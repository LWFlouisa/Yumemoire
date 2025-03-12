## Moving To Codeberg
Also note that this is the only official Yumemoire repository, and anyone else is scamming you.

[Codeberg](https://codeberg.org/LWFlouisa)

See [STYLE GUIDE]() before contributing, this has become a major pet peeve for me. After that there should be no ambiguity left about what I'm going for.

### Translation
When that time comes I will do translation, do to not do translations to English language without my expressed permission. If you see a copy of this in any language besides French, except in situations I specify in this agreement, you're are being conned. I will not charge people for a poorly translated English release.

### Color PH Chart Improvements
~~~ruby
color_context = [
  [["red",   "red"], ["red",   "orange"], ["red",   "yellow"], ["red",   "green"], ["red",   "cyan"], ["red",   "blue"], ["red",   "purple"]],
  [["green", "red"], ["green", "orange"], ["green", "yellow"], ["green", "green"], ["green", "cyan"], ["green", "blue"], ["green", "purple"]],
  [["blue",  "red"], ["blue",  "orange"], ["blue",  "yellow"], ["blue",  "green"], ["blue",  "cyan"], ["blue",  "blue"], ["blue",  "purple"]],
], [
  [["dr1",   "ph4"], ["dr1",      "ph5"], ["dr1",      "ph6"], ["dr1",     "ph7"], ["dr1",    "ph8"], ["dr1",    "ph9"], ["dr1",     "ph10"]],
  [["dr2",   "ph4"], ["dr2",      "ph5"], ["dr2",      "ph6"], ["dr2",     "ph7"], ["dr2",    "ph8"], ["dr2",    "ph9"], ["dr2",     "ph10"]],
  [["dr2",   "ph4"], ["dr2",      "ph5"], ["dr2",      "ph6"], ["dr2",     "ph7"], ["dr2",    "ph8"], ["dr2",    "ph9"], ["dr2",     "ph10"]],
]

puts "Your color context is: #{color_context[0][0][0][0]}, #{color_context[0][0][0][1]} : #{color_context[1][0][0][0]}, #{color_context[1][0][0][1]}"
~~~
