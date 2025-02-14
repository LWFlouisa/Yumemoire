player_actions = File.readlines("_data/user/player_actions.txt")
total_actions  = player_actions.size.to_i

chosen_action = File.read("_data/user/chosen_action.txt").strip.to_i

total_actions.times do
  observed_player_behaviours = File.readlines("_data/ai/observed_player_actions.txt")
  observed_player_behaviours = observed_player_behaviours.shuffle
  current_ai_action          = observed_player_behaviours.sample.to_s

  if player_actions[chosen_action] == current_ai_action
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
