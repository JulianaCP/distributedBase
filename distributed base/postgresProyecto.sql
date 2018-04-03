
/*Proyecto bases dos*/
/*****************************************************************************************************************************************************
*****************************************************************************************************************************************************
*****************************************************************************************************************************************************
*************************************************	SERVER MULTIMEDIA	***************************************************************************
******************************************************************************************************************************************************/

create database multimedia


create table imagenes(
	idImagenes		Serial primary key,
	idPelicula		int not null,	
	img bytea	
);




create table comentario(
	idComentario		serial primary key,
	idPelicula		int not null,
	descripcion		varchar(400) not null
);



/*****************************************************************************************************************************************************
*************************************************	SERVER CINEMA		*******************************************************
*****************************************************************************************************************************************************/

create database cinema;



create table establecimiento(
	idEstablecimiento 	int not null primary key,
	nombre			varchar(50) not null
);





create table sala(
	idSala			int not null primary key,
	idEstablecimiento	int not null,
	nombreSala		varchar(50) not null,
	capacidad 		int not null,
	constraint FK_idEstablecimiento_Sala_Establecimiento foreign key(idEstablecimiento) references establecimiento(idEstablecimiento)	
);




create table peliculas(
	idPelicula	int not null primary key,
	nombre 		varchar(50) not null,
	genero		varchar(50) not null,
	idioma		varchar(50) not null,
	subtitulada	varchar(50)not null,
	sipnosis	varchar(500)not null,
	fecha		varchar(10) not null check(fecha similar to('[0-9][0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9]')),
	director	varchar(50) not null,
	estreno		varchar(2) not null check(estreno in ('si','no'))
);




create table horario(
	idHorario		int not null primary key,
	horaInicio		varchar (5) not null check (horaInicio similar to ('[0-9][0-9]:[0-9][0-9]')),
	horaFinal		varchar(5) not null check (horaInicio similar to ('[0-9][0-9]:[0-9][0-9]'))	
);

insert into peliculas values
(51,'Crepúsculo','romantica','ingles', 'si', 'Pelicula de romance que trata de la vida de Bella una jóven estudiante y un chico misterioso','19/02/2011','Amanda Watchisto F.','no'),
(52,'Titanic','romantica','español', 'no','Basada en hechos reales, narra cómo el barco famoso Titanic se hunde en el mar', '20/02/1997','Roberto Anderson T.','no'),
(53,'La bella y la bestia','romantica','español', 'no','Basada en el cuento la bella y la bestia de disney.','28/11/2017','Pitterson Herrera C.','no'),
(54,'Amor y otras drogas','romantica','español', 'no','Narra la historia de dos jóvenes enamorados.','12/11/2015','Marken Menderson L','no'),
(55,'Yo antes de ti','romantica','ingles', 'si','Pelicula basada en un joven discapacitado que se enamora de una chica','04/11/2016','Jonathan Whatson P.','si'),
(56,'La luz entre océanos','romantica','ingles', 'si','Cuenta la historia de un joven que se enamora desesperadamente de una chica.','07/11/2017','Amanda Watchisto F','no'),
(57,'Lo mejor de mi','romantica','español', 'no','Cuenta la historia de un joven que se enamora desesperadamente de una chica.', '17/03/2016','Roberto Anderson T.','si'),
(58,'The longest ride','romantica','ingles', 'no','Cuenta la historia de un joven que se enamora desesperadamente de una chica.','23/03/2016','Richard Parker G.','no'),
(59,'Cincuenta sombras de Gray','romantica','ingles', 'si','Pelicula basada en la historia de un hombre que posee transtornos psicológicos el cual posee distintos hábitos sexuales inhabituales','23/03/2016','Richard Parker G.','no'),
(60,'Cincuenta sombras de Gray','romantica','ingles', 'si','Pelicula basada en la continuación de la historia de un hombre que posee transtornos psicológicos el cual posee distintos hábitos sexuales inhabituales','23/03/2016','Richard Parker G.','si')
,

