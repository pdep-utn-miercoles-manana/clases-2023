{- 

data Estudiante = Estudiante String Int String

nombre :: Estudiante -> String
nombre (Estudiante unNombre _ _) = unNombre

edad :: Estudiante -> Int
edad (Estudiante _ unaEdad _) = unaEdad

legajo :: Estudiante -> String
legajo (Estudiante _ _ unLegajo) = unLegajo

-}


-- Escrito con record syntax ya te crea las funciones sin necesidad de definirlas

data Estudiante = Estudiante { 
    nombre :: String, 
    edad   :: Int, 
    legajo :: String
} deriving (Show)

-- Si se usa la notación de Record igualmente se puede escribir un estudiante de
-- cualquiera de las siguientes dos maneras

marcelo :: Estudiante
marcelo = Estudiante "Marcelo" 21 "170.141-2"

aylen :: Estudiante
aylen = Estudiante { 
    nombre = "Aylen",
    edad   =  21, 
    legajo = "170.140-1"
}

cumplirAnios :: Estudiante -> Estudiante
cumplirAnios (Estudiante unNombre unaEdad unLegajo) = Estudiante unNombre (unaEdad + 1) unLegajo


type Profesor = (String, Int, String) -- Esto es un alias de tipo, no crea un tipo de dato

fede :: Profesor
fede = ("fede", 73725, "pdep")

fst3 (x, _, _) = x
snd3 (_, y, _) = y
trd3 (_, _, z) = z

nombreProfesor :: Profesor -> String
nombreProfesor = fst3

idProfesor :: Profesor -> Int
idProfesor = snd3

materiaProfesor :: Profesor -> String
materiaProfesor = trd3


-- Podemos definir datas usando multiples constructores a modo de "enum" tipo C

data DiaDeLaSemana = Lunes | Martes | Miercoles | Jueves | Viernes | Sabado | Domingo deriving (Show)

esSabadoDeFlojera Sabado    = True
esSabadoDeFlojera Miercoles = True
esSabadoDeFlojera _         = False

-- O también podemos tener datas con multiples constructores pero que tengan parámetros

data Uteniano = Alumno String Int String
              | Docente String Int String
              | Graduado String Float
              | NoDocente

{-

O usando la notación Record que además te crea las funciones

data Uteniano 
    = Alumno {
        nombre :: String,
        edad :: Int,
        legajo :: String
    } 
    | Docente {
        nombre :: String,
        id :: Int,
        materia :: String
    } 
    | Graduado {
        nombre :: String,
        promedio :: Float
    } 
    | NoDocente
    deriving (Show)

-}