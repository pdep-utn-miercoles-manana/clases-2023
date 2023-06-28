pelicula(dulceNoviembre, drama).
pelicula(laCasaDelLago, drama).
pelicula(replicas, cienciaFiccion(utopica)).
pelicula(matrix, cienciaFiccion(distopica)).
pelicula(johnWick1, accion(2)).
pelicula(johnWick2, accion(4)).
pelicula(johnWick3, accion(8)).
pelicula(toyStory4, infantil(porComputadora, 100)).
pelicula(bobEsponjaUnHeroeAlRescate, infantil(animacion, 105)).
pelicula(billyYTed, infantil(carneYHueso, 120)).

puedoLlevarAMiHijo(Pelicula) :-
  pelicula(Pelicula, cienciaFiccion(utopica)).

puedoLlevarAMiHijo(Pelicula) :-
  pelicula(Pelicula, accion(Violencia)),
  Violencia < 3.

puedoLlevarAMiHijo(Pelicula) :-
  pelicula(Pelicula, infantil(porComputadora, _)).

puedoLlevarAMiHijo(Pelicula) :-
  pelicula(Pelicula, infantil(animacion, _)).

puedoLlevarAMiHijo(Pelicula) :-
  pelicula(Pelicula, infantil(carneYHueso, Duracion)),
  Duracion =< 90.

queHayEnElCine(Pelicula) :-
  pelicula(Pelicula, _).