(61,'El niño','terror','ingles', 'si', 'Pelicula de terror basada la historia de una familia que perdió a su hijo único','19/02/2016','Amanda Watchisto F.','si'),
(62,'Las dos hermanas','terror','ingles', 'si','Narra la vida de dos jóvenes hermanas fallecidas en un asesinato', '20/02/2000','Roberto Anderson T.','no'),
(63,'El conjuro','terror','español', 'no','Basada en hechos reales. Trata sobre la vida de una familia al ingresar a una casa maldita.','28/11/2016','Pitterson Herrera C.','si'),
(64,'Siniestro','terror','español', 'no','Narra los trágicos y misteriosas muertes de cinco familias.','12/11/2016','Marken Menderson L','si'),
(65,'El exorcista','terror','ingles', 'si','Pelicula basada en un exorcismo realizado a una joven','04/11/2001','Jonathan Whatson P.','no'),
(66,'El aro 3','terror','ingles', 'si','Cuenta la historia de un video el cual cada persona que ve dicho video muere al setimo día.','07/11/2016','Amanda Watchisto F','si'),
(67,'Arrastrame al infierno','terror','español', 'no','Narra la historia de una mujer que es atormentada por una señora fallecida.', '17/03/2011','Roberto Anderson T.','no'),
(68,'Dead silence','terror','ingles', 'no','Trata sobre un muñeco embrujado y su dueña fallecida','23/03/2012','Richard Parker G.','no'),
(69,'Casa embrujada','terror','ingles', 'no','Pelicula basada en hechos reales sobre una casa en la ciudad de Emitivile','23/03/2009','Richard Parker G.','no'),
(70,'La cabaña del diablo','terror','ingles', 'no','Pelicula basada en la historia de la casa embrujada del año 1994','23/03/2010','Richard Parker G.','si'),
(71,'Una noche en el museo','comedia','español', 'no', 'Pelicula de terror basada la historia de un hombre, el cual es guardian nocturno de un museo','19/02/2015','Amanda Watchisto F.','no'),

(72,'Austing Power','comedia','ingles', 'si','Narra las aventuras de Austing un hombre que viene del pasado', '20/02/2008','Roberto Anderson T.','no'),
(73,'American Pie','comedia','Inglés', 'no','Narra la vida de unos jóvenes y sus distintas aventuras.','28/11/2011','Pitterson Herrera C.','no'),
(74,'La resaca','comedia','español', 'no','Narra la historia de tres amigos que van de fiesta y al dpia siguiente no recuerdan lo que sucedió la noche anterior.','12/11/2015','Marken Menderson L','no'),
(75,'Chiquito pero peligroso','comedia','español', 'no','Pelicula basada en un la llegada de un misterioso bebé a la familia','04/11/2014','Jonathan Whatson P.','no'),
(76,'Y donde están las rubias','comedia','español', 'no','Cuenta la historia de unos agentes del FBI que deben de proteger a dos jóvenes millonarias, pero algo sale mal...','07/11/2012','Amanda Watchisto F','no'),
(77,'Yes Man','Comedia','Inglés', 'no','Narra la historia de un hombre que debe de decir sí a todo lo que le piden.', '17/03/2015','Roberto Anderson T.','no'),
(78,'El dictador','comedia','Español', 'no','Trata sobre un dictador de medio oriente que ingresa a los Estados Unidos','23/03/2015','Richard Parker G.','no'),
(79,'Como si fuera la primera vez','comedia','español', 'no','Narra la vida de un hombre  que debe de conquistar a una mujer todos los días debido a que ésta siempre lo olvida','23/03/2011','Richard Parker G.','no'),
(80,'Mejor solteras','comedia','español', 'no','Pelicula basada en la historia de unas jóvenes que desean estar solteras el resto de su vida','23/03/2016','Richard Parker G.','si'),

