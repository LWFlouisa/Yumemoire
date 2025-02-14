mortal(X) :- person(X).

person(plato).
person(bethany).

mortal_report :-
  write('Known mortals are: '), nl,
  mortal(X),
  write(X), nl,
  fail.
