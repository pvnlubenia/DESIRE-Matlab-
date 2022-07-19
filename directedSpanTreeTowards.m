% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%                                                                           %
%    directedSpanTreeTowards                                                %
%                                                                           %
%                                                                           %
% OUTPUT: Returns the reactions of the given directed graph and the         %
%    reactions of the directed spanning trees rooted at the indicated       %
%    vertex. The spanning trees are towards the root. If there are no       %
%    directed spanning trees towards the indicated root vertex, only the    %
%    given digraph will be shown. Furthermore, there is no output variable. %
%    The function automatically generates the spanning tree.                %
%                                                                           %
% INPUTS:                                                                   %
%    - G: directed graph (generated using the class graph_.m) with          %
%         property root_vertex already identified and edges added using     %
%         the class addEdge                                                 %
%    - r: root vertex of G where the spanning trees will be generated       %
%         towards to                                                        %
%                                                                           %
% Note: This uses the same algorithm for directedSpanTreeAway but the       %
%    edges of the given graph are reversed first, then edges of the         %
%    spanning tree generated away from a root are reversed again.           %
%                                                                           %
% Reference: Gabow H and Meyers E (1978) Finding all spanning trees of      %
%    and undirected graphs. SIAM J Comput 7(3):280-287.                     %
%    https://doi.org/10.1137/0207024                                        %
%                                                                           %
% Created: 22 June 2022                                                     %
% Last Modified: 19 July 2022                                               %
%                                                                           %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %



function directedSpanTreeTowards(G, r)

    % Print out digraph G
    fprintf('\n  GIVEN \n\n');
    G.displayGraph();

    % Initialize reversed edges
    reverse_edge = cell(1, G.V);
    
    % Reverse the edges
    for i = 1:G.V
        for j = 1:length(G.edge{i})
            reverse_edge{G.edge{i}(j)}(end+1) = i;
        end
    end
    
    % Replace the edges of G
    G.edge = reverse_edge;

    % Root vertex where the spanning trees will come from
    G.root_vertex = r;

    % Initialize subtree for spanning tree generation
    T = graph_(G.V);

    % Initialize latest spanning tree found
    L = graph_(G.V);

    % Initialize list of all edges directed from vertices in T to vertices not in T
    F = [ ];

    % Initialize count of spanning trees rooted at G.root_vertex
    spanTreeCount = 0;
    
    % Initialize F to contain all edges from the root vertex
    % Go through each vertex to which the root vertex is connected to
    for i = 1:length(G.edge{G.root_vertex})
    
        % Insert at the beginning of F each edge from the root vertex
        F = [edge(G.root_vertex, G.edge{G.root_vertex}(i)), F];
    end
    
    % Generate spanning trees
    grow(G.V, G, T, L, F, spanTreeCount);

end










% % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % %
% %                                                 % %
% % The following function is used in the algorithm % %
% %                                                 % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % %

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%                                                                                                                 %
% Function: grow                                                                                                  %
%                                                                                                                 %
%    - Purpose: To generate the spanning trees away from the root vertex                                          %
%    - Inputs                                                                                                     %
%         - V: number of vertices in the graph                                                                    %
%         - G: given digraph                                                                                      %
%         - T: subtree for spanning tree generation                                                               %
%         - L: latest spanning tree found                                                                         %
%         - F: list of all edges directed from vertices in T to vertices not in T                                 %
%         - spanTreeCount: number of spanning trees                                                               %
%    - Outputs                                                                                                    %
%         - spanTreeCount: count of spanning trees rooted at G.root_vertex                                        %
%         - Automatically shows the reactions of each spanning tree                                               %
%    - Used in                                                                                                    %
%         - directedSpanTreeAway                                                                                  %
%    - Notes                                                                                                      %
%         - The function uses the class edge.m                                                                    %
%         - This function was converted from Python to Matlab                                                     %
%         - Python code can be found in https://github.com/ricelink/finding-all-spanning-trees-in-directed-graph  %
%                                                                                                                 %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
 
function spanTreeCount = grow(V, G, T, L, F, spanTreeCount)

    %
    % Step 1: Make sure the root vertex of the subgraphs are the same as that of the main graph
    %

    T.root_vertex = G.root_vertex;
    L.root_vertex = G.root_vertex;



    %
    % Step 2: Check if subtree T already contains all the vertices
    %

    if T.connectedVertices == V

        % If yes, then T becomes L, the latest spanning tree found
        % We deepcopy T to L
        L.V = T.V;
        L.root_vertex = T.root_vertex;
        L.edge = T.edge;
        L.time = T.time;
        L.vertex = T.vertex;

        % Initialize the reversed back edges
        reverse_edge_back = cell(1, V);
        
        % Reverse back the edges
        for i = 1:V
            for j = 1:length(L.edge{i})
                reverse_edge_back{L.edge{i}(j)}(end+1) = i;
            end
        end
        
        % Replace the edges of L
        L.edge = reverse_edge_back;

        % Add 1 to the count of spanning trees
        spanTreeCount = spanTreeCount + 1;

        % Print the spanning tree L
        fprintf(['\n  SPANNING TREE ', num2str(spanTreeCount), ' (Root: Vertex ', num2str(L.root_vertex), ') \n\n']);
        L.displayGraph();
        
        % Visit all the vertices of L
        L.depthFirstSearch(L.root_vertex);
    else



    %
    % Step 3: % Initialize FF, a list of edges
    %

        FF = [ ];



    %
    % Step 4: Repeat
    %

        % Run the following block of codes until it breaks
        while true
    


    %
    % Step 5: Pop an edge e from F
    %

            % If F is not empty, pop an edge e from F
            if ~isempty(F)
    
                % Get the first element of F (an edge)
                e = F(1);
    
                % Remove the first element from F
                F(1) = [ ];
            else
    
                % If F is empty, then the function ends
