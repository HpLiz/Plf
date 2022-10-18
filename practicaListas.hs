-- 1. Recibir una lista y regresarla pero al revés
firstToEnd :: (Eq a) => [a] -> [a]
firstToEnd [] = []
firstToEnd xs = [x | x <- reverse xs]
{-Utilicé el método reverse para regresar la misma lista pero al revés-}

-- 2. Definir una lista con el elemento minimo y el maximo de una lista inicial
minAndMax :: (Ord a) => [a] -> [a]
minAndMax [] = []
minAndMax xs = [x | x <- xs , (maximum xs)==x || (minimum xs)==x]
{-La función va a recibir una lista de tipo Ord, de esa forma se puede utilizar maximum y minimum
para encontrar los números buscados-}

-- 3. Una lista con los elementos menores al primero la lista inicial
minorsFirstElement :: (Integral a) => [a] -> [a]
minorsFirstElement [] = []
minorsFirstElement xs = [x | x <- xs, x < head xs]
{-Se recibe una lista de enteros, despues utilizando head se localiza el primer elemento
para compararlo mientras se recorre la lista-}

-- 4. Una lista con los elementos mayores o iguales al primer elemento de otra lista
greaterOrEqualFirstElement :: (Integral a) => [a] -> [a]
greaterOrEqualFirstElement [] = []
greaterOrEqualFirstElement xs = [x | x <- xs, x >= head xs]
{-Para esta función utilicé el mismo método de la función anterior, pero cambiando el simbolo po
mayor o igual y así obtener los números deseados-}

-- 5. Una lista con los elementos menores a la suma del primer y segundo elemento de xs sin tomar en cuenta los primeros dos
minorsToSumFirstAndSecondElem :: (Integral a) => [a] -> [a]
minorsToSumFirstAndSecondElem [] = []
minorsToSumFirstAndSecondElem (x:y:xs) = [s | s <- xs, s < (x+y)]
{-Para esta función el elemento a comparar es la suma de los primeros dos elementos, los cuales
obtuve desde que se recibió la lista separandola con ajuste de parametros-}

-- 6. Una lista donde cada elemento es la suma de los elementos de cada dupla de xs
listSumDuplaToList :: (Integral a) => [(a,a)] -> [a]
listSumDuplaToList [] = []
listSumDuplaToList xs = [x+y | (x,y) <- xs]
{-Para obtener los elementos a sumar indiqué que la lista sería tomada como una dupla con valores
x & y-}

-- 7. Una lista donde cada elemento es la multiplicación de cada tripleta de la lista original
listMultTripletaToList :: (Integral a) => [(a,a,a)] -> [a]
listMultTripletaToList [] = []
listMultTripletaToList xs = [x*y*z | (x,y,z) <- xs]
{-Esta función es similar a la anterior pero en vez de sumar se multiplican los valores-}

-- 8. Definir una lista para cambiar la posición de los elementos de cada dupla de una lista original
changeFstToSnd :: (Integral a) => [(a,a)] -> [(a,a)]
changeFstToSnd [] = []
changeFstToSnd xs = [(y,x) | (x,y) <- xs]
{-Para poder cambiar los elementos solo los ingresé en la lista de duplas en la forma inversa
a la que estaban-}


-- 9. Definir un vector resultante de la suma de vectores de una lista de duplas
sumVectors :: (Integral a) => [(a,a)] -> (a,a)
sumVectors [] = error "Lista vacia"
sumVectors [(x,y)] = (x,y)
sumVectors ((x,y):xs) = (sumx+x,sumy+y)
    where (sumx,sumy) = sumVectors xs
{-Para poder sumar los valores de cada dupla, primero descompuse la lista en dupla y el resto de 
la lista ((x,y):xs), posteriormente utilicé recursión con los dos valores para ir acumulando y sumando-}

-- 10. Una lista de los divisores de un numero
dividers :: (Integral a) => a -> [a]
dividers 0 = [0]
dividers n = [x | x <- [1..n], (mod n x)==0]
{-Esta función recorre los números de 1 hasta n y los divide entre el número dado entre x y si el
residuo es 0, lo agrega a la lista-}

-- 11. Una lista con los numeros primos existentes de 1 a n
primeNumbers :: (Integral a) => a -> [a]
primeNumbers n = [x | x <- [1..n], length (dividers x) == 2]
{-Para poder encontrar los números primos de un número especifico hice uso de mi función anterior
(Dividers), si el tamaño de la lista que devuleve es 2, significa que sus números divisibles son 1 
y el mismo número, por lo cual es primo-}

-- 12. Una lista infinita de los numeros primos
infinitePrimeNumbers :: [Int]
infinitePrimeNumbers = primos [2..]
    where primos (x:xs) = x : primos [s | s <- xs, (mod s x)/= 0]
{-Esta función no recibe ningún parametro pero devuleve una lista de 2 a infinito, 2 es el número
de inicio ya que es el primer número primo, para hallar los demás utilicé el algoritmo criba de 
aristoteles que marca el primer número como primo para despues eliminar a todos sus multiplos,
despues hace lo mismo con el resto de números, de esta forma descarta varios números en poco tiempo-}