viveEn(gusteaus, remy).
viveEn(malabar, emile).
viveEn(jeSuis, django).

cocina(linguini, ratatoulli, 3).
cocina(linguini, sopa, 5).
cocina(colette, salmonAsado, 9).
cocina(horst, ensaladaRusa, 8).

trabajaEn(gusteaus, linguini).
trabajaEn(gusteus, colette).
trabajaEn(gusteus, horst).
trabajaEn(cafeDes2Molins, amelie).

plato(ensaladaRusa, entrada([papa, zanahoria, arvejas, huevo, mayonesa])).
plato(bifeDeChorizo, principal(pure, 25)).
plato(frutillasConCrema, postre(265)).


% Punto 1

inspeccionSatisfactoria(Restaurante):-
    trabajaEn(Restaurante, _),
    not(viveEn(Restaurante, _)).


% Punto 2

chef(Chef, Restaurante):-
    trabajaEn(Restaurante, Chef),
    cocina(Chef, _, _).


% Punto 3

chefcito(Rata):-
    viveEn(Restaurante, Rata),
    trabajaEn(Restaurante, linguini).


% Punto 4

cocinaBien(Chef, Plato) :-
    cocina(Chef, Plato, Experiencia),
    Experiencia >= 7.

cocinaBien(remy, Plato) :-
    plato(Plato, _).


% Punto 5

encargadoDe(Encargado, Plato, Restaurante):-
    cocinaEn(Encargado, Plato, Restaurante, ExperienciaMaxima),
    forall(cocinaEn(_, Plato, Restaurante, ExperienciaChef), ExperienciaChef =< ExperienciaMaxima).

cocinaEn(Chef, Plato, Restaurante, Experiencia):-
    chef(Chef, Restaurante),
    cocina(Chef, Plato, Experiencia).


% Punto 6

saludable(Plato):-
    plato(Plato, Tipo),
    caloriasPara(Tipo, Calorias),
    Calorias < 75.

caloriasPara(entrada(Ingredientes), Calorias) :-
    length(Ingredientes, Cuantos),
    Calorias is Cuantos * 15.

caloriasPara(principal(Guarnicion, Minutos), Calorias) :-
    CaloriasCoccion is Minutos * 5,
    caloriasPara(Guarnicion, CaloriasGuarnicion),
    Calorias is CaloriasCoccion + CaloriasGuarnicion.

caloriasPara(pure, 20).
caloriasPara(papasfritas, 50).
caloriasPara(ensalada, 0).
caloriasPara(postre(Calorias), Calorias).


% Punto 7

criticaPositiva(Critico, Restaurante) :-
     inspeccionSatisfactoria(Restaurante),
     resenaPositiva(Critico, Restaurante).

resenaPositiva(antonEgo, Restaurante) :-
    especialistaEn(ratatouille, Restaurante).

especialistaEn(Plato, Restaurante):-
    forall(chef(Chef, Restaurante), cocinaBien(Chef, Plato)).

resenaPositiva(christophe, Restaurante):-
    findall(Chef, chef(Chef, Restaurante), Chefs),
    length(Chefs, Cuantos),
    Cuantos > 3.

resenaPositiva(cormillot, Restaurante):-
    todosPlatosSaludables(Restaurante),
    todasEntradasTienenZanahorias(Restaurante).

todosPlatosSaludables(Restaurante) :-
    forall(cocinaEn(_, Plato, Restaurante, _), saludable(Plato)).

todasEntradasTienenZanahorias(Restaurante) :-
    forall(entradasDe(Restaurante, Ingredientes), tieneZanahoria(Ingredientes)).

entradaDe(Restaurante, Ingredientes):-
    plato(Plato, entrada(Ingredientes)),
    cocinaEn(_, Plato, Restaurante, _).

tieneZanahoria(Ingredientes):-
    member(zanahoria, Ingredientes).

