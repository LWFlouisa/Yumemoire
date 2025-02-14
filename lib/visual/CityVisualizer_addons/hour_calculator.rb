bot_name = File.read("_data/bot_identity/name.txt").strip

print "What is your starting time? >> "
starting_time = gets.chomp.strip.to_i # % 12

print "What is your ending time? >> "
ending_time   = gets.chomp.strip.to_i # %12

print "What is your working interval? >> "
time_interval = gets.chomp.to_i

hours_added_start   = starting_time + time_interval
hours_added_end     = ending_time + time_interval

puts "#{bot_name}: If starting time was #{starting_time}:00 and ending time was #{ending_time}:00,\nthe new time alottments are #{hours_added_start}:00 and #{hours_added_end}:00."

sleep(1.5)
