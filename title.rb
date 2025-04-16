puts "\e[38;2;187;127;118m  \e[8;42;107t"

loop do
  system("clear")

  title_text = File.read("lib/images/title/title2.txt")

  puts title_text

  print "What would you like to do? [ Play / Beastiary / Language / Laboratory / Quit ] >> "; option = gets.chomp

  if option == "Play"
    system("ruby rockpaper.rb")
  elsif option == "Beastiary"
    system("cd lib/beastiary; ruby beastiary.rb")
  elsif option == "Language"
    print ">> Glossary or translation? >> "; lang_choice = gets.chomp

    if    lang_choice == "Glossary"
      system("ruby study.rb")
    elsif lang_choice == "Translate"
      system("ruby lib/encyclopedia/translate/translate.rb")
    else
      puts ">> This language option does not exist."
    end
  elsif option == "Laboratory"
    print "What type of color synthesis? >> "; synthesis_type = gets.chomp

    if synthesis_type == "Real"
      system("cd lib/laboratory/AutomixREAL; ./routine.sh")
    elsif synthesis_type == "Synthetic"
      system("cd lib/laboratory/AutomixSYNTH; ./routine.sh")
    else
      puts ">> There is no such laboratory..."

      abort
    end
#  elsif option == "Medication"
#    system("cd lib/medication; ruby medication_promptor.rb")
#
#    sleep(1.5)

    #puts "\e[38;2;187;127;118m  \e[8;42;107t"
  elsif option == "Quit"
    system("clear")

    abort
  else
    puts "Unregonized command..."

    sleep(1.5)
  end

end
