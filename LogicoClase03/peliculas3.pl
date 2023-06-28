pelicula(dulceNoviembre, drama).
pelicula(laCasaDelLago, drama).
pelicula(replicas, cienciaFiccion(utopica)).
pelicula(matrix, cienciaFiccion(distopica)).
pelicula(johnWick1, accion(2)).
pelicula(johnWick2, accion(4)).
pelicula(johnWick3, accion(8)).
pelicula(toyStory4, infantil(porComputadora, 100)).
pelicula(bobEsponjaUnHeroeAlRescate, infantil(animada, 105)).
pelicula(billyYTed, infantil(carneYHueso, 120)).

puedoLlevarAMiHijo(Pelicula) :-
  pelicula(Pelicula, Genero),
  generoApto(Genero).

generoApto(cienciaFiccion(utopica)).

generoApto(accion(NivelDeViolencia)) :-
  NivelDeViolencia < 3.

generoApto(infantil(porComputadora, _)).
generoApto(infantil(animada, _)).
generoApto(infantil(carneYHueso, Duracion)) :-
  Duracion =< 90.

queHayEnElCine(Pelicula) :-
  pelicula(Pelicula, _).


%%%%%%

critica(dulceNoviembre, 5).
critica(dulceNoviembre, 4).
critica(laCasaDelLago, 4).
critica(replicas, 4).
critica(replicas, 2).
critica(replicas, 1).
critica(toyStory4, 5).
critica(toyStory4, 5).

premio(chicaMelosa, mejorActriz).
premio(chicoAtractivo, mejorActor).
premio(woody, mejorJuguete).

trabajaEn(dulceNoviembre, chicaMelosa).
trabajaEn(dulceNoviembre, chicoAtractivo).
trabajaEn(johnWick1, hombreRudo).
trabajaEn(johnWick2, hombreRudo).
trabajaEn(johnWick3, hombreRudo).
trabajaEn(toyStory4, woody).
trabajaEn(toyStory4, buzz).
trabajaEn(bobEsponjaUnHeroeAlRescate, bob).


%%    ∀x :  p(x) =>  q(x)
%%    ∀x : ~p(x)  v  q(x)
%% ~~(∀x : ~p(x)  v  q(x))
%%  ~(∃x : p(x)   ^ ~q(x))
 

% imperdible: todos los actores ganaron algún premio
imperdible(Pelicula) :-
  trabajaEn(Pelicula, _),
  forall(trabajaEn(Pelicula, Persona), premio(Persona, _)).


% aclamada: todas las críticas de la peli son 4 ó 5
aclamada(Pelicula) :-
  critica(Pelicula, _), 
  forall(critica(Pelicula, Estrellas), Estrellas >= 4).

aclamada2(Pelicula) :-
  critica(Pelicula, _),
  forall(critica(Pelicula, Estrellas), buenasEstrellas(Estrellas)).

buenasEstrellas(4).
buenasEstrellas(5).


% selectivo: todas las películas en las que actúa son imperdibles
selectivo(Persona) :-
  trabajaEn(_, Persona),
  forall(trabajaEn(Pelicula, Persona), imperdible2(Pelicula)).


% unánime: todas las críticas de la película son el mismo puntaje
unanime(Pelicula) :-
  critica(Pelicula, UnaCritica),
  forall(critica(Pelicula, OtraCritica), mismaCritica(UnaCritica, OtraCritica)).

mismaCritica(UnaCritica, UnaCritica).


% mejor crítica: la crítica más alta para una peli
mejorCriticaDeUnaPelicula(Pelicula, MejorCritica) :-
  critica(Pelicula, MejorCritica),
  forall(critica(Pelicula, OtraCritica), MejorCritica >= OtraCritica).
  













% imperdible(Pelicula) :-
%   pelicula(Pelicula, _),
%   forall(trabajaEn(Pelicula, Actor), premio(Actor, _)).

% aclamada(Pelicula) :-
%   pelicula(Pelicula, _),
%   forall(critica(Pelicula, Critica), esBuenaCritica(Critica)).

% esBuenaCritica(4).
% esBuenaCritica(5).

% selectivo(Actor) :-
%   trabajaEn(_, Actor),
%  forall(trabajaEn(Pelicula, Actor), aclamada(Pelicula)).

% unanime(Pelicula) :-
%   critica(Pelicula, UnaCritica),
%  forall(critica(Pelicula, OtraCritica), sonLaMisma(UnaCritica, OtraCritica)).

% sonLaMisma(Cosa, Cosa).