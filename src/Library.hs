module Library where
import PdePreludat

data Planeta = UnPlaneta { nombrePlaneta :: String, posicion :: Posicion, pasoDelTiempo :: (Number -> Number) } deriving Show

-- Este código hace que dos planetas sean iguales si su nombre y posicion son iguales
-- y que se puedan usar como parámetros de == y /= al hacer que Planeta sea parte de la Typeclass Eq
-- No es necesario tocarlo
instance Eq Planeta where
    unPlaneta == otroPlaneta =
        nombrePlaneta unPlaneta == nombrePlaneta otroPlaneta && posicion unPlaneta == posicion otroPlaneta

type Posicion = (Number, Number, Number)

