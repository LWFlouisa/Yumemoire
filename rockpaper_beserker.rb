
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

# Current Lunar Phase
$current_phase =  File.read("lib/data/lunar_calender/current_phase.txt").strip.to_i # 0

## Amount of days in a year.
$current_day = 0
$lunar_ticks = 30

# One allows you to always maintain a certain maximum reset hp. The other can be altered.
$true_reset_hp = File.read("lib/player_stats/true_reset_hp.txt").strip.to_i
$reset_hp      = File.read("lib/player_stats/reset_hp.txt").strip.to_i

# Standard base stats
$personal_demon_metric = File.read("lib/data/user/personal_demon_metric.txt").strip.to_i
$player_healing_rate   = File.read("lib/player_stats/player_healing_rate.txt").strip.to_i

$player_hp   = File.read("lib/player_stats/player_hp.txt").strip.to_i
$player_atk  = File.read("lib/player_stats/player_atk.txt").strip.to_i
$player_heal = $player_healing_rate

$enemy_hp   = 10
$enemy_atk  = 2
$enemy_heal = 4

# Resets the player's HP
$true_hp_reset = 10
$reset_hp = 10

# In game currency
$value_of_yen     = 172
$value_of_franc   = 1
$value_of_lunario = $value_of_franc * 500

# For every five Francs you get 860 yen.
$player_lunario = $value_of_lunario * 5
$player_franc   = $value_of_france * 5
$player_yen     = $value_of_yen * 5

# Footwear related
$wooden_shoes    = false
$steps_taken     = 0
$clog_sturdiness = 100

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
#                                 Dialogue Script                                     #
#######################################################################################
def word_lengths
  def one_character
    dipthongs = File.readlines("lib/data/dipthongs.txt")

    generated_word = dipthongs.sample.strip.to_s

    masculine      = generated_word.chop +  "u"
    feminine       = generated_word.chop +  "a"
    plural         = generated_word.chop + "os"
    
    puts "Single"
    puts "#{masculine} #{feminine} #{plural}"

    puts " "
  end

  def three_character
    dipthongs = File.readlines("lib/data/dipthongs.txt")

    component_one = dipthongs.sample.strip.to_s
    component_two = dipthongs.sample.strip.to_s
    component_tre = dipthongs.sample.strip.to_s

    generated_word = component_one + component_two + component_tre

    masculine      = generated_word.chop +  "u"
    feminine       = generated_word.chop +  "a"
    plural         = generated_word.chop + "os"
    
    puts "Triple"
    puts "#{masculine} #{feminine} #{plural}"

    puts " "
  end

  def five_character
    dipthongs = File.readlines("lib/data/dipthongs.txt")

    component_one = dipthongs.sample.strip.to_s
    component_two = dipthongs.sample.strip.to_s
    component_tre = dipthongs.sample.strip.to_s
    component_fro = dipthongs.sample.strip.to_s
    component_fiv = dipthongs.sample.strip.to_s

    generated_word = component_one + component_two + component_tre + component_fro + component_fiv

    masculine      = generated_word.chop +  "u"
    feminine       = generated_word.chop +  "a"
    plural         = generated_word.chop + "os"
    
    puts "Septuple"
    puts "#{masculine} #{feminine} #{plural}"

    puts " "
  end

  def seven_character
    dipthongs = File.readlines("lib/data/dipthongs.txt")

    component_one = dipthongs.sample.strip.to_s
    component_two = dipthongs.sample.strip.to_s
    component_tre = dipthongs.sample.strip.to_s
    component_fro = dipthongs.sample.strip.to_s
    component_fiv = dipthongs.sample.strip.to_s
    component_six = dipthongs.sample.strip.to_s
    component_sev = dipthongs.sample.strip.to_s

    generated_word = component_one + component_two + component_tre + component_fro + component_fiv + component_six + component_sev

    masculine      = generated_word.chop +  "u"
    feminine       = generated_word.chop +  "a"
    plural         = generated_word.chop + "os"
    
    puts "Seven"
    puts "#{masculine} #{feminine} #{plural}"

    puts " "
  end
end

