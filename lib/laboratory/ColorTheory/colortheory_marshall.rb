## Specific Rulesets
#  white is a pure tint.
#  tint is a mixture of a color with white.
#  tone is a mixture of a color with grey.
#  shade is a mixture of a color with black.
#  black is a pure shade.
#  a purecolor is a wavelength not mixed with any tone, shade, or tint.

# wavelength(white,        puretint).
# wavelength(grey,         puretone).
# wavelength(black,       pureshade).
# wavelength(dark grey,       shade).
# wavelength(light grey,       tint).
# wavelength(red,         purecolor).
# wavelength(blue,        purecolor).
# wavelength(green,       purecolor).
# wavelength(lightred,    colortint).
# wavelength(lightblue,   colortint).
# wavelength(lightgreen,  colortint).
# wavelength(darkred,    colorshade).
# wavelength(darkblue,   colorshade).
# wavelength(darkgreen,  colorshade).

require 'humanist_errors'
include HumanistErrors

with_human_errors do

# Rules about underlying symbols and strings.
ctheory = :tint,      :tone,      :shade
tint    = :colortint,          :puretint
shade   = :colorshade,        :pureshade
tone    = :colortone,          :puretone
colors  = :red,       :green,      :blue

white   =  tint[1], "white",  "puretint"
black   = shade[1], "black", "pureshade"
grey    =  tone[1],  "grey",  "puretone"

red   = colors[0],   "red", "purecolor"
green = colors[0], "green", "purecolor"
blue  = colors[0],  "blue", "purecolor"

lightred   =  tint[0],   "lightred",  "colortint"
lightgreen =  tint[0], "lightgreen",  "colortint"
lightblue  =  tint[0],  "lightblue",  "colortint"
greyred    =  tone[0],     "midred",  "colortone"
greygreen  =  tone[0],   "midgreen",  "colortone"
greyblue   =  tint[0],    "midblue",  "colortone"
darkred    = shade[0],    "darkred", "colorshade"
darkgreen  = shade[0],  "darkgreen", "colorshade"
darkblue   = shade[0],   "darkblue", "colorshade"

## Teach Color Theory Associations
white_associative =  "#{ctheory[0]}(#{white[1]}, #{white[2]})."
grey_associative   =   "#{ctheory[1]}(#{grey[1]},  #{grey[2]})."
black_associative  = "#{ctheory[2]}(#{black[1]}, #{black[2]})."

red_associative   =     "#{colors[0]}(#{red[1]},   #{red[2]})."
green_associative = "#{colors[1]}(#{green[1]}, #{green[2]})."
blue_associative  =   "#{colors[2]}(#{blue[1]},  #{blue[2]})."

lightred_associative   = "#{lightred[0]}(#{lightred[1]}, #{lightred[2]})."
lightgreen_associative = "#{lightgreen[0]}(#{lightgreen[1]}, #{lightgreen[2]})."
lightblue_associative  = "#{lightblue[0]}(#{lightblue[1]}, #{lightblue[2]})."
 
greyred_associative   = "#{greyred[0]}(#{greyred[1]}, #{greyred[2]})."
greygreen_associative = "#{greygreen[0]}(#{greygreen[1]}, #{greygreen[2]})."
greyblue_associative  = "#{greyblue[0]}(#{greyblue[1]}, #{greyblue[2]})."

darkred_associative   = "#{darkred[0]}(#{darkred[1]}, #{darkred[2]})."
darkgreen_associative = "#{darkgreen[0]}(#{darkgreen[1]}, #{darkgreen[2]})."
darkblue_associative  = "#{darkblue[0]}(#{darkblue[1]}, #{darkblue[2]})."

#puts white_associative
#puts grey_associative
#puts black_associative
#
#puts red_associative
#puts green_associative
#puts blue_associative
#
#puts lightred_associative
#puts lightgreen_associative
#puts lightblue_associative
#
#puts greyred_associative
#puts greygreen_associative
#puts greyblue_associative
#
#puts darkred_associative
#puts darkgreen_associative
#puts darkblue_associative

## Split Data Into Marshal Chunks 
white_dump      =      Marshal.dump( white_associative )
grey_dump       =       Marshal.dump( grey_associative )
black_dump      =      Marshal.dump( black_associative )
red_dump        =        Marshal.dump( red_associative )
green_dump      =      Marshal.dump( green_associative )
blue_dump       =       Marshal.dump( blue_associative )
lightred_dump   =   Marshal.dump( lightred_associative )
lightgreen_dump = Marshal.dump( lightgreen_associative )
lightblue_dump  =  Marshal.dump( lightblue_associative )
greyred_dump    =    Marshal.dump( greyred_associative )
greygreen_dump  =  Marshal.dump( greygreen_associative )
greyblue_dump   =   Marshal.dump( greyblue_associative )
darkred_dump    =    Marshal.dump( darkred_associative )
darkgreen_dump  =  Marshal.dump( darkgreen_associative )
darkblue_dump   =   Marshal.dump( darkblue_associative )

## Writing Marshal to Bin
File.write("_data/white.bin",           white_dump)
File.write("_data/grey.bin",             grey_dump)
File.write("_data/black.bin",           black_dump)

File.write("_data/red.bin",               red_dump)
File.write("_data/green.bin",           green_dump)
File.write("_data/blue.bin",             blue_dump)

File.write("_data/lightred.bin",     lightred_dump)
File.write("_data/lightgreen.bin", lightgreen_dump)
File.write("_data/lightblue.bin",   lightblue_dump)

File.write("_data/greyred.bin",      greyred_dump)
File.write("_data/greygreen.bin",  greygreen_dump)
File.write("_data/greyblue.bin",    greyblue_dump)

File.write("_data/darkred.bin",      darkred_dump)
File.write("_data/darkgreen.bin",  darkgreen_dump)
File.write("_data/darkblue.bin",    darkblue_dump)

end