(81,'Crepúsculo','romantica','ingles', 'si', 'Pelicula de romance que trata de la vida de Bella una jóven estudiante y un chico misterioso','19/02/2011','Amanda Watchisto F.','no'),
(82,'Titanic','romantica','español', 'no','Basada en hechos reales, narra cómo el barco famoso Titanic se hunde en el mar', '20/02/1997','Roberto Anderson T.','no'),
(83,'La bella y la bestia','romantica','español', 'no','Basada en el cuento la bella y la bestia de disney.','28/11/2017','Pitterson Herrera C.','no'),
(84,'Amor y otras drogas','romantica','español', 'no','Narra la historia de dos jóvenes enamorados.','12/11/2015','Marken Menderson L','no'),
(85,'Yo antes de ti','romantica','ingles', 'si','Pelicula basada en un joven discapacitado que se enamora de una chica','04/11/2016','Jonathan Whatson P.','si'),
(86,'La luz entre océanos','romantica','ingles', 'si','Cuenta la historia de un joven que se enamora desesperadamente de una chica.','07/11/2017','Amanda Watchisto F','no'),
(87,'Lo mejor de mi','romantica','español', 'no','Cuenta la historia de un joven que se enamora desesperadamente de una chica.', '17/03/2016','Roberto Anderson T.','si'),
(88,'The longest ride','romantica','ingles', 'no','Cuenta la historia de un joven que se enamora desesperadamente de una chica.','23/03/2016','Richard Parker G.','no'),
(89,'Cincuenta sombras de Gray','romantica','ingles', 'si','Pelicula basada en la historia de un hombre que posee transtornos psicológicos el cual posee distintos hábitos sexuales inhabituales','23/03/2016','Richard Parker G.','no'),
(90,'Cincuenta sombras de Gray','romantica','ingles', 'si','Pelicula basada en la continuación de la historia de un hombre que posee transtornos psicológicos el cual posee distintos hábitos sexuales inhabituales','23/03/2016','Richard Parker G.','si')
,

(91,'El niño','terror','ingles', 'si', 'Pelicula de terror basada la historia de una familia que perdió a su hijo único','19/02/2016','Amanda Watchisto F.','si'),
(92,'Las dos hermanas','terror','ingles', 'si','Narra la vida de dos jóvenes hermanas fallecidas en un asesinato', '20/02/2000','Roberto Anderson T.','no'),
(93,'El conjuro','terror','español', 'no','Basada en hechos reales. Trata sobre la vida de una familia al ingresar a una casa maldita.','28/11/2016','Pitterson Herrera C.','si'),
(94,'Siniestro','terror','español', 'no','Narra los trágicos y misteriosas muertes de cinco familias.','12/11/2016','Marken Menderson L','si'),
(95,'El exorcista','terror','ingles', 'si','Pelicula basada en un exorcismo realizado a una joven','04/11/2001','Jonathan Whatson P.','no'),
(96,'El aro 3','terror','ingles', 'si','Cuenta la historia de un video el cual cada persona que ve dicho video muere al setimo día.','07/11/2016','Amanda Watchisto F','si'),
(97,'Arrastrame al infierno','terror','español', 'no','Narra la historia de una mujer que es atormentada por una señora fallecida.', '17/03/2011','Roberto Anderson T.','no'),
(98,'Dead silence','terror','ingles', 'no','Trata sobre un muñeco embrujado y su dueña fallecida','23/03/2012','Richard Parker G.','no'),
(99,'Casa embrujada','terror','ingles', 'no','Pelicula basada en hechos reales sobre una casa en la ciudad de Emitivile','23/03/2009','Richard Parker G.','no'),
(100,'La cabaña del diablo','terror','ingles', 'no','Pelicula basada en la historia de la casa embrujada del año 1994','23/03/2010','Richard Parker G.','si'),
(101,'Una noche en el museo','comedia','español', 'no', 'Pelicula de terror basada la historia de un hombre, el cual es guardian nocturno de un museo','19/02/2015','Amanda Watchisto F.','no'),

