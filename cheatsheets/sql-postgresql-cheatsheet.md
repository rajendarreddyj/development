postgresql-cheatsheet
===================

A cheatsheet on the usage of postgresql.

/*Get info*/
\d table_name
 
/*Set timing*/
\t
 
/*Reproject*/
ST_Transform(geom, int)
 
/*Clip by vector*/
ST_Intersect(geom,geom)
 
/*Union/dissolve/merge-by-attribute*/
SELECT ST_Union(geom) AS geom, union_field FROM table_name GROUP BY union_field
/*Union two layers*/
SELECT new_table AS (SELECT geom, foo as field1, bar as field2) UNION (SELECT geom, fee as field1, fie as field2)
 
 
/*Add field*/
ALTER TABLE lyr ADD COLUMN field NUMERIC(1000,2)
 
/*Drop/remove/delete field*/
ALTER TABLE lyr DROP COLUMN field
 
/*Rename field*/
ALTER TABLE table_name RENAME COLUMN foo TO bar
 
/*Convert field type (cast); SQL conformant*/
CAST ( expression AS type )
/*Convert field type (cast); historic postgresql*/
expression::type
 
/*Set/update/calculate field/values*/
UPDATE table_name SET field='value'
 
/*Look-Up/pseudo-join/calculate*/
UPDATE table_name SET field=(SELECT field2 FROM pops2014 where name=name); (?)
 
/*Insert/add record*/
INSERT INTO table (field1,field2) value1, value2
 
/*Delete/remove record/feature*/
DELETE FROM table WHERE field=value
 
/*create serial / unique id*/
ALTER TABLE lyr ADD COLUMN uid integer primary key autoincrement
 
/*create index (non-spatial)*/
CREATE INDEX idx_name ON table(field)
 
/*Create/build spatial index*/
CREATE SPATIAL INDEX ON lyr
 
/*concatenate*/
SELECT field1 || ':' || field2 AS new_field FROM table_name LIMIT 10
/*Join*/
 
/*Explode*/
 
/*Buffer*/
ST_Buffer(GEOMETRY,1000)
 
/*Simplify (point-remove)*/
 
/*Simplify/Generalize*/
alter table table_name add column the_geom_simp geometry;
update table_name set the_geom_simp = ST_SimplifyPreserveTopology(the_geom,5);
 
/*Count vertices*/
select st_npoints(the_geom) as npoints from table_name order by npoints;
select sum(st_npoints(the_geom)) from table_name;
 
/*Centroid (within)*/
SELECT ST_PointOnSurface(GEOMETRY) AS GEOMETRY,other_fields FROM lyr
 
/*spatial join point-in-poly two shapefiles*/
UPDATE neighborhoods_table SET field_name = (SELECT NAME FROM cities_table WHERE ST_Intersects(geometry, ST_PointOnSurface(neighborhoods_table.geometry)))
 
/*Erase*/
ST_Difference
 
 
/*Summarize table attribue/field*/
SELECT dataagg, COUNT(*) AS cnt FROM table_name GROUP BY dataagg ORDER BY cnt DESC
/*Summarize to file*/
SELECT dataagg, COUNT(*) AS cnt FROM table_name GROUP BY dataagg ORDER BY cnt DESC
/*Explode (multipart to singlepart)*/
ST_Dump
 
/*Get a list of fields*/
select * from table_name where 1=0
 
/*snap / coordinate_precision*/
ST_SnapToGrid (requires gdal 1.11 ?)
 
/*
Optimize field widths
RESIZE table?
Merge
*/