drama(dulceNoviembre).
drama(laCasaDelLago).
cienciaFiccion(replicas, utopica).
cienciaFiccion(matrix, distopica).
accion(johnWick1, 2).
accion(johnWick2, 4).
accion(johnWick3, 8).
infantil(toyStory4, porComputadora, 100).
infantil(bobEsponjaUnHeroeAlRescate, animacion, 105).
infantil(billyYTed, carneYHueso, 120).

puedoLlevarAMiHijo(Pelicula) :-
  cienciaFiccion(Pelicula, utopica).

puedoLlevarAMiHijo(Pelicula) :-
  accion(Pelicula, Violencia),
  Violencia < 3.

puedoLlevarAMiHijo(Pelicula) :-
  infantil(Pelicula, porComputadora, _).

puedoLlevarAMiHijo(Pelicula) :-
  infantil(Pelicula, animacion, _).

puedoLlevarAMiHijo(Pelicula) :-
  infantil(Pelicula, carneYHueso, Duracion),
  Duracion =< 90.  

queHayEnElCine(Pelicula) :-
  drama(Pelicula).

 queHayEnElCine(Pelicula) :-
  cienciaFiccion(Pelicula, _).
  
queHayEnElCine(Pelicula) :-
  accion(Pelicula, _).

queHayEnElCine(Pelicula) :-
  infantil(Pelicula, _, _).
  