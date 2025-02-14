system("clear")

bot_name   = File.read("_bident/name.txt").strip
u_name     = File.read("_uident/name.txt").strip

answer_set = File.readlines("_script/answers.txt")

first_answer  = answer_set[0]
second_answer = answer_set[1]
third_answer  = answer_set[2]

puts "#{bot_name} >> What would you like to know?"
print "#{u_name} << "; question = gets.chomp

if    question == "How did the Ahusacos language diverge from French?"
  puts "\n#{bot_name} >>  #{first_answer}"
elsif question == "What is the national flag of the Ahusacos?"
  puts "\n#{bot_name} >> #{second_answer}"
else
  puts "#{bot_name} << I don't understand your question."
end

gets.chomp