def dialogue
  # Adjust programr so that different dialogue sections are opened up at different lunar phases.
  # This is a temporary solution until I can write my own XML based dialogue scripting system.

  def talk_to_innkeeper
    require 'programr'

    brains = Dir.glob("lib/AIML/Inkeeper/*")

    robot = ProgramR::Facade.new
    robot.learn(brains)

    begin
      print '>> '
      s = STDIN.gets.chomp
  
      if s != 'quit'
        reaction = robot.get_reaction(s)
        STDOUT.puts "INKEEPER << #{reaction}"
      end
    end while s != 'quit'
  end

  def talk_to_armourer
    require 'programr'

    brains = Dir.glob("lib/AIML/Armourer/*")

    robot = ProgramR::Facade.new
    robot.learn(brains)

    begin
      print '>> '
      s = STDIN.gets.chomp
  
      if s != 'quit'
        reaction = robot.get_reaction(s)
        STDOUT.puts "ARMOURER << #{reaction}"
      end
    end while s != 'quit'
  end

  def talk_to_cremator
    require 'programr'

    brains = Dir.glob("lib/AIML/Cremator/*")

    robot = ProgramR::Facade.new
    robot.learn(brains)

    begin
      print '>> '
      s = STDIN.gets.chomp
  
      if s != 'quit'
        reaction = robot.get_reaction(s)
        STDOUT.puts "CREMATOR << #{reaction}"
      end
    end while s != 'quit'
  end

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
#                        Purchasing Shoes And Steps Counter                            #
########################################################################################
def shoe_carpenter
  if $clog_sturdiness < 85
    puts "###################"
    puts "     25 Francs     "
    puts "###################"

    print ">> Do you wish to repair your shoes?"; repair_shoes = gets.chomp

    if repair_shoes == "repair"
      if $player_franc > 25
        $clog_sturdiness = 100
      else
        puts ">> Sorry I can't repair your clogs if your don't have enough money."
      end
    else
      puts ">> Hope you'll come again.'"
    end
  else
    puts ">> You don't need to repair your wooden shoes.'"
  end
end

def step_counter
  def if_wearing_clogs
    $steps_taken = $steps_taken + 1
    $player_hp = $player_hp - 1

    $clog_sturdiness = $clog_sturdiness - 2

    puts "You are wearing wooden shoes, your current HP is #{$player_hp}."
  end

  def if_no_shoes
    $steps_taken = $steps_taken + 1
    $player_hp = $player_hp - 3

    puts "Your are not wearing shoes, this wears out your HP faster: #{$player_hp}"
  end

  wooden_shoes = $wooden_shoes

  if wooden_shoes == true
    if_wearing_clogs
  else
    if_no_shoes
  end
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
        f.puts enemy_actions[chosen_action]
      }

      ">> The player retained enemy behaviour patterns in longterm memory."

      break
    else
      ">> The player has guessed enemy's behaviours incorrectly."
    end

    sleep(1.5)
  end
end

def guess_enemy_movement
  enemy_actions = File.readlines("lib/data/ai/enemy_actions.txt")
  total_actions = enemy_actions.size.to_i

  chosen_action = File.read("lib/data/ai/chosen_action.txt").strip.to_i

  total_actions.times do
    observed_enemy_behaviours = File.readlines("lib/data/ai/observed_enemy_actions.txt")
    observed_enemy_behaviours = observed_enemy_behaviours.shuffle
    current_enemy_action      = observed_enemy_behaviours.sample.to_s

    if enemy_actions[chosen_action] == current_enemy_action
      File.open("lib/data/ai/enemy_patterns/observed_enemy_actions.txt", "a") { |f|
        f.puts enemy_actions[chosen_action]
      }

      ">> The player in beserker status countered the enemies behaviour based on previous interactions."

      break
    else
      ">> The player in beserker made has chosen incorrectly."
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
    possible_player_actions  = possible_player_actions.shuffle
    current_player_action = possible_player_actions.sample.to_s

    if player_actions[chosen_action] == current_player_action
      File.open("lib/data/ai/observed_player_actions.txt", "a") { |f|
        f.puts player_actions[chosen_action]
      }

      ">> The enemy retained player behaviour patterns in longterm memory."

      break
    else
      ">> The enemy has guessed player behaviours incorrectly."
    end

    sleep(1.5)
  end
