function [ total_num_primitive, actual_ave_targ_deg_round, A, C] =...
    planned_generator_func( num_robot,  num_primitive, num_target, ave_target_degree)
%PLANNED_GENERATOR_FUNC Summary of this function goes here
%   Detailed explanation goes here
    num_instances = 1; % Number of instances you want to make with this configuration.
    actual_ave_targ_deg_round = 0; % At this moment this is not considered yet.
    
    total_num_primitive = num_robot * num_primitive;
    primitive_start = num_robot + 1;
    target_start = num_robot + total_num_primitive + 1;
    total_num_nodes = num_robot + total_num_primitive + num_target;
    G_generated = graph;
    still_connected = 1;
    % Recursively generate output files.
    for num = 1:num_instances

        G = zeros(total_num_nodes);
        A(1:num_robot,1:total_num_primitive) = 0;
        C(1:num_target,1:total_num_primitive) = 0;

        % Upper part of the graph generation. (Deterministic graph)
        for i = 1:num_robot
            for j = (i-1)*num_primitive+primitive_start:i*num_primitive+primitive_start-1
                G(i,j) = 1;
                G(j,i) = 1;
            end
        end

        G_generated = graph(G);
        rng('shuffle');
        tot_target = total_num_nodes - target_start +1;

        % add primitve to target edges

        for (p = primitive_start:primitive_start+total_num_primitive-1)
            % Pick any targets randomly.
            target_selected = randi([target_start total_num_nodes],1);
            if(~findedge(G_generated, target_selected, p))  
                   G_generated = addedge(G_generated, target_selected, p, 1);
            end

        end


        for (t = target_start:total_num_nodes)

           % Pick any motion primitives randomly.
            primitive_selected = randi([primitive_start target_start-1],1);


            if(~findedge(G_generated, t, primitive_selected))  
                   G_generated = addedge(G_generated, t, primitive_selected, 1);
            end

        end



        %plot(G_generated);

        rng('shuffle');
        con_comp = conncomp(G_generated);
        if(length(unique(con_comp))>1)
            for (cyc = 1:length(unique(con_comp)))

                cyc_cur_tar = target_start+find(con_comp(target_start:total_num_nodes) == cyc)-1;
                rand_tar = randi([1 length(cyc_cur_tar)], 1);
                target_selected = cyc_cur_tar(rand_tar);

                if(cyc == length(unique(con_comp)))
                    cyc_next_prim = primitive_start + find(con_comp(primitive_start:primitive_start + total_num_primitive - 1) == 1) -1;
                    rand_prim = randi([1 length(cyc_next_prim)], 1);
                    primitive_selected = cyc_next_prim(rand_prim);
                else
                    cyc_next_prim = primitive_start + find(con_comp(primitive_start:primitive_start + total_num_primitive - 1) == cyc+1) -1;
                    rand_prim = randi([1 length(cyc_next_prim)], 1);
                    primitive_selected = cyc_next_prim(rand_prim);
                end
                if(~findedge(G_generated, target_selected, primitive_selected)) 
                    G_generated = addedge(G_generated, target_selected, primitive_selected, 1);
                end
            end
        end


        %plot(G_generated);

        % Lower part of the graph generation. (Randomness applied)
        % this will never be used as we are making the graph conneted in the
        % previous step
        while (size(unique(conncomp(G_generated)), 2) ~= 1)

            % Pick any targets randomly.
            target_selected = randi([target_start total_num_nodes],1);

            % Pick any motion primitives randomly.
            primitive_selected = randi([primitive_start target_start-1],1);

            % Add edge to the graph.
            if(~findedge(G_generated, target_selected, primitive_selected))  
                   G_generated = addedge(G_generated, target_selected, primitive_selected, 1);
            end

        end
        %plot(G_generated);
        degree_tar = sum(degree(G_generated,target_start:total_num_nodes));
        while(degree_tar/tot_target < ave_target_degree)
            degree_tar = sum(degree(G_generated,target_start:total_num_nodes));

            % Pick any targets randomly.
            target_selected = randi([target_start total_num_nodes],1);

            % Pick any motion primitives randomly.
            primitive_selected = randi([primitive_start target_start-1],1);

            % Add edge to the graph.

            if(~findedge(G_generated, target_selected, primitive_selected))  
               G_generated = addedge(G_generated, target_selected, primitive_selected, 1);
            end


        end

        degree_tar = sum(degree(G_generated,target_start:total_num_nodes));
        actual_ave_targ_deg_round = (degree_tar/tot_target);
        % Plot a graph instance for debugging. (Note that this does not draw a nice three layered graph as you expect.)
        % plot(G_generated);
        G = adjacency(G_generated);
        G = full(G);
        % Generate A_{p,r} and C_{p,t} for output files.
        [row_a, col_a] = find(triu(G(1:target_start-1,1:target_start-1)) == 1);
        for i = 1:size(row_a,1)
            if row_a(i) < primitive_start
                A(row_a(i),col_a(i)-primitive_start+1) = 1;
            end
        end

        [row_b, col_b] = find(tril(G) == 1);
        for i = 1:size(row_b,1)
            if row_b(i) >= target_start
                C(row_b(i)-target_start+1,col_b(i)-primitive_start+1) = 1;
            end
        end


    end

    
end

