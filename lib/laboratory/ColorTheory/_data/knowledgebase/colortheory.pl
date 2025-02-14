:- discontiguous purecolor/3.
:- discontiguous colortint/2.

% basic tint, tone, shade
tint(white, puretint).
tone(grey,  puretone).
shade(black, pureshade).

% basic red, green, blue
red(red,   purecolor).
green(green, purecolor).
blue(blue,  purecolor).

% basic tinted versions of colors
colortint(lightred, colortint).
colortint(lightgreen, colortint).
colortint(lightblue, colortint).

% basic toned versions of colors
colortone(midred, colortone).
colortone(midgreen, colortone).
colortint(midblue, colortone).

% basic shaded versions of colors
colorshade(darkred, colorshade).
colorshade(darkgreen, colorshade).
colorshade(darkblue, colorshade).
