def constrained_bruteforce
  options       = File.readlines("lib/experimental/cob_system/enemy_options/possible_actions.txt")
  ai_choice     = 0
  search_limit  = options.size.to_i

  player_choice = File.readlines("lib/experimental/cob_system/player_options/possible_actions.txt")

  print "Rock, Paper, Scissors >> "; action = gets.chomp

  search_limit.times do
    current_selection = options[ai_choice]

    if current_selection == action
      puts ">> The enemy has guessed the right player action."

      enemy_counter_attack = [
        "Rock",
        "Paper",
        "Scissors"
      ]

      current_counter_atk = enemy_counter_attack.sample

      if current_counter_atk == action
        puts ">> The enemy countered the player's action."

        sleep(1.5)

        break
      else
        puts ">> The enemy failed to counter-attack."
      end
    else
      puts ">> The enemy has not guessed the right player action."

      ai_choice = ai_choice + 1 % 2
    end
  end
end

def constrained_randomized_bruteforce
  options       = File.readlines("lib/experimental/cob_system/enemy_options/possible_actions.txt").shuffle
  ai_choice     = 0
  search_limit  = options.size.to_i

  player_choice = File.readlines("lib/experimental/cob_system/player_options/possible_actions.txt")

  print "Rock, Paper, Scissors >> "; action = gets.chomp

  search_limit.times do
    current_selection = options[ai_choice]

    if current_selection == action
      puts ">> The enemy has guessed the right player action."

      enemy_counter_attack = [
        "Rock",
        "Paper",
        "Scissors"
      ]

      current_counter_atk = enemy_counter_attack.sample

      if current_counter_atk == action
        puts ">> The enemy countered the player's action."

        sleep(1.5)

        break
      else
        puts ">> The enemy failed to counter-attack."
      end
    else
      puts ">> The enemy has not guessed the right player action."

      ai_choice = ai_choice + 1 % 2
    end
  end
end

def constrained_reversed_bruteforce
  options       = File.readlines("lib/experimental/cob_system/enemy_options/possible_actions.txt").reverse
  ai_choice     = 0
  search_limit  = options.size.to_i

  player_choice = File.readlines("lib/experimental/cob_system/player_options/possible_actions.txt")

  print "Rock, Paper, Scissors >> "; action = gets.chomp

  search_limit.times do
    current_selection = options[ai_choice]

    if current_selection == action
      puts ">> The enemy has guessed the right player action."

      enemy_counter_attack = [
        "Rock",
        "Paper",
        "Scissors"
      ]

      current_counter_atk = enemy_counter_attack.sample

      if current_counter_atk == action
        puts ">> The enemy countered the player's action."

        sleep(1.5)

        break
      else
        puts ">> The enemy failed to counter-attack."
      end
    else
      puts ">> The enemy has not guessed the right player action."

      ai_choice = ai_choice + 1 % 2
    end
  end
end

def constrained_shuffled_and_reversed_bruteforce
  options       = File.readlines("lib/experimental/cob_system/enemy_options/possible_actions.txt").reverse
  options       = options.shuffle

  ai_choice     = 0
  search_limit  = options.size.to_i

  player_choice = File.readlines("lib/experimental/cob_system/player_options/possible_actions.txt")

  print "Rock, Paper, Scissors >> "; action = gets.chomp

  search_limit.times do
    current_selection = options[ai_choice]

    if current_selection == action
      puts ">> The enemy has guessed the right player action."

      enemy_counter_attack = [
        "Rock",
        "Paper",
        "Scissors",
      ]

      current_counter_atk = enemy_counter_attack.sample

      if current_counter_atk == action
        puts ">> The enemy countered the player's action."

        sleep(1.5)

        break
      else
        puts ">> The enemy failed to counter-attack."
      end
    else
      puts ">> The enemy has not guessed the right player action."

      ai_choice = ai_choice + 1 % 2
    end
  end
end

current_ai_options = [ constrained_bruteforce,
                       constrained_randomized_bruteforce,
                       constrained_reversed_bruteforce,
                       constrained_shuffled_and_reversed_bruteforce,
]

current_ai_options.sample