(102,'Austing Power','comedia','ingles', 'si','Narra las aventuras de Austing un hombre que viene del pasado', '20/02/2008','Roberto Anderson T.','no'),
(103,'American Pie','comedia','Inglés', 'no','Narra la vida de unos jóvenes y sus distintas aventuras.','28/11/2011','Pitterson Herrera C.','no'),
(104,'La resaca','comedia','español', 'no','Narra la historia de tres amigos que van de fiesta y al dpia siguiente no recuerdan lo que sucedió la noche anterior.','12/11/2015','Marken Menderson L','no'),
(105,'Chiquito pero peligroso','comedia','español', 'no','Pelicula basada en un la llegada de un misterioso bebé a la familia','04/11/2014','Jonathan Whatson P.','no'),
(106,'Y donde están las rubias','comedia','español', 'no','Cuenta la historia de unos agentes del FBI que deben de proteger a dos jóvenes millonarias, pero algo sale mal...','07/11/2012','Amanda Watchisto F','no'),
(107,'Yes Man','Comedia','Inglés', 'no','Narra la historia de un hombre que debe de decir sí a todo lo que le piden.', '17/03/2015','Roberto Anderson T.','no'),
(108,'El dictador','comedia','Español', 'no','Trata sobre un dictador de medio oriente que ingresa a los Estados Unidos','23/03/2015','Richard Parker G.','no'),
(109,'Como si fuera la primera vez','comedia','español', 'no','Narra la vida de un hombre  que debe de conquistar a una mujer todos los días debido a que ésta siempre lo olvida','23/03/2011','Richard Parker G.','no'),
(110,'Mejor solteras','comedia','español', 'no','Pelicula basada en la historia de unas jóvenes que desean estar solteras el resto de su vida','23/03/2016','Richard Parker G.','si'),

(111,'Crepúsculo','romantica','ingles', 'si', 'Pelicula de romance que trata de la vida de Bella una jóven estudiante y un chico misterioso','19/02/2011','Amanda Watchisto F.','no'),
(112,'Titanic','romantica','español', 'no','Basada en hechos reales, narra cómo el barco famoso Titanic se hunde en el mar', '20/02/1997','Roberto Anderson T.','no'),
(113,'La bella y la bestia','romantica','español', 'no','Basada en el cuento la bella y la bestia de disney.','28/11/2017','Pitterson Herrera C.','no'),
(114,'Amor y otras drogas','romantica','español', 'no','Narra la historia de dos jóvenes enamorados.','12/11/2015','Marken Menderson L','no'),
(115,'Yo antes de ti','romantica','ingles', 'si','Pelicula basada en un joven discapacitado que se enamora de una chica','04/11/2016','Jonathan Whatson P.','si'),
(116,'La luz entre océanos','romantica','ingles', 'si','Cuenta la historia de un joven que se enamora desesperadamente de una chica.','07/11/2017','Amanda Watchisto F','no'),
(117,'Lo mejor de mi','romantica','español', 'no','Cuenta la historia de un joven que se enamora desesperadamente de una chica.', '17/03/2016','Roberto Anderson T.','si'),
(118,'The longest ride','romantica','ingles', 'no','Cuenta la historia de un joven que se enamora desesperadamente de una chica.','23/03/2016','Richard Parker G.','no'),
(119,'Cincuenta sombras de Gray','romantica','ingles', 'si','Pelicula basada en la historia de un hombre que posee transtornos psicológicos el cual posee distintos hábitos sexuales inhabituales','23/03/2016','Richard Parker G.','no'),
(120,'Cincuenta sombras de Gray','romantica','ingles', 'si','Pelicula basada en la continuación de la historia de un hombre que posee transtornos psicológicos el cual posee distintos hábitos sexuales inhabituales','23/03/2016','Richard Parker G.','si')

