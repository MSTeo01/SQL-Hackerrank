--Problem Statement

/*
Given a table FUNCTIONS that holds data for two fields namely X, Y.
+-------------+------------+
| Column      |   Type     |
+-------------+------------+
| X           | INTEGER    |
| Y           | INTEGER    |
+-------------+------------+

Two pairs (X_1, Y_1) and (X_2, Y_2) are said to be symmetric pairs if X_1 = Y_2 and X_2 = Y_1.
Write a query to output all symmetric pairs in ascending order by the value of X. List the rows such that X_1 <= Y_1.
*/

--Solution

SELECT DISTINCT f1.x, f1.y
FROM 
  (SELECT x, y, ROW_NUMBER() OVER() AS rn FROM functions) AS f1 
INNER JOIN 
  (SELECT x, y, ROW_NUMBER() OVER() AS rn FROM functions) AS f2 
ON f1.x = f2.y AND f2.x = f1.y
WHERE f1.x <= f1.y AND f1.rn <> f2.rn
ORDER BY f1.x ASC 
