# Make sure that story elements are kept on seperate lines.
character_fate = File.readlines("_narratives/outcomes/character_fates.txt")
dating_outcome = File.readlines("_narratives/outcomes/dating_outcomes.txt")

# Make the total imagined branch the size of the darkest path.
# branch_size = branch_1.size.to_i

# Imagined a compromise path that is neither ideal or tragic.
open("_imaginedpath/outcomes/outcome1.pl", "w") { |f|

  ## 0, 1
  segment_1 = character_fate[0].strip
  segment_2 = dating_outcome[1].strip

  f.puts segment_1
  f.puts "#{segment_2} :- #{segment_1}"
}

open("_imaginedpath/outcomes/outcome2.pl", "w") { |f|
  ## 0, 2
  segment_1 = character_fate[0].strip
  segment_2 = dating_outcome[2].strip

  f.puts segment_1
  f.puts "#{segment_2} :- #{segment_1}"
}

open("_imaginedpath/outcomes/outcome3.pl", "w") { |f|
  ## 1, 0
  segment_1 = character_fate[1].strip
  segment_2 = dating_outcome[0].strip

  f.puts segment_1
  f.puts "#{segment_2} :- #{segment_1}"
}

open("_imaginedpath/outcomes/outcome4.pl", "w") { |f|
  ## 1, 1
  segment_1 = character_fate[1].strip
  segment_2 = dating_outcome[1].strip

  f.puts segment_1
  f.puts "#{segment_2} :- #{segment_1}"
}

open("_imaginedpath/outcomes/outcome5.pl", "w") { |f|
  ## 1, 2
  segment_1 = character_fate[1].strip
  segment_2 = dating_outcome[2].strip

  f.puts segment_1
  f.puts "#{segment_2} :- #{segment_1}"
}

open("_imaginedpath/outcomes/outcome6.pl", "w") { |f|
  ## 2, 0
  segment_1 = character_fate[2].strip
  segment_2 = dating_outcome[0].strip

  f.puts segment_1
  f.puts "#{segment_2} :- #{segment_1}"
}

open("_imaginedpath/outcomes/outcome7.pl", "w") { |f|
  ## 2, 1
  segment_1 = character_fate[2].strip
  segment_2 = dating_outcome[1].strip

  f.puts segment_1
  f.puts "#{segment_2} :- #{segment_1}"
}
