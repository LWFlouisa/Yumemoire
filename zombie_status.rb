###############################################################################################
#                                 Zombie State Minigame                                       #
###############################################################################################
#$true_reset_hp = File.read("lib/player_stats/true_reset_hp.txt").strip.to_i
$reset_hp      = File.read("lib/player_stats/reset_hp.txt").strip.to_i
$player_hp     = File.read("lib/player_stats/zombie_player_hp.txt").strip.to_i

def reset_standard_hp_restoration
  puts "The curse of being a zombie has been lifted. You can not die like any other mortal."

  $reset_hp = $true_reset_hp
end

def cremation
  puts "You've self cremated."

  sleep(1.5)

  puts "You've opted to self cremate. Restarting the map."

  $player_hp = $reset_hp

  puts "Now returning to human form..."

  system("ruby rockpaper.rb")
end

def consumption
  puts "You've eaten parts of your own corpse."

  sleep(1.5)

  $reset_hp  = $reset_hp - 1
  $player_hp = $reset_hp

  print "Your HP was replinished but "

  puts " you lost 3 hit points from consuming your own body."

  File.open("lib/player_stats/zombie_player_hp.txt", "w") { |f|
    $player_hp = $player_hp + 3

    f.puts $player_hp -20
  }

  File.open("lib/player_stats/reset_hp.txt", "w") { |f|
    $reset_hp = $reset_hp - 3

    f.puts $reset_hp
  }

  system("ruby rock_paper_zombie.rb")
end

loop do
  print "Do you wish to self-cremate or continue this battle? ( cremate / consumption ) << "

  choose_your_fate = gets.chomp

  if    choose_your_fate == "cremate"
    cremation
  elsif choose_your_fate == "consumption"
    consumption
  else
    puts ">> Last wishes not understoood, defaulting to self-cremation."
  end
end
