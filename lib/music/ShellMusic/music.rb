entries = Dir.entries("Solfege").sort

row = 2

iteration = entries.size.to_i

iteration.times do
  system("play Solfege/#{entries[row]}")

  row = row + 1
end
