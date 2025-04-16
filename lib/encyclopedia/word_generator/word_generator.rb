system("clear")

# Single Character Word: esa 
# Three Character Word: ehykiemu 
# Five Character Word: uaeneenyehyehi 
# Seven Character Word: faeneenuemugewyya

# Single
#uu ua uos
 
# Triple
#emekopu emekopa emekopos
 
# Septuple
#jawudueheiu jawudueheia jawudueheios
 
# Seven
#enakyiykoerieridu enakyiykoerierida enakyiykoerieridos

gets.chomp

def word_lengths
  def one_character
    dipthongs  = File.readlines("dictionary/dipthongs.txt")
    tripthongs = File.readlines("dictionary/tripthongs.txt")

    chosen_tripthong = tripthongs.sample.strip.to_s
    chosen_dipthong  = dipthongs.sample.strip.to_s

    generated_word = chosen_tripthong + chosen_dipthong

    masculine      = generated_word.chop +  "u"
    feminine       = generated_word.chop +  "a"
    plural         = generated_word.chop + "os"
    
    puts "Single Factor"
    puts "#{masculine} #{feminine} #{plural}"

    puts " "
  end

  def three_character
    dipthongs  = File.readlines("dictionary/dipthongs.txt")
    tripthongs = File.readlines("dictionary/tripthongs.txt")

    chosen_tripthong1 = tripthongs.sample.strip.to_s
    chosen_dipthong1  = dipthongs.sample.strip.to_s

    chosen_tripthong2 = tripthongs.sample.strip.to_s
    chosen_dipthong2  = dipthongs.sample.strip.to_s

    chosen_tripthong3 = tripthongs.sample.strip.to_s
    chosen_dipthong3  = dipthongs.sample.strip.to_s

    component_one = chosen_tripthong1 + chosen_dipthong1
    component_two = chosen_tripthong2 + chosen_dipthong2
    component_tre = chosen_tripthong3 + chosen_dipthong3

    generated_word = component_one + component_two + component_tre

    masculine      = generated_word.chop +  "u"
    feminine       = generated_word.chop +  "a"
    plural         = generated_word.chop + "os"
    
    puts "Three Factor"
    puts "#{masculine} #{feminine} #{plural}"

    puts " "
  end

  def five_character
    dipthongs  = File.readlines("dictionary/dipthongs.txt")
    tripthongs = File.readlines("dictionary/tripthongs.txt")

    chosen_tripthong1 = tripthongs.sample.strip.to_s
    chosen_dipthong1  = dipthongs.sample.strip.to_s

    chosen_tripthong2 = tripthongs.sample.strip.to_s
    chosen_dipthong2  = dipthongs.sample.strip.to_s

    chosen_tripthong3 = tripthongs.sample.strip.to_s
    chosen_dipthong3  = dipthongs.sample.strip.to_s

    chosen_tripthong4 = tripthongs.sample.strip.to_s
    chosen_dipthong4  = dipthongs.sample.strip.to_s

    chosen_tripthong5 = tripthongs.sample.strip.to_s
    chosen_dipthong5  = dipthongs.sample.strip.to_s

    component_one = chosen_tripthong1 + chosen_dipthong1
    component_two = chosen_tripthong2 + chosen_dipthong2
    component_tre = chosen_tripthong3 + chosen_dipthong3
    component_fro = chosen_tripthong4 + chosen_dipthong4
    component_fiv = chosen_tripthong5 + chosen_dipthong5

    generated_word = component_one + component_two + component_tre + component_fro + component_fiv

    masculine      = generated_word.chop +  "u"
    feminine       = generated_word.chop +  "a"
    plural         = generated_word.chop + "os"
    
    puts "Five Factor"
    puts "#{masculine} #{feminine} #{plural}"

    puts " "
  end

  def seven_character
    dipthongs  = File.readlines("dictionary/dipthongs.txt")
    tripthongs = File.readlines("dictionary/tripthongs.txt")

    chosen_tripthong1 = tripthongs.sample.strip.to_s
    chosen_dipthong1  = dipthongs.sample.strip.to_s

    chosen_tripthong2 = tripthongs.sample.strip.to_s
    chosen_dipthong2  = dipthongs.sample.strip.to_s

    chosen_tripthong3 = tripthongs.sample.strip.to_s
    chosen_dipthong3  = dipthongs.sample.strip.to_s

    chosen_tripthong4 = tripthongs.sample.strip.to_s
    chosen_dipthong4  = dipthongs.sample.strip.to_s

    chosen_tripthong5 = tripthongs.sample.strip.to_s
    chosen_dipthong5  = dipthongs.sample.strip.to_s

    chosen_tripthong6 = tripthongs.sample.strip.to_s
    chosen_dipthong6  = dipthongs.sample.strip.to_s

    chosen_tripthong7 = tripthongs.sample.strip.to_s
    chosen_dipthong7  = dipthongs.sample.strip.to_s

    component_one = chosen_tripthong1 + chosen_dipthong1 # dipthongs.sample.strip.to_s
    component_two = chosen_tripthong2 + chosen_dipthong2 # dipthongs.sample.strip.to_s
    component_tre = chosen_tripthong3 + chosen_dipthong3 # dipthongs.sample.strip.to_s
    component_fro = chosen_tripthong4 + chosen_dipthong4 # dipthongs.sample.strip.to_s
    component_fiv = chosen_tripthong5 + chosen_dipthong5 # dipthongs.sample.strip.to_s
    component_six = chosen_tripthong6 + chosen_dipthong6 # dipthongs.sample.strip.to_s
    component_sev = chosen_tripthong7 + chosen_dipthong7 # dipthongs.sample.strip.to_s

    generated_word = component_one + component_two + component_tre + component_fro + component_fiv + component_six + component_sev

    masculine      = generated_word.chop +  "u"
    feminine       = generated_word.chop +  "a"
    plural         = generated_word.chop + "os"
    
    puts "Seven Factor"
    puts "#{masculine} #{feminine} #{plural}"

    puts " "
  end

  def hybrid_compounds
    japanese_words = File.readlines("dictionary/japanese_words.txt")
    french_words   = File.readlines("dictionary/french_words.txt")

    current_nihongo  = japanese_words.sample.strip.to_s
    current_francais = french_words.sample.strip.to_s

    generated_word = current_nihongo + current_francais

    #if    not(generated_word == "garejimerde") # Means shitting in the garage, don't do that sil vous plait.
      #puts ">> Hey, no shitting in the garage sil vous plait."

      #sleep(1.5)
    #elsif not(generated_word == "reizokumerde") # Means shitting the slaves. Or at best, Refridgerator pooping.
      #puts ">> We can't allow for refridgerator pooping."

      #sleep(1.5)
    #else
      masculine_class = "Te "
      feminine_class  = "Ta "
      plural_class    = "Deso "

      generated_masculine_form = masculine_class + generated_word
      generated_feminine_form  = feminine_class  + generated_word
      generated_plural_form    = plural_class    + generated_word

      masculine_end_word = generated_masculine_form.chop + "u"
      feminine_end_word  = generated_feminine_form.chop + "a"
      plural_end_word    = generated_plural_form.chop + "os"

      puts "Naturalistic"
      puts "#{masculine_end_word}"
      puts "#{feminine_end_word}"
      puts "#{plural_end_word}"

      #abort
    #end
  end

  def additional_constraints
  end
end

word_lengths.one_character
word_lengths.three_character
word_lengths.hybrid_compounds

#word_lengths.five_character
#word_lengths.seven_character

gets.chomp
