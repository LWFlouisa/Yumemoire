system("clear")

beasts = File.read("beasts/beasts.txt")

puts beasts

available_beasts = [
  "[Cochonbuta]", "[Ursinehomme]",
  "[Ursinepiros]", "[Kumabatto]",
  "[The Quantumcrusafied]",
]

print "\nWhat kind of beast? ( Cochonbuta / Ursinehomme / Ursinepiros / Kumabatto / The Quantumcrusafied ) << "; do_beast = gets.chomp

if    do_beast ==           "Cochonbuta"; print available_beasts[0]; puts " Combines a lobster and a boar, related to the spider pig."
elsif do_beast ==          "Ursinehomme"; print available_beasts[1]; puts " Literally translates to bear-man, is the male version of wearbears. Ursinefemme is the female version."
elsif do_beast ==          "Ursinepiros"; print available_beasts[2]; puts " Literally translates to vampire-bear, is the human version of wearbears that feeds on human's blood."
elsif do_beast ==            "Kumabatto"; print available_beasts[3]; puts " A condensed version of 'Le Kumabatto De Les Ghoules', is the king of the bear-bat ghouls."
elsif do_beast == "The Quantumcrusafied"; print available_beasts[4]; puts " The wandering spirits of men punished for quantum treason by quantum crusafiction."
else
  puts ">> Not such beast exists on land or sea..."
end

gets.chomp
