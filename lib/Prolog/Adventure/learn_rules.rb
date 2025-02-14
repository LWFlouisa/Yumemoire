def learn_rules
  known_ruleset = File.readlines("_rules/ruleset.txt")
  rule_limit    = known_ruleset.size.to_i
  ai_choice     = File.read("_ai/ai_choice.txt").strip.to_i
  ideal_rule    = File.read("_ai/ideal_rule.txt").strip.to_s
  reset_choice  = 0

  rule_limit.times do
    known_ruleset = known_ruleset.sample

    chosen_rule = known_ruleset[ai_choice]

    if chosen_rule == ideal_rule
      puts ">> The ideal rule has been found..."

      File.open("_adaptational/rewritten_rules.txt", "w") { |f|
        f.puts chosen_rule
      }

      File.open("_ai/ai_choice.txt", "w") { |f|
        f.puts reset_choice
      }
    else
      puts ">> The ideal rule has not been found..."

      File.open("_ai/ai_choice.txt", "w") { |f|
        f.puts ai_choice % rule_limit
      }
    end
  end
end

def make_decision
  new_rules   = File.readlines("_adaptional/rewritten_rules.txt")
  ai_choice   = File.read("_ai/ai_choice.txt").strip.to_i
  active_rule = new_rules[ai_choice]

  # Checks if prolog file exists, if not avoid consulting.
  file_extension = ".pl"
  full_file      = "#{active_rule}#{file_extension}"

  if File.exist?(full_file)
    system("prolog #{active_rule}.pl")
  else
    puts ">> Sorry but this prolog file doesn't exist. Consulting might be a waste of time.'"
  end
end

learn_rules
make_decision
