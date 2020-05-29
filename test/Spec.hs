import PdePreludat
import Library
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "Interestelar" $ do
    let tierra = UnPlaneta "Tierra" (0, 0, 0) id
        marte = UnPlaneta "Marte" (4, 3, 0) (*2)
    describe "distancia" $ do
      it "entre un planeta y si mismo es 0" $ do
        escribime
      it "dados dos planetas es la distancia entre sus posiciones en el espacio" $ do
        escribime
    describe "tiempo de viaje" $ do
      it "entre un planeta y si mismo es 0 sin importar la velocidad de viaje" $ do
        escribime
      it "es la distancia entre dos planetas dividido la velocidad de viaje" $ do
        escribime
    describe "pasar tiempo" $ do
      context "en un planeta donde el tiempo pasa al igual que en la tierra" $ do
        it "envejece a un astronauta tantos anios como paso ahi" $ do
          escribime
      context "en un planeta donde el tiempo pasa diferente a la tierra" $ do 
        it "envejece a un astronauta tantos anios como el tiempo que paso en el planeta afectado por como funciona el paso del tiempo ahí" $ do
          escribime
    describe "viajar" $ do
      context "en una nave vieja" $ do
        context "con 6 o mas tanques de oxígeno" $ do
          it "transporta al astronauta al otro planeta a una velocidad de 10" $ do
            escribime
        context "con menos de 6 tanques de oxígeno" $ do
          it "transporta al astronauta al otro planeta a una velocidad de 5" $ do
            escribime
    describe "nave futurista" $ do
      it "transporta al astronauta al otro planeta instantaneamente" $ do
        escribime
    describe "rescatar astronauta" $ do
      it "dado unos rescatistas con una nave y un astronauta a rescatar, me da los rescatistas junto con el rescatado luego de haber viajado al planeta del rescatado y viajado de nuevo al de los rescatistas" $ do
        escribime
    describe "astronautas rescatables" $ do
      it "dado un grupo de rescatistas y un grupo de astronautas varados, me da aquellos que al rescatarlos en el equipo que vuelve no hay nadie de mas de 90 años" $ do
        escribime
    
escribime :: Expectation
escribime = implementame


