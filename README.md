# mybuild-mode

[![MELPA](https://melpa.org/packages/mybuild-mode-badge.svg)](https://melpa.org/#/mybuild-mode)
[![MELPA Stable](https://stable.melpa.org/packages/mybuild-mode-badge.svg)](https://stable.melpa.org/#/mybuild-mode)

_mybuild-mode_ -- major mode for GNU Emacs for Mybuild files from
[Embox](https://embox.github.io/) operating system.

_mybuild-mode_ supports:

- syntax highlighting;
- proper indentations.

_mybuild-mode_ doesn't support:

- correctness checking;
- tooltips and auto completion.

## Customization

You can set the width of the indentation by setting the customizable user option
variable `mybuild-indent-offset` from customization group `mybuild`. By default,
it is set to `2`.

## Details

_mybuild-mode_ based on `prog-mode` and uses standard `font-lock-mode`
for proper syntax highlighting.

When creating the mode, the formal grammar `mk/mybuild/myfile.grm`
from Embox sources was used.

The correctness of the highlighting was manually checked on Mybuild files
from Embox sources.

## License

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

(c) 2022 Evgeny Simonenko
