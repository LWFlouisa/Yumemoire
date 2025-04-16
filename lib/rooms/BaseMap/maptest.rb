puts "\e[38;2;187;127;118m  \e[8;46;103t"
puts "\e[38;2;187;127;118m  \e]11;#252424\e\\"

system("clear")

map = File.read("template.txt")

#print "\e'\033[96m#{map}\033[0m"

puts "\e[38;2;187;127;118m #{map} \e[0m"

gets.chomp

puts "\e[8;23;80t"
puts "\e]11;#000000\e\\"

system("clear")
