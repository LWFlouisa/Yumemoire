player_actions = File.readlines("_data/user/player_actions.txt")
total_actions  = player_actions.size.to_i

ai_choice = 0

chosen_action = File.read("_data/user/chosen_action.txt").strip.to_i

total_actions.times do
  possible_actions  = File.readlines("_data/ai/possible_player_actions.txt")
  possible_actions  = possible_actions.shuffle
  current_ai_action = possible_actions.sample.to_s

  if player_actions[chosen_action] == current_ai_action
    File.open("_data/ai/observed_player_actions.txt", "a") { |f|
      f.puts player_actions[chosen_action]
    }

    puts ">> The AI has countered your action. Now searches for specific files..."

    open("_scripts/script.sen", "w") { |f|
      f.puts "? |txt| present?"
    }

    system("ruby autosearch.rb")

    abort
  else
    puts ">> The AI has chosen incorrectly."
  end

  sleep(1.5)
end
