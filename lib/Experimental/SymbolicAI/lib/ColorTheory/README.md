# ColorTheory
An experiment in learning color theory symbolically, and saving it for later to process.

## Knowledge Base
~~~prolog
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
~~~

## Consult Color
~~~prolog
:- initialization tint, tone, shade.

tint :-
    consult("_data/knowledgebase/colortheory.pl"), 
    X = tint(white, puretint), write("The result of "), write(X), write(" holds.\n"). % consults the stories prolog file.

tone :-
    consult("_data/knowledgebase/colortheory.pl"),
    Y = tone(grey,  puretone), write("The result of "), write(Y), write(" holds.\n").

shade :-
    consult("_data/knowledgebase/colortheory.pl"),
    Y = shade(black, pureshade), write("The result of "), write(Y), write(" holds.\n"), halt.
~~~
