/*hombres por parte de papa*/
/*abuelo fermin*/
hombre(fermin).
/*hijos hombres de fermin*/
hombre(rene).
hombre(gilberto).

/*hombres por parte de mama*/
/*abuelo apolinar*/
hombre(apolinar).
/*hijo hombre de apolinar*/
hombre(victor).
/*hijo hombre de victor-viviana*/
hombre(jhon).
/*hijos hombre de julia-gabino*/
hombre(richard).
hombre(cristian).
hombre(jhilmar).
/*hijo hombre de rene-virginia*/
hombre(ronal).
/*esposo hombre de julia*/
hombre(gabino).

/*mujeres por parte de papa*/
mujer(hilaria).
mujer(martha).

/*mujeres por parte de mama*/
/*abuela florencia*/
mujer(florencia).
/*hijas mujeres de florencia*/
mujer(virginia).
mujer(julia).
/*hija mujer de julia-gabino*/
mujer(jhoselin).
/*hija mujer de victor-viviana*/
mujer(anahi).
/*hijas mujeres de rene-virginia*/
mujer(noelia).
mujer(yessica).
/*esposa mujer de victor*/
mujer(viviana).

progenitorde(florencia,virginia).
progenitorde(florencia,julia).
progenitorde(florencia,victor).

progenitorde(apolinar,virginia).
progenitorde(apolinar,julia).
progenitorde(apolinar,victor).

progenitorde(hilaria,rene).
progenitorde(hilaria,gilberto).
progenitorde(hilaria,martha).

progenitorde(fermin,rene).
progenitorde(fermin,gilberto).
progenitorde(fermin,martha).

progenitorde(virginia,ronal).
progenitorde(virginia,yessica).
progenitorde(virginia,noelia).

progenitorde(rene,ronal).
progenitorde(rene,yessica).
progenitorde(rene,noelia).

progenitorde(julia,cristian).
progenitorde(julia,jhoselin).
progenitorde(julia,richard).
progenitorde(julia,jhilmar).

progenitorde(vistor,jhon).
progenitorde(victor,anahi).

parejade(apolinar,florencia).
parejade(florencia,apolinar).

parejade(fermin,hilaria).
parejade(hilaria,fermin).

parejade(rene,virginia).
parejade(virginia,rene).

parejade(gabino,julia).
parejade(julia,gabino).

parejade(victor,viviana).
parejade(viviana,victor).
/*reglas*/
padrede(X,Y):- hombre(X),progenitorde(X,Y).
madrede(X,Y) :- mujer(X),progenitorde(X,Y).

hijode(X,Y) :- hombre(X),progenitorde(Y,X).
hijade(X,Y) :- mujer(X),progenitorde(Y,X).

hermanos(X,Y) :- progenitorde(Z,X),progenitorde(Z,Y),not(X==Y).

hermanode(X,Y) :- hombre(X),hermanos(X,Y).
hermanade(X,Y) :- mujer(X),hermanos(X,Y).

esposode(X,Y) :- parejade(X,Y),hombre(X).
esposade(X,Y) :- parejade(X,Y),mujer(X).

suegrode(X,Y) :- padrede(X,Z),parejade(Y,Z).
suegrade(X,Y) :- madrede(X,Z),parejade(Y,Z).

cuñados(X,Y) :- ((parejade(X,Z),hermanos(Z,Y));(parejade(Y,Z),hermanos(Z,X))).
cuñadode(X,Y) :-cuñados(X,Y),hombre(X).
cuñadade(X,Y) :-cuñados(X,Y),mujer(X).

abuelode(X,Y) :- progenitorde(Z,Y),padrede(X,Z).
abuelade(X,Y) :- progenitorde(Z,Y),madrede(X,Z).

tiode(X,Y) :- progenitorde(Z,Y),(hermanode(X,Z);cuñadode(X,Z)).
tiade(X,Y) :- progenitorde(Z,Y),(hermanade(X,Z);cuñadade(X,Z)).

sobrinode(X,Y) :- hermanos(Z,Y),progenitorde(Z,X),hombre(X).
sobrinade(X,Y) :-hermanos(Z,Y),progenitorde(Z,X),mujer(X).

nietode(X,Y) :- progenitorde(Y,Z),progenitorde(Z,X),hombre(X).
nietade(X,Y) :- progenitorde(Y,Z),progenitorde(Z,X),mujer(X).

primode(X,Y) :-progenitorde(Z,X),progenitorde(W,Y),hermanos(Z,W),hombre(X).
primade(X,Y) :-progenitorde(Z,X),progenitorde(W,Y),hermanos(Z,W),mujer(X).

yernode(X,Y) :- suegrode(Y,X);suegrade(Y,X),hombre(X).
nuerade(X,Y) :- suegrode(Y,X);suegrade(Y,X),mujer(X).

