require "humanist_errors"

include HumanistErrors

#system("clear")

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
$true_reset_hp = File.read("lib/data/user/player_stats/true_reset_hp.txt").strip.to_i
$reset_hp      = File.read("lib/data/user/player_stats/true_reset_hp.txt").strip.to_i

# Standard base stats
$personal_demon_metric = File.read("lib/data/user/personal_demon_metric.txt").strip.to_i
$player_healing_rate   = File.read("lib/data/user/player_stats/player_healing_rate.txt").strip.to_i

$player_hp   = File.read("lib/data/user/player_stats/player_hp.txt").strip.to_i
$player_atk  = 2
$player_heal = 1 #$player_healing_rate

$enemy_hp   = 10
$enemy_atk  = 2
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

# Yes or no spider
$has_pet_spider = false

##########################################################################################
#                                    Lunar Phase                                         #
##########################################################################################
def lunar_cycle
  lunar_phases = [0, 1, 2, 3, 4, 5, 6, 7]

  # The current lunar phase mod 7
  current_phase  = $current_phase % 7
  #$current_phase = $current_phase + 1 % 7

  if    current_phase == lunar_phases[0]
    puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Full Moon. Réinitialisation des statistiques du joueur...\e[0m"

    sleep(1)

    $player_hp   = $player_hp
    $player_atk  = $player_atk
    $player_heal =  2

    # Negative Healing ala illness
    #$player_illness = 2
  elsif current_phase == lunar_phases[1]
    puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Waning Gibbous. Réinitialisation des statistiques du joueur...\e[0m"

    sleep(1)

    $player_hp   = $player_hp - 2
    $player_atk  = $player_atk + 2
    $player_heal = 2

    # Negative Healing ala illness
    #$player_illness = 2
  elsif current_phase == lunar_phases[2]
    puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: First Quarter. Réinitialisation des statistiques du joueur...\e[0m"

    sleep(1)

    $player_hp   = $player_hp  - 4
    $player_atk  = $player_atk + 4
    $player_heal = 2

    # Negative Healing ala illness
    #$player_illness = 2
  elsif current_phase == lunar_phases[3]
    puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Waxing Crescent. Réinitialisation des statistiques du joueur...\e[0m"

    sleep(1)

    $player_hp   = $player_hp  - 6
    $player_atk  = $player_atk + 6
    $player_heal = 2

    # Negative Healing ala illness
    #$player_illness = 2
  elsif current_phase == lunar_phases[4]
    puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: New Moon. Réinitialisation des statistiques du joueur...\e[0m"

    sleep(1)

    $player_hp   = $player_hp  - 8
    $player_atk  = $player_atk + 8
    $player_heal = 2

    # Negative Healing ala illness
    #$player_illness = 8
  elsif current_phase == lunar_phases[5]
    puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Waning Crescent. Réinitialisation des statistiques du joueur...\e[0m"

    sleep(1)

    $player_hp   = $player_hp  - 5
    $player_atk  = $player_atk + 6
    $player_heal = 2

    # Negative Healing ala illness
    #$player_illness = 6
  elsif current_phase == lunar_phases[6]
    puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Third Quarter. Réinitialisation des statistiques du joueur...\e[0m"

    sleep(1)

    $player_hp   = $player_hp  - 3 #  7
    $player_atk  = $player_atk + 8 # 10
    $player_heal = 2

    # Negative Healing ala illness
    #$player_illness = 4
  elsif current_phase == lunar_phases[7]
    puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Waning Gibbous. Réinitialisation des statistiques du joueur...\e[0m"

    sleep(1)

    $player_hp   = $player_hp  - 1 # 9
    $player_atk  = $player_atk - 2 # 2
    $player_heal = 2

    # Negative Healing ala illness
    #$player_illness = 2
  end

  sleep(1.5)
end

#######################################################################################
#                                  Monster Names                                      #
#######################################################################################
def monster_name
  def five_elements
    possible_elements = File.readlines("lib/beastiary/monsternames/elements.txt")

    $chosen_element = possible_elements.sample.strip.to_s
  end

  def adjectives
    possible_adjectives = File.readlines("lib/beastiary/monsternames/gendered_adverb.txt")

    $chosen_adjective = possible_adjectives.sample.strip.to_s 
  end
end 

monster_name.five_elements
monster_name.adjectives

$current_monster_name = $chosen_element + " " + $chosen_adjective
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
#                       Damage And Healing Formulas For Players                        #
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

#def player_healing_rate
  #$player_hp = $player_hp + 1 # Heal the player at a specific rate.
#end

# An intransitive state machine that determines healing success rate.
def spider_pig_farmer
  monster_form = {
    "spider" =>    "pig",
    "pig"    => "farmer",
    "farmer" => "spider",
  }

  print "[ Spider, Pig, Farmer ] >> "
  @choice = gets.chomp

  @cchoices = ["spider", "pig", "farmer"]
  @cchoice  = @cchoices.sample

  if    monster_form[@cchoice] == @choice # Spider heals itself.
    healing_accuracy = {
      "enemy"        => "gribatomaton",
      "gribatomaton" =>       "player",
      "player"       =>        "enemy",
    }

    @cchoice_healing_options = [  "enemy", "gribatomaton", "player" ]

    @cchoice2                = @cchoice_healing_options.sample
    @cchoice_chosen_healing  = healing_accuracy[@cchoice2]

    if    @cchoice_chosen_healing ==        "enemy"; # Enemy heals itself.
    elsif @cchoice_chosen_healing == "gribatomaton"; # Enemy healing cancelled by Pet spider.
    elsif @cchoice_chosen_healing ==       "player"; # Enemy healing cancelled by Farmer.
    end
  elsif monster_form[@choice]  == @choice # Pig heals itself.
    puts "Player managed to prevent enemy from healing."
  elsif @choice == @cchoice
    puts "Player and enemy reach a stalemate."
  else
    puts "Process was not understood..."
  end
end

########################################################################################
#                         Enemy Damage And Healing Formulas                            #
########################################################################################
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

#def enemy_healing_rate
  #$enemy_hp = $enemy_hp + 1 # Heal the player at a specific rate.
#end

############################################################################################################
#                                  Personal Demon Metric                                                   #
############################################################################################################
## Here player autonomy is based on how much the protagonist succumbs to their inner darkness.             #
## With how damaging fully automatic protagonist is depending on how much player tracked enemy behaviours. #
############################################################################################################

#############################################################################################
# Decreases or increases beserker status for player.                                        #
#############################################################################################
# Punishing the player for bad deeds,
def increase_player_pdm
  pdm = File.read("lib/data/user/personal_demons_metric.txt").strip.to_i

  File.open("lib/data/user/personal_demons_metric.txt", "w") { |f|
    pdm = pdm + 5

    f.puts pdm
  }
end

# Rewards the player for good deeds.
def decrease_player_pdm
  pdm = File.read("lib/data/user/personal_demons_metric.txt").strip.to_i

  File.open("lib/data/user/personal_demons_metric.txt", "w") { |f|
    pdm = pdm - 5

    f.puts pdm
  }
end

#############################################################################################
# Determines how devestating fully automated player is for the enemy, based on how much
# the player has learned about the enemy over time.
#############################################################################################
def observe_enemy
  enemy_actions = File.readlines("lib/data/ai/enemy_actions.txt")
  total_actions = enemy_actions.size.to_i

  chosen_action = File.read("lib/data/ai/chosen_action.txt").strip.to_i

  total_actions.times do
    possible_enemy_actions  = File.readlines("lib/data/ai/possible_ai_actions.txt")
    possible_enemy_actions  = possible_enemy_actions.shuffle
    current_enemy_action = possible_enemy_actions.sample.to_s

    if enemy_actions[chosen_action] == current_enemy_action
      File.open("lib/data/ai/observed_enemy_actions.txt", "a") { |f|
        f.puts player_actions[chosen_action]
      }

      puts ">> The player retained enemy behaviour patterns in longterm memory."

      abort
    else
      puts ">> The player has guessed player behaviours incorrectly."
    end

    sleep(1.5)
  end
end

def guess_enemy_movement
  enemy_actions = File.readlines("lib/data/ai/enemy_actions.txt")
  total_actions = enemy_actions.size.to_i

  chosen_action = File.read("liv/data/ai/chosen_action.txt").strip.to_i

  total_actions.times do
    observed_enemy_behaviours = File.readlines("lib/data/ai/observed_enemy_actions.txt")
    observed_enemy_behaviours = observed_enemy_behaviours.shuffle
    current_enemy_action      = observed_enemy_behaviours.sample.to_s

    if enemy_actions[chosen_action] == current_ememy_action
      File.open("lib/data/user/enemy_patterns/observed_player_actions.txt", "a") { |f|
        f.puts player_actions[chosen_action]
      }

      puts ">> The player in beserker status countered the enemies behaviour based on previous interactions."

      abort
    else
      puts ">> The player in beserker made has chosen incorrectly."
    end

    sleep(1.5)
  end
end

################################################################################################
# AI with player observation and educated guesses. Alternative to the main AI decision making. #
################################################################################################
def observe_player
  player_actions = File.readlines("lib/data/user/player_actions.txt")
  total_actions = player_actions.size.to_i

  automated_enemy_choice = 0

  chosen_action = File.read("lib/data/user/chosen_action.txt").strip.to_i

  total_actions.times do
    possible_player_actions  = File.readlines("lib/data/user/possible_player_actions.txt")
    possible_player_actions  = possible_enemy_actions.shuffle
    current_player_action = possible_player_actions.sample.to_s

    if player_actions[chosen_action] == current_player_action
      File.open("lib/data/ai/observed_player_actions.txt", "a") { |f|
        f.puts player_actions[chosen_action]
      }

      puts ">> The enemy retained enemy behaviour patterns in longterm memory."
    else
      puts ">> The enemy has guessed player behaviours incorrectly."
    end

    sleep(1.5)
  end
end

def guess_player_movement
  player_actions = File.readlines("lib/data/user/player_actions.txt")
  total_actions = player_actions.size.to_i

  chosen_action = File.read("liv/data/user/chosen_action.txt").strip.to_i

  total_actions.times do
    observed_player_behaviours = File.readlines("lib/data/ai/observed_player_actions.txt")
    observed_player_behaviours = observed_player_behaviours.shuffle
    current_player_action      = observed_enemy_behaviours.sample.to_s

    if player_actions[chosen_action] == current_player_action
      File.open("lib/data/ai/player_patterns/observed_player_actions.txt", "a") { |f|
        f.puts player_actions[chosen_action]
      }

      puts ">> The enemy countered the enemies behaviour based on previous interactions."

      abort
    else
      puts ">> The enemy made has chosen incorrectly."
    end

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

#############################################################################################
# Standard methods for player autonomy in the game.                                         #
#############################################################################################
def full_player_control
  player_heal = $healing_rate

  # Loop for full player control

  # Least damaging, yet most efficient healing and other maintence.

  observe_player
  observe_enemy
end

def mostly_player_control
  player_heal = $healing_rate

  # Loop for mostly player control

  # More powerful than full player control, but less efficient maintanence tasks.

  observe_player
  observe_enemy
end

def mostly_automated_player
  player_heal = $healing_rate

  # Loop for mostly automated player.

  # The most powerful attacks for player character, but least efficient maintance tasks.

  observe_player
  observe_enemy
end

def fully_automated_player
  player_heal = $healing_rate

  # Loop for fully automated player characters.

  # Your attacks are more powerful, but you're not as efficient at maintanence.

  guess_enemy_movement
  guess_player_movement
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

  menu = File.read("lib/images/menus/main.txt")

  puts menu

  puts "\e[38;2;187;127;118m[ Currency is #{$player_franc} Francs And #{$player_yen} Yen ]\e[0m"

  puts "\e[38;2;187;127;118m\n[ Stalemates: #{$stalemates} ] [ Player Strikes: #{$player_struck} ] [ Enemy Strikes: #{$enemy_struck} ]\e[0m"
  puts "\e[38;2;187;127;118m  [ #{$player_lunario} Lunario ( You wont need this for most game functions. ) ]"

  puts "\e[38;2;187;127;118m\n\e[0m"
  puts "\e[38;2;187;127;118mSouer De Chaos ( Ana Nuveyatusuki ) HP: #{$player_hp} \e[0m"
  puts "\e[38;2;187;127;118m#{$current_monster_name} HP: #{$enemy_hp}\e[0m"
  #puts "\e[38;2;187;127;118mSouer De Commande ( Ana Nuveyatusuki ) HP: #{$enemy_hp}\e[0m"
  puts "\e[38;2;187;127;118m\n\e[0m"

  if $player_hp <= 0
    system("clear")

    puts "\e[38;2;187;127;118mYou've been zombiefied!\e[0m"

    sleep(1.5)

    system("ruby zombie_status.rb")
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

  if $has_spider == true
    puts "\e[38;2;187;127;118mTo heal the player, type: Heal\e[0m"
  else
    puts "\e[38;2;187;127;118mTo heal the player, type: Sleep\e[0m"
  end

  print "\e[38;2;164;145;91m\nEpee, Ishi, or Bache >> \e[0m"
  @choice = gets.chomp.capitalize

  if    @choice == "Epee"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "0"
    }

    # Records a history of player actions.
    open("lib/data/user/chosen_action.txt", "a") { |f|
      f.puts "0"
    }
  elsif @choice == "Ishi"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "1"
    }

    # Records a history of player actions.
    open("lib/data/user/chosen_action.txt", "a") { |f|
      f.puts "1"
    }
  elsif @choice == "Bache"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "2"
    }

    # Records a history of player actions.
    open("lib/data/user/chosen_action.txt", "a") { |f|
      f.puts "2"
    }
  elsif @choice == "Sleep"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "2"
    }

    # Records a history of player actions. This one defaults to bache even though its a distinct action.
    open("lib/data/user/chosen_action.txt", "a") { |f|
      f.puts "2"
    }
  elsif @choice == "Heal"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "2"
    }

    # Records a history of player actions. This one defaults to bache even though its a distinct action.
    open("lib/data/user/chosen_action.txt", "a") { |f|
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
  elsif @choice == "Sleep"
    puts "\e[38;2;187;127;118mYou've opted to stay at an inn...'\e[0m"

    sleep(1.5)

    stay_at_inn
  elsif @choice == "Heal"
    puts "\e[38;2;187;127;118mThink quickly or you wont be able to heal properly....'\e[0m"

    sleep(1.5)

    spider_pig_farmer
  else
    puts "\e[38;2;187;127;118m#{@choice} is not a valid option\e[0m"
  end

  $current_day = $current_day + 1
end

####################################################################################################
# Game Loop Chooser Coming Soon #
####################################################################################################
#if pdm == 0
#  $healing_rate = 8
#
#  fully_player_control
#elsif pdm == 25
#  $healing_rate = 6
#
#  mostly_player_control
#elsif pdm == 70
#  $healing_rate = 4
#
#  mostly_automated_player
#elsif pdm == 100
#  $healing_rate = 2
#
#  fully_automated_player # With full personal demon metric meaning automated beserker like mode.
#end
