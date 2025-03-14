module Reverse
  class Lookup

    # Work in progress, don't implement yet. Adapting this for being based on end game conditions.'
    def self.decision_making
      def self.guess # The AI tracks the users previous choices.

        player_actions = File.readlines("lib/data/user/player_actions.txt")
        total_actions  = player_actions.size.to_i

        chosen_action = File.read("lib/data/user/chosen_action.txt").strip.to_i

        total_actions.times do
          observed_player_behaviours = File.readlines("lib/data/ai/observed_player_actions.txt")
          observed_player_behaviours = observed_player_behaviours.shuffle
          current_ai_action          = observed_player_behaviours.sample.to_s

          if player_actions[chosen_action] == current_ai_action
            # Adjust outcome prediction based on player interaction.

            abort
          else
            puts ">> The AI has chosen incorrectly."
          end

          sleep(1.5)
        end
      end

      def self.learn # The AI makes an educated guess for what choice to make
        player_actions = File.readlines("lib/data/user/player_actions.txt")
        total_actions  = player_actions.size.to_i

        ai_choice = 0

        chosen_action = File.read("lib/data/user/chosen_action.txt").strip.to_i

        total_actions.times do
          possible_actions  = File.readlines("lib/data/ai/possible_player_actions.txt")
          possible_actions  = possible_actions.shuffle
          current_ai_action = possible_actions.sample.to_s

          if player_actions[chosen_action] == current_ai_action
            File.open("lib/data/ai/observed_player_actions.txt", "a") { |f|
              f.puts player_actions[chosen_action]
            }

            # Adjust outcome for prediction based on player interactions.

            abort
          else
            puts ">> The AI has chosen incorrectly."
          end

         sleep(1.5)
        end
      end

      choice_options = [ guess, learn ]
      choice_options.sample
    end

    # Training Set
    def self.imagine
      # Make sure that story elements are kept on seperate lines.
      character_fate = File.readlines("lib/narratives/outcomes/character_fates.txt")
      dating_outcome = File.readlines("lib/narratives/outcomes/dating_outcomes.txt")

      # Make the total imagined branch the size of the darkest path.
      # branch_size = branch_1.size.to_i

      # Imagined a compromise path that is neither ideal or tragic.
      open("lib/imaginedpath/outcomes/nuetral_outcome.txt", "w") { |f|
        #fates_rand  = [0, 1].sample
        #dating_rand = [0, 1].sample

        # Choose numbers based on AI's educated guess.
        segment_1 = character_fate[0].strip
        segment_2 = dating_outcome[1].strip

        f.puts "#{segment_1} #{segment_2}"
      }

      open("lib/translate/outcomes/nuetral_outcome.txt", "w") { |f|
        #fates_rand  = [0, 1].sample
        #dating_rand = [0, 1].sample

        # Choose numbers based on AI's educated guess.
        segment_1 = character_fate[0].strip
        segment_2 = dating_outcome[1].strip

        f.puts "#{segment_1} #{segment_2}"
      }
    end

    # Learning Set
    def self.outcomes
      input = File.read("lib/imaginedpath/outcomes/nuetral_outcome.txt").strip.to_s

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

      print "#{current_outcome} "
    end

    def self.translate
      input = File.read("lib/translate/outcomes/nuetral_outcome.txt").strip.to_s.downcase

      actual_inputs = input.split(" ")

      row = 0
      limitation = input.size.to_i

      proto = {
#        "le"                         =>                        "the ",
#        "la"                         =>                        "the ",
#        "lez"                        =>                        "the ",
#        "the"                        =>                         "le ",
#        "the"                        =>                         "la ",
#        "the"                        =>                        "lez ",
#        "je"                         =>                          "I ",
#        "vous"                       =>                    "you-all ",
#        "tu"                         =>                        "you ",
#        "nous"                       =>                         "we ",
#        "il"                         =>                         "he ",
#        "ils"                        =>                        "him ",
#        "elle"                       =>                        "she ",
#        "elles"                      =>                        "her ",
#        "I",                         =>                         "je ",
#        "You-all",                   =>                       "vous ",
#        "You",                       =>                         "tu ",
#        "We",                        =>                       "nous ",
#        "He",                        =>                         "il ",
#        "Him",                       =>                        "ils ",
#        "She",                       =>                       "elle ",
#        "Her",                       =>                      "elles ",
#        "mien"                       =>                       "mine ",
#        "votre"                      =>                       "your ",
#        "tien"                       =>                      "yours ",
#        "notre"                      =>                        "our ",
#        "notrez"                     =>                       "ours ",
#        "zien"                       =>                        "his ",
#        "zienne"                     =>                       "hers ",
#        "mine"                       =>                       "mien ",
#        "your"                       =>                      "votre ",
#        "yours"                      =>                       "tien ",
#        "our"                        =>                      "notre ",
#        "ours"                       =>                     "notrez ",
#        "his"                        =>                       "zien ",
#        "hers"                       =>                     "zienne ",
#        "pere"                       =>                     "father ",
#        "mere"                       =>                     "mother ",
#        "frere"                      =>                    "brother ",
#        "zoeur"                      =>                     "sister ",
#        "couzifrere"                 =>                "male-cousin ",
#        "couzizoeur"                 =>              "female-cousin ",
#        "couziles"                   =>               "both-cousins ",
#        "tante"                      =>                       "aunt ",
#        "uncle"                      =>                      "uncle ",

        ## Syntactical
        "[" => "[",
        "]" => "]",

        ## Outcome specific
        "charlotte"                  =>                  "charlotte",
        "dies"                       =>                      "meurt",
        "lives"                      =>                       "vies",
        "never"                      =>                     "jamais",
        "dated"                      =>                "rendez-vous",
        "player"                     =>                    "joueuse",
      }

      limitation.times do
        current_word = actual_inputs[row]

        new_word = proto[current_word]

        print "#{new_word} "

        row = row + 1
      end

      puts " "
    end
  end
end
