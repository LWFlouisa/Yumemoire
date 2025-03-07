reverse_dictionary = {
  ## Colors
  "Bistre-Black, made by blending beechwood and sawtooth soot and allowed to ferment." => "Le Furenchibisutoru",
  "Brown-Black; Black-Flesh. Synonym for Furenchibisutoru. Paired with Metallic blue." =>   "Anos Chaironoiros",

  ## Painting
  "A form of monochromatic painting designed to mimmick the look and feel of traditional Japanese paintings, but with a look and feel more reminiscent of the vibrancy of soft pastels such that it has a similar vibrancy and shelf life. The main difference being that often they use Sanguine and and lime green tones for occassional sequences in color used sparingly." => "Anos Sumie-Pasuteros",
  "A type of reed pen that can be loaded with Sumi ink with a watercolor brush or to soften pastels." => "Ana Fezaroseau",
  "Graphic novels designed with the intent to show the plight of creators that feel like foreigners in their own lands." => "Des Photos De Alienes",
  "Alienating Pictures. Manga about isolation, specifically of foreign creators." => "Soen'na byoga",

  ## Themes And Concepts
  "Dehydratingly homesick. Used to describe long periods alone in harsh weather. Derived from Kansohomushikku, or 'Dehydrating of homesickness.'" => "Kansodesir",
  "Post-Apocalyptic France left over from World War III. With Paris essentially in ruins, with the majority of French living near Sands Of Pilat." => "La Nagasaki De Paris",
  "A type of body duplicate crafted as a porcelain doll someone haunts while waiting for reincarnation. Those without a Karada Duplicata haunt the world of the living if they don't have a porceilain doll to be hosted in." => "Karada Duplicata",
  "Anarchism of rebirth; the chaotic period of time between one life and rebirth; societies structured to accompany such periods." => "Anaruko No Shinsei [ アナルコ 新生 ]",
  "Societies structured around the chaotic shifts between reincarnations, to factor in souls that refuse to move on, and cause chaos in the material world; can be viewed as a sub-genre of dystopian fiction." => "Shineitopia",
  "Hyper realistic digital representations of ancient ceramic when the original is lost, to preserve culture." => "La Céramique Dejitaru",
  "The practice of veterinary care for cryptid creatures, specifically taken in creatures society will not." => "La Cryptohippiatrica",

  ## Idiomatic Expressions
  "The arrival of innocense; the arrival of safety." => "Adobentasu Inokyu",

  # Lunar Phases
  "Masculine form of the new moon." => "Atarashi Lune",
  "Feminine form of the new moon."  => "Nouvelle Tsuki",
}

print "What do you want to look up? >> "; lookup = gets.chomp

puts "
Here is the word you might be looking for:
reverse_dictionary[lookup]
"