(121,'Las dos hermanas','terror','ingles', 'si','Narra la vida de dos jóvenes hermanas fallecidas en un asesinato', '20/02/2000','Roberto Anderson T.','no'),
(122,'El conjuro','terror','español', 'no','Basada en hechos reales. Trata sobre la vida de una familia al ingresar a una casa maldita.','28/11/2016','Pitterson Herrera C.','si'),
(123,'Siniestro','terror','español', 'no','Narra los trágicos y misteriosas muertes de cinco familias.','12/11/2016','Marken Menderson L','si'),
(124,'El exorcista','terror','ingles', 'si','Pelicula basada en un exorcismo realizado a una joven','04/11/2001','Jonathan Whatson P.','no'),
(125,'El aro 3','terror','ingles', 'si','Cuenta la historia de un video el cual cada persona que ve dicho video muere al setimo día.','07/11/2016','Amanda Watchisto F','si'),
(126,'Arrastrame al infierno','terror','español', 'no','Narra la historia de una mujer que es atormentada por una señora fallecida.', '17/03/2011','Roberto Anderson T.','no'),
(127,'Dead silence','terror','ingles', 'no','Trata sobre un muñeco embrujado y su dueña fallecida','23/03/2012','Richard Parker G.','no'),
(128,'Casa embrujada','terror','ingles', 'no','Pelicula basada en hechos reales sobre una casa en la ciudad de Emitivile','23/03/2009','Richard Parker G.','no'),
(129,'La cabaña del diablo','terror','ingles', 'no','Pelicula basada en la historia de la casa embrujada del año 1994','23/03/2010','Richard Parker G.','si'),

(130,'El niño','terror','ingles', 'si', 'Pelicula de terror basada la historia de una familia que perdió a su hijo único','19/02/2016','Amanda Watchisto F.','si'),
(131,'Las dos hermanas','terror','ingles', 'si','Narra la vida de dos jóvenes hermanas fallecidas en un asesinato', '20/02/2000','Roberto Anderson T.','no'),
(132,'El conjuro','terror','español', 'no','Basada en hechos reales. Trata sobre la vida de una familia al ingresar a una casa maldita.','28/11/2016','Pitterson Herrera C.','si'),
(133,'Siniestro','terror','español', 'no','Narra los trágicos y misteriosas muertes de cinco familias.','12/11/2016','Marken Menderson L','si'),
(134,'El exorcista','terror','ingles', 'si','Pelicula basada en un exorcismo realizado a una joven','04/11/2001','Jonathan Whatson P.','no'),
(135,'El aro 3','terror','ingles', 'si','Cuenta la historia de un video el cual cada persona que ve dicho video muere al setimo día.','07/11/2016','Amanda Watchisto F','si'),
(136,'Arrastrame al infierno','terror','español', 'no','Narra la historia de una mujer que es atormentada por una señora fallecida.', '17/03/2011','Roberto Anderson T.','no'),
(137,'Dead silence','terror','ingles', 'no','Trata sobre un muñeco embrujado y su dueña fallecida','23/03/2012','Richard Parker G.','no'),
(138,'Casa embrujada','terror','ingles', 'no','Pelicula basada en hechos reales sobre una casa en la ciudad de Emitivile','23/03/2009','Richard Parker G.','no'),
(139,'La cabaña del diablo','terror','ingles', 'no','Pelicula basada en la historia de la casa embrujada del año 1994','23/03/2010','Richard Parker G.','si'),
(140,'Una noche en el museo','comedia','español', 'no', 'Pelicula de terror basada la historia de un hombre, el cual es guardian nocturno de un museo','19/02/2015','Amanda Watchisto F.','no'),

(141,'Austing Power','comedia','ingles', 'si','Narra las aventuras de Austing un hombre que viene del pasado', '20/02/2008','Roberto Anderson T.','no'),
(142,'American Pie','comedia','Inglés', 'no','Narra la vida de unos jóvenes y sus distintas aventuras.','28/11/2011','Pitterson Herrera C.','no'),
(143,'La resaca','comedia','español', 'no','Narra la historia de tres amigos que van de fiesta y al dpia siguiente no recuerdan lo que sucedió la noche anterior.','12/11/2015','Marken Menderson L','no'),
(144,'Chiquito pero peligroso','comedia','español', 'no','Pelicula basada en un la llegada de un misterioso bebé a la familia','04/11/2014','Jonathan Whatson P.','no'),
(145,'Y donde están las rubias','comedia','español', 'no','Cuenta la historia de unos agentes del FBI que deben de proteger a dos jóvenes millonarias, pero algo sale mal...','07/11/2012','Amanda Watchisto F','no'),
(146,'Yes Man','Comedia','Inglés', 'no','Narra la historia de un hombre que debe de decir sí a todo lo que le piden.', '17/03/2015','Roberto Anderson T.','no'),
(147,'El dictador','comedia','Español', 'no','Trata sobre un dictador de medio oriente que ingresa a los Estados Unidos','23/03/2015','Richard Parker G.','no'),
(148,'Como si fuera la primera vez','comedia','español', 'no','Narra la vida de un hombre  que debe de conquistar a una mujer todos los días debido a que ésta siempre lo olvida','23/03/2011','Richard Parker G.','no'),
(149,'Mejor solteras','comedia','español', 'no','Pelicula basada en la historia de unas jóvenes que desean estar solteras el resto de su vida','23/03/2016','Richard Parker G.','si'),
(150,'Crepúsculo','romantica','ingles', 'si', 'Pelicula de romance que trata de la vida de Bella una jóven estudiante y un chico misterioso','19/02/2011','Amanda Watchisto F.','no')





