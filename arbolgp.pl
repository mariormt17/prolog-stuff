/*HECHOS DE LA BASE DE CONOCIMIENTO*/
hombre(jesus).
hombre(julio).
hombre(julio_esteban).
hombre(mario).
hombre(mario_ruben).
hombre(carlos_ruben).
hombre(ruben).
hombre(fortino).
hombre(victor).
hombre(victor_manuel).
hombre(alejandro).

mujer(paz).
mujer(rebeca).
mujer(virginia).
mujer(isela).
mujer(maria_isela).
mujer(yolanda).
mujer(rosa).
mujer(hortensia).
mujer(roselia).
mujer(jimena).
mujer(indira).

padre(jesus, julio).
padre(jesus, virginia).
padre(jesus, mario).
padre(julio, julio_esteban).
padre(mario, mario_ruben).
padre(mario, carlos_ruben).
padre(mario, maria_isela).
padre(ruben, isela).
padre(ruben, rosa).
padre(ruben, hortensia).
padre(ruben, roselia).
padre(victor, jimena).
padre(victor, victor_manuel).
padre(fortino, indira).
padre(fortino, alejandro).

madre(paz, julio).
madre(paz, virginia).
madre(paz, mario).
madre(rebeca, julio_esteban).
madre(isela, mario_ruben).
madre(isela, carlos_ruben).
madre(isela, maria_isela).
madre(yolanda, isela).
madre(yolanda, rosa).
madre(yolanda, hortensia).
madre(yolanda, roselia).
madre(rosa, jimena).
madre(rosa, victor_manuel).
madre(roselia, indira).
madre(roselia, alejandro).

esposos(paz, jesus).
esposos(rebeca, julio).
esposos(isela, mario).
esposos(yolanda, ruben).
esposos(rosa, victor).
esposos(roselia, fortino).

/*ACTIVIDAD 1*/
/*Determina que X es hijo de Y.*/
hijo(X,Y) :- (padre(Y,X); madre(Y,X)),hombre(X).
/*Determina que X es hija de Y.*/
hija(X,Y) :- (padre(Y,X); madre(Y,X)),mujer(X).
/*Determina que X son todas las abuelas de Y.*/
abuelas(X,Y) :- madre(X,Z), madre(Z,Y) ; madre(X,Z), padre(Z,Y).
/*Determina que X es la abuela materna de Y.*/
abuelam(X,Y) :- madre(X,Z), madre(Z,Y).
/*Determina que X es la abuela paterna de Y.*/
abuelap(X,Y) :- madre(X,Z), padre(Z,Y).
/*Determina que X son todos los abuelos de Y.*/
abuelos(X,Y) :- padre(X,Z), madre(Z,Y) ; padre(X,Z), padre(Z,Y).
/*Determina que X es el abuelo materno de Y.*/
abuelom(X,Y) :- padre(X,Z), madre(Z,Y).
/*Determina que X es el abuelo paterno de Y.*/
abuelop(X,Y) :- padre(X,Z), padre(Z,Y).
/*Determina que X son todos los nietos de Y.*/
nietos(X,Y) :- (abuelas(Y,X); abuelos(Y,X)), hombre(X).
/*Determina que X son todas las nietas de Y.*/
nietas(X,Y) :- (abuelas(Y,X); abuelos(Y,X)), mujer(X).
/*Determina que X son todos los hermanos de Y (hombres y/o mujeres).*/
hermanos(X,Y) :- padre(Z,X),padre(Z,Y),X\=Y.
/*Determina que X es hermano de Y.*/
hermano(X,Y) :- padre(Z,X),padre(Z,Y),hombre(X),X\=Y.
/*Determina que X es hermana de Y.*/
hermana(X,Y) :- padre(Z,X),padre(Z,Y),mujer(X),X\=Y.
/*Determina que X son todos los primos de Y (hombres y/o mujeres).*/
primos(X,Y) :-  hermanos(Z, W),
                ((padre(Z,X), padre(W,Y));
                (madre(Z,X),madre(W,Y));
                (madre(Z,X),padre(W,Y));
                (padre(Z,X),madre(W,Y))).
/*Determina que X es primo de Y.*/
primo(X,Y) :- hermanos(Z, W),
              ((padre(Z,X), padre(W,Y));
              (madre(Z,X),madre(W,Y));
              (madre(Z,X),padre(W,Y));
              (padre(Z,X),madre(W,Y))), hombre(X).
/*Determina que X es prima de Y.*/
prima(X,Y) :- hermanos(Z, W),
              ((padre(Z,X), padre(W,Y));
              (madre(Z,X),madre(W,Y));
              (madre(Z,X),padre(W,Y));
              (padre(Z,X),madre(W,Y))), mujer(X).
/*Determina que X son todos los tíos de Y (hombres y/o mujeres).*/
tios(X,Y) :- hermanos(Z,X),((padre(Z,Y));(madre(Z,Y))).
/*Determina Que X es tío de Y.*/
tio(X,Y) :- hermanos(Z,X),((padre(Z,Y));(madre(Z,Y))),hombre(X).
/*Determina que X es tía de Y.*/
tia(X,Y) :- hermanos(Z,X),((padre(Z,Y));(madre(Z,Y))),mujer(X).
/*Determina que X son todos los sobrinos de Y (hombres y/o mujeres).*/
sobrinos(X,Y) :-  hermanos(Z,Y),((padre(Z,X));(madre(Z,X))).
/*Determina que X es sobrino de Y.*/
sobrino(X,Y) :-  hermanos(Z,Y),((padre(Z,X));(madre(Z,X))), hombre(X).
/*Determina que X es sobrina de Y.*/
sobrina(X,Y) :-  hermanos(Z,Y),((padre(Z,X));(madre(Z,X))), mujer(X).

/*ACTIVIDAD 2*/
/*Regla que encuentre los descendientes de X utilizando recursividad.*/
ancdes(Anc,Des) :- padre(Anc,Des);madre(Anc,Des).
ancdes(Anc,Des) :- (padre(Anc,X);madre(Anc,X)),ancdes(X,Des).

/*ACTIVIDAD 3*/
/*Determina que X sea esposo (hombre) de Y*/
esposo(X,Y) :- (esposos(X,Y);esposos(Y,X)),hombre(X).
/*Determina que X sea esposa (mujer) de Y*/
esposa(X,Y) :- (esposos(X,Y);esposos(Y,X)),mujer(X).
/*Determina que X son todos los suegros de Y*/
suegros(X,Y) :- (esposos(Y,Z);esposos(Z,Y)),((padre(X,Z));(madre(X,Z))).
/*Determina que X sea suegro (hombre) de Y*/
suegro(X,Y) :- (esposos(Y,Z);esposos(Z,Y)),((padre(X,Z));(madre(X,Z))),hombre(X).
/*Determina que X sea suegra (mujer) de Y*/
suegra(X,Y) :- (esposos(Y,Z);esposos(Z,Y)),((padre(X,Z));(madre(X,Z))),mujer(X).