end

def guess_player_movement
  player_actions = File.readlines("lib/data/user/player_actions.txt")
  total_actions = player_actions.size.to_i

  chosen_action = File.read("lib/data/user/chosen_action.txt").strip.to_i

  total_actions.times do
    observed_player_behaviours = File.readlines("lib/data/ai/observed_player_actions.txt")
    observed_player_behaviours = observed_player_behaviours.shuffle
    current_player_action      = observed_player_behaviours.sample.to_s

    if player_actions[chosen_action] == current_player_action
      File.open("lib/data/ai/player_patterns/observed_player_actions.txt", "a") { |f|
        f.puts player_actions[chosen_action]
      }

      ">> The enemy countered the player's behaviour based on previous interactions."

      break
    else
      ">> The enemy made has chosen incorrectly."
    end

    sleep(1.5)
  end
end

#############################################################################################
# Standard methods for player autonomy in the game.                                         #
#############################################################################################
def full_player_control
  #player_heal = $healing_rate

  # Loop for full player control

  # Least damaging, yet most efficient healing and other maintence.

  conditions = {
    "Epee"  => "Ishi",
    "Ishi"  => "Bache",
    "Bache" => "Epee",
  }

  bezerker_chance = ["autonomy", "autonomy", "autonomy", "autonomy"]

  chance_of_bezerker = bezerker_chance.sample

  if chance_of_bezerker == "autonomy"
    print "Player Choice >> "; @choice = gets.chomp
  else
    puts "Player lost control of the MC..."

    sleep(1.5)

    @choice = File.readlines("lib/data/ai/player_patterns/observed_player_actions.txt").sample.strip.to_s
  end

  @cchoice  = File.readlines("lib/data/ai/enemy_patterns/observed_enemy_actions.txt").sample.strip.to_s

  puts "The enemy chose: #{@cchoice}"

  if    @choice == "Epee"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "0"
    }

    # Records a history of player actions.
    open("lib/data/user/chosen_action.txt", "a") { |f|
      f.puts "0"
    }

    # Allows enemey to learn about player patterns.
    File.open("lib/data/ai/player_patterns/observed_player_actions.txt", "a") { |f|
      f.puts "Epee"
    }
  elsif @choice == "Ishi"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "1"
    }

    # Records a history of player actions.
    open("lib/data/user/chosen_action.txt", "a") { |f|
      f.puts "1"
    }

    # Allows enemey to learn about player patterns.
    File.open("lib/data/ai/player_patterns/observed_player_actions.txt", "a") { |f|
      f.puts "Ishi"
    }
  elsif @choice == "Bache"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "2"
    }

    # Records a history of player actions.
    open("lib/data/user/chosen_action.txt", "a") { |f|
      f.puts "2"
    }

    # Allows enemey to learn about player patterns.
    File.open("lib/data/ai/player_patterns/observed_player_actions.txt", "a") { |f|
      f.puts "Bache"
    }
  elsif @choice == "Sleep"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "2"
    }

    # Records a history of player actions. This one defaults to bache even though its a distinct action.
    open("lib/data/user/chosen_action.txt", "a") { |f|
      f.puts "2"
    }

    # Allows enemey to learn about player patterns.
    File.open("lib/data/ai/player_patterns/observed_player_actions.txt", "a") { |f|
      f.puts "Bache"
    }
  end

  puts " "
  sleep(1.5)

  # Experiment with using an enemy that learns from player's decisions.'
  #ai_decision

  if conditions[@choice] == @cchoice
    puts "You were struck by the enemy!"

    $player_struck = $player_struck + 1

    # The amount of damage player gets is based on the enemies attack power.
    #$player_hp = $player_hp - $enemy_atk
    enemy_damage_rate
  elsif @cchoice == @choice
    puts "You reach a stalemate."

    $stalemates = $stalemates + 1
  elsif conditions[@cchoice] == @choice
    puts "You struck the enemy!"

    $enemy_struck = $enemy_struck + 1

    # The amount of damage enemy recieves is based on the player's attack power.
    #$enemy_hp = $enemy_hp - $player_atk
    player_damage_rate
  elsif @choice == "Sleep"
    puts "\e[38;2;187;127;118mYou've opted to stay at an inn...'\e[0m"

    sleep(1.5)

    stay_at_inn
  else
    puts "\e[38;2;187;127;118m#{@choice} is not a valid option\e[0m"
  end

  observe_enemy
  observe_player

  sleep(1.5)

  $current_day = $current_day + 1
