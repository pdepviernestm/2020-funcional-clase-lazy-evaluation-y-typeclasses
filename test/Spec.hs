import PdePreludat
import Library
import Test.Hspec
import           Control.Monad (unless)
import Control.Exception (evaluate)

main :: IO ()
main = hspec $ do
  suiteDeTestsDePartes1y2
  suiteDeTestsDeParte3
  --suiteDeTestsDeParte4 -- descomenta esto solo si vas a hacer el punto bonus

suiteDeTestsDePartes1y2 = describe "Animales, alimentos y entrenamientos" $ do
  let tigre = Animal 5 Terrestre 120
  let lechuza = Animal 40 Volador 10
  let tiburon = Animal 100 Acuatico 100
  describe "los de un tipo" $ do
    it "retorna los animales de un mismo tipo" $ do
      losDeTipo Volador [tigre, lechuza, tiburon] `shouldBe` [lechuza]
      losDeTipo Terrestre [tigre, lechuza, tiburon] `shouldBe` [tigre]
      losDeTipo Volador [tigre, tiburon] `shouldBe` ([] :: [Animal])

  describe "animalesHambrientos" $ do
    it "dada una lista vacia retorna una lista vacia" $ do
      animalesHambrientos [] `shouldBe` ([] :: [Animal])
    it "dada una lista sin animales hambrientos (la energia de todos es mayor o igual a 10) devuelve una lista vacia" $ do
      animalesHambrientos [Animal 10 Terrestre 10, Animal 20 Volador 10] `shouldBe` ([] :: [Animal])
    it "dada una lista con animales devuelve una lista con aquellos que esten hambrientos (su energia es menor a 10)" $ do
      animalesHambrientos [Animal 5 Terrestre 10, Animal 10 Terrestre 5] `shouldBe` [Animal 5 Terrestre 10]


  describe "alimentos" $ do
    it "consumir una baya  aumenta en 5 la energia y el peso en 0.1" $ do
      escribime
    it "consumir carne aumenta en 20 la energia y el peso en 2" $ do
      escribime
   
    describe "alimentarATodos" $ do
      it "alimentarATodos con un alimento aumenta la energia y el peso de todos los animales segun el alimento" $ do
        escribime

  describe "entrenar" $ do
    it "un animal acuatico no hace nada" $ do
      entrenar tiburon `shouldBe` tiburon
    it "un animal terrestre disminuye el peso y la energia en 5" $ do
      entrenar tigre `shouldBe` (Animal 0 Terrestre 115)
    it "un animal volador disminuye el peso en 3" $ do
      entrenar lechuza `shouldBe` (Animal 40 Volador 7)

  describe "aplicar itinerario" $ do
    it "dado un itinerario vacio el animal sigue igual" $ do
      aplicarItinerario [] tigre `shouldBe` tigre
    it "dado un itinerario con entrenamientos y alimentos los aplica a todos" $ do
      escribime

