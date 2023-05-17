--------------
-- Punto 01 --
--------------

data Heroe = Heroe {
    epiteto        :: String,
    reconocimiento :: Int,
    artefactos     :: [Artefacto],
    tareas         :: [Tarea]
}

data Artefacto = Artefacto {
    nombre :: String,
    rareza :: Int
}

type Tarea = Heroe -> Heroe

--------------
-- Punto 02 --
--------------

pasarALaHistoria :: Heroe -> Heroe
pasarALaHistoria unHeroe
    | reconocimiento unHeroe > 1000 = cambiarEpiteto "El mítico" unHeroe
    | reconocimiento unHeroe >= 500 = cambiarEpiteto "El magnífico" . agregarArtefacto lanzaDelOlimpo $ unHeroe
    | reconocimiento unHeroe >  100 = cambiarEpiteto "Hoplita" . agregarArtefacto xiphos $ unHeroe
    | otherwise                     = unHeroe

cambiarEpiteto :: String -> Heroe -> Heroe
cambiarEpiteto epiteto unHeroe = 
    unHeroe { epiteto = epiteto }

agregarArtefacto :: Artefacto -> Heroe -> Heroe
agregarArtefacto artefacto = mapArtefactosHeroe (artefacto :)
--    unHeroe { artefactos = artefacto : artefactos unHeroe }

lanzaDelOlimpo :: Artefacto
lanzaDelOlimpo = Artefacto "Lanza del Olimpo" 100

xiphos :: Artefacto
xiphos = Artefacto "Xiphos" 50

--------------
-- Punto 03 --
--------------

encontrarArtefacto :: Artefacto -> Tarea
encontrarArtefacto artefacto = 
    ganarReconocimiento (rareza artefacto) . agregarArtefacto artefacto

ganarReconocimiento :: Int -> Heroe -> Heroe
ganarReconocimiento unReconocimiento unHeroe =
    unHeroe { reconocimiento = reconocimiento unHeroe + unReconocimiento }

escalarElOlimpo :: Tarea
escalarElOlimpo = 
    agregarArtefacto relampagoDeZeus . desecharArtefactosComunes . triplicarRarezas . ganarReconocimiento 500

triplicarRarezas :: Heroe -> Heroe
triplicarRarezas = mapArtefactosHeroe (map triplicarRareza)
--    unHeroe { artefactos = map triplicarRareza (artefactos unHeroe) }

triplicarRareza :: Artefacto -> Artefacto
triplicarRareza unArtefacto = 
    unArtefacto { rareza = rareza unArtefacto * 3 }

desecharArtefactosComunes :: Heroe -> Heroe
desecharArtefactosComunes = mapArtefactosHeroe (filter ((>= 1000) . rareza))
--    unHeroe { artefactos = filter ((>= 1000) . rareza) (artefactos unHeroe) }

relampagoDeZeus :: Artefacto
relampagoDeZeus = Artefacto "Relámpago de Zeus" 500

mapArtefactosHeroe :: ([Artefacto] -> [Artefacto]) -> Heroe -> Heroe
mapArtefactosHeroe funcion unHeroe = 
    unHeroe { artefactos = funcion (artefactos unHeroe) }

type CantidadCuadras = Int

ayudarACruzarLaCalle :: CantidadCuadras -> Tarea
ayudarACruzarLaCalle cantidadCuadras =
    cambiarEpiteto ("Gros" ++ replicate cantidadCuadras 'o')

-- NO A LA PROGRAMACIÓN DEFENSIVA

matarALaBestia :: Bestia -> Tarea
matarALaBestia unaBestia unHeroe
    | debilidad unaBestia unHeroe = cambiarEpiteto ("El asesino de " ++ nombreBestia unaBestia) unHeroe
    | otherwise                   = mapArtefactosHeroe (drop 1) . cambiarEpiteto "El cobarde" $ unHeroe

type Debilidad = Heroe -> Bool

data Bestia = Bestia {
    nombreBestia :: String,
    debilidad    :: Debilidad
}

--------------
-- Punto 04 --
--------------

heracles :: Heroe
heracles = Heroe "El guardián del Olimpo" 700 [relampagoDeZeus, pistolaRara] [matarAlLeonDeNemea]

pistolaRara :: Artefacto
pistolaRara = Artefacto "Pistola" 1000

--------------
-- Punto 05 --
--------------

leonDeNemea :: Bestia
leonDeNemea = Bestia "León de Nemea" ((>= 20) . length . epiteto)

matarAlLeonDeNemea :: Tarea
matarAlLeonDeNemea = matarALaBestia leonDeNemea

--------------
-- Punto 06 --
--------------

hacer :: Tarea -> Heroe -> Heroe
hacer unaTarea unHeroe = 
    (unaTarea unHeroe) { tareas = unaTarea : tareas unHeroe }

--------------
-- Punto 07 --
--------------

presumir :: Heroe -> Heroe -> (Heroe, Heroe)
presumir heroe1 heroe2
    | leGana heroe1 heroe2 = (heroe1, heroe2)
    | leGana heroe2 heroe1 = (heroe2, heroe1)
    | otherwise = presumir (realizarTareas (tareas heroe2) heroe1) (realizarTareas (tareas heroe1) heroe2)

sumatoriaRarezasArtefactos :: Heroe -> Int
sumatoriaRarezasArtefactos = sum . map rareza . artefactos

realizarTareas :: [Tarea] -> Heroe -> Heroe
realizarTareas tareas unHeroe = foldl (flip hacer) unHeroe tareas

leGana :: Heroe -> Heroe -> Bool
leGana heroe1 heroe2 = 
    (reconocimiento heroe1 >  reconocimiento heroe2) || 
    (reconocimiento heroe1 == reconocimiento heroe2  && 
     sumatoriaRarezasArtefactos heroe1 > sumatoriaRarezasArtefactos heroe2)

--------------
-- Punto 08 --
--------------
 
 --Loopea

--------------
-- Punto 09 --
--------------

realizarLabor :: [Tarea] -> Heroe -> Heroe
realizarLabor = realizarTareas

--------------
-- Punto 10 --
--------------

-- Loopea