end

def mostly_player_control
  #player_heal = $healing_rate

  # Loop for mostly player control

  # More powerful than full player control, but less efficient maintanence tasks.

  conditions = {
    "Epee"  => "Ishi",
    "Ishi"  => "Bache",
    "Bache" => "Epee",
  }

  bezerker_chance = ["autonomy", "autonomy", "autonomy", "bezerker"]

  chance_of_bezerker = bezerker_chance.sample

  if chance_of_bezerker == "autonomy"
    print "Player Choice >> "; @choice = gets.chomp
  else
    puts "Player lost control of the MC..."

    sleep(1.5)

    @choice = File.readlines("lib/data/ai/player_patterns/observed_player_actions.txt").sample.strip.to_s
  end

  @cchoice  = File.readlines("lib/data/ai/enemy_patterns/observed_enemy_actions.txt").sample.strip.to_s

  puts "The enemy chose: #{@cchoice}"

  if    @choice == "Epee"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "0"
    }

    # Records a history of player actions.
    open("lib/data/user/chosen_action.txt", "a") { |f|
      f.puts "0"
    }

    # Allows enemey to learn about player patterns.
    File.open("lib/data/ai/player_patterns/observed_player_actions.txt", "a") { |f|
      f.puts "Epee"
    }
  elsif @choice == "Ishi"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "1"
    }

    # Records a history of player actions.
    open("lib/data/user/chosen_action.txt", "a") { |f|
      f.puts "1"
    }

    # Allows enemey to learn about player patterns.
    File.open("lib/data/ai/player_patterns/observed_player_actions.txt", "a") { |f|
      f.puts "Ishi"
    }
  elsif @choice == "Bache"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "2"
    }

    # Records a history of player actions.
    open("lib/data/user/chosen_action.txt", "a") { |f|
      f.puts "2"
    }

    # Allows enemey to learn about player patterns.
    File.open("lib/data/ai/player_patterns/observed_player_actions.txt", "a") { |f|
      f.puts "Bache"
    }
  elsif @choice == "Sleep"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "2"
    }

    # Records a history of player actions. This one defaults to bache even though its a distinct action.
    open("lib/data/user/chosen_action.txt", "a") { |f|
      f.puts "2"
    }

    # Allows enemey to learn about player patterns.
    File.open("lib/data/ai/player_patterns/observed_player_actions.txt", "a") { |f|
      f.puts "Bache"
    }
  end

  puts " "
  sleep(1.5)

  # Experiment with using an enemy that learns from player's decisions.'
  #ai_decision

  if conditions[@choice] == @cchoice
    puts "You were struck by the enemy!"

    $player_struck = $player_struck + 1

    # The amount of damage player gets is based on the enemies attack power.
    #$player_hp = $player_hp - $enemy_atk
    enemy_damage_rate
  elsif @cchoice == @choice
    puts "You reach a stalemate."

    $stalemates = $stalemates + 1
  elsif conditions[@cchoice] == @choice
    puts "You struck the enemy!"

    $enemy_struck = $enemy_struck + 1

    # The amount of damage enemy recieves is based on the player's attack power.
    #$enemy_hp = $enemy_hp - $player_atk
    player_damage_rate
  elsif @choice == "Sleep"
    puts "\e[38;2;187;127;118mYou've opted to stay at an inn...'\e[0m"

    sleep(1.5)

    stay_at_inn
  else
    puts "\e[38;2;187;127;118m#{@choice} is not a valid option\e[0m"
  end

  observe_enemy
  observe_player

  sleep(1.5)

  $current_day = $current_day + 1
end

