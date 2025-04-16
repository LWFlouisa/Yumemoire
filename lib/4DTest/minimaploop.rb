# The player starts off in the center of the hypercube.
$player_x = 0 # Determines west or east cube.
$player_y = 0 # Determines north or south cube.
$player_z = 0 # Determines up or down cube.

# +------+
# |\     |\
# | \    | \                                    Y
# +--\---+  \                               +------+                 Z
#  \  +---\--+                             /|     /|              ------
#   \ | T  \ |                            / |    / |              [  1 ]
#    \|     \|                           /  +---/--+
#     +------+                          +--/---+  / 
# +------+                              | / N  | /
# |\     |\                             |/     |/
# | \    | \                            +------+
# +--\---+  \                                                     [  0 ]
#  \  +---\--+          +------+                        +------+
#   \ | M  \ |         /|     /|                       /|     /|
#    \|     \|     X  / |    / |                      / |    / | X
#     +------+    -1 /  +---/--+                     /  +---/--+ 1
# +------+          +--/---+  /                     +--/---+  /
# |\     |\         | / E  | /                      | / W  | /
# | \    | \        |/     |/                       |/     |/
# +--\---+  \       +------+                        +------+      [ -1 ] 
#  \  +---\--+                      +------+
#   \ | S  \ |                     /|     /|
#    \| F   \|                    / |    / |
#     +------+                   /  +---/--+
# +------+                      +--/---+  /
# |\     |\                     | / S  | /
# | \    | \                    |/     |/
# +--\---+  \                   +------+                          [ -2 ]
#  \  +---\--+
#   \ | T  \ |
#    \| F   \|
#     +------+

#           \ 5
#           \ 4
#           \ 3
#           \ 2
#           \ 1
# - - - - - 0 - - - - -
#           | 1 2 3 4 5
#           |
#           |
#           |
#           |

def clear_screen
  system("clear")
end

def statistics_gui
  puts "Player HP: #{$player_hp} [ X: #{$player_x} ][ Y: #{$player_y} ][ Z: #{$player_z} ]"
end

def minimap
  #statistics_gui

  def top_cube # Cybe just above the player.
    up_cube = File.read("_graphics/dimensions/up_cube.txt").to_s

    puts up_cube
  end

  def north_cube # Floor level of map
    north_cube = File.read("_graphics/dimensions/north_cube.txt").to_s

    puts north_cube
  end

  def west_cube # Floor level of map
    west_cube = File.read("_graphics/dimensions/west_cube.txt").to_s

    puts west_cube
  end

  def standard_cube # Floor level of map.
    standard_cube = File.read("_graphics/dimensions/standard_cube.txt").to_s

    puts standard_cube
  end

  def east_cube # Floor level of map
    east_cube = File.read("_graphics/dimensions/east_cube.txt").to_s

    puts east_cube
  end

  def south_cube # Floor level of map
    south_cube = File.read("_graphics/dimensions/south_cube.txt").to_s

    puts south_cube
  end

  def cube_second_floor
    cube_second_floor = File.read("_graphics/dimensions/cube_second_floor.txt").to_s

    puts cube_second_floor
  end

  def cube_third_floor
    cube_third_floor = File.read("_graphics/dimensions/cube_third_floor.txt").to_s

    puts cube_third_floor
  end

  # Determines how many cube floors up or down.
  if    $player_x == 0 and $player_y == 0 and $player_z == 0
    standard_cube
  elsif $player_x == 0 and $player_y == 0 and $player_z == 1
    top_cube
  elsif $player_x == 0 and $player_y == 0 and $player_z == -1
    cube_second_floor
  elsif $player_x == 0 and $player_y == 0 and $player_z == -2
    cube_third_floor

  ## West and East is X
  elsif $player_x == -1 and $player_y == 0 and $player_z == 0
    west_cube
  elsif $player_x ==  1 and $player_y == 0 and $player_z == 0
    east_cube

  # North and South is Y
  elsif $player_x == 0 and $player_y == -1 and $player_z == 0
    north_cube
  elsif $player_x == 0 and $player_y ==  1 and $player_z == 0
    south_cube

  # Out of bounds for top floor.
  elsif $player_x == -1 and $player_y ==  0 and $player_z == 1 # West second floor doesn't exist.
    $player_x = $player_x + 1

    minimap
  elsif $player_x ==  1 and $player_y ==  0 and $player_z == 1 # East second floor doesn't exist.
    $player_x = $player_x - 1

    minimap
  elsif $player_x ==  0 and $player_y == -1 and $player_z == 1 # North second floor doesn't exist.
    $player_y = $player_y + 1

    minimap
  elsif $player_x ==  0 and $player_y ==  1 and $player_z == 1 # South second floor doesn't exist.
    $player_y = $player_y - 1

    minimap

  # Out of bounds access second floor.
  elsif $player_x == -1 and $player_y ==  0 and $player_z == -1 # West second floor doesn't exist.
    $player_x = $player_x + 1

    minimap
  elsif $player_x ==  1 and $player_y ==  0 and $player_z == -1 # East second floor doesn't exist.
    $player_x = $player_x - 1

    minimap
  elsif $player_x ==  0 and $player_y == -1 and $player_z == -1 # North second floor doesn't exist.
    $player_y = $player_y + 1

    minimap
  elsif $player_x ==  0 and $player_y ==  1 and $player_z == -1 # South second floor doesn't exist.
    $player_y = $player_y - 1

    minimap

  # Out of bounds access third floor.
  elsif $player_x == -1 and $player_y ==  0 and $player_z == -2 # West third floor doesn't exist.
    $player_x = $player_x + 1

    minimap
  elsif $player_x ==  1 and $player_y ==  0 and $player_z == -2 # East third floor doesn't exist.
    $player_x = $player_x - 1

    minimap
  elsif $player_x ==  0 and $player_y == -1 and $player_z == -2 # North third floor doesn't exist.
    $player_y = $player_y + 1

    minimap
  elsif $player_x ==  0 and $player_y ==  1 and $player_z == -2 # South third floor doesn't exist.
    $player_y = $player_y - 1

    minimap
  end
