% 1. Pertenece- Verificar si un elemento pertenece a una lista dada
% Se recibe un elemento y una lista, en el primer hecho se comprueba si el elemento está en la primer
% posición de la lista, regresa true, de lo contrario entra a la regla para hacer recursividad con
% el resto de la lista.
pertenece(E,[E|_]).
pertenece(E,[_|T]):- pertenece(E,T).

% 2. Size- Obtener la longitud de una lista
% Se recibe una lista, el primer hecho evalua si la lista está vacía, de ser así regresa el valor 0, de 
% lo contrario ejecuta una regla donde separa el primer elemento del resto, hacer recursividad con el resto
% de la lista y suma el valor 1 a la variable que contiene el resultado.
size([],0).
size([_|T],R):- size(T,R2), R is R2+1.

% 3. Concatenación- Obtener la concatenación de dos listas dadas.
% Se reciben dos listas, en el primer hecho, si la primera lista está vacía regresa solo la segunda, de lo
% contrario entra a una regla donde separa el primer elemento del resto de la primera lista y lo añade a 
% lo que será el resultado, así mismo realiza recursividad con el resto de la primera lista y la segunda.
concatenar([],L2,L2).
concatenar([H1|T1],L2,[H1|R]):- concatenar(T1,L2,R).

% 4. Eliminar- Eliminar un elemento de una lista 
% Se recibe un valor y una lista, si la lista está vacía regresa una lista vacía, si el elemento es el unico
% contenido en la lista, también regresa una lista vacía, de lo cotrario existen dos posibles reglas:
% En la primera, si el valor es diferente del primer elemento de la lista, lo añade al resultado y realiza
% recursividad con el resto de la lista.
% Si el valor es igual al primer elemento lo omitira en el resultado y realiza la misma recursividad
eliminar(_,[],[]).
eliminar(X,[X],[]).
eliminar(X,[H1|T1],[H1|Tail]):- X=\=H1, eliminar(X,T1,Tail).
eliminar(X,[H1|T1],Tail):- X=:=H1, eliminar(X,T1,Tail).

% 5. Agregar un elemento a una lista
% Para esta función se recibe un valor y una lista, si la lista está vacía se regresa una lista con el valor
% recibido, de lo contrario regresa una nueva lista posicionando el valor como primer elemento y despues
% toda la lista recibida
agregar(X,[],[X]).
agregar(X,L,[X|L]).

% 6. Par e impares- Separar una lista en 2 listas (pares e impares)
% Se recibe una lista, en el primer hecho, si la lista recibida está vacía retorna dos listas vacías, de lo
% contrario hay dos reglas, en la primera se añade el primer elemento a Lp si su mod es 0, pues significa que
% es par, y realiza recursividad con el resto de la lista.
% Si no es par lo añade en el resultado para li y realiza la misma recursividad.
parImpar([],[],[]).
parImpar([H|T],[H|LP],LI):- P is H mod 2, P=0, parImpar(T,LP,LI),!.
parImpar([H|T],LP,[H|LI]):- I is H mod 2, I>0, parImpar(T,LP,LI),!.

% 7. Ascendente- Verifica si una lista se encuentra de manera ascendente
% En esta función se recibe una lista, si solo es un elemento se regresa True, si hay mas elementos se separan
% el primer y segundo elemento para comprobar que el segundo sea mayor, y realiza recursividad omitiendo la
% primer posición de la lista, pues ya fue evaluado.
ascendente([_]).
ascendente([X1,X2|TAIL]):- X1<X2, ascendente([X2|TAIL]).

% 8. Descendente- Verifica si una lista se encuentra de manera descendente
% Para verificar si la lista es descendiente se realiza el mismo proceso de la función anterior pero evaluando
% que el segundo elemento sea menor.
descendente([_]).
descendente([X1,X2|TAIL]):- X1>X2, descendente([X2|TAIL]).

% 10. Menor que head- Obtener una lista con elementos menores que el elemento 
% Se recibe una lista, si esta vacía se regresa otra lista vacía al igual que si es un solo elemento, de lo
% contrario se separa el primer y segundo elemento, donde si el primero es mayor, se añadirá el segundo a una
% nueva lista y se realiza recursión omitiendo dicho elemeto, si el segundo elemento es mayor entonces se
% omite para la lista que contiene el resultado.
menorHead([],[]).
menorHead([_],[]).
menorHead([X1,X2|TAIL],[X2|L]):- X1 > X2, menorHead([X1|TAIL],L).
menorHead([X1,X2|TAIL],L):- X1 < X2, menorHead([X1|TAIL],L).

% 11. Mayor que head- Obtener una lista con elementos mayores que el elemento HEAD
% Para estafunción se utiliaz la misma lógica que en la anterior, pero almacenando solo los elementos que
% resulten ser mayores al primero de la lista.
mayorHead([],[]).
mayorHead([_],[]).
mayorHead([X1,X2|TAIL],[X2|L]):- X1 < X2, mayorHead([X1|TAIL],L).
mayorHead([X1,X2|TAIL],L):- X1 > X2, mayorHead([X1|TAIL],L).

% 12. Invertir. Obtener una lista con los elementos invertidos.
% Para esta función se recibe una lista con valores y otra vacía que servirá como auxiliar, en la regla se
% separa el primer elemento de la lista para realizar recursividad añadiendolo al principio de la lista 
% auxiliar, al finalizar unificará con LI para retornar los valores que acumuló.
invertir([],LI,LI).
invertir([X|TAIL],Aux,LI):- invertir(TAIL,[X|Aux],LI).