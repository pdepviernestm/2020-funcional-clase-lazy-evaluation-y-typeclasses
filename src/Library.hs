module Library where
import PdePreludat

-- unos == [1,1,1,1,1,1,1,1,1,1,1...]
unos :: [Number]
unos = 1 : unos

-- naturales == [1,2,3,4,5,6,7,8,9...]
naturales :: [Number]
naturales = 1 : map (+1) naturales

potenciasDe n = 1 : map (*n) (potenciasDe n)

potenciar base exponente = potenciasDe base !! exponente

-- chasquidoDeThanos ["Capitan America", "Bucky", "Ironman", "Spiderman"] ==
--    ["Capitan America", "Ironman"]
chasquidoDeThanos :: [a] -> [a]
chasquidoDeThanos [] = []
chasquidoDeThanos [unico] = [unico]
chasquidoDeThanos (primero : segundo : resto) = primero : chasquidoDeThanos resto

-- impares == [1,3,5,7,9...]
impares :: [Number]
impares = chasquidoDeThanos naturales
--impares = filter odd naturales
--impares = [1,3..]

-- pares == [2,4,6,8,10,12...]
pares :: [Number]
pares = (chasquidoDeThanos . tail) naturales
--pares = [2,4..]
--pares = filter even naturales

-- repetir 1 == [1,1,1,1,1,1,1,1,1...]
-- repetir "hola" == ["hola", "hola", "hola"...]
repetir :: a -> [a]
repetir elemento = elemento : repetir elemento

-- replicar 5 "hola" = ["hola","hola","hola","hola","hola"]
replicar :: Number -> a -> [a]
replicar veces elemento = (take veces . repetir) elemento

-- Que pasa si evaluo...?

-- fst (10, head [])

-- snd (10, head [])

-- filter even pares

-- head (filter even pares)

-- filter even impares

-- head (filter even impares)

-- [1, 2, 3, 4, 5, 6] !! 10

-- [even, odd, even, odd] !! 10

-- const 10 (1/0)

-- foldr const 0 [1..]

-- foldl const 0 [1..]

-- Por que?

-- foldr _ semilla [] = semilla
-- foldr f semilla (x:xs) = f x (foldr f semilla xs)

-- foldr const 0 [1..]
-- const 1 (foldr const 0 xs)
-- 1

-- En cambio con foldl:

-- foldl _ semilla [] = semilla
-- foldl f semilla (x:xs) = foldl f (f semilla x) xs

-- foldl const 0 [1..]
-- foldl const (const 0 1) [2..]
-- foldl const (const (const 0 1) 2) [3..]
-- foldl const (const (const (const 0 1) 2) 3) [4..]

-- Que hace ghci para imprimir por pantalla?

-- print = putStrLn . show

-- Entonces, [1, 2, 3, 4, 5, 6] !! 10 se convierte en
-- print ([1, 2, 3, 4, 5, 6] !! 10)
-- (putStrLn . show) ([1, 2, 3, 4, 5, 6] !! 10)

-- Y [even, odd, even, odd] !! 10 en
-- print ([even, odd, even, odd] !! 10)
-- (putStrLn . show) ([even, odd, even, odd] !! 10)

-- instance Show (a -> b) where
--    show _ = "<una función>"

