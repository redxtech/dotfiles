{ pkgs ? import <nixpkgs> { }, lib ? pkgs.lib
, writeScriptBin ? pkgs.writeScriptBin }:

writeScriptBin "pipewire-output-tail" ''
  #!${pkgs.wireplumber}/bin/wpexec

  -- Live update of current sink's volume level, muteness in polybar friendly format.

  node_om = ObjectManager({
    Interest({ type = "node", Constraint({ "media.class", "=", "Audio/Sink", type = "pw-global" }) }),
  })

  metadata_om = ObjectManager({
    Interest({ type = "metadata", Constraint({ "metadata.name", "=", "default" }) }),
  })

  local default_sink = nil
  local sink2volume = {}
  local sink2name = {}

  local tag = function(volume, name, color)
    local content = volume .. "% " .. name
    if color then
      return "%{F#6b6b6b}" .. content .. "%{F-}"
      -- return "%{F#282a36}" .. content .. "%{F-}"
    else
      return content
    end
  end

  local update_prompt = function()
    for sink, vol in pairs(sink2volume) do
      if sink == default_sink then
        print(tag(vol.level, sink2name[sink], vol.mute))
      end
    end
  end

  local node_volume = function(node)
    for p in node:iterate_params("Props") do
      local output = p:parse().properties
      if output["channelVolumes"] == nil then
        return { level = "?", mute = false }
      end
      local vol = output.channelVolumes[1] ^ (1 / 3)
      return {
        level = math.floor(100 * vol + 0.5),
        mute = output.mute,
      }
    end

    error("something went wrong :(")
  end

  metadata_om:connect("object-added", function(_, metadata)
    local process = function(key, value)
      if key ~= "default.audio.sink" then
        return
      end
      default_sink = value:match('{"name":"(.*)"}')
      update_prompt()
    end

    for _, k, _, v in metadata:iterate(Id.ANY) do
      process(k, v)
    end
    metadata:connect("changed", function(_, _, k, _, v)
      process(k, v)
    end)
  end)

  node_om:connect("object-added", function(_, node)
    local name = node.properties["node.name"]
    local nick = node.properties["node.description"]
    sink2volume[name] = node_volume(node)
    sink2name[name] = nick
    update_prompt()

    node:connect("params-changed", function(_, params)
      if params == "Props" then
        sink2volume[name] = node_volume(node)
        update_prompt()
      end
    end)
  end)

  node_om:connect("object-removed", function(_, node)
    local name = node.properties["node.name"]
    sink2volume[name] = nil
    sink2name[name] = nil
    update_prompt()
  end)

  metadata_om:activate()
  node_om:activate()
''
