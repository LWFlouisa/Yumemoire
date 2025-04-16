# Require humanist errors.
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

red   = colors[0],   "Pure Red", "Pure Color"
green = colors[0], "Pure Green", "Pure Color"
blue  = colors[0],  "Pure Blue", "Pure Color"

lightred   =  tint[0],   "Light Red",  "Color Tint"
lightgreen =  tint[0], "Light Green",  "Color Tint"
lightblue  =  tint[0],  "Light Blue",  "Color Tint"
greyred    =  tone[0],     "Mid Red",  "Color Tone"
greygreen  =  tone[0],   "Mid Green",  "Color Tone"
greyblue   =  tint[0],    "Mid Blue",  "Color Tone"
darkred    = shade[0],    "Dark Red", "Color Shade"
darkgreen  = shade[0],  "Dark Green", "Color Shade"
darkblue   = shade[0],   "Dark Blue", "Color Shade"

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
darkblue_associative  = "#{darkblue[0]}()#{darkblue[1]}, #{darkblue[2]})."

puts white_associative
puts grey_associative
puts black_associative
puts red_associative
puts green_associative
puts blue_associative

puts lightred_associative
puts lightgreen_associative
puts lightblue_associative

puts greyred_associative
puts greygreen_associative
puts greytblue_associative

puts darkred_associative
puts darkgreen_associative
puts darkblue_associative

## Split Data Into Marshall Chunks
white_dump      =      Marshall.dump(white_associative)
grey_dump       =       Marshall.dump(grey_associative)
black_dump      =      Marshall.dump(black_associative)
red_dump        =        Marshall.dump(red_associative)
green_dump      =      Marshall.dump(green_associative)
blue_dump       =       Marshall.dump(blue_associative)
lightred_dump   =   Marshall.dump(lightred_associative)
lightgreen_dump = Marshall.dump(lightgreen_associative)
lightblue_dump  =  Marshall.dump(lightblue_associative)
greyred_dump    =    Marshall.dump(greyred_associative)
greygreen_dump  =  Marshall.dump(greygreen_associative)
greyblue_dump   =   Marshall.dump(greyblue_associative)
darkred_dump    =    Marshall.dump(darkred_associative)
darkgreen_dump  =  Marshall.dump(darkgreen_associative)
darkblue_dump   =   Marshall.dump(darkblue_associative)

## Writing Marshall to Bin
File.write("_data/white.bin",           white_dump)
File.write("_data/grey.bin",             grey_dump)
File.write("_data/black.bin",           black_dump)
File.write("_data/red.bin",               red_dump)
File.write("_data/green.bin",           green_dump)
File.write("_data/blue.bin",             blue_dump)
File.write("_data/lightred.bin",     lightred_dump)
File.write("_data/lightgreen.bin", lightgreen_dump)
File.write("_data/lightblue.bin",   lightblue_dump)
File.write("_data/lightred.bin",      greyred_dump)
File.write("_data/lightgreen.bin",  greygreen_dump)
File.write("_data/lightblue.bin",    greyblue_dump)
File.write("_data/lightred.bin",      darkred_dump)
File.write("_data/lightgreen.bin",  darkgreen_dump)
File.write("_data/lightblue.bin",    darkblue_dump)

end
