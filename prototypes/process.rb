  ## Determining user data and user choice.
  value = File.read("_input/user/user_choice.txt").to_s.to_i

  user_data   = File.readlines("_data/user/candidates.txt")
  user_choice = user_data[value]

  ## Processing AI focused data
  ai_choice            = File.read("_data/ai/ai_choice.txt").to_s.to_i
  ai_initial_candidate = user_data[ai_choice]
  ai_search_limit      = user_data.size.to_i

  ## Create AI data from user data.
  ai_search_limit.times do
    if ai_choice == user_choice
      #puts "The specific candidate was found. Terminating selection..."

      ai_data      = user_data.slice!(ai_choice)

      open("_data/ai/candidates.txt", "w") { |f|
        f.puts ai_data
      }
    else
      puts "Enemey finds you didn't make this choice..."
    end

    sleep(1.5)
  end

  ## AI processing data.
  ai_choice            = File.read("_data/ai/ai_choice.txt").to_s.to_i
  ai_data              = File.readlines("_data/ai/candidates.txt")
  ai_search_limit      = ai_data.size.to_i
  ai_next_candidate    = ai_data[ai_choice]

  ai_search_limit.times do
    if ai_next_candidate == user_choice
      ai_final_candidate = ai_next_candidate
    
      puts "Candidate found, processing input..."; sleep(1)

      # Breaks the loop if an appropriate candidate is found.

      sleep(1.5)

      conditions = ["Sword", "Stone", "Tarp"]

      decision_made = conditions.sample

      puts "By process of elimination, the bot chose: #{ai_data}"

      @cchoice = "#{ai_data}"

      puts $cchoice

      break
    else
      ai_choice            = File.read("_data/ai/ai_choice.txt").to_s.to_i
      ai_data              = File.readlines("_data/ai/candidates.txt")
      ai_search_limit      = ai_data.size.to_i
      ai_next_candidate    = ai_data[ai_choice]

      ai_data      = user_data.slice!(ai_choice).strip

      puts "Enemy found the option #{ai_data}"

      enemy_decision = ["choose", "skip"]

      decision_made = enemy_decision.sample

      if decision_made == "choose"
        puts "The enemy chose: #{ai_data}, but found it causes a stalemate. Makes a new decision"

        @cchoice = "#{ai_data}"

        enemy_decision = ["Sword", "Stone", "Tarp"]

        decision_made = enemy_decision.sample

        if    decision_made == "Sword"
          @cchoice = "Sword"
        elsif decision_made == "Stone"
          @cchoice = "Stone"
        elsif decision_made ==  "Tarp"
          @cchoice = "Tarp"
        end

        break
      else
        puts "Enemy weighed the option of choosing #{ai_data}, but decided to skip its turn."

        break
      end

      sleep(1.5)
 
      open("_data/ai/candidates.txt", "w") { |f|
        f.puts ai_data
      }
    end
  end
