ve_peliculas(roberto,suspenso).
ve_peliculas(hannai,suspenso).
ve_peliculas(abimael,suspenso).
ve_peliculas(leonardo,romance).
ve_peliculas(miguel,terror).

escucha_musica(abelino,reggae).
escucha_musica(jose,rock).
escucha_musica(izmucaneth,reggae).
escucha_musica(rolando,rock).
escucha_musica(maldonado,regional).

netflix(roberto).
netflix(hannai).
netflix(abimael).
netflix(miguel).

botana(roberto,palomitas).
botana(hannai,palomitas).
botana(abimael,maruchan).
botana(leonardo,maruchan).
botana(miguel,ensalada).

tiempo_libre(roberto,no).
tiempo_libre(hannai,no).
tiempo_libre(abimael,no).
tiempo_libre(leonardo,no).
tiempo_libre(miguel,no).

audifono(hannai).
audifono(leonardo).
audifono(miguel).
audifono(izmucaneth).
audifono(rolando).

spotify(jose).
spotify(izmucaneth).
spotify(maldonado).


%1. ¿Quienes prefieren ver peliculas?
peliculas(X) :- ve_peliculas(X,_).

%2. ¿Quienes prefieren escuchar música?
musica(X) :- escucha_musica(X,_).

%3. Alguien que ve peliculas de suspenso, disfruta verlas con palomitas, tiene una cuenta de
%   netflix y tiempo libre, tiene una tarde perfecta.
tarde_perfecta(X) :- ve_peliculas(X,suspenso),botana(X,palomitas),netflix(X),tiempo_libre(X,si).

%4. Alguien que ve peliculas comiendo una ensalada, tiene una vida saludable
vida_saludable(X) :- ve_peliculas(X,_),botana(X,ensalada).

%5. Alguien que escucha regional, tiene audifonos, y la aplicación de spotify, disfruta del
%   camino a casa
disfruta_camino(X) :- escucha_musica(X,regional),audifono(X),spotify(X).

%6. Alguien es feliz si ve peliculas consuminedo maruchan, tiempo libre, y netflix.
es_feliz(X) :- ve_peliculas(X,_),botana(X,maruchan),netflix(X),tiempo_libre(X,si).

%7. Unicamente pueden ser amigos quienes tienen los mismos gustos.
amigo(X) :- ve_peliculas(X,suspenso),botana(X,palomitas).
son_amigos(X,Y) :- amigo(X), amigo(Y).

