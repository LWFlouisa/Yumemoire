## Input Vectors
first_color  = File.read("_input/first_color.txt").strip.to_s
second_color = File.read("_input/second_color.txt").strip.to_s
third_color  = File.read("_input/third_color.txt").strip.to_s
fourth_color = File.read("_input/fourth_color.txt").strip.to_s

## Output Values
first_mix  = File.read("_results/first_mix.txt").strip.to_s
second_mix = File.read("_results/second_mix.txt").strip.to_s
final_mix  = File.read("_results/final_mix.txt").strip.to_s

## To File
open("_posts/input.md", "w") { |f|
  f.puts "## Ruby Mixer"
  f.puts "<p>For mixing #{first_color}, #{second_color}, #{third_color}, and #{fourth_color}:</p>"
  f.puts "<p>The first hex value #{first_color} mixed with second hex value #{second_color} makes: #{first_mix}.</p>"
  f.puts "<p>The third hex value #{third_color} mixed with fourth hex value #{fourth_color} makes: #{second_mix}.</p>"
  f.puts "<p>The first aggregate hex value #{first_mix} mixed with the second aggregate value #{second_mix} produces: #{final_mix}.</p>"
}
