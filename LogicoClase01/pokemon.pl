%% Base de conocimiento

pokemon(bulbasaur, hierba).
pokemon(ivysaur, hierba).
pokemon(venusaur, hierba).
pokemon(squirtle, agua).
pokemon(wartortle, agua).
pokemon(blastoise, agua).
pokemon(charmander, fuego).
pokemon(charmeleon, fuego).
pokemon(charizard, fuego).
pokemon(mew, psiquico).
pokemon(mewtwo, psiquico).
pokemon(pikachu, electrico).

legendario(mew).
legendario(mewtwo).

superEfectivo(agua, fuego).
superEfectivo(fuego, hierba).
superEfectivo(hierba, agua).

%% Ganar en batalla:
%% Un pokemon le gana a otro si su tipo es súper efectivo contra el otro.

%% si el tipo del primero es super efectivo contra el otro => ganaEnBatalla
%% ganaEnBatalla <= el tipo del primero es super efectivo contra el otro
ganaEnBatalla(PokemonGanador, OtroPokemon) :-
  pokemon(PokemonGanador, TipoGanador),
  pokemon(OtroPokemon, TipoPerdedor),
  superEfectivo(TipoGanador, TipoPerdedor).

% También puede ganar en batalla si es legendario.
ganaEnBatalla(PokemonLegendario, _) :-
  legendario(PokemonLegendario).

% evolucion/3
% Que pokemon, en qué nivel, evoluciona en cuál
evolucion(bulbasaur, 16, ivysaur).
evolucion(ivysaur, 32, venusaur).
evolucion(charmander, 16, charmeleon).
evolucion(charmeleon, 36, charizard).
evolucion(squirtle, 16, wartortle).
evolucion(wartortle, 36, blastoise).
evolucion(pikachu, piedraTrueno, raichu).

%% evolucionaRapido/1: 
%% evoluciona rápido si evoluciona antes del nivel 20.

evolucionaRapido(Pokemon) :-
  evolucion(Pokemon, Nivel, _),
  Nivel < 20.

% mismaFamilia/2
%   Evoluciona directamente en él, o
%   evoluciona en un pokemon que evoluciona en él

mismaFamilia(UnPokemon, OtroPokemon) :-
  evolucion(UnPokemon, _, OtroPokemon).

mismaFamilia(UnPokemon, OtroPokemon) :-
  evolucion(UnPokemon, _, PokemonIntermedio),
  evolucion(PokemonIntermedio, _, OtroPokemon).

mismaFamilia(UnPokemon, OtroPokemon) :-
  mismaFamilia(OtroPokemon, UnPokemon).

%% equipo/2: entrenador, pokemon.
equipo(ash, pikachu).
equipo(ash, charizard).

%% puedeCapturar/2:
%% Un entrenador puede capturar a un pokemon si tiene en su equipo
%% alguno que le gane en batalla.
%% Y ese pokemon a capturar no es pikachu.
%% ganaEnBatalla(UnPokemon, OtroPokemon).

puedeCapturar(Entrenador, PokemonSalvaje) :-
  equipo(Entrenador, PokemonCompi),
  ganaEnBatalla(PokemonCompi, PokemonSalvaje),
  PokemonSalvaje \= pikachu.



