def nouns
  def observe_nouns
    noun_options = File.readlines("lib/data/ai/language/options/noun_options.txt")
    total_nouns = noun_options.size.to_i

    chosen_noun = File.read("lib/data/ai/language/choice/chosen_noun.txt").strip.to_i

    total_nouns.times do
      possible_noun_options = File.readlines("lib/data/ai/language/choice/possible_noun_options.txt")
      possible_noun_options = possible_noun_options.shuffle
      current_noun_option   = possible_noun_options.sample.to_s

      if noun_options[chosen_noun] == current_noun_option
        File.open("lib/data/ai/language/observed/observed_nouns.txt", "w") { |f|
          f.puts noun_options[chosen_noun]
        }
      else
        ">> Have not yet found the right noun...\n"
      end
    end
  end

  def guess_nouns
    noun_options = File.readlines("lib/data/ai/language/options/noun_options.txt")
    total_nouns = noun_options.size.to_i

    chosen_noun = File.read("lib/data/ai/language/choice/chosen_noun.txt").strip.to_i

    total_nouns.times do
      observed_noun_options = File.readlines("lib/data/ai/language/observed/observed_nouns.txt")
      observed_noun_options = observed_noun_options.shuffle
      current_noun_option   = observed_noun_options.sample.to_s

      if noun_options[chosen_noun] == current_noun_option
        File.open("lib/data/ai/language/guessed/guessed_nouns.txt", "w") { |f|
          f.puts noun_options[chosen_noun]
        }
      else
        ">> Have not yet found the right noun...\n"
      end
    end
  end
end

def adjective
  def observe_adjectives
    adjective_options = File.readlines("lib/data/ai/language/options/adjective_options.txt")
    total_adjectives = adjective_options.size.to_i

    chosen_adjective = File.read("lib/data/ai/language/choice/chosen_adjective.txt").strip.to_i

    total_adjectives.times do
      possible_adjective_options = File.readlines("lib/data/ai/language/choice/possible_adjective_options.txt")
      possible_adjective_options = possible_adjective_options.shuffle
      current_adjective_option   = possible_adjective_options.sample.to_s

      if adjective_options[chosen_adjective] == current_adjective_option
        File.open("lib/data/ai/language/observed/observed_adjectives.txt", "w") { |f|
          f.puts adjective_options[chosen_adjective]
        }
      else
        ">> Have not yet found the right adjective..."
      end
    end
  end

  def guess_adjectives
    adjective_options = File.readlines("lib/data/ai/language/options/adjective_options.txt")
    total_adjectives = adjective_options.size.to_i

    chosen_adjective = File.read("lib/data/ai/language/choice/chosen_adjective.txt").strip.to_i

    total_adjectives.times do
      observed_adjective_options = File.readlines("lib/data/ai/language/observed/observed_adjectives.txt")
      observed_adjective_options = observed_adjective_options.shuffle
      current_adjective_option   = observed_adjective_options.sample.to_s

      if adjective_options[chosen_adjective] == current_adjective_option
        File.open("lib/data/ai/language/guessed/guessed_adjectives.txt", "w") { |f|
          f.puts adjective_options[chosen_adjective]
        }
      else
        ">> Have not yet found the right adjective..."
      end
    end
  end
end

def verb
  def observe_verbs
    verb_options = File.readlines("lib/data/ai/language/options/verb_options.txt")
    total_verbs = verb_options.size.to_i

    chosen_verb = File.read("lib/data/ai/language/choice/chosen_verb.txt").strip.to_i

    total_verbs.times do
      possible_verb_options = File.readlines("lib/data/ai/language/choice/possible_verb_options.txt")
      possible_verb_options = possible_verb_options.shuffle
      current_verb_option   = possible_verb_options.sample.to_s

      if verb_options[chosen_verb] == current_verb_option
        File.open("lib/data/ai/language/observed/observed_verbs.txt", "w") { |f|
          f.puts verb_options[chosen_verb]
        }
      else
        ">> Have not yet found the right verb..."
      end
    end
  end

  def guess_verbs
    verb_options = File.readlines("lib/data/ai/language/options/verb_options.txt")
    total_verbs = verb_options.size.to_i

    chosen_verb = File.read("lib/data/ai/language/choice/chosen_verb.txt").strip.to_i

    total_verbs.times do
      observed_verb_options = File.readlines("lib/data/ai/language/observed/observed_verbs.txt")
      observed_verb_options = observed_verb_options.shuffle
      current_verb_option   = observed_verb_options.sample.to_s

      if verb_options[chosen_verb] == current_verb_option
        File.open("lib/data/ai/language/guessed/guessed_verbs.txt", "w") { |f|
          f.puts verb_options[chosen_verb]
        }
      else
        ">> Have not yet found the right verb..."
      end
    end
  end
end

## Observe Symbolic Representation
def observed_representation
  nouns.observe_nouns
  adjective.observe_adjectives
  verb.observe_verbs

  observed_noun_result             = File.read("lib/data/ai/language/observed/observed_nouns.txt").strip
  observed_adjective_result        = File.read("lib/data/ai/language/observed/observed_adjectives.txt").strip
  observed_verb_result             = File.read("lib/data/ai/language/observed/observed_verbs.txt").strip
  observed_symbolic_representation = "#{observed_noun_result}(#{observed_adjective_result}, #{observed_verb_result})"

  observed_symbolic_representation + " : " 

  File.open("lib/data/ai/relationships/observed_relationships.txt", "w") { |f|
    f.puts observed_symbolic_representation
  }
end

## Guesssed Symbolic Representation
def guessed_representation
  nouns.guess_nouns
  adjective.guess_adjectives
  verb.guess_verbs

  guessed_noun_result             = File.read("lib/data/ai/language/guessed/guessed_nouns.txt").strip
  guessed_adjective_result        = File.read("lib/data/ai/language/guessed/guessed_adjectives.txt").strip
  guessed_verb_result             = File.read("lib/data/ai/language/guessed/guessed_verbs.txt").strip
  guessed_symbolic_representation = "#{guessed_noun_result}(#{guessed_adjective_result}, #{guessed_verb_result})."

  guessed_symbolic_representation

  sleep(1.5)

  puts " "

  File.open("lib/data/ai/relationships/guessed_relationship.txt", "w") { |f|
    f.puts guessed_symbolic_representation
  }
end

# Analyze relationship
def symbolic_speculation
  symbolic_relationship = File.read("lib/data/ai/relationships/guessed_relationship.txt").strip.to_s

  if    symbolic_relationship == "house(brown, darkens)."
    puts ">> This brown house darkens."
  elsif symbolic_relationship ==   "kitchen(taupe, brightens)."
    puts ">> This taupe kitchen brightens."
  else
    puts ">> I don't understand the relationship...'"
  end
end

system("cd lib/data/ai/language/choice; ruby choose_words.rb")

observed_representation
guessed_representation
symbolic_speculation
