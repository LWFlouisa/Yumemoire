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
  elsif current_behaviours ==       "Bites the player..."
    puts ">> Your pet spider bites the player affectionately..."

    sleep(1.5)

    system("ruby rockpaperzombie.rb")
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

def spider_damage_formula
  #Switch to routine determine damage rate.
  healing_accuracy = {
    "enemy"        => "gribatomaton",
    "gribatomaton" =>       "player",
    "player"       =>        "enemy",
  }

  @cchoice_healing_options = [  "enemy", "gribatomaton", "player" ]

  @landed_choice = @cchoice_healing_options.sample

  if    @cchoice_chosen_healing ==        "enemy"; # Enemy damages the spider.
    # Enemy launches its counter attack.
  elsif @cchoice_chosen_healing == "gribatomaton"; # Spider damages the enemy.
    # Spider successfully damages the enemy.
  elsif @cchoice_chosen_healing ==       "player"; # Enemy damages the plauer.
    # Player counter attacks the enemy.
  end
end

def enemy_damage_formula
  #Switch to routine determine damage rate.

  @cchoice_healing_options = [  "enemy", "gribatomaton", "player" ]

  @landed_choice = @cchoice_healing_options.sample

  if    @cchoice_chosen_healing ==        "enemy"; # Enemy is damaged by the spider.
    # Counterattack for spider.
  elsif @cchoice_chosen_healing == "gribatomaton"; # Spider is damaged the enemy.
    # Enemey successfully damages the spider.
  elsif @cchoice_chosen_healing ==       "player"; # Enemy is damaged by the player...
    # Counterattack by the player.
  end
end

def spider_pig_farmer
  monster_form = {
    "spider" =>    "pig",
    "pig"    => "farmer",
    "farmer" => "spider",
  }

  print "[ Spider, Pig, Farmer ] >> "
  @spider_choices = ["spider", "pig", "farmer"]
  @choice = @spider_choices.sample

  @cchoices = ["spider", "pig", "farmer"]
  @cchoice  = @cchoices.sample

  if    monster_form[@cchoice] == @choice
    puts "Spider managed to prevent enemy from harming the player."

    spider_damage_formula
  elsif monster_form[@choice]  == @choice # Spider prevents attacking of player altogether.
    puts "Spider managed to prevent enemy from harming the player."

    sleep(1.5)
  elsif @choice == @cchoice
    enemy_damage_formula
  else
    puts "Process was not understood..."
  end
end

loop do
  #navigation

  enemy_spotted; behaviours; pet_noises

  spider_pig_farmer

  sleep(1.5)
end