### This section flips between automatic player and player autonomy.
def mostly_automated_player
  #player_heal = $healing_rate

  # Loop for mostly automated player.

  # The most powerful attacks for player character, but least efficient maintance tasks.

  conditions = {
    "Epee"  => "Ishi",
    "Ishi"  => "Bache",
    "Bache" => "Epee",
  }

  bezerker_chance = ["autonomy", "bezerker", "bezerker", "bezerker"]

  chance_of_bezerker = bezerker_chance.sample

  if chance_of_bezerker == "autonomy"
    print "Player Choice >> "; @choice = gets.chomp
  else
    puts "Player lost control of the MC..."

    sleep(1.5)

    @choice = File.readlines("lib/data/ai/player_patterns/observed_player_actions.txt").sample.strip.to_s
  end

  @cchoice  = File.readlines("lib/data/ai/enemy_patterns/observed_enemy_actions.txt").sample.strip.to_s

  puts "The enemy chose: #{@cchoice}"

  if    @choice == "Epee"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "0"
    }

    # Records a history of player actions.
    open("lib/data/user/chosen_action.txt", "a") { |f|
      f.puts "0"
    }

    # Allows enemey to learn about player patterns.
    File.open("lib/data/ai/player_patterns/observed_player_actions.txt", "a") { |f|
      f.puts "Epee"
    }
  elsif @choice == "Ishi"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "1"
    }

    # Records a history of player actions.
    open("lib/data/user/chosen_action.txt", "a") { |f|
      f.puts "1"
    }

    # Allows enemey to learn about player patterns.
    File.open("lib/data/ai/player_patterns/observed_player_actions.txt", "a") { |f|
      f.puts "Ishi"
    }
  elsif @choice == "Bache"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "2"
    }

    # Records a history of player actions.
    open("lib/data/user/chosen_action.txt", "a") { |f|
      f.puts "2"
    }

    # Allows enemey to learn about player patterns.
    File.open("lib/data/ai/player_patterns/observed_player_actions.txt", "a") { |f|
      f.puts "Bache"
    }
  elsif @choice == "Sleep"
    open("lib/input/user/user_choice.txt", "w") { |f|
      f.puts "2"
    }

    # Records a history of player actions. This one defaults to bache even though its a distinct action.
    open("lib/data/user/chosen_action.txt", "a") { |f|
      f.puts "2"
    }

    # Allows enemey to learn about player patterns.
    File.open("lib/data/ai/player_patterns/observed_player_actions.txt", "a") { |f|
      f.puts "Bache"
    }
  end

  puts " "
  sleep(1.5)

  # Experiment with using an enemy that learns from player's decisions.'
  #ai_decision

  if conditions[@choice] == @cchoice
    puts "You were struck by the enemy!"

    $player_struck = $player_struck + 1

    # The amount of damage player gets is based on the enemies attack power.
    #$player_hp = $player_hp - $enemy_atk
    enemy_damage_rate
  elsif @cchoice == @choice
    puts "You reach a stalemate."

    $stalemates = $stalemates + 1
  elsif conditions[@cchoice] == @choice
    puts "You struck the enemy!"

    $enemy_struck = $enemy_struck + 1

    # The amount of damage enemy recieves is based on the player's attack power.
    #$enemy_hp = $enemy_hp - $player_atk
    player_damage_rate
  elsif @choice == "Sleep"
    puts "\e[38;2;187;127;118mYou've opted to stay at an inn...'\e[0m"

    sleep(1.5)

    stay_at_inn
  else
    puts "\e[38;2;187;127;118m#{@choice} is not a valid option\e[0m"
  end

  observe_enemy
  observe_player

  sleep(1.5)

  $current_day = $current_day + 1
end

