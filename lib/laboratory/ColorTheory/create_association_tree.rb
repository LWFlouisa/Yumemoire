require "decisiontree"
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

## Create a decision tree attribute
attribute = ["Color Theory"]

## Get input from different color associations.
input_1  =      "#{white_associative}"
input_2  =       "#{grey_associative}"
input_3  =      "#{black_associative}"
input_4  =        "#{red_associative}"
input_5  =      "#{green_associative}"
input_6  =       "#{blue_associative}"
input_7  =   "#{lightred_associative}"
input_8  = "#{lightgreen_associative}"
input_9  =  "#{lightblue_associative}"
input_10 =    "#{greyred_associative}"
input_11 =  "#{greygreen_associative}"
input_12 =   "#{greyblue_associative}"
input_13 =    "#{darkred_associative}"
input_14 =  "#{darkgreen_associative}"
input_15 =   "#{darkblue_associative}"

## Create training examples.
training = [
  [6.666666667,       "#{white_associative}"]. [30.0,               "#{grey_associative}"],
  [41.666666666,      "#{black_associative}"], [47.5,                "#{red_associative}"],
  [50.416666666,      "#{green_associative}"], [51.875,             "#{blue_associative}"],
  [52.604166666,   "#{lightred_associative}"], [53.333333333, "#{lightgreen_associative}"],
  [54.0625,       "#{lightblue_associative}"], [54.791666666,    "#{greyred_associative}"],
  [56.25,         "#{greygreen_associative}"], [59.166666666,   "#{greyblue_associative}"],
  [65.0,            "#{darkred_associative}"], [76.666666666,  "#{darkgreen_associative}"],
  [100.0,          "#{darkblue_associative}"],
]

# Instantiate the tree, and train it based on the data (set default to '1')
dec_tree = DecisionTree::ID3Tree.new(attributes, training, 1, :continuous)
dec_tree.train

test_input1  =  [input_1]
test_input2  =  [input_2]
test_input3  =  [input_3]
test_input4  =  [input_4]
test_input5  =  [input_5]
test_input6  =  [input_6]
test_input7  =  [input_7]
test_input8  =  [input_8]
test_input9  =  [input_9]
test_input10 = [input_10]
test_input11 = [input_11]
test_input12 = [input_12]
test_input13 = [input_13]
test_input14 = [input_14]
test_input15 = [input_15]

decision1  =  dec_tree.predict(test_input1)
decision2  =  dec_tree.predict(test_input2)
decision3  =  dec_tree.predict(test_input3)
decision4  =  dec_tree.predict(test_input4)
decision5  =  dec_tree.predict(test_input5)
decision6  =  dec_tree.predict(test_input6)
decision7  =  dec_tree.predict(test_input7)
decision8  =  dec_tree.predict(test_input8)
decision9  =  dec_tree.predict(test_input9)
decision10 = dec_tree.predict(test_input10)
decision11 = dec_tree.predict(test_input11)
decision12 = dec_tree.predict(test_input12)
decision13 = dec_tree.predict(test_input13)
decision14 = dec_tree.predict(test_input14)
decision15 = dec_tree.predict(test_input15)

  ## Coming Soon point to different methods to confirm different decision tree decisions.
end