
# conky-calendar #

![screenshot1](https://raw.github.com/zeromancer/conky-calendar/master/screenshots/1.png)

Conky-Calendar prints a calendar with left margin spacing.
Intended to be used in [conky](http://conky.sourceforge.net/).
Written in [vala](https://wiki.gnome.org/Vala)


## Requirements ##

**Build Requirements:**
 * valac >= 0.20.0
 * gcc


## Usage ##

Compile & run (in terminal):
```
make && ./conky-calendar headline && ./conky-calendar before && ./conky-calendar now && ./conky-calendar after
```

Add to Conky:
```
${execi 600 /path/to/conky-calendar/conky-calendar before}${color tan2}${execi 3600 /path/to/conky-calendar/conky-calendar now}${color white}${execi 3600 /path/to/conky-calendar/conky-calendar after}
```

## Customisation ##

change conky-calendar.vala, near line 36:
```
	string left_margin = "   ";
```
to (example)
```
	string left_margin = "        ";
```

## Authors ##
 * David Siewert (david /zero siewert /at gmail /dot com)


## License ##

Copyright © 2013 David Siewert

conky-calendar is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.


## Credits ##

**Icons:**
 * License: [Creative Commons Attribution-NoDerivs](http://creativecommons.org/licenses/by-nd/3.0/)
 * Link: [icons8.com](http://icons8.com/)