suiteDeTestsDeParte3 = describe "Orden Superior" $ do
  let numeroAString :: Number -> String
      numeroAString = show

  describe "mapTupla" $ do
    it "aplica la funcion que le paso a ambos elementos de una tupla" $ do
      mapTupla (\n -> n * 2) (1, 3) `shouldBe` (2, 6)
      mapTupla length ("hola", "mundo") `shouldBe` (4, 5)

  describe "menorSegun" $ do
    it "si el primer elemento es mayor segun el criterio que paso me da el segundo" $ do
      menorSegun length "hola" "ola" `shouldBe` "ola"
      menorSegun abs (-2) 1 `shouldBe` 1
    it "si el primer elemento es menor segun el criterio que paso me da el primero" $ do
      menorSegun length "ola" "hola" `shouldBe` "ola"
      menorSegun numeroAString 100 20 `shouldBe` 100
    it "si ambos elementos son iguales segun el criterio, me da el primero" $ do
      menorSegun length "hola" "chau" `shouldBe` "hola"
      menorSegun abs (-1) 1 `shouldBe` (-1)
    
  describe "minimoSegun" $ do
    it "si se pasa una lista vacia, falla" $ do
      shouldThrowError (minimoSegun length [])
    it "me da el menor elemento segun el criterio que pase" $ do
      minimoSegun length ["hola", "ornitorrinco", "a"] `shouldBe` "a"
      minimoSegun numeroAString [3, 100, 20] `shouldBe` 100

  describe "aplicarVeces" $ do
    it "aplicar 0 veces me devuelve lo mismo que le pase" $ do
      aplicarVeces 0 (\texto -> texto ++ "!") "hola" `shouldBe` "hola"
      aplicarVeces 0 (\numero -> numero * 2) 1 `shouldBe` 1
    it "aplicar varias veces me devuelve lo que le pase, luego de haber sido aplicado a la funcion la cantidad de veces que se paso" $ do
      aplicarVeces 3 (\texto -> texto ++ "!") "hola" `shouldBe` "hola!!!"
      aplicarVeces 3 (\numero -> numero * 2) 1 `shouldBe` 8

  describe "replicar" $ do
    it "dado 0, devuelve una lista vacia" $ do
      replicar 0 "hola" `shouldBe` ([] :: [String])
    it "dado un numero y un valor, devuelve una lista con ese valor tantas veces como el numero" $ do
      replicar 3 "hola" `shouldBe` ["hola", "hola", "hola"]
      replicar 5 1 `shouldBe` [1, 1, 1, 1, 1]

suiteDeTestsDeParte4 = describe "combinando funciones" $ do
  describe "|>" $ do
    it "dado un valor y una funcion, pasa el valor como parametro de la funcion" $ do
      "hola" |> length `shouldBe` 4
      3 |> (\n -> n + 2) `shouldBe` 5

  describe "esVocal" $ do
    it "dada una letra vocal da True" $ do
      esVocal 'a' `shouldBe` True
      esVocal 'E' `shouldBe` True
    it "dada una letra consontante da False" $ do
      esVocal 'c' `shouldBe` False
      esVocal 'B' `shouldBe` False
    it "dado un caracter que no es una letra da False" $ do
      esVocal ' ' `shouldBe` False
      esVocal '@' `shouldBe` False

  describe "primeraLinea" $ do
    it "dado un texto sin saltos de linea, devuelve el mismo texto" $ do
      primeraLinea "hola mundo!" `shouldBe` "hola mundo!"
    it "dado un texto con saltos de linea, devuelve el mismo hasta antes del primer salto de linea" $ do
      primeraLinea "hola\nmundo!" `shouldBe` "hola"

  describe "lasVocales" $ do
    it "dado un texto vacio, devuelve un string vacio" $ do
      lasVocales "" `shouldBe` ""
    it "dado un texto sin vocales, devuelve un string vacio" $ do
      lasVocales "why" `shouldBe` ""
    it "dado un texto con vocales, devuelve un string con solo las vocales" $ do
      lasVocales "chau" `shouldBe` "au"
      lasVocales "azarath metrion zinthos" `shouldBe` "aaaeioio"

  describe "contarVocalesDeLaPrimerLinea" $ do
    it "dado un texto vacio, da 0" $ do
      contarVocalesDeLaPrimeraLinea "" `shouldBe` 0
    it "dado un texto sin saltos de linea, da la cantidad de vocales en ese texto" $ do
      contarVocalesDeLaPrimeraLinea "hello world" `shouldBe` 3
    it "dado un texto sin saltos de linea, da la cantiad de vocales hasta el primer salto de linea" $ do
      contarVocalesDeLaPrimeraLinea "Aeea,\n yo soy sabalero" `shouldBe` 4

escribime :: Expectation
escribime = implementame

shouldThrowError expression = evaluate expression `shouldThrow` anyException
