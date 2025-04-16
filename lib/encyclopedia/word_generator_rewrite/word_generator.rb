#          Te      Ta     Tos
# Te    Te,Te   Te,Ta  Te,Tos
# Ta    Ta,Te   Ta,Ta  Ta,Tos
# Tos  Tos,Te  Tos,Ta Tos,Tos

7.times do

hybrid_genders = [
  [["Te",  "Te"], ["Te",  "Ta"], ["Te",  "Tos"]],
  [["Ta" , "Te"], ["Ta",  "Ta"], ["Ta",  "Tos"]],
  [["Tos", "Te"], ["Tos", "Ta"], ["Tos", "Tos"]],
]

gender_row_options = [0, 1, 2]
gender_col_options = [0, 1, 2]
gender_arr_options = [0, 1]

gender_cur_row = gender_row_options.sample
gender_cur_col = gender_col_options.sample
gender_cur_arr = gender_arr_options.sample

h_gender = hybrid_genders[gender_cur_row][gender_cur_col][gender_cur_arr]

#               ie  shado gareji ribingurumu  roka   daidakoro shinku aisubokkusu uindo  basurumu shinshitsu
# ie            i,i  i,s1  i,g    i,r1         i,r2   i,d       i,s2    i,a         i,u    i.b      i,s3     # House
# shado        s1,i s1,s1 s1,g   s1,r1        s1,r2  s1,d      s1,s2   s1,a        s1,u   s1.b     s1,s3     # Slope
# gareji        g,i  g,s1  g,g    g,r1         g,r2   g,d       g,s2    g,a         g,u    g.b      g,s3     # Garage
# ribingurumu  r1,i r1,s1 r1,g   r1,r1        r1,r2  r1,d      r1,s2   r1,a        r1,u   r1.b     r1,s3     # Living Room
# roka          g,i  g,s1  g,g    g,r1         g,r2   g,d       g,s     g,a         g,u    g.b      g,s3     # Fridge
# daidakoro     d,i  d,s1  d,g    d,r1         d,r2   d,d       d,s     d,a         d,u    d.b      d,s3     # The first time
# shinku       s2,i s2,s1 s2,g   s2,r1        s2,r2  s2,d      s2,s    s2,a        s2,u   s2.b     s2,s3     # Sink
# aisubokkusu   a,i  a,s1  a,g    a,r1         a,r2   a,d       a,s     a,a         a,u    a.b      a,s2     # Ice Box
# uindo         u,i  u,s1  u,g    u,r1         u,r2   u,d       u,s     u,a         u,u    u.b      u,s2     # Window
# basurumu      b,i  b,s1  b,g    b,r1         b,r2   b,d       b,s     b,a         b,u    b.b      b,s2     # Bathroom
# shinshitsu   s3,i s3,s1 s3,g   s3,r1        s3,r2  s3,d      s3,s    s3,a         s3,u  s3.b     s3,s2     # Bedroom