def fully_automated_player
  # Loop for fully automated player characters.

  # Your attacks are more powerful, but you're not as efficient at maintanence.

  guess_player_movement
  guess_enemy_movement

  conditions = {
    "Epee"  => "Ishi",
    "Ishi"  => "Bache",
    "Bache" => "Epee",
  }

  bezerker_chance = ["bezerker", "bezerker", "bezerker", "bezerker"]

  chance_of_bezerker = bezerker_chance.sample

  if chance_of_bazerker == "autonomy"
    print "Player Choice >> "; @choice = gets.chomp
  else
    puts "Player lost control of the MC..."

    sleep(1.5)

    @choice = File.readlines("lib/data/ai/player_patterns/observed_player_actions.txt").sample.strip.to_s
  end

  @cchoice  = File.readlines("lib/data/ai/enemy_patterns/observed_enemy_actions.txt").sample.strip.to_s

  puts "The enemy chose: #{@choice}"

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
  end

  puts " "
  sleep(1.5)

  # Experiment with using an enemy that learns from player's decisions.'
  #ai_decision

  if conditions[@choice] == @cchoice
    puts "You were struck by the enemy!"

    $player_struck = $player_struck + 1

    # The amount of damage player gets is based on the enemies attack power.
    #$player_hp = $player_hp - $enemy_atk
    enemy_damage_rate
  elsif @cchoice == @choice
    puts "You reach a stalemate."

    $stalemates = $stalemates + 1
  elsif conditions[@cchoice] == @choice
    puts "You struck the enemy!"

    $enemy_struck = $enemy_struck + 1

    # The amount of damage enemy recieves is based on the player's attack power.
    #$enemy_hp = $enemy_hp - $player_atk
    player_damage_rate
  elsif @choice == "Sleep"
    puts "\e[38;2;187;127;118mYou've opted to stay at an inn...'\e[0m"

    sleep(1.5)

    stay_at_inn
  else
    puts "\e[38;2;187;127;118m#{@choice} is not a valid option\e[0m"
  end

  #$current_day = $current_day + 1

  sleep(1.5)

  $current_day = $current_day + 1
end

####################################################################################################
#                                  Game Loop Chooser Coming Soon                                   #
####################################################################################################
pdm = $personal_demon_metric # File.read("lib/data/user/personal_demon_metric.txt").strip.to_i

gets.chomp

loop do
  if pdm > 100
    pdm = 0

    File.open("lib/data/user/personal_demon_metric.txt", "w") { |f|
      f.puts pdm
    }
  end

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

  if $wooden_shoes == true
    puts "[ Clog Studiness: #{$clog_sturdiness} ]"
  else
    puts "[ Clog Studiness: Inactive ]"
  end

  puts "\e[38;2;187;127;118m\n[ Stalemates: #{$stalemates} ] [ Player Strikes: #{$player_struck} ] [ Enemy Strikes: #{$enemy_struck} ]\e[0m"
  puts "\e[38;2;187;127;118m  [ #{$player_lunario} Lunario ( You wont need this for most game functions. ) ]"

  puts "Personal Demon Metric: #{pdm}"

  puts "\e[38;2;187;127;118m\n\e[0m"
  puts "\e[38;2;187;127;118mSouer De Chaos ( Ana Nuveyatusuki ) HP: #{$player_hp} \e[0m"
  puts "\e[38;2;187;127;118mSouer De Commande ( Ana Nuveyatusuki ) HP: #{$enemy_hp}\e[0m"
  puts "\e[38;2;187;127;118m\n\e[0m"


  if pdm == 0
    #$healing_rate = 8

    full_player_control

    File.open("lib/data/user/personal_demon_metric.txt", "w") { |f|
      pdm = pdm + 25

      f.puts pdm
    }
  elsif pdm >= 25
    #$healing_rate = 6

    mostly_player_control

    File.open("lib/data/user/personal_demon_metric.txt", "w") { |f|
      pdm = pdm + 25

      f.puts pdm
    }
  elsif pdm >= 50
    #$healing_rate = 6

    mostly_player_control

    File.open("lib/data/user/personal_demon_metric.txt", "w") { |f|
      pdm = pdm + 25

      f.puts pdm
    }
  elsif pdm >= 75
    #$healing_rate = 4

    mostly_automated_player

    File.open("lib/data/user/personal_demon_metric.txt", "w") { |f|
      pdm = pdm + 25

      f.puts pdm
    }
  elsif pdm >= 100
    #$healing_rate = 2

    fully_automated_player # With full personal demon metric meaning automated beserker like mode.
  end

end
