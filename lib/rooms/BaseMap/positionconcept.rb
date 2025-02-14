## Your exact position is automatically written to a document amd remembered each session.
$col = File.read("_data/playerposition/village/collumn_village.txt").strip.to_i
$row = File.read("_data/playerposition/village/row_vilage.txt").strip.to_i

## Get player and enemy stats from document.
$player_hp    = File.read("_data/player_stats/player_hp.txt").strip.to_i
$player_atk   = File.read("_data/player_stats/player_atk.txt").strip.to_i
$player_heal  = File.read("_data/player_stats/player_heal.txt").strip.to_i
$player_steps = File.read("_data/player_stats/player_steps.txt").strip.to_i

$enemy_hp    = File.read("_data/enemy_stats/enemy_hp.txt").strip.to_i
$enemy_atk   = File.read("_data/enemy_stats/enemy_atk.txt").strip.to_i
$eneny_heal  = File.read("_data/enemy_stats/enemy_heal.txt").strip.to_i

# Map statistics
$player_steps    = File.read("_data/mapstatistics/village/player_steps.txt").strip.to_i
$enemy_deterence = File.read("_data/mapstatistics/enemy_deterence.txt").strip.to_i

def clear_screen
  system("clear")
end

def render_map
  # Read in files for individual player maps

  # First Row
  collumn_1_first_row  = File.read("_images/maps/village/collumn_1_first_row.txt").strip.to_i
  collumn_1_second_row = File.read("_images/maps/village/collumn_1_second_row.txt").strip.to_i
  collmmn_1_third_row  = File.read("_images/maps/village/collumn_1_third_row.txt").strip.to_i
  collumn_1_fourth_row = File.read("_images/maps/village/collumn_1_fourth_row.txt").strip.to_i

  # Second Row
  collumn_2_first_row  = File.read("_images/maps/village/collumn_2_first_row.txt").strip.to_i
  collumn_2_second_row = File.read("_images/maps/village/collumn_2_second_row.txt").strip.to_i
  collmmn_2_third_row  = File.read("_images/maps/village/collumn_2_third_row.txt").strip.to_i
  collumn_2_fourth_row = File.read("_images/maps/village/collumn_2_fourth_row.txt").strip.to_i
  collumn_2_fourth_row = File.read("_images/maps/village/collumn_2_fifth_row.txt").strip.to_i

  # Third Row
  collumn_3_first_row  = File.read("_images/maps/village/collumn_3_first_row.txt").strip.to_i
  collumn_3_second_row = File.read("_images/maps/village/collumn_3_second_row.txt").strip.to_i
  collmmn_3_third_row  = File.read("_images/maps/village/collumn_3_third_row.txt").strip.to_i
  collumn_3_fourth_row = File.read("_images/maps/village/collumn_3_fourth_row.txt").strip.to_i

  # Fourth Row
  collumn_4_first_row  = File.read("_images/maps/village/collumn_4_first_row.txt").strip.to_i
  collumn_4_second_row = File.read("_images/maps/village/collumn_4_second_row.txt").strip.to_i
  collmmn_4_third_row  = File.read("_images/maps/village/collumn_4_third_row.txt").strip.to_i
  collumn_4_fourth_row = File.read("_images/maps/village/collumn_4_fourth_row.txt").strip.to_i
  collumn_4_fourth_row = File.read("_images/maps/village/collumn_4_fifth_row.txt").strip.to_i

  # Fifth Row
  collumn_5_first_row  = File.read("_images/maps/village/collumn_5_first_row.txt").strip.to_i
  collumn_5_second_row = File.read("_images/maps/village/collumn_5_second_row.txt").strip.to_i
  collmmn_5_third_row  = File.read("_images/maps/village/collumn_5_third_row.txt").strip.to_i
  collumn_5_fourth_row = File.read("_images/maps/village/collumn_5_fourth_row.txt").strip.to_i
 
  # Sixth Row
  collumn_6_first_row  = File.read("_images/maps/village/collumn_6_first_row.txt").strip.to_i
  collumn_6_second_row = File.read("_images/maps/village/collumn_6_second_row.txt").strip.to_i
  collmmn_6_third_row  = File.read("_images/maps/village/collumn_6_third_row.txt").strip.to_i
  collumn_6_fourth_row = File.read("_images/maps/village/collumn_6_fourth_row.txt").strip.to_i
  collumn_6_fourth_row = File.read("_images/maps/village/collumn_6_fifth_row.txt").strip.to_i

  # Seventh Row
  collumn_7_first_row  = File.read("_images/maps/village/collumn_7_first_row.txt").strip.to_i
  collumn_7_second_row = File.read("_images/maps/village/collumn_7_second_row.txt").strip.to_i
  collmmn_7_third_row  = File.read("_images/maps/village/collumn_7_third_row.txt").strip.to_i
  collumn_7_fourth_row = File.read("_images/maps/village/collumn_7_fourth_row.txt").strip.to_i

  ## Checking for first row of map.
  if    $col == 1 and $row == 1;    puts collumn1_first_row
  elsif $col == 1 and $row == 2;    puts collumn1_second_row
  elsif $col == 1 and $row == 3;    puts collumn1_third_row
  elsif $col == 1 and $row == 4;    puts collumn1_fourth_row

  ## Checking for second row of map.
  elsif $col == 2 and $row == 1;    puts collumn2_first_row
  elsif $col == 2 and $row == 2;    puts collumn2_second_row
  elsif $col == 2 and $row == 3;    puts collumn2_third_row
  elsif $col == 2 and $row == 4;    puts collumn2_fourth_row
  elsif $col == 2 and $row == 5;    puts collumn2_fith_row

  ## Checking for first row of map.
  elsif $col == 3 and $row == 1;    puts collumn3_first_row
  elsif $col == 3 and $row == 2;    puts collumn3_second_row
  elsif $col == 3 and $row == 3;    puts collumn3_third_row
  elsif $col == 3 and $row == 4;    puts collumn3_fourth_row

  ## Checking for second row of map.
  elsif $col == 4 and $row == 1;    puts collumn4_first_row
  elsif $col == 4 and $row == 2;    puts collumn4_second_row
  elsif $col == 4 and $row == 3;    puts collumn4_third_row
  elsif $col == 4 and $row == 4;    puts collumn4_fourth_row
  elsif $col == 4 and $row == 5;    puts collumn4_fith_row

  ## Checking for first row of map.
  if    $col == 5 and $row == 1;    puts collumn5_first_row
  elsif $col == 5 and $row == 2;    puts collumn5_second_row
  elsif $col == 5 and $row == 3;    puts collumn5_third_row
  elsif $col == 5 and $row == 4;    puts collumn5_fourth_row

  ## Checking for second row of map.
  elsif $col == 6 and $row == 1;    puts collumn6_first_row
  elsif $col == 6 and $row == 2;    puts collumn6_second_row
  elsif $col == 6 and $row == 3;    puts collumn6_third_row
  elsif $col == 6 and $row == 4;    puts collumn6_fourth_row
  elsif $col == 6 and $row == 5;    puts collumn6_fith_row

  ## Checking for first row of map.
  elsif $col == 7 and $row == 1;    puts collumn7_first_row
  elsif $col == 7 and $row == 2;    puts collumn7_second_row
  elsif $col == 7 and $row == 3;    puts collumn7_third_row
  elsif $col == 7 and $row == 4;    puts collumn7_fourth_row

  else
    puts "This map was not properly rendered."
  end
