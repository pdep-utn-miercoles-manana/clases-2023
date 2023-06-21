% vuelo/3
% vuelo(Origen, Destino, Costo).
vuelo(eze, mad, 250000).
vuelo(mad, eze, 270000).
vuelo(aep, scl, 90000).
vuelo(scl, aep, 95000).
vuelo(eze, fnj, 150000).
vuelo(fnj, eze, 150000).
% vuelo(eze, fnj, 5).
% vuelo(fnj, eze, 5).
% vuelo(fnj2, scl, 10).

% is
costoIdaYVuelta(Costo, Aeropuerto1, Aeropuerto2) :-
  vuelo(Aeropuerto1, Aeropuerto2, CostoIda),
  vuelo(Aeropuerto2, Aeropuerto1, CostoVuelta),
  Costo is CostoIda + CostoVuelta.
  
% La cantidad de millas para hacer un viaje
% es el costo en pesos dividido 5.
costoIdaYVueltaEnMillas(Millas, Aeropuerto1, Aeropuerto2) :-
  costoIdaYVuelta(CostoEnPesos, Aeropuerto1, Aeropuerto2),
  Millas is CostoEnPesos / 5.

% diferenciaEnPesos/3:
% la diferencia de costo entre la ida y la vuelta
% abs/2 
diferenciaEnPesos(Diferencia, Aeropuerto1, Aeropuerto2) :-
  vuelo(Aeropuerto1, Aeropuerto2, CostoIda),
  vuelo(Aeropuerto2, Aeropuerto1, CostoVuelta),
  DiferenciaParcial is CostoIda - CostoVuelta,
  abs(DiferenciaParcial, Diferencia).

% Inversibilidad
% Predicados no inversibles, parcialmente inversibles, totalmente inversibles

% Negación:
% not/1 -> algo para negar
% recibe un ¡¿predicado?!

aeropuerto(aep, buenosAires).
aeropuerto(eze, buenosAires).
aeropuerto(mad, madrid).
aeropuerto(scl, santiago).
aeropuerto(fnj, sunan).
aeropuerto(fnj2, sunan).

ciudad(buenosAires, argentina).
ciudad(madrid, espania).
ciudad(santiago, chile).
ciudad(laprida, argentina).
ciudad(sunan, coreaDelNorte).

% inaccesibleEnAvion/1 -> se cumple si no se puede llegar en avión
accesibleEnAvion(Ciudad) :-
  vuelo(_, Aeropuerto, _),
  aeropuerto(Aeropuerto, Ciudad).

inaccesibleEnAvion(Ciudad) :-
  ciudad(Ciudad, _),
  not(accesibleEnAvion(Ciudad)).

% imposibleSalir/1 (Ciudad) -> hay vuelo de ida pero no de vuelta  
imposibleSalir(Ciudad) :-
  accesibleEnAvion(Ciudad),
  not(hayVueloDeVuelta(Ciudad)).

hayVueloDeVuelta(Ciudad) :-
  aeropuerto(Aeropuerto, Ciudad),
  vuelo(Aeropuerto, _, _).

% vueloNacional(Aeropuerto1, Aeropuerto2) -> sale y llega de Arg
vueloNacional(Aeropuerto1, Aeropuerto2) :-
  vuelo(Aeropuerto1, Aeropuerto2, _),
  aeropuertoArgentino(Aeropuerto1),
  aeropuertoArgentino(Aeropuerto2).

aeropuertoArgentino(Aeropuerto) :-
  aeropuerto(Aeropuerto, Ciudad),
  ciudad(Ciudad, argentina).

% viajeCaro(Aero1, Aero2) -> no hay vuelos de menos de 200000 
viajeCaro(Aeropuerto1, Aeropuerto2) :-
  vuelo(Aeropuerto1, Aeropuerto2, _),
  vuelo(Aeropuerto2, Aeropuerto1, _),
  not(hayVuelosDeMenosDe200000(Aeropuerto1, Aeropuerto2)).

hayVuelosDeMenosDe200000(Aeropuerto1, Aeropuerto2) :-
  costoIdaYVuelta(Costo, Aeropuerto1, Aeropuerto2),
  Costo < 200000.
