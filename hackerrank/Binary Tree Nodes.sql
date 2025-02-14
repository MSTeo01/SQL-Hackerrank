--Problem Statement

/*
Given a table BST that holds data for two fields namely N, P.
+-------------+------------+
| Column      |   Type     |
+-------------+------------+
| N           | INTEGER    |
| P           | INTEGER    |
+-------------+------------+

N represents the value of a node in Binary Tree, and P is the parent of N.
Write a query to find the node type of Binary Tree ordered by the value of the node.

Root : Node that represents the beginning of the tree
Leaf : Node that represents the end of a tree branch
Inner: Node that's neither leaf or root node
*/

--Solution

SELECT b.n, CASE WHEN b.p IS NULL THEN 'Root'
           WHEN b.n in (SELECT DISTINCT b2.p FROM bst AS b2 WHERE b2.p IS NOT NULL) THEN 'Inner'
           ELSE 'Leaf' END
FROM bst AS b
ORDER BY b.n
