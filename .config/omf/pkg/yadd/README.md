# [yadd][repo-link]
> A yarn/npm plugin for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)


## Install

```fish
$ omf install yadd
```

## Features

* Update yarn/npm dependencies with one command.
* Add new dependencies.
* Fallback to yarn if npm isn't installed.
* Specify whether to use yarn or npm.
* Specify whether to update dependencies or devDependencies.

## Usage

```fish
# it's as simple as this:
yadd

# specify that you want to use npm:
yadd -n # or yadd --npm

# specify that you want to update devDependencies:
yadd -d # or yadd --dev

# do both of the above:
yadd -nd # or yadd --npm --dev

# add new dependencies:
yadd new-package

# use npm and add new dependencies:
yadd -n new-package

# if running the command yadd doesn't make sense you can use the alias yup
# it does the exact same thing and autocompletion works the same as well
yup
```

## Author

**yadd** © [redxtech][author], Released under the [MIT][mit] License.

[mit]:            https://opensource.org/licenses/MIT
[author]:         https://github.com/redxtech
[omf-link]:       https://github.com/oh-my-fish/oh-my-fish
[repo-link]:      https://github.com/redxtech/yadd

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
