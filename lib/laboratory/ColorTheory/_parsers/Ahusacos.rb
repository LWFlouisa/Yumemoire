require "parslet"

require 'humanist_errors'
include HumanistErrors

module AhusacosLite
  class AhusacosParser < Parslet::Parser
    root(:grammar)

    # Three seperate grammar patterns: French, Japanese, and Alsatian German.
    rule(:grammar) { fr_grammar | jp_grammar | gm_grammar | hybrid_grammar }

    # French grammar pattern.
    rule(:fr_grammar) { fr_gender_marker    >> space >>
                        fr_noun_marker      >> space >>
                        fr_adjective_marker >> space >>
                        fr_conju_marker     >> space >>
                        fr_verb_marker      >> space >>
                        fr_adverb_marker    >> space >>
                        punc_marker                     }

    # Japanese grammar pattern
    rule(:jp_grammar) { jp_gender_marker    >> space >>
                        jp_noun_marker      >> space >>
                        jp_adjective_marker >> space >>
                        jp_conju_marker     >> space >>
                        jp_verb_marker      >> space >>
                        jp_adverb_marker    >> space >>
                        punc_marker                     }

    # Alsatian German grammar pattern.
    rule(:gm_grammar) { gm_gender_marker    >> space >>
                        gm_noun_marker      >> space >>
                        gm_adjective_marker >> space >>
                        gm_conju_marker     >> space >>
                        gm_verb_marker      >> space >>
                        gm_adverb_marker    >> space >>
                        punc_marker                     }

    # Hybrid grmmar rules.
    rule(:hy_grammar) { hy_gender_marker    >> space >>
                        hy_noun_marker      >> space >>
                        hy_adjective_marker >> space >>
                        hy_conju_marker     >> space >>
                        hy_verb_marker      >> space >>
                        hy_adverb_marker    >> space >>
                        punc_marker                     }

    # French word gender rules.
    rule(:fr_gender_marker) { le | la | lez | un | une | dez }

    ### Specific French Genders.
    rule(:le)  {  str("Le") }
    rule(:la)  {  str("La") }
    rule(:lez) { str("Lez") }
    rule(:un)  {  str("Un") }
    rule(:une) { str("Une") }
    rule(:dez) { str("Dez") }

    # Note that here these are Pseudo word genders and don't exist in Japanaese proper.
    rule(:jp_gender_marker) { anu | ana | anos | tu | ta | tos }

    ### Specific Pseudo Japanese Genders.
    rule(:anu)  {  str("Anu") }
    rule(:ana)  {  str("Ana") }
    rule(:anos) { str("Anos") }
    rule(:tu)   {   str("Tu") }
    rule(:ta)   {   str("Ta") }
    rule(:tos)  {  str("Tos") }

    # German gender rules.
    rule(:gm_gender_marker) { der | die | das | a | ein }

    ### Specific German Genders.
    rule(:der) { str("Der") }
    rule(:die) { str("Die") }
    rule(:das) { str("Das") }
    rule(:a)   {   str("A") }
    rule(:ein) { str("Ein") }

    # Hybrd gender rules.
    rule(:hy_gender_marker) { lanu | lana | lanos |  tun | tan | deso }

    ### Specific Hybrid Genders
    rule(:lanu)  {  str("Lanu") }
    rule(:lana)  {  str("Lana") }
    rule(:lanos) { str("Lanos") }
    rule(:tun)   {   str("Tun") }
    rule(:tan)   {   str("Tan") }
    rule(:deso)  {  str("Deso") }

    # Nouns
    # These use the genders of the corresponding languages.
    rule(:fr_noun_markers) { famille | personne | animeux | locales | things }

    ## Family
    rule(:famille) {       pere |       mere |    frere | zoeur |
                     couzifrere | couzizoeur | couzilez | tente |
                          oncle                                   }

    ### French Nouns
    rule(:pere)       {       str("pere") } # Father
    rule(:mere)       {       str("mere") } # Mother
    rule(:frere)      {      str("frere") } # Brother
    rule(:zoeur)      {      str("zoeur") } # Sister
    rule(:couzifrere) { str("couzifrere") } # Male Cousin
    rule(:couzizoeur) { str("couzizoeur") } # Female Cousin
    rule(:couzilez)   {   str("couzilez") } # Both Cousins
    rule(:tante)      {      str("tante") } # Aunt
    rule(:oncle)      {      str("oncle") } # Uncle

    ## Personne
    rule(:personne) { homme | femme | garcon | fille }

    ### Specific Personne Rules
    rule(:homme)  {  str("homme") } # Man
    rule(:femme)  {  str("femme") } # Woman
    rule(:garcon) { str("garcon") } # Boy
    rule(:fille)  {  str("fille") } # Girl

    # Animeux
    rule(:animeux) {   chien |     chat |  lapin |   tortue |  hamster |
                     poisson |   souris | canari | perroqui |    vache |
                      mouton |   cheval |  poule |      coq |   canard |
                      cochon |      ane | chevre |   renard | ecureuil |
                       lieve |     loup | oiseau |    hibou |  sangler |
                        serf | herisson | 
    }

    ## Specific Animeux Rules
    rule(:chien)    {    str("chien") } # Cat
    rule(:chat)     {     str("chat") } # Dog
    rule(:lapin)    {    str("lapin") } # Rabbit
    rule(:tortue)   {   str("tortue") } # Turtle
    rule(:hamster)  {  str("hamster") } # Hamster
    rule(:poisson)  {  str("poisson") } # Fish
    rule(:souris)   {   str("souris") } # Mouse
    rule(:canari)   {   str("caneri") } # Canari
    rule(:perroqui) { str("perroqui") } # Parrot
    rule(:vache)    {    str("vache") } # Cow
    rule(:mouton)   {   str("mouton") } # Sheep
    rule(:cheval)   {   str("cheval") } # Horse
    rule(:poule)    {    str("poule") } # Hen
    rule(:coq)      {      str("coq") } # Rooster
    rule(:canard)   {   str("canard") } # Duck
    rule(:cochon)   {   str("cochon") } # Pig
    rule(:ane)      {      str("ane") } # Donkey
    rule(:chevre)   {   str("chevre") } # Goat
    rule(:renard)   {   str("renard") } # Fox
    rule(:ecureuil) { str("ecureuil") } # Squirrel
    rule(:lieve)    {    str("lieve") } # Hare
    rule(:loup)     {     str("loup") } # Wolf
    rule(:oiseau)   {   str("oiseau") } # Bird
    rule(:hibou)    {    str("hibou") } # Owl
    rule(:sangler)  {  str("sangler") } # Wild Bore
    rule(:serf)     {     str("serf") } # Deer
    rule(:herisson) { str("herisson") } # Hedgehog

    # Japanese Nouns
    rule(:jp_noun_marker) { kazoku | hito | dobutsu | rokeru | mono }

    ## Japanese Family Rules
    rule(:kazoku) { chichioyu |  haha | musuku | musuma |
                        itoku | itoka | itokos |    oju |
                          oba 
    }

    ### Specific Japanese Family Members
    rule(:chichioyu) { str("chichioyu") } # Father
    rule(:haha)      {      str("haha") } # Mother
    rule(:musuku)    {    str("musuku") } # Brother
    rule(:musuma)    {    str("musuma") } # Sister
    rule(:itoku)     {     str("itoku") } # Male Cousin
    rule(:itoka)     {     str("itoka") } # Female Cousin
    rule(:itokos)    {    str("itokos") } # Cousin
    rule(:oju)       {       str("oju") } # Uncle
    rule(:oba)       {       str("oba") } # Oba

    # Japanese Rokeru
    rule(:neko)
    rule(:inu)
    rule(:usagi)
    rule(:kame)
    rule(:hamusuta)
    rule(:sakana)
    rule(:nezumi)
    rule(:kanaria)
    rule(:omu)
    rule(:ushi)
    rule(:hitsuji)
    rule(:uma)
    rule(:niwatori)
    rule(:ondori)
    rule(:ahiru)
    rule(:buta)
    rule(:yagi)
    rule(:kitsune)
    rule(:risu)
    rule(:nousagi)
    rule(:okami)
    rule(:tori)
    rule(:fokuro)
    rule(:inoshishi)
    rule(:harinezumi)

    ## German Nouns
    ## Hybrid Nouns Ala Compound Words
