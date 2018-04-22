module.exports = {
  // for advanced config flags please refer to https://hyper.is/#cfg
  config: {
    updateChannel: 'stable',
    fontSize: 12,
    fontFamily: '"Fira Code", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    uiFontFaminly: 'Roboto, -apple-system, BlinkMacSystemFont, "Segoe UI"',
    fontWeight: 'normal',
    fontWeightBold: 'bold',
    cursorColor: 'rgba(248,28,229,0.8)',
    cursorAccentColor: '#000',
    cursorShape: 'BEAM',
    cursorBlink: false,
    foregroundColor: '#fff',
    backgroundColor: '#000',
    selectionColor: 'rgba(248,28,229,0.3)',
    borderColor: '#333',
    css: '',
    termCSS: '',
    showHamburgerMenu: '',
    showWindowControls: '',
    padding: '12px 14px',
    colors: {
      black: '#000000',
      red: '#C51E14',
      green: '#1DC121',
      yellow: '#C7C329',
      blue: '#0A2FC4',
      magenta: '#C839C5',
      cyan: '#20C5C6',
      white: '#C7C7C7',
      lightBlack: '#686868',
      lightRed: '#FD6F6B',
      lightGreen: '#67F86F',
      lightYellow: '#FFFA72',
      lightBlue: '#6A76FB',
      lightMagenta: '#FD7CFC',
      lightCyan: '#68FDFE',
      lightWhite: '#FFFFFF',
    },
    MaterialTheme: {
        // OPTIONS: 'Darker', 'Palenight', ''
        theme: 'Palenight',
        backgroundOpacity: '1',
        accentColor: '#64FFDA',
        vibrancy: 'dark'
    },
    visor: {
      hotkey: 'CommandOrControl+Shift+Z'
    },
    shell: 'ubuntu.exe',
    shellArgs: [],
    env: {},
    bell: 'SOUND',
    copyOnSelect: false,
    defaultSSHApp: true,
    // quickEdit: true
  },

  plugins: [
    "hyperpower",
    "hyper-material-theme",
    "hyperterm-visor",
    "hyperterm-paste",
    "hyperlinks",
    "hyper-pane"
  ],

  localPlugins: [],

  keymaps: {
    // 'window:devtools': 'cmd+alt+o',
  },
};
