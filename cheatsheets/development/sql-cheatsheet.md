
sql-cheatsheet
===================

A cheatsheet on the usage of sql.

-- find duplicated values
SELECT
    address_line1, address_line2, zip, city, country, COUNT(*)
FROM
    location
GROUP BY
    address_line1, address_line2, zip, city, country
HAVING
    COUNT(*) > 1;
 
-- show the average length of a column
SELECT
    AVG(LENGTH(column1))
FROM table1