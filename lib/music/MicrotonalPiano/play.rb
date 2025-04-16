system("clear")

loop do
  puts "
        +-------------+
        | | | | | | | |
        | | | | | | | |
        | | | | | | | |
        +-------------+
         N W R R V X V
         e o e o i i E"

  print "Which key? >> "
  key = gets.chomp

  if    key == "Ne"
    system("play Solfege/1_Ne.mp3")
  elsif key == "Wo"
    system("play Solfege/2_Wo.mp3")
  elsif key == "Re"
    system("play Solfege/3_Re.mp3")
  elsif key == "Ro"
    system("play Solfege/4_Ro.mp3")
  elsif key == "Vi"
    system("play Solfege/5_Vi.mp3")
  elsif key == "Xi"
    system("play Solfege/6_Xi.mp3")
  elsif key == "Ve"
    system("play Solfege/7_Ve.mp3")
  elsif key == "exit"
    abort
  else
    puts "I didn't understand your key..."
  end
end
