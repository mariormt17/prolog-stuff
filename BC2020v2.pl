ordenar(X,[A,B,C]) :-
    member(A,X), member(B,X), member(C,X),
        A=\=B, A=\=C, B=\=C,
        A < B,
        B < C.

partir(L,A,B) :-
    append(A,B,L),
    last(A,Ult),
    memberchk(Ult,B).
