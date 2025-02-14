#require "naive_bayes"

#require 'humanist_errors'
#include HumanistErrors

#with_human_errors do

dataset       = File.readlines("_data/datasets/functions.txt")
mapped_values = File.readlines("_data/mapped_values/conversion_map.txt")

scrambled   = dataset.shuffle

actual_row = 0
row1       = 0

limitation = dataset.size.to_i

limitation.times do
  current_scrambled_line   = scrambled[row1].to_i
  actual_datapoint         = dataset[actual_row].to_i

  num_to_part = {
    0 => mapped_values[0], # "Hair",
    1 => mapped_values[1], # "Eyes",
    2 => mapped_values[2], # "Nose",
    3 => mapped_values[3], # "Mouth",
    4 => mapped_values[4], # "Chin",
  }

  scrambled_part = num_to_part[current_scrambled_line]
  actual_representation = num_to_part[actual_datapoint]

  puts "Scrambled: #{scrambled_part.strip} Unscrambled: #{actual_representation}"

  row1 = row1 + 1

  actual_row = actual_row + 1

  open("_scrambled/dataset.txt", "a") { |f|
    f.puts scrambled_part
  }

  open("_unscrambled/dataset.txt", "a") { |f|
    f.puts actual_representation
  }
end

#end
