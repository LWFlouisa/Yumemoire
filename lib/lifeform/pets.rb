###################################################################################
#                            Upgrades For Pet Spider                              #
###################################################################################
def level_one_spider
  $spider_hp   = File.read("pet_stats/spider_hp.txt").strip.to_s
  $spider_atk  = File.read("pet_stats/spider_atk.txt").strip.to_s
  $spider_heal = File.read("pet_stats/spider_heal.txt").strip.to_s
end

def level_two_spider
  $spider_hp   = File.read("pet_stats/spider_hp.txt").strip.to_s
  $spider_atk  = File.read("pet_stats/spider_atk.txt").strip.to_s
  $spider_heal = File.read("pet_stats/spider_heal.txt").strip.to_s

  File.open("pet_stats/spider_hp.txt", "w") { |f|
    $spider_hp = $spider_hp + 3

    f.puts $spider_hp
  }

  File.open("pet_stats/spider_atk.txt", "w") { |f|
    $spider_atk = $spider_atk + 3

    f.puts $spider_atk
  }

  File.open("pet_stats/spider_heal.txt", "w") { |f|
    $spider_heal = $spider_heal + 3

    f.puts $spider_heal
  }
end

def level_three_spider
  $spider_hp   = File.read("pet_stats/spider_hp.txt").strip.to_s
  $spider_atk  = File.read("pet_stats/spider_atk.txt").strip.to_s
  $spider_heal = File.read("pet_stats/spider_heal.txt").strip.to_s

  File.open("pet_stats/spider_hp.txt", "w") { |f|
    $spider_hp = $spider_hp + 5

    f.puts $spider_hp
  }

  File.open("pet_stats/spider_atk.txt", "w") { |f|
    $spider_atk = $spider_atk + 5

    f.puts $spider_atk
  }

  File.open("pet_stats/spider_heal.txt", "w") { |f|
    $spider_heal = $spider_heal + 5

    f.puts $spider_heal
  }
end

def level_four_spider
  $spider_hp   = File.read("pet_stats/spider_hp.txt").strip.to_s
  $spider_atk  = File.read("pet_stats/spider_atk.txt").strip.to_s
  $spider_heal = File.read("pet_stats/spider_heal.txt").strip.to_s

  File.open("pet_stats/spider_hp.txt", "w") { |f|
    $spider_hp = $spider_hp + 7

    f.puts $spider_hp
  }

  File.open("pet_stats/spider_atk.txt", "w") { |f|
    $spider_atk = $spider_atk + 7

    f.puts $spider_atk
  }

  File.open("pet_stats/spider_heal.txt", "w") { |f|
    $spider_heal = $spider_heal + 7

    f.puts $spider_heal
  }
end

def level_five_spider
  $spider_hp   = File.read("pet_stats/spider_hp.txt").strip.to_s
  $spider_atk  = File.read("pet_stats/spider_atk.txt").strip.to_s
  $spider_heal = File.read("pet_stats/spider_heal.txt").strip.to_s

  File.open("pet_stats/spider_hp.txt", "w") { |f|
    $spider_hp = $spider_hp + 9

    f.puts $spider_hp
  }

  File.open("pet_stats/spider_atk.txt", "w") { |f|
    $spider_atk = $spider_atk + 9

    f.puts $spider_atk
  }

  File.open("pet_stats/spider_heal.txt", "w") { |f|
    $spider_heal = $spider_heal + 9

    f.puts $spider_heal
  }
end

def level_six_spider
  $spider_hp   = File.read("pet_stats/spider_hp.txt").strip.to_s
  $spider_atk  = File.read("pet_stats/spider_atk.txt").strip.to_s
  $spider_heal = File.read("pet_stats/spider_heal.txt").strip.to_s

  File.open("pet_stats/spider_hp.txt", "w") { |f|
    $spider_hp = $spider_hp + 11

    f.puts $spider_hp
  }

  File.open("pet_stats/spider_atk.txt", "w") { |f|
    $spider_atk = $spider_atk + 11

    f.puts $spider_atk
  }

  File.open("pet_stats/spider_heal.txt", "w") { |f|
    $spider_heal = $spider_heal + 11

    f.puts $spider_heal
  }
end

def level_seven_spider
  $spider_hp   = File.read("pet_stats/spider_hp.txt").strip.to_s
  $spider_atk  = File.read("pet_stats/spider_atk.txt").strip.to_s
  $spider_heal = File.read("pet_stats/spider_heal.txt").strip.to_s

  File.open("pet_stats/spider_hp.txt", "w") { |f|
    $spider_hp = $spider_hp + 13

    f.puts $spider_hp
  }

  File.open("pet_stats/spider_atk.txt", "w") { |f|
    $spider_atk = $spider_atk + 13

    f.puts $spider_atk
  }

  File.open("pet_stats/spider_heal.txt", "w") { |f|
    $spider_heal = $spider_heal + 13

    f.puts $spider_heal
  }
end

#####################################################################################################
#                                Main Pet Spider Functionality                                      #
#####################################################################################################
def enemy_spotted
  # Determines if your pet spider pig has seen the enemy.
  enemy_event         = File.readlines("enemies/enemies_spotted/spot_enemy.txt")
  enemy_event_toggle = File.read("enemies/enemies_toggle/toggle_enemies.txt").strip.to_i
  enemy_spotted       = enemy_event[enemy_event_toggle]

  if enemy_spotted == true
    $enemy_hp = $enemy_hp - $spider_atk

    puts ">> Your pet spider pig spotted #{enemy_spotted}, and was attacked by your pet spider pig..."
  else
    puts ">> Your pet spider pig hasn't spotted the enemy..."
  end
end

# A list of all possible nevigations, behaviours, and noises.
#def navigation
#  navigation_x = File.readlines("lifeform/aspects/navigation_x.txt")
#  navigation_y = File.readlines("lifeform/aspects/navigation_y.txt")
#
#  navigational_ai = File.read("ainput/navigation/input.txt")
#
#  if navigation_x[navigational_ai_x] == player_x and navigation_y[navigational_ai_y] == player_y
#    puts ">> Your pet spider pig moved in the direction of your player for ear scratches."
#
#    enemy_spotted
#  else
#    puts ">> Your pet spider pig stays where its at sitting on its eight legs..."
#  end
#end

def behaviours
  behaviours    = File.readlines("lifeform/aspects/behaviours.txt")
  behaviours_ai = File.read("ainput/behaviours/input.txt").strip.to_i

  current_behavours = behaviours[behaviours_ai]

  if    current_behaviours ==      "Spins spidersilk..."
    puts ">> Your pet spider pig spins some spidersilk..."
  elsif current_behaviours ==       "Bits the player..."
    puts ">> Your pet spider bites the player affectionately..."

    sleep(1.5)

    #system("ruby rockpaperzombie.rb")
  end
end

def pet_noises
  noises          = File.readlines("lifeform/aspects/noises.txt")
  noises_ai       = File.read("ainput/noises/input.txt").strip.to_i
  current_noises  = noises[noises_ai]

  elsif current_noises ==  "Hisses like a spider..."
    puts ">> Your pet spider pig hisses like a spider..."
  elsif current_noises == "Oinks like a baby pig..."
    puts ">> Your pet spider pig oinks like a baby pig..."
  end
end

def attack_enemy
end

loop do
  #navigation

  enemy_spotted
  behaviours
  pet_noises
  attack_enemy

  sleep(1.5)
end