select * from comentario

delete from comentario

--150
insert into comentario(idPelicula,descripcion) values
	(4, 'esta muy buena'),
	(4, 'esta muy buena'),
	(4, 'esta muy buena'),
	(4, 'es genial'),
	(4, 'esta bien fea'),
	(4, 'esta bien fea'),
	(4, 'esta muy buena'),
	(4, 'esta muy buena'),
	(4, 'esta bien fea'),
	(4, 'es genial'),
	(5, 'es genial'),
	(5, 'es genial'),
	(5, 'esta bien fea'),
	(5, 'esta bien fea'),
	(5, 'esta bien fea'),
	(5, 'es genial'),
	(5, 'es genial'),
	(5, 'esta bien fea'),
	(5, 'esta bien fea'),
	(5, 'esta bien fea'),--20
	(6, 'esta muy buena'),
	(6, 'esta muy buena'),
	(6, 'esta muy buena'),
	(6, 'esta muy buena'),
	(6, 'esta bien fea'),
	(6, 'esta bien fea'),
	(7, 'esta bien fea'),
	(7, 'esta bien fea'),
	(7, 'esta bien fea'),
	(7, 'esta muy buena'),--30
	(7, 'esta muy buena'),
	(7, 'esta muy buena'),
	(7, 'esta muy buena'),
	(7, 'esta bien fea'),
	(7, 'esta bien fea'), --28
	(8, 'esta muy buena'),
	(8, 'esta muy buena'),
	(8, 'esta muy buena'),
	(1, 'esta muy buena'),
	(2, 'esta bien fea'),--40
	(3, 'esta bien fea'),
	(3, 'esta bien fea'),
	(2, 'esta bien fea'),
	(9, 'esta muy buena'),
	(9, 'esta bien fea'),
	(9, 'esta bien fea'),
	(9, 'esta bien fea'),
	(10, 'esta muy buena'),
	(2, 'es genial'),
	(2, 'es genial');--50

create table sala_Comercio(
	idPelicula		int not null,
	idSala			int not null,
	activo			varchar(1) not null check (activo in ('S','N')),
	idHorario		int not null,
	fecha			varchar(10) not null check(fecha similar to('[0-9][0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9]')),
	constraint PK_idPelicula_idSala_SalaComercio primary key (idPelicula, idSala),
	constraint FK_idPelicula_salaComercio_Pelicula foreign key (idPelicula) references peliculas(idPelicula),
	constraint FK_idSala_salaComercio_Sala foreign key (idSala) references sala(idSala),
	constraint FK_idHorario_salaComercio_horario foreign key (idHorario) references horario(idHorario)	
);




/*****************************************************************************************************************************************************
*************************************************	SERVER MASTER PROYECTOBASESDOS		*******************************************************
*****************************************************************************************************************************************************/



create database ProyectoBasesDos


							/*EXTENSION*/


create extension dbLink;
select * from dblink ('host=localhost user=postgres password=12345 dbname=proyectobasesdos', 
'select idPelicula,nombre from peliculas') as pelis (idPelicula int,carne varchar(50))

