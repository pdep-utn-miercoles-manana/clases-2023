padreDe(abe, abbie).
padreDe(abe, homero).
padreDe(abe, herbert).
padreDe(clancy, marge).
padreDe(clancy, patty).
padreDe(clancy, selma).
padreDe(homero, bart).
padreDe(homero, hugo).
padreDe(homero, lisa).
padreDe(homero, maggie).
madreDe(edwina, abbie).
madreDe(mona, homero).
madreDe(gaby, herbert).
madreDe(jacqueline, marge).
madreDe(jacqueline, patty).
madreDe(jacqueline, selma).
madreDe(marge, bart).
madreDe(marge, hugo).
madreDe(marge, lisa).
madreDe(marge, maggie).
madreDe(selma, ling).

%---------------%
%-- Punto 1 a --%
%---------------%

tieneHijo(Persona) :-
  madreOPadre(Persona, _).

madreOPadre(Persona, Hijo) :-
  madreDe(Persona, Hijo).

madreOPadre(Persona, Hijo) :-
  padreDe(Persona, Hijo).

%---------------%
%-- Punto 1 b --%
%---------------%

hermanos(Hermano1, Hermano2) :-
  compartenPadre(Hermano1, Hermano2),
  compartenMadre(Hermano1, Hermano2),
  Hermano1 \= Hermano2.

compartenMadre(Hermano1, Hermano2) :-
  madreDe(Madre, Hermano1),
  madreDe(Madre, Hermano2).

compartenPadre(Hermano1, Hermano2) :-
  padreDe(Padre, Hermano1),
  padreDe(Padre, Hermano2).

%---------------%
%-- Punto 1 c --%
%---------------%

medioHermanos(MedioHermano1, MedioHermano2) :-
  compartenPadre(MedioHermano1, MedioHermano2),
  not(compartenMadre(MedioHermano1, MedioHermano2)).

medioHermanos(MedioHermano1, MedioHermano2) :-
  compartenMadre(MedioHermano1, MedioHermano2),
  not(compartenPadre(MedioHermano1, MedioHermano2)).

%---------------%
%-- Punto 1 d --%
%---------------%

tioDe(Tio, Sobri) :-
  hermanos(Tio, Persona),
  madreOPadre(Persona, Sobri).

% Para los tíos políticos hace falta un predicado que me relacione a alguien con su pareja actual.

%---------------%
%-- Punto 1 f --%
%---------------%

abueloMultiple(Abuelo) :-
  abuelo(Abuelo, Nieto1),
  abuelo(Abuelo, Nieto2),
  Nieto1 \= Nieto2.

abuelo(Abuelo, Nieto) :-
  madreOPadre(Abuelo, Persona),
  madreOPadre(Persona, Nieto).

%---------------%
%-- Punto 1 g --%
%---------------%

% Para hacerlo hace falta un predicado que me relacione a alguien con su pareja actual.

%-------------%
%-- Punto 2 --%
%-------------%

descendiente(Predecesor, Descendiente) :-
  madreOPadre(Predecesor, Descendiente).

descendiente(Predecesor, Descendiente) :-
  madreOPadre(Predecesor, Persona),
  descendiente(Persona, Descendiente).
