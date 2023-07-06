% Punto 1
todosSiguenA(Rey) :-
  personaje(Rey),
  forall(personaje(Personaje), sigueA(Personaje, Rey)).

sigueA(Alguien, Alguien).
sigueA(lyanna, jon).
sigueA(jorah, daenerys).


% Punto 2
ciudadInteresante(Ciudad) :-
  antigua(Ciudad),
  cantidadLugaresCopados(Ciudad, CantidadLugares),
  CantidadLugares > 10.

cantidadLugaresCopados(Ciudad, CantidadLugares) :-
  findall(Lugar, copadosEn(Ciudad, Lugar), Lugares),
  length(Lugares, CantidadLugares).

copadosEn(Ciudad, Lugar) :-
  puntoDeInteres(PuntoCopado, Ciudad),
  puntoCopado(PuntoCopado).

puntoCopado(bar(CantidadVariedadesCerveza)) :-
  CantidadVariedadesCerveza > 4.
puntoCopado(museo(cienciasNaturales)).
puntoCopado(estadio(Capacidad)) :-
  Capacidad > 40000.


% Punto 3
inFraganti(Delito, Delincuente) :-
  cometio(Delito, Delincuente),
  testigo(Delito, Testigo).


% Punto 4
viejoMaestro(Pensador) :-
  pensamiento(Pensador, _),
  forall(pensamiento(Pensador, Pensamiento), llegaANuestrosDias(Pensamiento)).


% Punto 5
numeroDeLaSuerte(Persona, Numero) :-
  diaDelNacimiento(Persona, Numero).

numeroDeLaSuerte(joaquin, 2).


% Punto 6
obraMaestra(Compositor, Obra) :-
  compositor(Compositor, Obra),
  forall(movimiento(Obra, Movimiento),
         movimientoMaestro(Movimiento)).


% Punto 7
puedeComer(analia, Comida) :-
  ingrediente(Comida, _),
  forall(ingrediente(Comida, Ingrediente),
         esVegano(Ingrediente)).

esVegano(Ingrediente) :-
  not(contieneCarne(Ingrediente)),
  not(contieneHuevo(Ingrediente)),
  not(contieneLeche(Ingrediente)).

puedeComer(evaristo, asado).


% Punto 8
% Hay que eliminar la lógica repetida
% de itemPaquete(Paquete, ...) que está tres veces.
