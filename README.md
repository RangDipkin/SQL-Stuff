SQL-Stuff
=========

dijkstra.sql  -- Given some table called 'graph' which represents an undirected, weighted graph; this algorithm reads 
                 some vertex as a parameter, then calculates the shortest path to every other vertex on the graph.
                 It then outputs every vertex on the graph along with its total path distance into a table called 
                 'paths'. Make sure that the 'graph' table follows this format: 
                 (vertex1 integer, vertex2 integer, weight double).

leaves.sql    -- Given some tree called 'tree', this algorithm reads some node as a parameter, then inserts all edges
                 which are linked to that node or descendants of that node into a table called 'tc'.  Make sure that 'tree' follows this format: 
                 (parent integer, child integer).

mark.sql      -- Given some tree called 'tree', and the root as a parameter. This algorithm does a breadth-first search through the tree, and 
                 creates a table called 'depth_marks' with every node along with its depth.
                 Make sure that 'tree' follows the format:
                 (parent integer, child integer).

max_occur.sql --