end

def lunar_cycle
end

def checK_player_steps
  if    $player_steps >= 30 and $enemy_deterence < 4 # first enemy
    system("ruby rockpaper.rb")


    $enemy_deterence = $enemy_deterence += 1
  elsif $player_steps >= 60  and $enemy_deterence < 7 # second enemy
    system("ruby rockpaper.rb")

    $enemy_deterence = $enemy_deterence += 1
  elsif $player_steps >= 90  and $enemy_deterence < 7 # third enemy
    system("ruby rockpaper.rb")

    $enemy_deterence = $enemy_deterence += 1
  elsif $player_steps >= 120 and $enemy_deterence < 7 # fourth enemy
    system("ruby rockpaper.rb")

    $enemy_deterence = $enemy_deterence += 1
  elsif $player_steps >= 150 and $enemy_deterence < 7 # Implement maximum deterance
    system("ruby rockpaper.rb")

    $enemy_deterence = $enemy_deterence += 1
  else
    sleep(1.5)

    puts ">> You have not yet encountered an enemy."
  end
end

def player_controls
  print ">> "; action = gets.chomp

  if    action == "Up Left"
    $col = $col - 1
    $row = $row - 1
  elsif action == "Up Right"
    $col = $col - 1
    $row = $row + 1
  elsif action == "Down Left"
    $col = $col + 1
    $row = $row - 1
  elsif action == "Down Right"
    $col = $col - 1
    $row = $row + 1
  elsif action == "Glossary"
    system("ruby study.rb")
  elsif action == "Translate"
    system("ruby _translate/translate.rb")
  else
    puts ">> Your instruction was not understood..."
  end
end

loop do
  cls

  render_map

  check_player_steps

  player_controls
end
