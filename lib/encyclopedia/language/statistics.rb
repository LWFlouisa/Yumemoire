require "naive_bayes"

## Francophone Word class extraction
system("./le.sh; ./la.sh; ./les.sh")
#system("./anu.sh; ./ana.sh; ./anos.sh")

system("clear")

#system("xmlstarlet sel -t -v '/screen/container/conlang/word_name' le.xml > language_data/word_classes/le.txt")
#system("xmlstarlet sel -t -v '/screen/container/conlang/word_name' la.xml  > language_data/word_classes/la.txt")
#system("xmlstarlet sel -t -v '/screen/container/conlang/word_name' les.xml > language_data/word_classes/les.txt")

## Pseudo-Japanese Word Classes
#system("xmlstarlet sel -t -v '/screen/container/conlang/word_name' anu.xml  > language_data/word_classes/anu.txt")
#system("xmlstarlet sel -t -v '/screen/container/conlang/word_name' ana.xml  > language_data/word_classes/ana.txt")
#system("xmlstarlet sel -t -v '/screen/container/conlang/word_name' anos.xml > language_data/word_classes/anos.txt")

language = NaiveBayes.new(:word_class_name, :word_class_type, :word_class_definition, :word_class_context,

                          :noun,
                          :adjective,   :conjucation,
                          :preposition, :verb,
                          :adverb,
           )

# Dataset to train on.

## Francophonic Word Class Names
le_name  = File.read("language_data/word_classes/names/le.txt").strip.to_s
la_name  = File.read("language_data/word_classes/names/la.txt").strip.to_s
les_name = File.read("language_data/word_classes/names/les.txt").strip.to_s

## Francophonic Word Class Types
le_type  = File.read("language_data/word_classes/types/le.txt").strip.to_s
la_type  = File.read("language_data/word_classes/types/la.txt").strip.to_s
les_type = File.read("language_data/word_classes/types/les.txt").strip.to_s

## Francophonic Word Class Definitions
le_define  = File.read("language_data/word_classes/definition/le.txt").strip.to_s
la_define  = File.read("language_data/word_classes/definition/la.txt").strip.to_s
les_define = File.read("language_data/word_classes/definition/les.txt").strip.to_s

## Francophonic Word Class Context
le_type  = File.read("language_data/word_classes/context/le.txt").strip.to_s
la_type  = File.read("language_data/word_classes/context/la.txt").strip.to_s
les_type = File.read("language_data/word_classes/context/les.txt").strip.to_s

#anu = File.read("language_data/word_classes/anu.txt").strip.to_s
#ana = File.read("language_data/word_classes/ana.txt").strip.to_s
#anu = File.read("language_data/word_classes/anos.txt").strip.to_s

#le = "le"
#la = "la"
#les = "les"

## Japanophonic
#anu  = File.read("language_data/word_classes/anu.txt").strip.to_s
#ana  = File.read("language_data/word_classes/ana.txt").strip.to_s
#anos = File.read("language_data/word_classes/anos.txt").strip.to_s

# Traning on the dataset.
language.train(:word_class_name,          le_name,  "word")
language.train(:word_class_name,          la_name,  "word")
language.train(:word_class_name,         les_name,  "word")
language.train(:word_class_type,          le_type,  "word")
language.train(:word_class_type,          la_type,  "word")
language.train(:word_class_type,         les_type,  "word")
language.train(:word_class_definition,  le_define,  "word")
language.train(:word_class_definition,  la_define,  "word")
language.train(:word_class_definition, les_define,  "word")

#language.train(:word_class, anu,  "word")
#language.train(:word_class, ana,  "word")
#language.train(:word_class, anos, "word")

#puts "Language object initialized: #{language.inspect}"

sentence = "Word Class [ Francophonic ]" #.split(' ')

information     = language.classify(*sentence)
unlikelyhood    = 100 - information[1]

if unlikelyhood > 60
  puts "It is unlikely to be a/an #{information[0]}"
else
  puts "It is likely to be a/an #{information[0]}"
end

  #=> [:spam, 0.03125]

