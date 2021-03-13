hombre(mario).
hombre(marioRuben).
hombre(marianoRuberiano).
mujer(isela).
mujer(mariaRubena).
mujer(marianitaRubenita).

padre(marioRuben, mario).
padre(marianoRuberiano, mario).
padre(mariaRubena, mario).
padre(marianitaRubenita, marioRuben).

madre(marioRuben, isela).
madre(marianoRuberiano, isela).
madre(mariaRubena, isela).

esposa(mario, isela).
esposa(marioRuben, karen).
esposo(isela, mario).
esposo(karen, marioRuben).

/* DEFINICION DE CLAUSULAS */
hermanoXpadre(X,Y) :- padre(X,Z), padre(Y,Z),X\=Y.
hermanoXmadre(X,Y) :- madre(X,Z), madre(Y,Z),X\=Y.

tioPaterno(X,Y) :- hermanoXpadre(Z,Y),padre(X,Z).
tioMaterno(X,Y) :- hermanoXpadre(Z,Y),madre(X,Z).

abuelo(X,Y) :- (padre(X,Z), padre(Z,Y)) |  (madre(X,Z), madre(Z,Y)).