%                 disp('F is empty.');
                return
            end
    
            % Get the ending node of edge e
            % This vertex v is not yet in T
            v = e.to_node;
    


    %
    % Step 6: Add edge e to T
    %
            
            T.addEdge(e.from_node, v);



    %
    % Step 7: Push each edge (v, w), where w is NOT in T, onto F
    %

            % Deepcopy F to F_copy
            F_copy = [ ];
            F_copy = F(:)';
    
            % Push each edge (v, w), where w is NOT in T, onto F
            % Go through each vertex to which vertex v is connected to
            for i = 1:length(G.edge{v})
    
                % Get each ending node
                w = G.edge{v}(i);
    
                % If vertex w is not a vertex of any edge in T
                if T.connectedVertex(w) == 0
    
                    % Insert the edge at the beginning of F
                    F = [edge(v, w), F];
                end
            end
            


    %
    % Step 8: Remove each edge (w, v), where w IS in T, from F
    %

            % Go through each vertex w
            for w = 1:length(G.edge)
    
                % If vertex w is a vertex of an edge in T
                if T.connectedVertex(w) == 1
    
                    % Initialize checker if w -> v exists in T
                    w_to_v = [ ];
    
                    % Go through each vertex to which vertex w is connected to
                    for j = 1:length(G.edge{w})
    
                        % If vertex w is connected to vertex v
                        if G.edge{w}(j) == v
    
                            % Append (i.e., place at the end) the index of v to the checker
                            w_to_v = [w_to_v, j];
                        end
                    end
    
                    % If there is w -> v in T
                    if ~isempty(w_to_v)
    
                        % Initialize checker of location of w -> v in F
                        w_to_v_loc = [ ];
    
                        % Go through each element of F
                        for j = 1:length(F)
    
                            % Look for the location of w -> v in F
                            if (F(j).from_node == w) & (F(j).to_node == v)
    
                                % Append the index in F to the checker
                                w_to_v_loc = [w_to_v_loc, j];
                            end
                        end
    
                        % If w -> v is located in F
                        if ~isempty(w_to_v_loc)
    
                            % j decreases by 1 each step until it reaches 1
                            for j = length(w_to_v_loc):-1:1
                                
                                % Remove the w -> v from F
                                F(w_to_v_loc(j)) = [ ];
                            end
                        end
                    end
                end
            end
    


    %
    % Step 8: Recurse
    %

            spanTreeCount = grow(V, G, T, L, F, spanTreeCount);



    %
    % Step 9: Pop each edge (v, w), where w is NOT in T, from F and restore each edge (w, v), where w IS in T, in F
    %

            % Deepcopy F_copy to F
            F = F_copy(:)';



    %
    % Step 10: Remove e from T and G, and add e to FF
    %

            % Remove edge e from graphs T and G
            T.removeEdge(e.from_node, e.to_node);
            G.removeEdge(e.from_node, e.to_node);

            % Insert edge e at the beginning of FF
            FF = [e, FF];
    


    %
    % Step 11: Bridge Test
    %    - An edge e is a bridge if G\{e} is NOT connected
    %    - Check if there is an edge (w, v), where w is NOT a descendant of v in L
    %
    
            % Initialize b as true
            b = 1;
    
            % Go through each vertex
            for w = 1:length(G.edge)
    
                % Variable to check for an edge w -> v
                w_to_v = -1;
    
                % Go through each vertex to which vertex w is connected to
                for j = 1:length(G.edge{w})
    
                    % If vertex w is connected to vertex v
                    if G.edge{w}(j) == v
    
                        % j is the index of v s.t. w -> v
                        % This confirms that w is NOT a descendant of v
                        w_to_v = j;
                    end
                end

                % If w is NOT directly connected to v
                if w_to_v ~= -1

                    % Check if w is a descendant of any child of v in L
                    if ((L.vertex{v}.d < L.vertex{w}.d) & (L.vertex{w}.d < L.vertex{w}.f) & (L.vertex{w}.f < L.vertex{v}.f)) == 0
    
                        % Change b to 0 (i.e., the Bridge Test fails)
                        b = 0;
    
                        % Get out of the for-loop for w
                        break
                    end
                end
            end
    
            % If b is still 1 (i.e., the Bridge Test passes)
            if b == 1

                % Get out of the while-true loop
                break
            end
        end
    


    %
    % Step 12: Reconstruct G
    %    - Pop each edge e from FF
    %    - Push e onto F
    %    - Add e to G
    %

        while ~isempty(FF)
    
            % Get the first element of FF (an edge)
            e = FF(1);
    
            % Remove it from FF
            FF(1) = [ ];
    
            % Insert it at the beginning of F
            F = [e, F];
    
            % Add it to G
            G.addEdge(e.from_node, e.to_node);
        end
    end

end