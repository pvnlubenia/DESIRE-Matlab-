=========================================================

  SPANTREE: directed SPANning TREEs of a directed graph

=========================================================

Matlab was used to develop the classes and functions used here.



=====================
Functions and Classes
=====================The function directed_span_tree returns the reactions of the given directed graph and the reactions of the directed spanning trees rooted at the indicated vertex. If there are no directed spanning trees from the indicated root vertex, only the given digraph will be shown. There is no output variable. The function automatically generates the spanning tree.

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

     2. grow (function)           - OUTPUT: Returns the spanning trees away from the root vertex. The output variable 'spanningTree' allows the user to view the count of spanning trees rooted at G.root_vertex
           - INPUTS
                - V: number of vertices in the graph
                - G: given digraph
                - T: subtree for spanning tree generation
                - L: latest spanning tree found
                - F: list of all edges directed from vertices in T to vertices not in T
                - spanningTree: number of spanning trees
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

     1. Make sure all 4 classes/function are in the same folder/path being used as the current working directory.

     2. The algorithm is based on [1].

     3. The classes and functions are converted from Python to Matlab. The Python code can be found in https://github.com/ricelink/finding-all-spanning-trees-in-directed-graph.



========
Examples
========

3 examples are included in this folder:

   - Example 1: A graph with 4 spanning trees rooted at vertex 1 [1]

   - Example 2: Generalized chemical reaction network of the Histidine Kinase Model [2]

   - Example 3: Subnetwork 1 of the insulin metabolic signaling network [3]



===================
Contact Information
===================

For questions, comments, and suggestions, feel free to contact me at pvnlubenia@yahoo.co.uk.


- Patrick Lubenia (4 July 2022)



==========
References
==========

   [1] Gabow H and Meyers E (1978) Finding all spanning trees of directed and undirected graphs. SIAM J Comput 7(3):280-287. https://doi.org/10.1137/0207024

   [2] Johnston M and Burton E (2019) Computing weakly reversible deficiency zero network translations using elementary flux modes. Bull Math Biol 81:1613-1644. https://doi.org/10.1007/s11538-019-00579-z

   [3] Lubenia P, Mendoza E, Lao A (2022) ﻿Reaction network analysis of metabolic insulin signaling (submitted) https://doi.org/10.48550/arXiv.2204.04614