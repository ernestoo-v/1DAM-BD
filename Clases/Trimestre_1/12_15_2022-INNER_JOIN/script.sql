use nba;

/* Con esto saco el id del equipo_id */
select equipo_id from jugadores where id = 1;

/* Con esto saco los datos del equipo */
select * from equipos where id = 1; 

select jugadores.nombre AS jugador, jugadores.procedencia, equipos.nombre as equipo, equipos.ciudad
from jugadores
inner join equipos
on equipos.id = jugadores.equipo_id /* Esta es la interseccion */
where jugadores.id = 1;

select jugadores.nombre AS jugador, jugadores.procedencia, equipos.nombre as equipo, equipos.ciudad
from equipos
inner join jugadores
on equipos.id = jugadores.equipo_id /* Esta es la interseccion */
where jugadores.id = 1;

/*
	Ejercicio: suma total de puntos de LeBron James entre todas las temporadas
*/
SELECT * FROM estadisticas WHERE jugador_id = 336;
SELECT * FROM jugadores WHERE nombre = "Lebron James";

SELECT SUM(estadisticas.puntos) as total
FROM jugadores
INNER JOIN estadisticas
ON estadisticas.jugador_id = jugadores.id
WHERE jugadores.nombre = "Lebron James";
