## Reverse Dictionary Lookup
Implements a simple neural net, and then converts output to plain English.

~~~ruby
module Reverse
  class Lookup

    # Training Set
    def self.imagine
      # Make sure that story elements are kept on seperate lines.
      character_fate = File.readlines("_narratives/outcomes/character_fates.txt")
      dating_outcome = File.readlines("_narratives/outcomes/dating_outcomes.txt")

      # Make the total imagined branch the size of the darkest path.
      # branch_size = branch_1.size.to_i

      # Imagined a compromise path that is neither ideal or tragic.
      open("_imaginedpath/outcomes/nuetral_outcome.txt", "w") { |f|
        #fates_rand  = [0, 1].sample
        #dating_rand = [0, 1].sample

        segment_1 = character_fate[0].strip
        segment_2 = dating_outcome[1].strip

        f.puts "#{segment_1} #{segment_2}"
      }
    end

    # Learning Set
    def self.outcomes
      input = File.read("_imaginedpath/outcomes/nuetral_outcome.txt").strip.to_s

      outcomes = {
        ## Worst Outcome
        "[ charlotte dies ] [ never dated player ]" => "BIANCA >> Charlotte died before the player ever met her.",

        ## Nuetral Outcome
        "[ charlotte dies ] [ dated player ]" => "BIANCA >> Charlotte had met the player previously, but player failed to rescue her.",
        "[ charlotte lives ] [ never dated player ]" => "BIANCA >> Although Charlotte wasn't executed, player was never in a situation to meet her.",

        ## Best Outcome
        "[ charlotte lives ] [ dated player ]" => "BIANCA >> Charlotte met the player before and eventually they date and become permanent room mates.",
      }

      current_outcome = outcomes[input].to_s

      puts "#{current_outcome}"
    end
  end
end
~~~

## Possible Extension
Posible way to nest case when, nuetral networks, hash tables, and conversion to prolog knowledge bases.

~~~
when duck      -> 0, 0 -> hash worst        -> convert to prolog
when quackduck -> 0, 1 -> hash dark nuetral -> convert to prolog
when duckquack -> 1, 0 -> hash best nuetral -> convert to prolog
when quack     -> 1, 1 -> hash best         -> convert to prolog
~~~
## 