select * from dblink ('host=localhost user=postgres password=12345 dbname=proyectobasesdos', 
'select idPelicula,img from imagenes') as imgs (idPelicula int,img varchar(100))

select * from dblink ('host=localhost user=postgres password=12345 dbname=proyectobasesdos', 
'select idPelicula,descripcion from comentario') as comentarios (idPelicula int,descripcion varchar(400))



							/*TRIGGERS E INSERTAR*/

							

--insertar pelicula


create or replace function public.insert_peliculas()
returns trigger
as
$BODY$ 
	begin
		raise notice 'valores de la nueva pelicula: idPelicula=%, nombre=%,genero=%,idioma=%,subtitulada=%,sipnosis=%
		fecha=%,director=%,estreno=%',NEW.idPelicula,New.nombre,NEW.genero,NEW.idioma,NEW.subtitulada,NEW.sipnosis,NEW.fecha,NEW.director
		,NEW.estreno;
		perform dblink_exec('host=localhost user=postgres password=12345 dbname=cinema',
		'insert into peliculas values('''||NEW.idPelicula||''','''||NEW.nombre||''','''||NEW.genero||''','''||NEW.idioma||''',
		'''||NEW.subtitulada||''','''||NEW.sipnosis||''','''||NEW.fecha||''','''||NEW.director||''','''||NEW.estreno||''')');
		raise notice 'insertado en la base de datos cinema';
		return new;	
		
	end;
$BODY$
language plpgsql;


--trigger


create TRIGGER TGG_insert_peliculas
after insert
on peliculas
for each row
execute procedure public.insert_peliculas()


--insertar imagenes


create or replace function public.insert_imagenes()
returns trigger
as
$BODY$ 
	begin
		raise notice 'valores de la nueva imagen:,idPelicula=%,img=%',NEW.idPelicula,NEW.img;
		perform dblink_exec('host=localhost user=postgres password=12345 dbname=multimedia',
		'insert into imagenes(idPelicula,img) values('''||NEW.idPelicula||''','''||NEW.img||''')');
		raise notice 'insertado en la base de datos multimedia';
		return new;		
	end;
$BODY$
language plpgsql;


--trigger


create TRIGGER TGG_insert_imagenes
after insert
on imagenes
for each row
execute procedure public.insert_imagenes()

--insertar comentarios

create or replace function public.insert_comentario()
returns trigger
as
$BODY$ 
	begin
		raise notice 'valores del nuevo comentario:idPelicula=%,descripcion=%',NEW.idPelicula,NEW.descripcion;
		perform dblink_exec('host=localhost user=postgres password=12345 dbname=multimedia',
		'insert into comentario(idPelicula,descripcion) values('''||NEW.idPelicula||''','''||NEW.descripcion||''')');
		raise notice 'insertado en la base de datos multimedia';		
		return new;
	end;
$BODY$
language plpgsql;


--trigger


create TRIGGER TGG_insert_comentario
after insert
on comentario
for each row
execute procedure public.insert_comentario()




						/*FUNCIONES O CONSULTAS*/



CREATE OR REPLACE FUNCTION notaDePelicula(idPeliculap int) RETURNS int AS 
$$
DECLARE	
	numeroTotal int default 0;
	porcentaje int default 0;
	numeroNegativos int default 0;
	r record;
	c CURSOR FOR SELECT * FROM 
			(select * from dbLink('host = localhost user= postgres password= 12345 dbname= multimedia',
			'SELECT descripcion FROM comentario  where idPelicula = '''||idPeliculap||'''')
			as estudiantes(descripcion varchar(500)))as comentarios;	
BEGIN	
	FOR r IN c LOOP		
		numeroTotal= numeroTotal + 1;
		
		RAISE NOTICE 'descripcion: %', r.descripcion;			
		if r.descripcion similar to '%esta bien fe%' 			or r.descripcion similar to '%no esta para nada bonit%' 	or r.descripcion similar to '%esta fe%' 
			or r.descripcion similar to '%esta bien fe%'    	or r.descripcion similar to '%esta aburrid%'			or r.descripcion similar to '%estuvo aburrid%'
			or r.descripcion similar to '%esta horrible%'   	or r.descripcion similar to '%estuvo horrible%' 		or r.descripcion similar to '%no me gusto%' 
			or r.descripcion similar to '%no me encanto%'   	or r.descripcion similar to '%no es atractiv%' 			or r.descripcion similar to '%no es genial%' 
			or r.descripcion similar to '%no es para nada genial%'  or r.descripcion similar to '%no es en lo absoluto genial%' 
			or r.descripcion similar to '%no posee nada atractiv%'  or r.descripcion similar to '%no estaba bueno%'
			
			THEN
			numeroNegativos= numeroNegativos + 1;
		end if;

		porcentaje = ((numeroTotal-numeroNegativos) * 100) / numeroTotal;
				
	END LOOP;
	RETURN porcentaje;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION cantidadDeComentariosBuenos(idPeliculap int) RETURNS int AS 
$$
DECLARE	
	numeroTotal int default 0;
	porcentaje int default 0;
	numeroNegativos int default 0;
	r record;
	c CURSOR FOR SELECT * FROM 
			(select * from dbLink('host = localhost user= postgres password= 12345 dbname= multimedia',
			'SELECT descripcion FROM comentario  where idPelicula = '''||idPeliculap||'''')
			as estudiantes(descripcion varchar(500)))as comentarios;	
BEGIN	
	FOR r IN c LOOP		
		numeroTotal= numeroTotal + 1;
		RAISE NOTICE 'descripcion: %', r.descripcion;			
		if r.descripcion similar to '%esta bien fe%' 			or r.descripcion similar to '%no esta para nada bonit%' 	or r.descripcion similar to '%esta fe%' 
			or r.descripcion similar to '%esta bien fe%'    	or r.descripcion similar to '%esta aburrid%'			or r.descripcion similar to '%estuvo aburrid%'
			or r.descripcion similar to '%esta horrible%'   	or r.descripcion similar to '%estuvo horrible%' 		or r.descripcion similar to '%no me gusto%' 
			or r.descripcion similar to '%no me encanto%'   	or r.descripcion similar to '%no es atractiv%' 			or r.descripcion similar to '%no es genial%' 
			or r.descripcion similar to '%no es para nada genial%'  or r.descripcion similar to '%no es en lo absoluto genial%' 
			or r.descripcion similar to '%no posee nada atractiv%'  or r.descripcion similar to '%no estaba bueno%'
			
			THEN
			numeroNegativos= numeroNegativos + 1;
		end if;

		porcentaje = numeroTotal-numeroNegativos;
				
	END LOOP;
	RETURN porcentaje;
END;
$$ LANGUAGE plpgsql;
		
			

select * from 	cincoMasVistas()	
create type masVistas as
(	
	peliculaNombre		varchar,
	cantidad 		int
);
create or replace function cincoMasVistas() returns SETOF masVistas
as
$func$
declare
    myrec  masVistas;
begin
	for myrec in select peliculas.nombre, count(*) as cantidad from
			(select * from dbLink('host = localhost user= postgres password= 12345 dbname= multimedia',
			'SELECT idPelicula FROM comentario')as comentarios(idPelicula varchar(500)))as comentarios

			 inner join 

			(select * from dbLink('host = localhost user= postgres password= 12345 dbname= cinema',
			'select peliculas.idPelicula, peliculas.nombre
			from peliculas inner join sala_Comercio on sala_Comercio.idPelicula= peliculas.idPelicula
			inner join sala on sala.idSala= sala_Comercio.idSala
			inner join establecimiento on establecimiento.idEstablecimiento = sala.idEstablecimiento')
			as comentarios(idPelicula varchar(500), nombre varchar(50)))as peliculas

			on 

			peliculas.idPelicula= comentarios.idPelicula

			group by peliculas.nombre order by cantidad desc limit 5
	loop
		RETURN next myrec;
	end loop;
end;
$func$ language plpgsql;


/*****************************************************************   INDICES **********************************************************/

create index idComentario_Index on comentario (idComentario);
create index idPelicula_Index on peliculas(idPelicula);



