color_set = File.readlines("Colors/mycolors.txt")

first_color = color_set.sample.strip
second_color = color_set.sample.strip
third_color = color_set.sample.strip
fourth_color = color_set.sample.strip

puts "Inputting colors into mixer vectors..."

puts first_color

open("_input/first_color.txt", "w") { |f|
  f.puts first_color
}

puts second_color

open("_input/second_color.txt", "w") { |f|
  f.puts second_color
}

puts third_color

open("_input/third_color.txt", "w") { |f|
  f.puts third_color
}

puts fourth_color

open("_input/fourth_color.txt", "w") { |f|
  f.puts fourth_color
}

sleep(1.5)
