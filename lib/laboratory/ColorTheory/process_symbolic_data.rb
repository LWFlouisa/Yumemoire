require "naive_bayes"
require "HumanistErrors"

with_human_errors do

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
puts      white_associative
puts       grey_associative
puts      black_associative
puts        red_associative
puts      green_associative
puts       blue_associative
puts   lightred_associative
puts lightgreen_associative
puts  lightblue_associative
puts    greyred_associative
puts  greygreen_associative
puts   greyblue_associative
puts    darkred_associative
puts  darkgreen_associative
puts   darkblue_associative

## Train a Baysian model on color theory associations.
colors             = NaiveBayes.new(
    :tint,      :red,       :lightred,      :greyred,       :darkred,
    :tone,      :green,     :lightgreen,    :greygreen,     :darkgreen,
    :shade,     :blue,      :lightblue,     :greyblue,      :darlblue,
)

colors.db_filepath = "_data/colortheory/colortheory.nb"

## Tine, Tone, and Shade trained.
colors.train(:tint,  white_associative, "white")
colors.train(:tone,   grey_associative,  "grey")
colors.train(:shade, black_associative, "black")

## Red, Green, and Blue
colors.train(:red,     red_associative,   "red")
colors.train(:green, green_associative, "green")
colors.train(:blue,   blue_associative,  "blue")

## Tinted Colors
colors.train(:lightred,     lightred_associative,   "lightred")
colors.train(:lightgreen, lightgreen_associative, "lightgreen")
colors.train(:lightblue,   lightblue_associative,  "lightblue")

## Toned Colors
colors.train(:greyred,     greyred_associative,   "greyred")
colors.train(:greygreen, greygreen_associative, "greygreen")
colors.train(:greyblue,   greyblue_associative,  "greyblue")

## Shades Colors
colors.train(:darkred,     darkred_associative,   "darkred")
colors.train(:darkgreen, darkgreen_associative, "darkgreen")
colors.train(:darkblue,   darkblue_associative,  "darkblue")

## Saving Baysian data for later.
colors.save

end