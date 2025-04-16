system("clear")

word_index = File.read("lib/encyclopedia/encyclopedia/glossary.txt")

puts word_index

print "\nWhat word would you like to look up? >> "; research = gets.chomp

if    research == "Lunario"
  puts "BOB >> This is the largest form of in game currency, and is not used in ordinary game mechanics. It is mainly used for giving offerings to the lunar goddess, or paying the fair for dimension hopping that will come in the tiles version."

  gets.chomp
elsif research == "Yen"
  puts "BOB >> The smallest form of in game currency, this is mainly used for smaller fair items."

  gets.chomp

elsif research == "Franc"
  puts "BOB >> This is the largest form of in game currency within the scope of standard in game use. Once the tiles version of released, Lunario exists as travel currency."

  gets.chomp
elsif research == "RPS"
  puts "BOB >> RPS ia the ancronym for a form of games based on the mechanics of rock, paper, and scissors."

  gets.chomp
elsif research == "exit"
  abort
else
end
