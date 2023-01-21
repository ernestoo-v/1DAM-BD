use nba;

/*
	GROUP BY
    Su funcionalidad es agrupar datos bajo unas condiciones
    Suele ir de la mano con las funciones de agregacion: AVG(), SUM(), MIN(), MAX(), COUNT()
    
    HAVING
    Proporciona condicion al agrupamiento
    
    WHERE vs HAVING
    - WHERE proporciona una condicion antes de realizar el agrupamiento.
    - HAVING proporciona una condicion sobre el agrupamiento
    
    CAST
    Cambiar un tipo de un valor
    CAST(VALOR AS TIPO)
*/
select * from jugadores;
select equipo_id, count(*) from jugadores;

/* Ejemplo que agrupa el total de jugadores por equipo */
/* Muestra todos los jugadores que hay por equipo */
SELECT equipo_id, COUNT(*)
FROM jugadores
GROUP BY equipo_id;

/* Muestra todas estadisticas por temporada */
SELECT * FROM estadisticas;

SELECT temporada_id, COUNT(*)
FROM estadisticas
GROUP BY temporada_id;

/* Muestra el numero de estadisticas por temporada y jugador */
SELECT temporada_id, jugador_id, COUNT(*)
FROM estadisticas
GROUP BY temporada_id, jugador_id;

/* Muestra cuantas estadisticas tiene cada jugador */
SELECT jugador_id, COUNT(*) AS 'numero estadisticas'
FROM estadisticas
GROUP BY jugador_id
ORDER BY COUNT(*) DESC, jugador_id ASC;

