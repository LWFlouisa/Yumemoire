def cls
  system("clear")
end

# Plot Progression Value
$ppv = File.read("scenes/plot_progress/ppv.txt").strip.to_i

def scene_1
  puts "As Souer De Chaos, you must locate the leader of a revolt against your leader, Kimigayo."

  sleep(1.5)

  puts "However, it is said there are secrets in the caverns depth that do not wish to be reawakened."

  sleep(1.5)

  puts "Can you, as Souer de Chaos, survive long enough to discover its secrets?"

  sleep(1.5)
end

## Main Plot
def scene_2
  puts "As Souer de Order, your sister has not returned from the expedition to crush the working class rebellion in the caverns."

  sleep(1.5)

  puts "But as a loyal servant to the Kimigayo, you begin to suspect fowl play, and seek answers yourself for what lies in the caves below."

  sleep(1.5)

  puts "Can you survive long enough to find yourself, and return her home safely?"
end

def scene_3
  puts "Your sister, whom wields the power of 'Okaeshi No Kuma', has lost control of her humanity, as she seeks to have you as her lunch."

  sleep(1.5)

  puts "Before you is a labirythnian cavern of bear-men catacombs. Can you make it to safety to tell the Kimigayo of your sister's fate?"

  sleep(1.5)
end

def scene_4
  puts "You are stuck inside the Tombakashi, or Les Catabombs De Ceramqiue Dijitaru. Before is the lair in which the Bear-Bat awaits his next victim."

  sleep(1.5)

  puts "The bear-bat seems to be immune to most normal attacks. Can you discover what its weakness is?"

  sleep(1.5)
end

def scene_5
end

def scene_6
  puts "As sister Chaos, you must defeat a crooked Ursinehomme, who has defected from the ranks of the Tombakashi, whom has kidnapped your sister in order to hold her for random."

  sleep(1.5)

  puts "Use your ability to travel the hypercube to avoid fighting bear-men head on, and avoid fighting as much as possible."

  sleep(1.5)
end
## End Main Plot

def scene_7
  puts "The Kimigayo has executed your sister, whose severed head is on a platter in front of the Kimigayo."

  puts "The kimigayo directs his bear-men in your direction in order to assassinate you."

  sleep(1.5)

  puts "Use your knowledge of Tombakashi and the hypercube, to unleash the final vengance of Kumabatto Des Les Ghoules, as your guiding light."

  sleep(1.5)
end

def scene_8
  puts "Together, after you defeated the Kimigayo and his bear men, with your sisters severed head, ascend into the heavens on an 8-Cube Cross."

  sleep(1.5)

  puts "And what awaits you from here, well that's a story for another time. In the fourth dimension..."

  sleep(1.5)

  abort
end


cls

if    $ppv == 0
  scene_1
elsif $ppv == 1
  scene_2
elsif $ppv == 2
  scene_3
elsif $ppv == 3
  scene_4
elsif $ppv == 4
  scene_5
elsif $ppv == 5
  scene_6
elsif $ppv == 6
  scene_7
elsif $ppv == 7
  scene_8
else
  puts "YOU WON"

  abort
end
