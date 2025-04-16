sleep 2.seconds

print "What word would you like to translate? >> "; translate = gets #.chomp

# Get the word count based on how many words are in a sentence.
#word_count = translate.split(" ").to_i

dictionary = {
  ## Word Classes

  ## Francophonic
  "Le"  => "The ( Masculine ) [ Francophonic ]",
  "La"  =>  "The ( Feminine ) [ Francophonic ]",
  "Les" =>    "The ( Plural ) [ Francophonic ]",
  "Un"  =>                 "A [ Francophonic ]",
  "Une" =>                "An [ Francophonic ]",
  "Des" =>              "Some [ Francophonic ]",

  ## Japonic
  "Anu"  => "The ( Masculine ) [ Pseudo-Japonic ]",
  "Ana"  =>  "The ( Feminine ) [ Pseudo-Japonic ]",
  "Anos" =>    "The ( Plural ) [ Pseudo-Japonic ]",
  "Tu"   =>                 "A [ Pseudo-Japonic ]",
  "Ta"   =>                "An [ Pseudo-Japonic ]",
  "Tos"  =>             "Some [ Pseudo-Japaonic ]",

  ## German By Route Of Alsatian
  "Der" => "The ( Masculine ) [ Germanic ]",
  "Die" =>  "The ( Feminine ) [ Germanic ]",
  "Das" =>    "The ( Plural ) [ Germanic ]",
  "A"   =>                 "A [ Germanic ]",
  "Ein" =>                "An [ Germanic ]",

  ## Compound Word Specific Word Classes
  "Lanu"  => "The ( masculine ) [ Ahusacos Specific ]",
  "Lana"  =>  "The ( feminine ) [ Ahusacos Specific ]",
  "Lanos" =>    "The ( plural ) [ Ahusacos Specific ]",
  "Tun"   =>                 "A [ Ahusacos Specific ]",
  "Tan"   =>                "An [ Ahusacos Specific ]",
  "Deso"  =>         "It / Some [ Ahusacos Specific ]",

  ## Negation Clauses
  "Ne"   => "Not [ Francophonic ]",
  "Na"   =>      "Not [ Japonic ]",
  "Nix " =>       "Not [ Hybrid ]",
  "Nein" =>     "Not [ Germanic ]",

  ## Personal Pronouns
  "Je"        =>       "I",
  "Vous"      => "You all",
  "Toi"       =>     "You",
  "Nous"      =>      "We",
  "Il"        =>      "He",
  "Ils"       =>     "Him",
  "Elle"      =>     "She",
  "Elles"     =>     "Her",

  ## Common Posessives
  "mien"   =>  "mine",
  "votre"  =>  "your",
  "tien"   => "yours",
  "notre"  =>   "our",
  "notres" =>  "ours",
  "sien"   =>   "his",
  "sienne" =>  "hers",

  ## Not used outside of context of military context, used to refer to groups of units.
  ## In practice, right-wing factions use the wrong plural pronoun to misgender entire units
  ## as a way to lower moral of left-wing factions. Because of this, after the Franco-Japanese
  ## Wars, they stopped being used widely.

  ## War Plurals
  "Nousil"    =>  "He plural",
  "Nousils"   => "Him plural",
  "Nouselle"  => "She plural",
  "Nouselles" => "Her plural",

  ## Plural Posessives
  "sienotre"    =>     "our men",
  "sienenotre"  =>   "our women",
  "sienotres"   =>   "our men's",
  "sienenotres" => "our women's",

  ## Famille / Family

  ### Francophonic
  "Pere"       =>        "Father",
  "Mere"       =>        "Mother",
  "Frere"      =>       "Brother",
  "Soeur"      =>        "Sister",
  "Cousifrere" =>   "Male Cousin",
  "Cousisoeur" => "Female Cousin",
  "Cousiles"   =>  "Both Cousins",
  "Tante"      =>          "Aunt",
  "Oncle"      =>         "Uncle",

  ### Color Acidity Framework
  # These colors are for a system that rates colors based on their acidity or alkalinity.

  ##### Reds
  "PH4DR1" => "Salmon",
  "PH5DR1" => "Pale Salmon",
  "PH4DR3" => "Salmon Pink",

  ##### Oranges
  "PH4DR2" => "Copper",
  "PH8WE1" => "Japanese Bistre",

  ##### Yellow
  "PH6DR1" => "Maize",
  "PH5DR2" => "Khaki",
  "PH6DR3" => "Bland",

  ##### Green
  "PH6DR2" =>     "Pale Lime",
  "PH7NU1" => "Vibrant Green",
  "PH7NU2" =>  "Medium Green",
  "PH8WE2" =>   "Kelly Green",

  ##### Blue
  "PH9WE2" =>       "Viridian",
  "PHAWE3" =>    "Ultramarine",
  "PH9WE3" => "Muted Sapphire",
  "PH8WE3" =>  "Dark Sapphire",
  "PH7NU3" =>      "Grey Blue",

  ##### Purple
  "PH9WE1" => "Dull Purple",
  "PH5DR3" => "Light Mauve",

  ##### Unusual Or Rare Color
  "PH1WE3CH1"    => "Dark Lavender", # A theoretical compound that blends Salmon with Sapphire blue.
  "PH4WE2CH2"    =>  "Atomic Hazel", # A highly toxic combination of copper and arsenic.
  "Atomic Hazel" =>       "#6D6C46", # Hex code for atomic hazel.

  ### Chomatic Shades
  ### Arsenic Scale

  ### Unknown Origin
  "PHAWE1"       =>      "Bordeaux", # I don't know how I got this color.'

  ### Hand Mixed Colors
  "#83b281" => "Dusty Green",

  ### Synthesized From Real Colors
  "#A9A8AD" => "Faded Carolina Blue", # Pale Lime, Salmon Pink, Bland, Grey Blue    [ Hypothesis Acidic Blue ]
  "#A0A5B9" => "Manilla Lavender",    # Salmon, Pale Salmon, Grey Blue, Grey Blue   [ Hypothesis Slightly Alkaline Grey Blue ]
  "#8cc874" => "Asparagus",           # Pale Lime, Maize, Light Mauve, Medium Green [ Hypothesis Alkaline Green ]
  "#a0b36c" => "Tan Green",           # Pale Salmon, Kelly Green, Bland, Khaki      [ Hypothesis Slightly Tan Green ]
  "#5673A9" => "Dusky Blue",          # Grey Blue, Light Mauve, Khaki, Sapphire     [ Hypothesis Highly Alkaline Blue ]
  "#A59C94" => "Warm Grey",           # Vibrant Green, Salmon, Sapphire Dark, Bland [ Hypothesis Slightly Acidic Grey ]

  ### Synthesized From Synthetic Colors
  "#788a9a" => "Steel",               # Faded Carolina Blue, Tan Green, Warm Grey, Dusky Blue [ Hypothesis Slightly Alkaline Medium Chromatic Blue ]
  "#415588" => "Dusky Blue Medium"    # Genetically related to standard Dusky blue. Faded Carolina Blue, Tan Green, Warm Grey, Dusky Blue [ Hypothesis More Shaded Alkaline Blue ]
}

#result = translate[dictionary]
#
#if translate[dictionary]    == "Salmon"          or
#                "Pale Salmon"     or
#                "Salmon Pink"     or
#                "Bordeaux"        or
#                "Copper"          or
#                "Japanese Bistre" or
#                "Maise"           or
#                "Khaki"           or
#                "Bland"           or
#                "Pale Lime"       or
#                "Vibrant Green"   or
#                "Medium Green"    or
#                "Kelly Green"     or
#                "Viridian"        or
#                "Ultramarine"     or
#                "Muted Sapphire"  or
#                "Dark Sapphire"   or
#                "Grey Blue"       or
#                "Dull Purple"     or
#                "Light Mauve"
#
#  open("_alkalinity/input/color.txt", "w") { |f|
#    f.puts "#{translate}"
#  }
#
#  print "Your translation: "
#  print "#{translate} => #{dictionary[translate]}"
#  puts " "
#
#  system("ruby _alkalinity/evaluate_color.rb")
#else
  print "Your translation: "
  print "#{translate} => #{dictionary[translate]}"
  puts " "
#end

gets