locations = [
  [["Ie",          "Ie"], ["Ie",          "Shado"], ["Ie",          "Gareji"], ["Ie",          "Ribingurumu"], ["Ie",          "Roka"], ["Ie",          "Daidakoro"], ["Ie",          "Shinku"], ["Ie",          "Aisubokkusu"], ["Ie",          "Uindo"], ["Ie",          "Basurumu"], ["Ie",          "Shinshitsu"]],
  [["Shadi" ,      "Ie"], ["Shado",       "Shado"], ["Shado",       "Gareji"], ["Shado",       "Ribingurumu"], ["Shado" ,      "Roka"], ["Shado",       "Daidakoro"], ["Shado",       "Shinku"], ["Shado",       "Aisubokkusu"], ["Shado",       "Uindo"], ["Shado",       "Basurumu"], ["Shado",       "Shinshitsu"]],
  [["Gareji",      "Ie"], ["Gareji",      "Shado"], ["Gareji",      "Gareji"], ["Gareji",      "Ribingurumu"], ["Gareji",      "Roka"], ["Gareji",      "Daidakoro"], ["Gareji",      "Shinku"], ["Gareji",      "Aisubokkusu"], ["Garehi",      "Uindo"], ["Gareji",      "Basurumu"], ["Shadow",      "Shinshitsu"]],
  [["Ribingurumu", "Ie"], ["Ribingurumu", "Shado"], ["Ribingurumu", "Gareji"], ["Ribingurumu", "Ribingurumu"], ["Ribingurumu", "Roka"], ["Ribingurumu", "Daidakoro"], ["Ribingurumu", "Shinku"], ["Ribingurumu", "Aisubokkusu"], ["Ribingurumu", "Uindo"], ["Ribingurumu", "Basurumu"], ["Ribingurumu", "Shinshitsu"]],
  [["Roka",        "Ie"], ["Roka",        "Shado"], ["Roka",        "Gareji"], ["Roka",        "Ribingurumu"], ["Roka",        "Roka"], ["Roka",        "Daidakoro"], ["Roka",        "Shinku"], ["Roka",        "Aisubokkusu"], ["Roka",        "Uindo"], ["Roka",        "Basurumu"], ["Roka",        "Shinshitsu"]],
  [["Daidakoro",   "Ie"], ["Daidakoro",   "Shado"], ["Daidakoro",   "Gareji"], ["Daidakoro",   "Ribingurumu"], ["Daidakoro",   "Roka"], ["Daidakoro",   "Daidakoro"], ["Daidakoro",   "Shinku"], ["Daidakoro",   "Aisubokkusu"], ["Daidakoro",   "Uindo"], ["Daidakoro",   "Basurumu"], ["Daidakoro",   "Shinshitsu"]],
  [["Shinku",      "Ie"], ["Shinku",      "Shado"], ["Shinku",      "Gareji"], ["Shinku",      "Ribingurumu"], ["Shinku",      "Roka"], ["Shinku",      "Daidakoro"], ["Shinku",      "Shinku"], ["Shinku",      "Aisubokkusu"], ["Shinku",      "Uindo"], ["Shinku",      "Basurumu"], ["Shinku",      "Shinshitsu"]],
  [["aisubokkusu", "Ie"], ["Aisubokkusu", "Shado"], ["Aisubokkusu", "Gareji"], ["Aisubokkusu", "Ribingurumu"], ["Aisubokkusu", "Roka"], ["Aisubokkusu", "Daidakoro"], ["Aisubokkusu", "Shinku"], ["Aisubokkusu", "Aisubokkusu"], ["Aisubokkusu", "Uindo"], ["Aisubokkusu", "Basurumu"], ["Aisubokkusu", "Shinshitsu"]],
  [["Uindo",       "Ie"], ["Uindo",       "Shado"], ["Uindo",       "Gareji"], ["Uindo"      , "Ribingurumu"], ["Uindo",       "Roka"], ["Uindo",       "Daidakoro"], ["Uindo",       "Shinku"], ["Uindo",       "Aisubokkusu"], ["Uindo",       "Uindo"], ["Uindo",       "Basurumu"], ["Uindo",       "Shinshitsu"]],
  [["Basurumu",    "Ie"], ["Basurumu",    "Shado"], ["Basurumu",    "Gareji"], ["Basurumu",    "Ribingurumu"], ["Basurumu",    "Roka"], ["Basurumu",    "Daidakoro"], ["Basurumu",    "Shinku"], ["Basurumu",    "Aisubokkusu"], ["Basurumu",    "Uindo"], ["Basurumu",    "Basurumu"], ["Basurumu",    "Shinshitsu"]],
  [["Shinshitsu",  "Ie"], ["Shinsitsu",   "Shado"], ["Shinsitsu",   "Gareji"], ["Shinshitsu",  "Ribingurumu"], ["Shinshitsu",  "Roka"], ["Shinshitsu",  "Daidakoro"], ["Shinshitsu",  "Shinku"], ["Shinshitsu",  "Aisubokkusu"], ["Shinshitsu",  "Uindo"], ["Shinshitsu",  "Basurumu"], ["Shinshitsu",  "Shinshitsu"]],
]

location_row_options = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
location_col_options = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
location_arr_options = [0, 1]

l_cur_row = location_row_options.sample
l_cur_col = location_col_options.sample
l_cur_arr = location_arr_options.sample

cur_location = locations[l_cur_row][l_cur_col][l_cur_arr]

#            guache entre sortie porte canape pratiquer manger lave  merde  dorm  mur
# guache      g,g    g,e   g,s    g,p   g,c    g,p       g,m1   g,l   g,m2   g,d   g,m3 # Gouache paint
# entre       e,g    e,e   e,s    e,p   e,c    e,p       e,m1   e,l   e,m2   e,d   e,m3 # Between
# sortie      s,g    s,e   s,s    s,p   s,c    s,p       s,m1   s,l   s,m2   s,d   s,m3 # Exit
# porte       p,g    p,e   p,s    p,p   p,c    p,p       p,m1   p,l   p,m2   p,d   p,m3 # Door
# canape      c,g    c,e   c,s    c,p   c,c    c,p       c,m1   c,l   c,m2   c,d   c,m3 # Couch
# pratiquer   p,g    p,e   p,s    p,p   p,c    p,p       p,m1   p,l   p,m2   p,d   p,m3 # Practice
# manger     m1,g   m1,e  m1,s   m1,p  m1,c   m1,p      m1,m1  m1,l  m1,m2  m1,d  m1,m3 # To Eat
# lave        l,g    l,e   l,s    l,p   l,c    l,p       l,m1   l,l   l,m2   l,d   l,m3 # Washed / Wash
# merde      m2,g   m2,e  m2,s   m2,p  m2,c   m2,p      m2,m1  m2,l  m2,m2  m2,d  m2,m3 # Shit / Poo ( informal )
# dorm        d,g    d,e   d,s    d,p   d,c    d,p       d,m1   d,l   d,m2   d,d   d,m3 # Sleep
# mur        m3,g   m3,e  m3,s   m3,p  m3,c   m3,p      m3,m1  m3,l  m3,m   m3,d  m3,m2 # Wall

