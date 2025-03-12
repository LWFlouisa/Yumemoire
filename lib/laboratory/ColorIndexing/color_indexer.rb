#                                         Context One
#
#       red                orange         yellow         green         cyan         blue         purple
# red   red,   red  red,   orange  red,   yellow  red,   green  red,   cyan  red,   blue  red,   purple
# green green, red  green, orange  green, yellow  green, green  green, cyan  green, blue  green, purple
# blue  blue,  red  blue,  orange  blue,  yellow  blue,  green  blue,  cyan  blue,  blue  blue,  purple

#                         Context Two
#            ph4      ph5      ph6      ph7      ph8      ph9
# dr1   dr1, ph4 dr1, ph5 dr1, ph6 dr1, ph7 dr1, ph8 dr1. ph9
# dr2   dr2, ph4 dr2, ph5 dr2, ph6 dr2, ph7 dr2, ph8 dr2. ph9
# dr3   dr3, ph4 dr3, ph5 dr3, ph6 dr3, ph7 dr3, ph8 dr3. ph9

color_context = [
  [["red",   "red"], ["red",   "orange"], ["red",   "yellow"], ["red",   "green"], ["red",   "cyan"], ["red",   "blue"], ["red",   "purple"]],
  [["green", "red"], ["green", "orange"], ["green", "yellow"], ["green", "green"], ["green", "cyan"], ["green", "blue"], ["green", "purple"]],
  [["blue",  "red"], ["blue",  "orange"], ["blue",  "yellow"], ["blue",  "green"], ["blue",  "cyan"], ["blue",  "blue"], ["blue",  "purple"]],
], [
  [["dr1",   "ph4"], ["dr1",      "ph5"], ["dr1",      "ph6"], ["dr1",     "ph7"], ["dr1",    "ph8"], ["dr1",    "ph9"], ["dr1",     "ph10"]],
  [["dr2",   "ph4"], ["dr2",      "ph5"], ["dr2",      "ph6"], ["dr2",     "ph7"], ["dr2",    "ph8"], ["dr2",    "ph9"], ["dr2",     "ph10"]],
  [["dr2",   "ph4"], ["dr2",      "ph5"], ["dr2",      "ph6"], ["dr2",     "ph7"], ["dr2",    "ph8"], ["dr2",    "ph9"], ["dr2",     "ph10"]],
]

puts "Your color context is: #{color_context[0][0][0][0]} : #{color_context[1][0][0][0]}, #{color_context[1][0][0][1]}"
