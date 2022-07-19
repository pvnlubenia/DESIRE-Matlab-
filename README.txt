===================================

  DESIRE: DirectEd SpannIng tREes

===================================

Matlab was used to develop the classes and functions used here.



=====================
Functions and Classes
=====================The function directedSpanTreeAway and directedSpanTreeTowards return the reactions of the given directed graph and the reactions of the directed spanning trees rooted at the indicated vertex, away from and towards the root, respectively. If there are no directed spanning trees from the indicated root vertex, only the given digraph will be shown. There is no output variable. The functions automatically generate the spanning trees, if they exist.

directed_span_tree uses the following classes and function:     1. graph_ (class)
           - OUTPUT: Returns a digraph with 'V' vertices and corresponding default properties. The edges of the digraph are equally weighted.
           - INPUT: V: number of vertices in the digraph
           - This class has 8 functions inside it:
                a. noKnownEdge: To check if the edge we are trying to add is NOT YET recorded
                b. addEdge: To add an edge to the digraph
                c. removeEdge: To remove an edge from the digraph
                d. connectedVertex: To check if a vertex is a node of any edge
                e. connectedVertices: To check how many vertices of the graph are connected (but does not indicated number of components)
                f. depthFirstSearch: To try to go through each vertex starting with vertex v, then determine its parent vertex
                g. displayGraph: To display the edges of the graph
                h. plotGraph: To plot the graph

     2. grow (function)           - OUTPUT: Returns the spanning trees away from the root vertex. The output variable 'spanTreeCount' allows the user to view the count of spanning trees rooted at G.root_vertex
           - INPUTS
                - V: number of vertices in the graph
                - G: given digraph
                - T: subtree for spanning tree generation
                - L: latest spanning tree found
                - F: list of all edges directed from vertices in T to vertices not in T
                - spanTreeCount: number of spanning trees
     3. edge (class; used in graph_ and grow)           - OUTPUT: Returns a directed edge with indicated starting and ending vertex numbers. It adds a directed edge from 'from_node' to 'to_node' to a directed graph created using the class graph_.
           - INPUTS
                - from_node: starting vertex number (natural number)
                - to_node: ending vertex number (natural number)
     4. vertex (class; used in graph_)
           - OUTPUT: Returns a digraph with 'V' vertices and corresponding default properties.
           - INPUT: V: number of vertices in the digraph



=====
Notes
=====

   1. directedSpanTreeTowards uses the same algorithm for directedSpanTreeAway but the edges of the given graph are reversed first, then edges of the spanning tree generated away from a root are reversed again.

   2. Make sure all 4 classes/function are in the same folder/path being used as the current working directory.

   3. The algorithm is based on [2].

   4. The classes and functions are converted from Python to Matlab. The Python code can be found in https://github.com/ricelink/finding-all-spanning-trees-in-directed-graph.



========
Examples
========

5 examples are included in this folder (the first 3 use directedSpanTreeAway while the last 2 use directedSpanTreeTowards):

   - Example 1: A graph with 4 spanning trees rooted at vertex 1 [2]

   - Example 2 and 4: 7-state model of conformational changes that a ribosome can undergo during the elongation stage of translation [1]

   - Example 3 and 5: A graph that has no spanning tree [3]



===================
Contact Information
===================

For questions, comments, and suggestions, feel free to contact me at pvnlubenia@yahoo.co.uk.


- Patrick Lubenia (19 July 2022)



==========
References
==========

   [1] Dutta A, Schutz G, Chowdhury D (2020) Stochastic thermodynamics and modes of operation of ribosome: A network theoretic perspective. Phys Rev E 101(3):1-28. https://doi.org/10.1103/PhysRevE.101.032402

   [2] Gabow H and Meyers E (1978) Finding all spanning trees of directed and undirected graphs. SIAM J Comput 7(3):280-287. https://doi.org/10.1137/0207024

   [3] Liu B, Lu W, Chen T (2015) Consensus in continuous-time multiagent systems under discontinuous nonlinear protocols. IEEE Trans Neural Netw Learn Syst 26(2):290-301. https://doi.org/10.1109/TNNLS.2014.2314699