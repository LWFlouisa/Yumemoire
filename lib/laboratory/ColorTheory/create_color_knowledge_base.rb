## Read in symbolic data.
white      =      File.read("_data/white.bin")
grey       =       File.read("_data/grey.bin")
black      =      File.read("_data/black.bin")
red        =        File.read("_data/red.bin")
green      =      File.read("_data/green.bin")
blue       =       File.read("_data/blue.bin")
lightred   =   File.read("_data/lightred.bin")
lightgreen = File.read("_data/lightgreen.bin")
lightblue  =  File.read("_data/lightblue.bin")
greyred    =    File.read("_data/greyred.bin")
greygreen  =  File.read("_data/greygreen.bin")
greyblue   =   File.read("_data/greyblue.bin")
darkred    =    File.read("_data/darkred.bin")
darkgreen  =  File.read("_data/darkgreen.bin")
darkblue   =   File.read("_data/darkblue.bin")

## Load specific Marshall data.
### Tint, Tone, and Shade
white_associative = Marshal.load(white)
grey_associative  = Marshal.load(grey)
black_associative = Marshal.load(black)

### Colors
red_associative   = Marshal.load(red)
green_associative = Marshal.load(green)
blue_associative  = Marshal.load(blue)

### Tinted Colors
lightred_associative   = Marshal.load(lightred)
lightgreen_associative = Marshal.load(lightgreen)
lightblue_associative  = Marshal.load(lightblue)

### Toned Colors
greyred_associative   = Marshal.load(greyred)
greygreen_associative = Marshal.load(greygreen)
greyblue_associative  = Marshal.load(greyblue)

### Shaded Colors
darkred_associative   = Marshal.load(darkred)
darkgreen_associative = Marshal.load(darkgreen)
darkblue_associative  = Marshal.load(darkblue)

## Display the data on the screen.
#puts      white_associative
#puts       grey_associative
#puts      black_associative
#puts        red_associative
#puts      green_associative
#puts       blue_associative
#puts   lightred_associative
#puts lightgreen_associative
#puts  lightblue_associative
#puts    greyred_associative
#puts  greygreen_associative
#puts   greyblue_associative
#puts    darkred_associative
#puts  darkgreen_associative
#puts   darkblue_associative

open("_data/knowledgebase/colortheory.pl", "w") { |f|
  f.puts ":- discontiguous purecolor/3.
:- discontiguous colortint/2.

"

  f.puts "% basic tint, tone, shade"
  f.puts      white_associative # .tr " ", "_"
  f.puts       grey_associative # .tr " ", "_"
  f.puts      black_associative# .tr " ", "_"

  f.puts "\n% basic red, green, blue"
  f.puts        red_associative # .tr " ", "_"
  f.puts      green_associative # .tr " ", "_"
  f.puts       blue_associative # .tr " ", "_"

  f.puts "\n% basic tinted versions of colors"
  f.puts   lightred_associative # .tr " ", "_"
  f.puts lightgreen_associative # .tr " ", "_"
  f.puts  lightblue_associative # .tr " ", "_"

  f.puts "\n% basic toned versions of colors"
  f.puts    greyred_associative # .tr " ", "_"
  f.puts  greygreen_associative # .tr " ", "_"
  f.puts   greyblue_associative # .tr " ", "_"

  f.puts "\n% basic shaded versions of colors"
  f.puts    darkred_associative # .tr " ", "_"
  f.puts  darkgreen_associative # .tr " ", "_"
  f.puts   darkblue_associative # .tr " ", "_"
}
