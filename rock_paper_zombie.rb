puts "\e[38;2;187;127;118m  \e[8;42;107t"
#puts "\e[38;2;187;127;118m  \e]11;#252424\e\\"

##########################################################################################
#                       Global variables that effect gameplay.                           #
##########################################################################################
# Standard Operations
$stalemates    = 0 # Keeps track of how many stalemates
$player_struck = 0 # Keeps track of how many times player hit the enemy.
$enemy_struck  = 0 # Keeps track of how many times enemy hit the player.

## Current Lunar Phase
$current_phase = 0

# One allows you to always maintain a certain maximum reset hp. The other can be altered.
$true_reset_hp = File.read("lib/player_stats/true_reset_hp.txt").strip.to_i
$reset_hp      = File.read("lib/player_stats/reset_hp.txt").strip.to_i

# Standard base stats
$player_hp   = File.read("lib/player_stats/zombie_player_hp.txt").strip.to_i
$player_atk  = 1
$player_heal = 4

$enemy_hp   = 10
$enemy_atk  = 1
$enemy_heal = 4

# Amount of days in a year.
$current_day = 0
$lunar_ticks = 30

# Resets the player's HP
$true_hp_reset = 10
$reset_hp = 10

# In game currency
$value_of_yen     = 172
$value_of_franc   = 1
$value_of_lunario = $value_of_franc * 500

