color_data = File.read("translation/input.txt").strip.to_s

## Natural colors
if    color_data ==          "Salmon";  sleep(1.5); system("./salmonbasic.sh")
elsif color_data ==     "Pale Salmon";  sleep(1.5); system("./palesalmon.sh")
elsif color_data ==     "Salmon Pink";  sleep(1.5); system("./salmonpink.sh")
elsif color_data ==          "Copper";  sleep(1.5); system("./cooper.sh")
elsif color_data == "Japanese Bistre";  sleep(1.5); system("./japanesebistre.sh")
elsif color_data ==           "Maize";  sleep(1.5); system("./maize.sh")
elsif color_data ==           "Khaki";  sleep(1.5); system("./khaki.sh")
elsif color_data ==           "Bland";  sleep(1.5); system("./bland.sh")
elsif color_data ==       "Pale Lime";  sleep(1.5); system("./palelime.sh")
elsif color_data ==   "Vibrant Green";  sleep(1.5); system("./vibrantgreen.sh")
elsif color_data ==    "Medium Green";  sleep(1.5); system("./mediuemgreen.sh")
elsif color_data ==     "Kelly Green";  sleep(1.5); system("./kellygreen.sh")
elsif color_data ==        "Viridian";  sleep(1.5); system("./viridian.sh")
elsif color_data ==     "Ultramarine";  sleep(1.5); system("./ultramarine.sh")
elsif color_data ==  "Muted Sapphire";  sleep(1.5); system("./mutedsapphire.sh")
elsif color_data ==   "Dark Sapphire";  sleep(1.5); system("./darksapphire.sh")
elsif color_data ==       "Grey Blue";  sleep(1.5); system("./greyblue.sh")
elsif color_data ==     "Dull Purple";  sleep(1.5); system("./dullpurple.sh")
elsif color_data ==     "Light Mauve";  sleep(1.5); system("./lightmauve.sh")
elsif color_data ==   "Dark Lavender";  sleep(1.5); system("./darklavender.sh")
elsif color_data ==    "Atomic Hazel";  sleep(1.5); system("./atomichazel.sh")

## Synthesized Colors
elsif color_data == "Faded Carolina Blue"; sleep(1.5); system("./fadedcarolinablue.sh")
elsif color_data == "Dusky Blue";          sleep(1.5); system("./duskyblue.sh")

## Double Processed Synthesized Colors

else
  sleep(1.5)

  puts ">> Either that's not a color, or no color information has yet been found."
end
