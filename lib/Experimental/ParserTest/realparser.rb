require "parslet"

module Yumelang
  class YumeParse < Parslet::Parser
    root(:document)

    rule(:document) { document_color | document_grammar | symbolic_relationship | symbolic_conditional }

    #rule(:document) { color_acid_index | grammar_index }
# <screen>
#   <container>
#      <conlang>
#        <color_identifier>TEST</color_identifier>
#        <color_name>TEST</color_name>
#        <color_hex>TEST</color_hex>
#        <color_alkalinity>TEST</color_alkalinity>
#        <color_relationship>TEST</color_relationship>
#      </conlang>
#    </container>
# </screen>"

    rule(:document_color) {
       o_tag       >> whitespace           >> # screen
         o_tag     >> whitespace           >> # container
           o_tag   >> whitespace           >> # conlang
             o_tag >> description >> c_tag >> # Color identifier
             o_tag >> description >> c_tag >> # color name
             o_tag >> description >> c_tag >> # color hex
             o_tag >> description >> c_tag >> # color alkalinity
             o_tag >> description >> c_tag >> # color relationship
           c_tag   >> whitespace           >> # close conlang
         c_tag     >> whitespace           >> whitespace >> # close container
       c_tag                                  # close screen
    }

    rule(:document_grammar) {
       o_tag       >> whitespace           >> # screen
         o_tag     >> whitespace           >> # container
           o_tag   >> whitespace           >> # conlang
             o_tag >> description >> c_tag >> # word name
             o_tag >> description >> c_tag >> # word type
             o_tag >> description >> c_tag >> # word definition
             o_tag >> description >> c_tag >> # word context
           c_tag   >> whitespace           >> # close conlang
         c_tag     >> whitespace           >> whitespace >> # close container
       c_tag                                  # close screen
    }

    rule(:symbolic_relationship) {
      symbolic_object >> lbrac >> symbolic_subject >> comma >> space >> symbolic_verb >> rbrac >> punc
    }

    rule(:symbolic_conditional) {
      symbolic_object >> lbrac >> symbolic_subject >> comma >> space >> symbolic_verb >> rbrac >> space >> symbolic_if >> space >>
      symbolic_object >> lbrac >> symbolic_subject >> rbrac >> punc
    }

    # Logic Syntax Symbols
    rule(:symbolic_object)  { match["A-Za-z"].repeat }
    rule(:symbolic_subject) { match["A-Za-z"].repeat }
    rule(:symbolic_verb)    { match["A-Za-z"].repeat }

    rule(:symbolic_if)      { str(":-") }
    rule(:lbrac) { str("(") }
    rule(:rbrac) { str(")") }
    rule(:comma) { str(",") }
    rule(:punc)  { str(".") }

    rule(:space) { match[" "].repeat }

    # Detects white space in code
    rule(:whitespace) {          match['\n\s'].repeat }

    rule(:o_tag) { match['A-Za-z_<>'].repeat  } #(1, 20) } #match['A-Za-z_<>'].repeat(1, 20)}
    rule(:c_tag) { match['A-Za-z_<>/\s'].repeat } #(1, 20) } #match['A-Za-z_<>'].repeat(1, 20) }


    rule(:identifier) { screen          | 
                        title           | 
                        clang           | 
                        cindex          | 
                        cname           | 
                        chex            | 
                        calka           | 
                        crela           |
                        word_class      |
                        word_type       |
                        word_definition |
                        word_context    
    }

    # Rules for colors
    rule(:screen)    { match['A-Za-z_#'].repeat(1, 20) }
    rule(:title)     { match['A-Za-z_#'].repeat(1, 20) }
    rule(:clang)     { match['A-Za-z_#'].repeat(1, 20) }
    rule(:cindex)    { match['A-Za-z_#'].repeat(1, 20) }
    rule(:cname)     { match['A-Za-z_#'].repeat(1, 20) }
    rule(:chex)      { match['A-Za-z_#'].repeat(1, 20) }
    rule(:calka)     { match['A-Za-z_#'].repeat(1, 20) }
    rule(:crela)     { match['A-Za-z_#'].repeat(1, 20) }

    # Rules for language
    rule(:word_name)       { match['A-Za-z_#'].repeat(1, 20) }
    rule(:word_type)       { match['A-Za-z_#'].repeat(1, 20) }
    rule(:word_definitopn) { match['A-Za-z_#'].repeat(1, 20) }
    rule(:word_context)    { match['A-Za-z_#'].repeat(1, 20) }

    rule(:description) { match['A-Za-z0-9.# \s'].repeat }
  end

  class YumeTransform < Parslet::Transform
    #rule(:o_tag) { "<" >> }
    #rule(:c_tag) { "" }

    ## Symbolic Parsing

    ### Symbolic Strings
    rule(:symbolic_if) { ":-" }
    rule(:lbrac)       {  "(" }
    rule(:lbrac)       {  ")" }
    rule(:comma)       {  "," }
    rule(:punc)        {  "." }

    ### Symbolic Simples
    rule(symbolic_object:   simple(:symbolic_object)) {  symbolic_object }
    rule(symbolic_subject: simple(:symbolic_subject)) { symbolic_subject }
    rule(symbolic_verb:       simple(:symbolic_verb)) {    symbolic_verb }

    ## Color System Transforms
    rule(screen:            simple(:screen)) {      screen }
    rule(title:              simple(:title)) {       title }
    rule(clang:              simple(:clang)) {       clang }
    rule(cindex:            simple(:cindex)) {      cindex }
    rule(cname:              simple(:cname)) {       cname }
    rule(chex:                simple(:chex)) {        chex }
    rule(calka:              simple(:calka)) {       calka }
    rule(crela:              simple(:crela)) {       crela }
    rule(description:  simple(:description)) { description }

    ## Graphic XML transformer
    rule(word_class:           simple(:word_class)) {      word_class }
    rule(word_type:             simple(:word_type)) {       word_type }
    rule(word_definition: simple(:word_definition)) { word_definition }
    rule(word_context:       simple(:word_context)) {    word_context }
  end
end

begin
  parser      = Yumelang::YumeParse.new
  transform   = Yumelang::YumeTransform.new

  tree        = parser.parse("<screen>
  <container>
    <conlang>
      <color_identifier>PH6DR3</color_identifier>
      <color_name>Bland</color_name>
      <color_hex>#CBC4AA</color_hex>
      <color_alkalinity>The color has the lowest level of alkalinity acity in the PH6 degree of acidity in the color spectrum for colors related to Periwinkle Blue.</color_alkalinity>
      <color_relationship>This color is derived from Periwinkle blue and Dandelion yellow.</color_relationship>
    </conlang>
  </container>
</screen>")


  ast         = transform.apply(tree)
  ast_output = "#{ast}".to_s

  puts "#{ast_output}"
rescue Parslet::ParseFailed => error
  puts error.parse_failure_cause.ascii_tree
end
