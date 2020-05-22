module Library where
import PdePreludat

data Hamburguesa = Hamburguesa {
    ingredientes :: [Ingrediente],
    valorInicial :: Number
} deriving(Show, Eq)

data Ingrediente = Carne | Pollo | Cheddar | Panceta |Pan | Curry  deriving(Show, Eq)

cuartoDeLibra = Hamburguesa {ingredientes= [Pan, Carne, Cheddar, Pan], valorInicial = 20}

precioIngrediente Carne = 20
precioIngrediente Pan = 2
precioIngrediente Panceta = 10
precioIngrediente Cheddar = 10
precioIngrediente Pollo = 10
precioIngrediente Curry = 5

esIngredienteBase Carne = True
esIngredienteBase Pollo = True
esIngredienteBase _ = False

agregarIngrediente ingrediente (Hamburguesa ingredientes valorInicial ) = Hamburguesa{ingredientes = ingrediente : ingredientes, valorInicial =valorInicial}  
cambiarPrecio cambio (Hamburguesa ingredientes valorInicial) = Hamburguesa ingredientes (cambio valorInicial)
agrandar hamburguesa = agregarIngrediente (filter esIngredienteBase (ingredientes hamburguesa) !! 0) hamburguesa
descuento porcentaje hamburguesa =  cambiarPrecio (*(1 - porcentaje / 100)) hamburguesa


precio hamburguesa = valorInicial hamburguesa + sum (map precioIngrediente (ingredientes hamburguesa))

pdepBurger = descuento  20 (agregarIngrediente Panceta (agregarIngrediente Cheddar ( agrandar (agrandar cuartoDeLibra))))

dobleCuarto = implementame
bigPdep = implementame
delDia = implementame

hacerVeggie  = implementame
cambiarPanDePati = implementame
dobleCuartoVegano = implementame