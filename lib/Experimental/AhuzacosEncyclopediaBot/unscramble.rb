reference_number   = File.read("_ref/ref_number.txt").strip.to_i
features           = File.readlines("_features/known_aspects.txt")
scrambled_features = features.shuffle
row                = features.size.to_i

File.open("_results/results.txt", "w") { |f|
  f.puts "For user known features: #{features}\n"
  f.puts "For scrambled features: #{scrambled_features}\n"

  row.times do
    if features[reference_number] == scrambled_features[reference_number]
      f.puts "Everything in the right place..."
    else
      f.puts "Something is not right here, resorting features..."

      resorted_features = [
        features[0],
        features[1],
        features[2],
        features[3],
        features[4],
      ]

      f.puts "Here are the resorted features: #{resorted_features[0].strip}, #{resorted_features[1].strip}, #{resorted_features[2].strip}, #{resorted_features[3].strip}, #{resorted_features[4].strip}\n"

      abort
    end

    reference_number = reference_number = 1
  end
}
