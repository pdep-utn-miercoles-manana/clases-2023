ciudad(buenosAires, argentina, 3000000).
ciudad(marDelPlata, argentina, 680000).
ciudad(roma, italia, 2873000).
ciudad(florencia, italia, 382258).

% findall/3
% findall(Variable, Consulta, Lista).

poblacion(Pais, PoblacionTotal) :-
  ciudad(_, Pais, _),
  findall(Poblacion, ciudad(_, Pais, Poblacion), Poblaciones),
  sumlist(Poblaciones, PoblacionTotal).


continente(america, argentina).
continente(europa, italia).

% continenteGrande/1: si el continente tiene
% diez países o más.
continenteGrande(Continente) :-
  continente(Continente, _),
  findall(Pais, continente(Continente, Pais), Paises),
  length(Paises, Cantidad),
  Cantidad >= 10.

% Para uno o dos países usamos existencia:
tieneAlMenosDosPaises(Continente) :-
  continente(Continente, Pais),
  continente(Continente, OtroPais),
  Pais \= OtroPais.

% Así se puede hacer con 3, pero es preferible usar findall:
tieneAlMenosTresPaises(Continente) :-
  continente(Continente, UnPais),
  continente(Continente, OtroPais),
  continente(Continente, TercerPais),
  UnPais \= OtroPais,
  OtroPais \= TercerPais,
  UnPais \= TercerPais.


monumentos(buenosAires, [monumento(obelisco, 1936), monumento(deLosEspanioles, 1927)]).
monumentos(roma, [monumento(coliseo, 80), monumento(fontanaDiTrevi, 1762)]).

% ciudadAntigua si todos sus monumentos son anteriores a 1800.
ciudadAntigua(Ciudad) :-
   monumentos(Ciudad, _),
   forall( monumentoDeLaCiudad(Ciudad, Monumento),
           esAntiguo(Monumento)).

monumentoDeLaCiudad(Ciudad, Monumento) :-
  monumentos(Ciudad, Monumentos),
  member(Monumento, Monumentos).

esAntiguo(monumento(_, Anio)) :-
  Anio < 1800.
