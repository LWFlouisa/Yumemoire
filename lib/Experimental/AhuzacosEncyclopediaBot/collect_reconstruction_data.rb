## Input Vectors
results = File.read("_results/results.txt")

## To File
open("_posts/input.md", "w") { |f|
  f.puts "## Reconstructor"
  f.puts "#{results}"
}

system("markdown _posts/input.md > _posts/input.txt")
