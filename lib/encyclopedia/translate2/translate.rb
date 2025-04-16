translate = {
  "Tos Iemangeros"          => "The non eating",
  "Tos Uindogouachos"       => "The window paint",       # Historically window paint was designed in such a way to be less permanent so it could be washed off.
  "Te Garejimangere"        => "The dining garage",      # Historically illegal restaurant might be operated out of people's garage to evade authorities.
  "Te Garejigouache"        => "The garage gouache",     # Gouache paint for painting garages needed to be more water proof, and more akin to water mixable oil paint.
  "Tos Garejimerdos"        => "The garage restroom",    # By extension, there needed to be special bathrooms for guests specifically in garages away from the rest of the house.
  "Te Basurumuentre"        => "The bathroom door",      # By extension, a Basurumuentre is another word for bathroom door.
  "Te Shinkuentre"          => "The sink entrance",      # Context, another word for a drainpipe in a sink.
  "Te Rokacanape"           => "The red couch",          # A type of French couch that uses Japanse red cloth over maple.
  "Ta Aisubokkusugouacha"   => "The icebox gouache",     # Painting the outside of an ice box, or the paint used for such activities.
  "Te Rokasortie"           => "The red exit",           # Doors are sometimes painted red, if only staff are meant past that point, or is a danger area.
  "Ta Daidakorogouacha"     => "The first time gouache", # Eluding to the smell of fresh water mixable oil paint.
  "Tos Ribingurumumangeros" => "The dining room",        # Frequently familial dining rooms seperate from the eating area of illegal restaurants in people's garages.
  "Ta Daidakoromangera"     => "The first time eating",  # First time eating at an illegal restaurant.
  "Tos Shinkumerdos"        => "The foul sink smell",    # In informal way of saying the kitchen stinks like fish.
  "Tos Basurumugouachos"    => "The bathroom paint",     # Sometimes bathroom in illegal restaurant would smell like fresh paint do to frequency of repainting walls.
  "Ta Shinkulavera"         => "The sink bath",          # Using the sink as a bath for washing vegetables that go along with seafood.
  "Ta Rokagouache"          => "The red paint",          # A specific variety of water-mixable oil paint with a rust red pigment.
  "Ta Basurumumanger"       => "The bathroom munch",     # An informal way of describing shitting where you eat, or jeapardize something essential. Ex. Ta Basurumumangr vous es.
  "Ta Rokaentre"            => "The red entrance",       # An entrance that's been painted in red, warning not to tresspass for non employees.
  "Ta Uindodorm"            => "The sleepingw window",   # An especially made window for sleeping in.
  "Te Shinkuporte"          => "The sink door",          # The sink door. Another word for a plug for a sink.

  ## Duplicates
  "Te Uindosortie"        => "The window exit",        # Using the open garage door or window as a way to vent out cooking smells in the garage.
  "Ta Uindosortia"        => "The window exit",        # Using the open garage door or window as a way to vent out cooking smells in the garage.
  "Tos Uindosortios"      => "The window exit",        # Using the open garage door or window as a way to vent out cooking smells in the garage.

  ## Negative
  "dekinai"                 => "can not",

  ## Special locations
  "Te Garejimangere Ursinehomme"     => "A shack in a garage known as the Bear-Man's tabern.",
  "Tos Garejimerdos Denkos"          => "The heavenly garage restroom",
  "Anos Shi Rokacanape"              => "The deadly red couch",
  "Anu Shi Rokaentre"                => "The deadly red entrance",
  "Ta Uindodorm de le recupere"      => "The sleeping window patients recover or die in",
  "Tos Aisubokkusulavos de la noyee" => "The ice box a corpse drowned in.",
  "Anos Uindodormos Tenchos"         => "The earthen sleeping window",
}

#print "What would you like to translate? >> "; trans = gets.chomp

#puts translate[trans]

dialogue_set = File.readlines("_input/dialogue.txt")

size_limit = dialogue_set.size.to_i

index = 0

size_limit.times do
  #begin
    trans = dialogue_set[index].to_s.strip

    print trans + " "
    print translate[trans]       
    puts " "

    index = index + 1
  #rescue
    #puts "Line being read properly as a string."
  #end
end
