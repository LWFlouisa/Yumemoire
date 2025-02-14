File.open("_results/second_mix.txt", "w") { |f|

  def mixed_colors(hex1, hex2, weight)
    def hex_to_rgb(hex)
      hex = hex.gsub("#", "")
      r = hex[0..1].to_i(16)
      g = hex[2..3].to_i(16)
      b = hex[4..5].to_i(16)
      [r, g, b]
    end

    def rgb_to_hex(rgb)
      rgb.map { |c| c.to_s(16).rjust(2, '0') }.join
    end

    rgb1 = hex_to_rgb(hex1)
    rgb2 = hex_to_rgb(hex2)
    mixed_rgb = rgb1.zip(rgb2).map { |r, g| (r * (1 - weight) + g * weight).round }
    "#" + rgb_to_hex(mixed_rgb)
  end

  hex_codes = [
    "#ff0000", # red
    "#00ff00", # green
    "#0000ff", # blue
  ]

  print  "Third number [ 0-1 ] >> ";  first_input = gets.chomp.to_i
  print "Fourth number [ 0-1 ] >> "; second_input = gets.chomp.to_i

  hex1 = hex_codes[first_input]  # Red
  hex2 = hex_codes[second_input] # Blue

  weight =  0.75 #  75% of hex2 and  25% of hex1

  mixed_hex = mixed_colors(hex1, hex2, weight)

  f.puts mixed_hex # Output will vary based on the weight
}
