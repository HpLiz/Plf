-- 1. Obtener el promedio de 3 números
average3Numbers :: (Floating a) => a -> a -> a -> a
average3Numbers x y z = (x+y+z)/3 
-- Utilizando los tres parametros recibidos se suman y dividen

-- 2. Determinar si el último dígito de un número es 3
isLastDigit3 :: (Integral a)=> a -> Bool
isLastDigit3 n = (mod n 10) == 3
-- Se obtiene el residuo de n entre 10 (pues es la parte de unidad) despues se compara con 3 

-- 3. Determinar si un número tiene 3 digitos
has3Digits :: (Integral a)=> a -> Bool
has3Digits  n
 | n > 99 && n < 1000 = True
 | otherwise = False
--Cualquier número entre 100 y 999 tiene tres digitos

-- 4. Determinar si un número es negativo
isNegative :: Int -> Bool
isNegative x = x < 0
--Compara si el número recibido es menor a 0

-- 5. Sumar los digitos de un número 
sum2Digits :: (Integral a) => a -> a
sum2Digits n
 | n < 10 || n > 99 = error "El número no tiene dos digitos"
 | otherwise = x + y
 where x = div n 10
       y = mod n 10
--Utiliza div para obtener el primer digito y mod para el segundo ya que es el resto de dividir entre 10

-- 6. Determinar si los digitos de un número son pares
even2Digits :: (Integral a) => a -> Bool
even2Digits n
 | n < 10 || n > 99 = error "El número no tiene dos digitos"
 | even x && even y = True
 | otherwise = False
 where x = div n 10
       y = mod n 10
--Basandome en la función anterior, pero utilicé even para determinar si son pares

-- 7. Determinar si un número pertenece a los 8 primeros números primos
isPrimeNumber :: (Integral a) => a -> Bool
isPrimeNumber x
 | elem x xs = True
 | otherwise = False
 where xs = [1,2,3,5,7,9,11,13]
--Utilicé una variable auxiliar que contiene los primeros 8 números primos

-- 8. Determinar si un número pertenece a los 8 primeros números primos y si es par
isEvenPrimeNumber :: (Integral a) => a -> Bool
isEvenPrimeNumber x
 | elem x xs && even x = True
 | otherwise = False
 where xs = [1,2,3,5,7,9,11,13]
-- Parecido al anterior pero incluí even para saber si es par

-- 9. Determinar si el número x es multiplo de y
isMultiple :: (Integral a) => a -> a -> Bool
isMultiple x y = (mod x y) == 0
--Utilice mod con los dos parametros recibidos para comparar el residuo

-- 10. Determinar si los dos digitos de un número son iguales
isEqual2Digits :: (Integral a) => a -> Bool
isEqual2Digits n
 | n < 10 || n > 99 = error "El número no tiene dos digitos"
 | x == y = True
 | otherwise = False
 where x = div n 10
       y = mod n 10
{-Utilicé div para obtener la parte entera (docena) del número y mod para la unidad que es
el segundo digito y después comparé ambos digitos-}

-- 11. Determinar el número mayor de tres números
higher :: (Integral a) => a -> a -> a -> a
higher x y z = max (max x y) z
{-Mediante max selecciona el mayor de los primeros dos números y despues lo compara con el
ultimo número-}

-- 12. Determinar si la suma de dos números origina un número par
isEvenSum2Number :: (Integral a) => a -> a -> Bool
isEvenSum2Number x y = even (x+y)
--Utiliza even despues de sumar los dos números

-- 13. Sumar todos los digitos de dos número
sum2Digit2Number :: (Integral a) => a -> a -> a
sum2Digit2Number x y
 | (x > 9 && x < 100) && (y > 9 && y < 100) = x1 + x2 + y1 + y2 
 | otherwise = error "Algun número no tiene dos digitos"
 where x1 = div x 10
       x2 = mod x 10
       y1 = div y 10
       y2 = mod y 10
{-Utilizando div obtuve el primer digito de cada número y con mod el segundo digito después sumé todos,
así mismo comparé en intervalos de >9 <100 para verificar que tuvieran dos digitos-}

-- 14. Sumar los digitos de un número
sum3Digits :: (Integral a) => a -> a
sum3Digits n
 | n < 100 || n > 999 = error "El número no tiene tres digitos"
 | otherwise = x + y + z
 where x = div n 100
       y = div (n-x*100) 10
       z = mod n 10
{-Utiliza div para obtener el primer núero, para el segundo le reste el resultado de x por 100
ya que corresponde a las centecimas, así como mod para el tercero ya que es el resto de dividir
entre 10 al final suma los-}

-- 15. Determinar si dos de los tres digitos son iguales
equal3Digits :: (Integral a) => a -> Bool
equal3Digits n
 | n < 100 || n > 999 = error "El número no tiene tres digitos"
 | (x==y) || (x==z) || (y==z) = True
 | otherwise = False
 where x = div n 100
       y = div (n-x*100) 10
       z = mod n 10
{--Esta función se basa en la anterior pero compara los números con OR, así si se cuample cualquera
significa que hay dos iguales-}

-- 16. Determinar la posición del digito mayor de un número de tres digitos
positionHigher3Digits :: (Integral a) => a -> String
positionHigher3Digits n
 | n < 100 || n > 999 = error "El número no tiene tres digitos"
 | may == x = "El mayor se encuentra en la posicion 1"
 | may == y = "El mayor se encuentra en la posicion 2"
 | otherwise = "El mayor se encuentra en la posicion 3"
 where x = div n 100
       y = div (n-x*100) 10
       z = mod n 10
       may = max (max x y) z
{-Después de separar los digitos con div y mod, utilicé max para encontrar el mayor y despues lo comparé
con x y z en distintos casos para determinar la osición-} 

-- 17. Determinar si xs es palindromo
palindromo :: (Eq a) => [a] -> Bool
palindromo xs 
 | xs == reverse xs = True
 | otherwise = False
{-Utilicé la clase de tipos eq para recibir distintos datos de entrada, despues comparé el parametro
recibido con el mismo pero usando reverse-}

-- 18. Definir una función que recibe dos número para realizar x/y
safeDivision :: (Floating a) => a -> a -> a
safeDivision x y = x / y
-- Tuve una serie de errores al comparar y con 0 

-- 19. Definir la funcion xor
xor' :: Bool -> Bool -> Bool
xor' x y
 | x==True && y==True = True
 | x==True && y==False = True
 | x==False && y==True = True
 |otherwise = False
--Recibí dos parametros, y los comparé con los dos datos booleanos para determinar el resultado

--  20. Calcular la distancia entre dos coordenadas
distance :: (Floating a) => (a,a) -> (a,a) -> a
distance v1 v2 = sqrt (((fst v2 - fst v1)^2) + ((snd v2 - snd v2)^2))
{-Para calcular la distancia se resta el primer elemento del vector dos al del vector uno,
y se eleva al cuadrado, después se hace lo mismo con el segundo elemento, se suman ambos
resultados y se obtiene la raiz cuadrada. si no se realiza el cuadrado y la raiz cuadrada el
resultado puede ser negativo -}