# For every five Francs you get 860 yen.
$player_lunario = $value_of_lunario * 5
$player_franc   = $value_of_franc * 5
$player_yen     = $value_of_yen * 5
##########################################################################################
#                                    Lunar Phase                                         #
##########################################################################################
def lunar_cycle
  lunar_phases = [0, 1, 2, 3, 4, 5, 6, 7]

  # The current lunar phase mod 7
  current_phase  = $current_phase % 7
  $current_phase = $current_phase + 1 % 7

  if    current_phase == lunar_phases[0]
    puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Full Moon. Réinitialisation des statistiques du joueur...\e[0m"

    sleep(1)

    $player_hp   = -10
    $player_atk  =  4
    $player_heal =  2

    # Negative Healing ala illness
    #$player_illness = 2
  elsif current_phase == lunar_phases[1]
    puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Waning Gibbous. Réinitialisation des statistiques du joueur...\e[0m"

    sleep(1)

    $player_hp   = -8
    $player_atk  = 6
    $player_heal = 2

    # Negative Healing ala illness
    #$player_illness = 2
  elsif current_phase == lunar_phases[2]
    puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: First Quarter. Réinitialisation des statistiques du joueur...\e[0m"

    sleep(1)

    $player_hp   = -6
    $player_atk  = 8
    $player_heal = 2

    # Negative Healing ala illness
    #$player_illness = 2
  elsif current_phase == lunar_phases[3]
    puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Waxing Crescent. Réinitialisation des statistiques du joueur...\e[0m"

    sleep(1)

    $player_hp   = -4
    $player_atk  = 8
    $player_heal = 2

    # Negative Healing ala illness
    #$player_illness = 2
  elsif current_phase == lunar_phases[4]
    puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: New Moon. Réinitialisation des statistiques du joueur...\e[0m"

    sleep(1)

    $player_hp   = -2
    $player_atk  = 10
    $player_heal = 2

    # Negative Healing ala illness
    #$player_illness = 8

    gets.chomp

    abort
  elsif current_phase == lunar_phases[5]
    puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Waning Crescent. Réinitialisation des statistiques du joueur...\e[0m"

    sleep(1)

    $player_hp   = -5
    $player_atk  = 8
    $player_heal = 2

    # Negative Healing ala illness
    #$player_illness = 6
  elsif current_phase == lunar_phases[6]
    puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Third Quarter. Réinitialisation des statistiques du joueur...\e[0m"

    sleep(1)

    $player_hp   =  -7
    $player_atk  = 10
    $player_heal =  2

    # Negative Healing ala illness
    #$player_illness = 4
  elsif current_phase == lunar_phases[7]
    puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Waning Gibbous. Réinitialisation des statistiques du joueur...\e[0m"

    sleep(1)

    $player_hp   = -9
    $player_atk  = 2
    $player_heal = 2

    # Negative Healing ala illness
    #$player_illness = 2
  end

  sleep(1.5)
end

#######################################################################################
#                                  Inn Mechanics                                      #
#######################################################################################
# Subroutine for staying at an inn.
def stay_at_inn
  if $player_hp > 0
    if $player_yen >= 172
      sleep(1.5)

      puts "\e[38;2;187;127;118mInn Keeper: Have a nice stay!\e[0m"

      $player_hp = $reset_hp
      $player_yen = $player_yen - 172

      sleep(1.5)
    else
      sleep(1.5)

      puts "\e[38;2;187;127;118mInn Keeper: Seems you don't have enough Yen.\e[0m"

      sleep(1.5)
    end
  else
    sleep(1.5)

    puts "\e[38;2;187;127;118mInn Keeper: Seems like you don't need the sleep!\e[0m"

    sleep(1.5)
  end
end

########################################################################################
#                                 Armoury Mechanics                                    #
########################################################################################
def visit_armoury
end

########################################################################################
#                      Damage Formulas For Players And Enemies                         #
########################################################################################
def player_damage_rate
  #set_player_stats
  #set_enemy_stats

  def_dice = [ 'full_damage', 'half_damage', 'missed', 'critical' ]

  roll_dice = def_dice.sample

  if roll_dice == 'full_damage'
    damage = $player_atk

    $enemy_hp = $enemy_hp - damage

    puts "\e[38;2;187;127;118mSister Chaos has attacked Sister Order for full damage.\e[0m"

    sleep(1.5)
  elsif roll_dice == 'critical'
    damage = $player_atk * 2

    $enemy_hp = $enemy_hp - damage

    puts "\e[38;2;187;127;118mSister Chaos has attacked Sister Order for double damage.\e[0m"

    sleep(1.5)
  elsif roll_dice == 'half_damage'
    damage = $player_atk / 2

    $enemy_hp = $enemy_hp - damage

    puts "\e[38;2;187;127;118mSister Chaos has attacked Sister Order for half damage.\e[0m"

    sleep(1.5)
  elsif roll_dice == 'missed'
    puts "\e[38;2;187;127;118mSister Chaos has missed Sister Order.\e[0m"

    sleep(1.5)
  end
end

def enemy_damage_rate
  #set_player_stats
  #set_enemy_stats

  def_dice = [ 'full_damage', 'half_damage', 'missed', 'critical' ]

  roll_dice = def_dice.sample

  if roll_dice == 'full_damage'
    damage = $enemy_atk

    $player_hp = $player_hp - damage

    puts "\e[38;2;187;127;118mSister Order has attacked Sister Chaos for full damage.\e[0m"

    sleep(1.5)
  elsif roll_dice == 'critical'
    damage = $enemy_atk * 2

    $player_hp = $player_hp - damage

    puts "\e[38;2;187;127;118mSister Order has attacked Sister Chaos for double damage.\e[0m"

    sleep(1.5)
  elsif roll_dice == 'half_damage'
    damage = $enemy_atk / 2

    $player_hp = $player_hp - damage

    puts "\e[38;2;187;127;118mSister Order has attacked Sister Chaos for half damage.\e[0m"

    sleep(1.5)
  elsif roll_dice == 'missed'
    puts "\e[38;2;187;127;118mSister Order has missed the Sister Chaos.\e[0m"

    sleep(1.5)
  end
end

###############################################################################################
#                                   AI Decision Making                                        #
###############################################################################################
def ai_decision
  cchoice = @choice

  ## Determining user data and user choice.
  value = File.read("lib/input/user/user_choice.txt").to_s.to_i

  user_data   = File.readlines("lib/data/user/candidates.txt")
  user_choice = user_data[value]

  ## Processing AI focused data
  ai_choice            = File.read("lib/data/ai/ai_choice.txt").to_s.to_i
  ai_initial_candidate = user_data[ai_choice]
  ai_search_limit      = user_data.size.to_i

  ## Create AI data from user data.
  ai_search_limit.times do
    if ai_choice == user_choice
      #puts "\e[38;2;187;127;118m  The specific candidate was found. Terminating selection..."

      ai_data      = user_data.slice!(ai_choice)

      open("lib/data/ai/candidates.txt", "w") { |f|
        f.puts ai_data
      }
    else
      puts "\e[38;2;187;127;118mL'ennemi découvre que vous n'avez pas fait ce choix...\e[0m"
    end

    sleep(1.5)
  end

  ## AI processing data.
  ai_choice            = File.read("lib/data/ai/ai_choice.txt").to_s.to_i
  ai_data              = File.readlines("lib/data/ai/candidates.txt")
  ai_search_limit      = ai_data.size.to_i
  ai_next_candidate    = ai_data[ai_choice]

  ai_search_limit.times do
    if ai_next_candidate == user_choice
      ai_final_candidate = ai_next_candidate
    
      puts "\e[38;2;187;127;118mCandidate found, processing input...\e[0m"; sleep(1)

      # Breaks the loop if an appropriate candidate is found.

      sleep(1.5)

      conditions = ["Sword", "Stone", "Tarp"]

      decision_made = conditions.sample

      puts "\e[38;2;187;127;118mBy process of elimination, the bot chose: #{ai_data}\e[0m"

      @cchoice = "#{ai_data}"

      puts $cchoice

      break
    else
      ai_choice            = File.read("lib/data/ai/ai_choice.txt").to_s.to_i
      ai_data              = File.readlines("lib/data/ai/candidates.txt")
      ai_search_limit      = ai_data.size.to_i
      ai_next_candidate    = ai_data[ai_choice]

      ai_data      = user_data.slice!(ai_choice).strip

      puts "\e[38;2;187;127;118mEnemy found the option #{ai_data}\e[0m"

      enemy_decision = ["choose", "skip"]

      decision_made = enemy_decision.sample

      if decision_made == "choose"
        puts "\e[38;2;187;127;118mThe enemy chose: #{ai_data}, but found it causes a stalemate. Makes a new decision\e[0m"

        @cchoice = "#{ai_data}"

        enemy_decision = ["Epee", "Ishi", "Bache"]

        decision_made = enemy_decision.sample

        if    decision_made == "Sword"
          @cchoice = "Epee"
        elsif decision_made == "Stone"
          @cchoice = "Ishi"
        elsif decision_made ==  "Tarp"
          @cchoice = "Bache"
        end

        break
      else
        puts "\e[38;2;187;127;118mEnemy weighed the option of choosing #{ai_data}, but decided to skip its turn.\e[0m"

        break
      end

      sleep(1.5)
 
      open("lib/data/ai/candidates.txt", "w") { |f|
        f.puts ai_data
      }
    end
  end

end

###############################################################################################
#                                      Main Game Loop                                         #
###############################################################################################
loop do

  system("clear")

  if $current_day < $lunar_ticks
    this_day = 29

    puts "\e[38;2;187;127;118mLa prochaine phase lunaire est en cours: #{this_day - $current_day} days...\e[0m"
  else
    lunar_cycle

    # Reset lunar ticks to twenty days away.
    $current_day = 1
  end

  puts "\e[38;2;187;127;118m[ Currency is #{$player_franc} Francs And #{$player_yen} Yen ]\e[0m"

  puts "\e[38;2;187;127;118m\n[ Stalemates: #{$stalemates} ] [ Player Strikes: #{$player_struck} ] [ Enemy Strikes: #{$enemy_struck} ]\e[0m"
  puts "\e[38;2;187;127;118m  [ #{$player_lunario} Lunario ( You wont need this for most game functions. ) ]"

  puts "\e[38;2;187;127;118m\n\e[0m"
  puts "\e[38;2;187;127;118mSouer De Chaos ( Ana Nuveyatusuki ) HP: #{$player_hp} \e[0m"
  puts "\e[38;2;187;127;118mSouer De Commande ( Ana Nuveyatusuki ) HP: #{$enemy_hp}\e[0m"
  puts "\e[38;2;187;127;118m\n\e[0m"

  if $player_hp > 0
    system("clear")

    puts "\e[38;2;187;127;118mYou've been zombiefied!\e[0m"

    sleep(1.5)

    system("ruby rockpaper.rb")
  elsif $enemy_hp <= 0
    puts "\e[38;2;187;127;118mYou won\e[0m"

    gets.chomp

    abort
  end

  conditions = {
    "Epee"  =>  "Ishi",
    "Ishi"  => "Bache",
    "Bache" =>  "Epee",
  }

  puts "\e[38;2;187;127;118mTo heal the player, type: Chomp\e[0m"

  print "\e[38;2;164;145;91m\nEpee, Ishi, or Bache >> \e[0m"
  @choice = gets.chomp.capitalize

  if    @choice == "Epee"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "0"
    }
  elsif @choice == "Ishi"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "1"
    }
  elsif @choice == "Bache"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "2"
    }
  elsif @choice == "Chomp"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "2"
    }
  end

  puts " "
  sleep(1.5)

  # Experiment with using an enemy that learns from player's decisions.'
  ai_decision

  if conditions[@choice] == @cchoice
    #puts "\e[38;2;187;127;118m  You were struck by the enemy!"

    $enemy_struck = $enemy_struck + 1

    # The amount of damage player gets is based on the enemies attack power.
    #$player_hp = $player_hp - $enemy_atk
    enemy_damage_rate
  elsif @cchoice == @choice
    puts "\e[38;2;187;127;118mYou reach a stalemate.\e[0m"

    $stalemates = $stalemates + 1
  elsif conditions[@cchoice] == @choice
    #puts "\e[38;2;187;127;118m  You struck the enemy!"

    $player_struck = $player_struck + 1

    # The amount of damage enemy recieves is based on the player's attack power.
    #$enemy_hp = $enemy_hp - $player_atk
    player_damage_rate
  elsif @choice == "Chomp"
    puts "\e[38;2;187;127;118mYou tried staying at an inn, but hotels don't take the undead...'\e[0m"

    sleep(1.5)

    death_ritual.consumption
  else
    puts "\e[38;2;187;127;118m#{@choice} is not a valid option\e[0m"
  end

  $current_day = $current_day + 1
end