end

def warp_to
  if    $player_x == 0 and $player_y == 0 and $player_z ==  0

    print ">> Would you like to warp to this standard map? ( Y/N )"; confirm = gets.chomp.capitalize

    if confirm == "Y"
    elsif confirm == "N"
    else
      puts ">> You cannot confirm or deny, because it wasn't understood.'"
    end

  elsif $player_x == 0 and $player_y == 0 and $player_z ==  1

    print ">> Would you like to warp to this standard map? ( Y/N )"; confirm = gets.chomp.capitalize

    if confirm == "Y"
    elsif confirm == "N"
    else
      puts ">> You cannot confirm or deny, because it wasn't understood.'"
    end

  elsif $player_x == 0 and $player_y == 0 and $player_z == -1

    print ">> Would you like to warp to this standard map? ( Y/N )"; confirm = gets.chomp.capitalize

    if confirm == "Y"
    elsif confirm == "N"
    else
      puts ">> You cannot confirm or deny, because it wasn't understood.'"
    end

  elsif $player_x == 0 and $player_y == 0 and $player_z == -2

    print ">> Would you like to warp to this standard map? ( Y/N )"; confirm = gets.chomp.capitalize

    if confirm == "Y"
    elsif confirm == "N"
    else
      puts ">> You cannot confirm or deny, because it wasn't understood.'"
    end

  ## West and East is X
  elsif $player_x == -1 and $player_y == 0 and $player_z == 0

    print ">> Would you like to warp to this standard map? ( Y/N )"; confirm = gets.chomp.capitalize

    if confirm == "Y"
    elsif confirm == "N"
    else
      puts ">> You cannot confirm or deny, because it wasn't understood.'"
    end

  elsif $player_x ==  1 and $player_y == 0 and $player_z == 0

    print ">> Would you like to warp to this standard map? ( Y/N )"; confirm = gets.chomp.capitalize

    if confirm == "Y"
    elsif confirm == "N"
    else
      puts ">> You cannot confirm or deny, because it wasn't understood.'"
    end

  # North and South is Y
  elsif $player_x == 0 and $player_y == -1 and $player_z == 0

    print ">> Would you like to warp to this standard map? ( Y/N )"; confirm = gets.chomp.capitalize

    if confirm == "Y"
    elsif confirm == "N"
    else
      puts ">> You cannot confirm or deny, because it wasn't understood.'"
    end

  elsif $player_x == 0 and $player_y ==  1 and $player_z == 0

    print ">> Would you like to warp to this standard map? ( Y/N )"; confirm = gets.chomp.capitalize

    if confirm == "Y"
    elsif confirm == "N"
    else
      puts ">> You cannot confirm or deny, because it wasn't understood.'"
    end

  end
end

def player_controls
  print "What cube would you like to travel to? ( N, S, W, E, U, P ) >> "; cube = gets.chomp

  if    cube == "N"
    if $player_y == 1
      puts ">> You cannot go further north a cube."

      sleep(1.5)
    else
      $player_y = $player_y + 1

      sleep(1.5)
    end
  elsif cube == "S"
    if $player_y == -1
      puts ">> You cannot go further south a cube."

      sleep(1.5)
    else
      $player_y = $player_y - 1

      sleep(1.5)
    end
  elsif cube == "E"
    if $player_x == 1
      puts ">> You cannot go further east a cube."

      sleep(1.5)
    else
      $player_x = $player_x + 1

      sleep(1.5)
    end
  elsif cube == "W"
    if $player_x == -1
      puts ">> You cannot go further west a cube."

      sleep(1.5)
    else
      $player_x = $player_x - 1

      sleep(1.5)
    end
  elsif cube == "U"
    if $player_z == 1
      puts ">> You cannot go further up a cube."

      sleep(1.5)
    else
      $player_z = $player_z + 1

      sleep(1.5)
    end
  elsif cube == "D"
    if $player_z == -2
      puts ">> You cannot go further down a cube."

      sleep(1.5)
    else
      $player_z = $player_z - 1

      sleep(1.5)
    end

  # Every other game function.

  # This simply tells the player that direction doesn't exist.'
  else
    puts ">> This direction does not exist..."

    gets.chomp
  end
end


loop do
  clear_screen

  minimap
  statistics_gui

  player_controls
end
