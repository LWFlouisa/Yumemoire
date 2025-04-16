# One allows you to always maintain a certain maximum reset hp. The other can be altered.
$true_reset_hp = 10
$reset_hp      = 10

# Standard Stats
$player_hp = 10
$enemey_hp = 10

$player_atk = 4
$enemy_atk  = 4

# Switch for determining zombie state.
$zombie_status = false

# If turned into a zombie, switch to immortality without invisibility for player.
def death_ritual
  def cremation
    puts "You've self cremated."

    sleep(1.5)

    puts "You've opted to self cremate, minus a little bit of progress. Restarting the map."

    $player_hp = $reset_hp
  end

  def consumption
    puts "You've eaten parts of your own corpse."

    sleep(1.5)

    $reset_hp  = $reset_hp - 1
    $player_hp = $reset_hp

    print "Your HP was replinished but "

    $player_hp = $player_hp - 3

    puts " you lost 3 hit points from consuming your own body."
  end

  def reset_standard_hp_restoration
    puts "The curse of being a zombie has been lifted. You can not die like any other mortal."

    $reset_hp = $true_reset_hp
  end
end

loop do
end
