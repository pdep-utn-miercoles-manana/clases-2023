tarea(basico,buscar(libro,jartum)).
tarea(basico,buscar(arbol,patras)).
tarea(basico,buscar(roca,telaviv)).
tarea(intermedio,buscar(arbol,sofia)).
tarea(intermedio,buscar(arbol,bucarest)).
tarea(avanzado,buscar(perro,bari)).
tarea(avanzado,buscar(flor,belgrado)).

nivelActual(pepe,basico).
nivelActual(lucy,intermedio).
nivelActual(juancho,avanzado).

idioma(alejandria,arabe).
idioma(jartum,arabe).
idioma(patras,griego).
idioma(telaviv,hebreo).
idioma(sofia,bulgaro).
idioma(bari,italiano).
idioma(bucarest,rumano).
idioma(belgrado,serbio).

habla(pepe,bulgaro).
habla(pepe,griego).
habla(pepe,italiano).
habla(juancho,arabe).
habla(juancho,griego).
habla(juancho,hebreo).
habla(lucy,griego).

% destinoPosible/2 relaciona personas con ciudades;
% una ciudad es destino posible para un nivel si
% alguna tarea que tiene que hacer la persona
% (dado su nivel) se lleva a cabo en la ciudad.
% P.ej. los destinos para Pepe son: Jartum, Patras y Tel Aviv.

destinoPosible(Persona, Ciudad) :-
  nivelActual(Persona, Nivel),
  tarea(Nivel, buscar(_, Ciudad)).

% excelenteCompaniero/2, que relaciona dos participantes.
% P2 es un excelente compañero para P1 si habla los idiomas
% de todos los destinos posibles del nivel donde está P1.
% P.ej. Juancho es un excelente compañero para Pepe, porque
% habla todos los idiomas de los destinos posibles para el
% nivel de Pepe.

excelenteCompaniero(Companiero, OtroCompaniero) :-
  nivelActual(Companiero, _),
  nivelActual(OtroCompaniero, _),
  Companiero \= OtroCompaniero,
  forall( destinoPosible(Companiero, Destino),
          hablaIdiomaDelDestino(OtroCompaniero, Destino)).

hablaIdiomaDelDestino(Persona, Destino) :-
  idioma(Destino, Idioma),
  habla(Persona, Idioma).

