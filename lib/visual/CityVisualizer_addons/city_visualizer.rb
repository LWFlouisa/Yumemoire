print "What is the height size ( in pixels ) of your main canvas? >> "; main_canvas_height  = gets.chomp.to_i
print "What is the width size ( in pixels ) of your main canvas? >> ";  main_canvas_width   = gets.chomp.to_i
print "What is the name of your city in main canvas? >> ";              city_in_main        = gets.chomp
print "What is the name of the neighboring city? >> ";                  neighboring_city    = gets.chomp

reduced_height = main_canvas_height / 3
reduced_width  = main_canvas_width / 3

sum_height = main_canvas_height + reduced_height / 2
sum_width  = main_canvas_width + reduced_width / 2

puts "If #{city_in_main} in canvas is #{main_canvas_height}x#{main_canvas_width} in pixels, it intersects and melts in with #{neighboring_city} at #{reduced_height}x#{reduced_width} pixels. The intersecting blur appears as the sum of both canvases, a fictional city: #{city_in_main} Street, #{neighboring_city} at #{sum_height}x#{sum_width} pixels."

puts "Effectively blending two real world towns or cities."
