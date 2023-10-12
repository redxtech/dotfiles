{ pkgs ? import <nixpkgs> { }, lib ? pkgs.lib
, writePython3Bin ? pkgs.writers.writePython3Bin }:

writePython3Bin "polywins" { libraries = with pkgs.python3Packages; [ ]; }

''
  import os
  import sys
  import json
  import subprocess

  # config
  separator = "·"
  empty_desktop_message = ""

  pad_with_spaces = True
  char_limit = 20
  max_windows = 10

  enforce_case = "lower"  # 'upper', 'lower', or 'none'
  show = "window_class"  # options: window_title, window_class, window_classname
  forbidden_classes = ["Polybar", "Conky", "Gmrun", "obsidian"]

  if len(sys.argv) != 2:
      print("Please include the monitor name as the first argument")
      exit(1)


  def output_windows():
      focused_desktop_id = os.popen(
          "${pkgs.bspwm}/bin/bspc query -T -m {} | ${pkgs.jq}/bin/jq .focusedDesktopId".format(sys.argv[1]) # noqa
      ).read()
      focused_desktop_tree_raw = os.popen(
          "${pkgs.bspwm}/bin/bspc query -T -d {}".format(focused_desktop_id) # noqa
      ).read()

      focused_desktop_tree = json.loads(focused_desktop_tree_raw)

      focused_node_id = focused_desktop_tree["focusedNodeId"]

      def parse_node(node):
          nodes = []
          if node is None:
              return nodes

          if node["client"] is not None:
              node["client"]["id"] = node["id"]
              nodes.append(node["client"])
          if "firstChild" in node and node["firstChild"] is not None:
              nodes.extend(parse_node(node["firstChild"]))
          if "secondChild" in node and node["secondChild"] is not None:
              nodes.extend(parse_node(node["secondChild"]))

          return nodes

      def add_actions_to_node(node):
          actions = ""
          action_closers = ""

          # add raise or minimize actions
          if node["id"] == focused_node_id:
              actions += '%{{A1:${pkgs.wmctrl}/bin/wmctrl -ir "{}" -b toggle,hidden:}}'.format( # noqa
                  node["id"]
              )
              action_closers += "%{A}"
          else:
              actions += '%{{A1:${pkgs.wmctrl}/bin/wmctrl -ir "{}" -b remove,hidden;${pkgs.wmctrl}/bin/wmctrl -ia "{}":}}'.format( # noqa
                  node["id"], node["id"]
              )
              action_closers += "%{A}"

          # add close action
          actions += '%{{A2:${pkgs.wmctrl}/bin/wmctrl -ic "{}":}}'.format(node["id"]) # noqa
          action_closers += "%{A}"

          # add padding
          padding = " " if pad_with_spaces else ""

          # change case of window title
          node_title = node["className"]
          if enforce_case == "lower":
              node_title = node_title.lower()
          elif enforce_case == "upper":
              node_title = node_title.upper()

          stringified = "{}{}{}{}{}".format(
              padding, actions, node_title, action_closers, padding
          )

          if node["id"] == focused_node_id:
              return "%{u#A4B9EF}%{+u}%{F#A4B9EF}" + stringified + "%{F-}%{-u}"

          return stringified

      nodes = parse_node(focused_desktop_tree["root"])

      filtered_nodes = [
          node for node in nodes if node["className"] not in forbidden_classes
      ]

      print(
          separator.join(
              [add_actions_to_node(node) for node in filtered_nodes]
          ),
          flush=True,
      )


  # Start the subprocess and redirect stdout to a pipe
  process = subprocess.Popen(
      ["${pkgs.bspwm}/bin/bspc", "subscribe"], stdout=subprocess.PIPE, universal_newlines=True # noqa
  )

  # Continuously read lines from the stdout
  while True:
      line = process.stdout.readline().strip()
      output_windows()
''
