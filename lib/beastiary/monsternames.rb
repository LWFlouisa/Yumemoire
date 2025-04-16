def monster_name
  def five_elements
    possible_elements = File.readlines("monsternames/elements.txt")

    $chosen_element = possible_elements.sample.strip.to_s
  end

  def adjectives
    possible_adjectives = File.readlines("monsternames/gendered_adverb.txt")

    $chosen_adjective = possible_adjectives.sample.strip.to_s 
  end
end 

monster_name.five_elements
monster_name.adjectives

$current_monster_name = $chosen_element + " " + $chosen_adjective

puts "Created monster name: #{$current_monster_name}"
