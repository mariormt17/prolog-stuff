esHombre(jose).
esHombre(carlos).
esHombre(juan).
esHombre(omar).
esHombre(jorge).
esMujer(eva).
esMujer(rosa).
esMujer(maria).
esMujer(esther).
papa(jose, carlos).
papa(jose, juan).
papa(jose, rosa).
papa(juan, omar).
papa(juan, jorge).
papa(omar, maria).
mama(eva,carlos).
mama(eva,juan).
mama(eva,rosa).
mama(eva,omar).
mama(eva,jorge).
mama(rosa,esther).

/*AGREGAMOS LA REGLA HIJO, SIENDO LA INVERSA DE PAPA*/
hijo(Y,X) :- papa(X,Y);mama(X,Y).
/*REGLA PARA CONOCER AL ESPOSO DE UNA PAREJA QUE TUVO HIJOS*/
esposo(X,Y) :-  papa(X,Z),mama(Y,Z).
/*REGLA PARA CONOCER A LA ESPOSA DE UNA PAREJA QUE TUVO HIJOS*/
esposa(X,Y) :-  papa(Y,Z),mama(X,Z).
/*REGLA PARA CONOCER SI ES HUMANO AL ESTAR DEFINIDO COMO HOMBRE O MUJER*/
esHumano(X) :- esHombre(X);esMujer(X).
/*REGLA PARA CONOCER LOS HIJOS HOMBRES DE UN PAPA O MAMA*/
hijoHombre(Y,X) :- (papa(X,Y);mama(X,Y)),esHombre(Y).
/*REGLA PARA CONOCER LAS HIJAS MUJERES DE UN PAPA O MAMA*/
hijaMujer(Y,X) :- (papa(X,Y);mama(X,Y)),esMujer(Y).
/*REGLA PARA CONOCER EL ABUELO DE UN NIETO*/
abuelo(X,Y) :- papa(X,Z), papa(Z,Y) ; papa(X,Z), mama(Z,Y).
/*REGLA PARA CONOCER LA ABUELA DE UN NIETO*/
abuela(X,Y) :- mama(X,Z), mama(Z,Y) ; mama(X,Z), papa(Z,Y).
/*REGLA PARA CONOCER LOS HERMANOS POR EL PADRE DE ESTOS*/
hermanoXpadre(X,Y) :- papa(Z,X), papa(Z,Y),X\=Y.
/*REGLA PARA CONOCER LOS HERMANOS POR LA MADRE DE ESTOS*/
hermanoXmadre(X,Y) :- mama(Z,X), mama(Z,Y),X\=Y.
