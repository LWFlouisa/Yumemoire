## Here player autonomy is based on how much the protagonist succumbs to their inner darkness.
## With how damaging fully automatic protagonist is depending on how much player tracked enemy behaviours.

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

#############################################################################################
# AI with player observation and educated guesses.
#############################################################################################
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

    #$enemy_struck = $enemy_struck + 1

    # The amount of damage player gets is based on the enemies attack power.
    #$player_hp = $player_hp - $enemy_atk
    #enemy_damage_rate
  elsif @cchoice == @choice
    puts "You reach a stalemate."

    #$stalemates = $stalemates + 1
  elsif conditions[@cchoice] == @choice
    puts "You struck the enemy!"

    #$player_struck = $player_struck + 1

    # The amount of damage enemy recieves is based on the player's attack power.
    #$enemy_hp = $enemy_hp - $player_atk
    #player_damage_rate
  #elsif @choice == "Sleep"
    #puts "\e[38;2;187;127;118mYou've opted to stay at an inn...'\e[0m"

    #sleep(1.5)

    #stay_at_inn
  else
    puts "\e[38;2;187;127;118m#{@choice} is not a valid option\e[0m"
  end

  observe_enemy
  observe_player

  sleep(1.5)
end

def mostly_player_control
  player_heal = $healing_rate

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

    #$enemy_struck = $enemy_struck + 1

    # The amount of damage player gets is based on the enemies attack power.
    #$player_hp = $player_hp - $enemy_atk
    #enemy_damage_rate
  elsif @cchoice == @choice
    puts "You reach a stalemate."

    #$stalemates = $stalemates + 1
  elsif conditions[@cchoice] == @choice
    puts "You struck the enemy!"

    #$player_struck = $player_struck + 1

    # The amount of damage enemy recieves is based on the player's attack power.
    #$enemy_hp = $enemy_hp - $player_atk
    #player_damage_rate
  #elsif @choice == "Sleep"
    #puts "\e[38;2;187;127;118mYou've opted to stay at an inn...'\e[0m"

    #sleep(1.5)

    #stay_at_inn
  else
    puts "\e[38;2;187;127;118m#{@choice} is not a valid option\e[0m"
  end

  observe_enemy
  observe_player

  sleep(1.5)
end

### This section flips between automatic player and player autonomy.
def mostly_automated_player
  player_heal = $healing_rate

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

    #$enemy_struck = $enemy_struck + 1

    # The amount of damage player gets is based on the enemies attack power.
    #$player_hp = $player_hp - $enemy_atk
    #enemy_damage_rate
  elsif @cchoice == @choice
    puts "You reach a stalemate."

    #$stalemates = $stalemates + 1
  elsif conditions[@cchoice] == @choice
    puts "You struck the enemy!"

    #$player_struck = $player_struck + 1

    # The amount of damage enemy recieves is based on the player's attack power.
    #$enemy_hp = $enemy_hp - $player_atk
    #player_damage_rate
  #elsif @choice == "Sleep"
    #puts "\e[38;2;187;127;118mYou've opted to stay at an inn...'\e[0m"

    #sleep(1.5)

    #stay_at_inn
  else
    puts "\e[38;2;187;127;118m#{@choice} is not a valid option\e[0m"
  end

  observe_enemy
  observe_player

  sleep(1.5)
end

def fully_automated_player
  player_heal = $healing_rate

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

    #$enemy_struck = $enemy_struck + 1

    # The amount of damage player gets is based on the enemies attack power.
    #$player_hp = $player_hp - $enemy_atk
    #enemy_damage_rate
  elsif @cchoice == @choice
    puts "You reach a stalemate."

    #$stalemates = $stalemates + 1
  elsif conditions[@cchoice] == @choice
    puts "You struck the enemy!"

    #$player_struck = $player_struck + 1

    # The amount of damage enemy recieves is based on the player's attack power.
    #$enemy_hp = $enemy_hp - $player_atk
    #player_damage_rate
  #elsif @choice == "Sleep"
    #puts "\e[38;2;187;127;118mYou've opted to stay at an inn...'\e[0m"

    #sleep(1.5)

    #stay_at_inn
  else
    puts "\e[38;2;187;127;118m#{@choice} is not a valid option\e[0m"
  end

  #$current_day = $current_day + 1

  sleep(1.5)
end

pdm = File.read("lib/data/user/personal_demon_metric.txt").strip.to_i

system("clear")

gets.chomp

loop do
  if pdm > 100
    pdm = 0

    File.open("lib/data/user/personal_demon_metric.txt", "w") { |f|
      f.puts pdm
    }
  end

  system("clear")

  puts "Personal Demon Metric: #{pdm}"


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
