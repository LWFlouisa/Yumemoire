ai_choice = 0

noun_options      = [  "house",   "kitchen"]
adjective_options = [  "brown",     "taupe"]
verb_options      = ["darkens", "brightens"]

choose_noun      = noun_options.sample
choose_adjective = adjective_options.sample
choose_verb      = verb_options.sample

File.open("chosen_noun.txt", "w") { |f|
  f.puts choose_noun
}

File.open("chosen_adjective.txt", "w") { |f|
  f.puts choose_adjective
}

File.open("chosen_verb.txt", "w") { |f|
  f.puts choose_verb
}
