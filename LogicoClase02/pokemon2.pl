%% Esto es lo único que cambiamos respecto a la clase anterior.
%% Ahora mismaFamilia/2 funciona simétricamente.

% mismaFamilia/2
%   Evoluciona directamente en él, o
%   evoluciona en un pokemon que evoluciona en él
mismaFamilia(UnPokemon, OtroPokemon) :-
  lineaSucesoria(UnPokemon, OtroPokemon).

mismaFamilia(UnPokemon, OtroPokemon) :-
  lineaSucesoria(OtroPokemon, UnPokemon).

lineaSucesoria(UnPokemon, OtroPokemon) :-
  evolucion(UnPokemon, _, OtroPokemon).

lineaSucesoria(UnPokemon, OtroPokemon) :-
  evolucion(UnPokemon, _, PokemonIntermedio),
  evolucion(PokemonIntermedio, _, OtroPokemon).
