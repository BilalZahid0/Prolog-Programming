% Database
person(rahim, 15, football, dog).
person(mohsan, 11, volleyball, cat).
person(sohail, 25, card, cow).
person(kamal, 30, swimming, dog).
person(haseeb, 11, football, goat).
person(shakeel, 25, volleyball, cat).
person(abrar, 15, swimming, dog).
person(raju, 30, swimming, dog).
person(javed, 40, football, cow).
person(waleed, 30, volleyball, cat).

% Query to display P_name and age, P_Name and hobby
display_info :-
    write('P_name\tAge\tHobby\n'),
    forall(person(Name, Age, Hobby, _),
           (write(Name), write('\t'), write(Age), write('\t'), write(Hobby), nl)).

% Query to display people having a pet Dog
people_with_dog :-
    write('People with a pet Dog:\n'),
    forall(person(Name, Age, Hobby, Pet),
           (Pet == dog, write(Name), write('\n'))).


?- display_info.
?- people_with_dog.


% Facts
is_star(sun).
is_planet(venus).
is_planet(earth).
orbits_around(moon, earth).
orbits_around(venus, sun).
orbits_around(earth, sun).
is_satellite(X) :- orbits_around(X, _).
is_heavenly_body(X) :- is_star(X) ; is_planet(X).

% Rules
geocentric_solar_system :- orbits_around(sun, earth).
heliocentric_solar_system :- orbits_around(earth, sun).

% Goals
% (a) Is the Sun a star?
is_star(sun).

% (b) Does the moon orbit around the earth?
orbits_around(moon, earth).

% (c) Is the solar system heliocentric?
heliocentric_solar_system.

% (d) Is there anything which orbits something which orbits the sun?
orbits_around(X, Y) :- orbits_around(Y, sun), is_satellite(X).

