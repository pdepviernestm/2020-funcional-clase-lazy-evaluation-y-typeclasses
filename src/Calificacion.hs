module Calificacion where
import PdePreludat

data NotaConceptual = Insuficiente | Regular | Aprobado | Sobresaliente deriving (Show, Eq, Ord)

type Examen = String

data Persona = Persona {
  nombre :: String,
  rendir :: Examen -> Number,
  edad :: Number,
  notas :: [Number]
}

instance Ord Persona where
  unaPersona <= otraPersona = edad unaPersona <= edad otraPersona

instance Eq Persona where
  unaPersona == otraPersona = nombre unaPersona == nombre otraPersona

instance Show Persona where
  show persona = nombre persona

mayor :: [Persona] -> Persona
mayor = foldl1 personaMayor 

personaMayor:: Persona -> Persona -> Persona
personaMayor p1 p2 | p1 >= p2 = p1
                   | otherwise = p2

class Calificacion a where  
  aprobo :: a -> Bool
  promociono:: a -> Bool

instance Calificacion Number where  
  aprobo = (>=6)
  promociono = (>=8)

instance Calificacion NotaConceptual where  
  aprobo = implementame
  promociono = implementame

vaAFinal :: Persona -> Bool
vaAFinal persona = all aprobo (notas persona) &&
  any (not.promociono) (notas persona)
