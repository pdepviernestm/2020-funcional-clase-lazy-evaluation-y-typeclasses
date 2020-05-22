import PdePreludat
import Library
import Test.Hspec
import           Control.Monad (unless)
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
  describe "parte 1 funciones basicas de agregados" $ do
    describe "agregar ingrediente" $ do
      it "retorna la hamburguesa con el ingrediente agregado" $ do
        agregarIngrediente cuartoDeLibra Panceta `shouldBe` Hamburguesa {ingredientes = [Panceta,Pan,Carne,Cheddar,Pan], valorInicial = 20.0}
    describe "agrandar" $ do
      it "retorna la hamburguesa con el ingrediente base duplicado" $ do
        agrandar cuartoDeLibra `shouldBe` Hamburguesa {ingredientes = [Carne,Pan,Carne,Cheddar,Pan], valorInicial = 20.0}
    describe "descuento" $ do
      it "retorna la hamburguesa con el descuento aplicado" $ do
        valorInicial (descuento 20 cuartoDeLibra) `shouldBe` 16
    describe "el precio de la pdepBurguer" $ do
      it "es correcto" $ do
        precio pdepBurger `shouldBe` 110
  describe "parte 2 algunas hamburguesas" $ do
    describe "el precio del doble cuarto" $ do
      it "es correcto" $ do
        precio dobleCuarto `shouldBe` 84
    describe "el precio de la bigPdep" $ do
      it "es correcto" $ do
        precio bigPdep `shouldBe` 89
    describe "el precio del día del dobleCuarto" $ do
      it "es correcto" $ do
        precio (delDia dobleCuarto) `shouldBe` 88
  describe "parte 3 algunas modificaciones más" $ do
    describe "el precio del dobleCuarto vegano y con pan integral " $ do
      it "es correcto" $ do
        precio ( dobleCuartoVegano) `shouldBe` 66
  
shouldThrowError expression = evaluate expression `shouldThrow` anyException
