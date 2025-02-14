naval_beast(X) :- beast(X).

beast(cochonbuta).

naval_report :-
  write('All known naval creatures: '), nl,
  beast(X),
  write(X), nl,
  fail.
