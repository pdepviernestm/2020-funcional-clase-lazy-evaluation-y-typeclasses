module Library where
import PdePreludat

data Hamburguesa = Hamburguesa {
    ingredientes :: [Ingrediente],
    valorInicial :: Number
} deriving(Show, Eq)

data Ingrediente = Carne | Pollo | Cheddar | Panceta | Pan | Curry  deriving (Show, Eq)

type Plata = Number

cuartoDeLibra :: Hamburguesa
cuartoDeLibra = Hamburguesa { ingredientes = [Pan, Carne, Cheddar, Pan], valorInicial = 20 }

precioIngrediente :: Ingrediente -> Plata
precioIngrediente Carne = 20
precioIngrediente Pan = 2
precioIngrediente Panceta = 10
precioIngrediente Cheddar = 10
precioIngrediente Pollo = 10
precioIngrediente Curry = 5

base :: Hamburguesa -> Ingrediente
base hamburguesa = head (filter esIngredienteBase (ingredientes hamburguesa))

esIngredienteBase :: Ingrediente -> Bool
esIngredienteBase ingrediente = elem ingrediente ingredientesBase

ingredientesBase :: [Ingrediente]
ingredientesBase = [Carne, Pollo]

precio :: Hamburguesa -> Plata
precio hamburguesa = valorInicial hamburguesa + sum (map precioIngrediente (ingredientes hamburguesa))

cambiarPrecio :: (Plata -> Plata) -> Hamburguesa -> Hamburguesa
cambiarPrecio cambio (Hamburguesa ingredientes valorInicial) = Hamburguesa ingredientes (cambio valorInicial)

agregarIngrediente :: Ingrediente -> Hamburguesa -> Hamburguesa
agregarIngrediente ingrediente (Hamburguesa ingredientes valorInicial) = Hamburguesa (ingrediente : ingredientes) valorInicial

agrandar :: Hamburguesa -> Hamburguesa
agrandar hamburguesa = agregarIngrediente (base hamburguesa) hamburguesa

descuento :: Number -> Hamburguesa -> Hamburguesa
descuento porcentaje =  cambiarPrecio (\precio -> precio - (precio * porcentaje / 100))

pdepBurger :: Hamburguesa
pdepBurger =
    (descuento 20 . agregarIngrediente Cheddar . agregarIngrediente Panceta . agrandar . agrandar) cuartoDeLibra

dobleCuarto = implementame

bigPdep = implementame

delDia = implementame

hacerVeggie  = implementame

cambiarPanDePati = implementame

dobleCuartoVegano = implementame
