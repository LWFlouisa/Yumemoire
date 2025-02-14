monday_meds    = File.read("_data/medication/monday_meds.txt").strip
tuesday_meds   = File.read("_data/medication/tuesday_meds.txt").strip
wednesday_meds = File.read("_data/medication/wednesday_meds.txt").strip
thursday_meds  = File.read("_data/medication/thursday_meds.txt").strip
friday_meds    = File.read("_data/medication/friday_meds.txt").strip
saturday_meds  = File.read("_data/medication/saturday_meds.txt").strip
sunday_meds    = File.read("_data/medication/sunday_meds.txt").strip

system("date > _data/time/date.txt")

data = File.read("_data/time/date.txt").split(" ")

current_day = "#{data[0]}"

print "BIANCA >> You need to take #{current_day}'s medication. "

if    current_day == "Mon"; puts "Take: #{monday_meds}."
elsif current_day == "Tue"; puts "Take: #{tuesday_meds}."
elsif current_day == "Wed"; puts "Take: #{wednesday_meds}."
elsif current_day == "Thu"; puts "Take: #{thursday_meds}."
elsif current_day == "Fri"; puts "Take: #{friday_meds}."
elsif current_day == "Sat"; puts "Take: #{saturday_meds}."
elsif current_day == "Sun"; puts "Take: #{sunday_meds}."
end

sleep(1.5)