#begin

verbs = [
  [["gouache",   "gouache"], ["gouache",   "entre"], ["gouache",   "sortie"], ["gouache",   "porte"], ["gouache",   "canape"], ["gouache",   "pratiquer"], ["gouache",   "manger"], ["gouache",   "laver"], ["gouache",   "merde"], ["gouache",   "dorm"], ["gouache",   "mur"]],
  [["entre",     "gouache"], ["entre",     "entre"], ["entre",     "sortie"], ["entre",     "porte"], ["entre",     "canape"], ["entre",     "pratiquer"], ["entre",     "manger"], ["entre",     "laver"], ["entre",     "merde"], ["entre",     "dorm"], ["entre",     "mur"]],
  [["sortie",    "gouache"], ["sortie",    "entre"], ["sortie",    "sortie"], ["sortie",    "porte"], ["sortie",    "canape"], ["sortie",    "pratiquer"], ["sortie",    "manger"], ["sortie",    "laver"], ["sortie",    "merde"], ["sortie",    "dorm"], ["sortie",    "mur"]],
  [["porte",     "gouache"], ["porte",     "entre"], ["porte",     "sortie"], ["porte",     "porte"], ["porte",     "canape"], ["porte",     "pratiquer"], ["porte",     "manger"], ["porte",     "laver"], ["porte",     "merde"], ["porte",     "dorm"], ["prte",      "mur"]],
  [["canape",    "gouache"], ["canape",    "entre"], ["canape",    "sortie"], ["canape",    "porte"], ["canape",    "canape"], ["canape",    "pratiquer"], ["canape",    "manger"], ["canape",    "laver"], ["canape",    "merde"], ["canape",    "dorm"], ["canape",    "mur"]],
  [["pratiquer", "gouache"], ["pratiquer", "entre"], ["pratiquer", "sortie"], ["pratiquer", "porte"], ["pratiquer", "canape"], ["pratiquer", "pratiquer"], ["pratiquer", "manger"], ["pratiquer", "laver"], ["pratiquer", "merde"], ["pratiquer", "dorm"], ["pratiquer", "mur"]],
  [["manger",    "gouache"], ["manger",    "entre"], ["manger",    "sortie"], ["manger",    "porte"], ["manger",    "canape"], ["manger",    "pratiquer"], ["manger",    "manger"], ["manger",    "laver"], ["manger",    "merde"], ["manger",    "dorm"], ["manger",    "mur"]],
  [["laver",     "gouache"], ["laver",     "entre"], ["laver",     "sortie"], ["laver",     "porte"], ["laver",     "canape"], ["laver",     "pratiquer"], ["laver",     "manger"], ["laver",     "laver"], ["laver",     "merde"], ["laver",     "dorm"], ["laver",     "mur"]],
  [["merde",     "gouache"], ["merde",     "entre"], ["merde" ,    "sortie"], ["merde",     "porte"], ["merde",     "canape"], ["merde",     "pratiquer"], ["merde",     "manger"], ["merde",     "laver"], ["merde",     "merde"], ["merde",     "dorm"], ["merde",     "mur"]],
  [["dorm",      "gouache"], ["dorm",      "entre"], ["dorm",      "sortie"], ["dorm",      "porte"], ["dorm",      "canape"], ["dorm",      "pratiquer"], ["dorm",      "manger"], ["dorm",      "laver"], ["dorm",      "merde"], ["dorm",      "dorm"], ["dorm",      "mur"]],
  [["mur",       "gouache"], ["mur",       "entre"], ["mur",       "sortie"], ["mur",       "porte"], ["mur",       "canape"], ["mur",       "pratiquer"], ["mur",       "manger"], ["mur",       "laver"], ["mur",       "merde"], ["mur",       "dorm"], ["mur",       "mur"]],
]

verb_row_options = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
verb_col_options = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
verb_arr_options = [0, 1]

v_cur_row = verb_row_options.sample
v_cur_col = verb_row_options.sample
v_cur_arr = verb_arr_options.sample

cur_verb = verbs[v_cur_row][v_cur_col][v_cur_arr]

#rescue
  #puts "No such verb on #{v_cur_row} #{v_cur_col} #{v_cur_arr}"
#end


## Create word
current_word = "#{h_gender} #{cur_location}#{cur_verb}"
#current_word = "#{cur_verb}"

  #training_data = " => portmanteau.train(:formal, '#{current_word}', 'word')\n"

  File.open("_input/portmanteau.txt", "a") { |f|
    f.puts current_word
  }
  #puts  training_data
end
