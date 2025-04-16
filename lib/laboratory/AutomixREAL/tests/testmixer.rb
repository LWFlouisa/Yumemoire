def mix_colors(hex1, hex2, weight)
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

# Example usage
hex1 = "#ff0000" # Red
hex2 = "#0000ff" # Blue
weight =  0.75 #  75% of hex2 and  25% of hex1
mixed_hex = mix_colors(hex1, hex2, weight)
puts mixed_hex # Output will vary based on the weight
