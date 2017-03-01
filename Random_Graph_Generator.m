%Random_Graph_Generator
%Last modified 26th February 2017
%Matlab code by Yoonchang Sung yooncs8@vt.edu

%%%%%%% Output format (Text files) %%%%%%%
% The first line of a text file is the number of robots.
% The second line of a text file is the number of motion primitives per
% each robot.
% The third line of a text file is the total number of motion primitives.
% The fourth line of a text file is the number of targets.
% The fifth line of a text file is the average degree of motion primitive
% nodes.
% The sixth line of a text file is the average degree of target nodes.
% One empty line is added.
% Two matrices will be given. '0' in matrices means there is no edge
% between the corresponding nodes.
% First one is A_{p,r} where the column corresponds to motion primitive IDs
% and the row corresponds to robot IDs. This starts from eighth line to
% eight plus the number of robots line.
% One empty line is added.
% Second matrix is C_{p,t} where the column corresponds to motion primitive
% IDs and the row corresponds to target IDs.

clear all;
close all;
clc;

%% Inputs
num_robot = 50;
num_primitive = 2; % This corresponds to the number of motion primitives per robot.
num_target = 20;
ave_primitive_degree = 3; % At this moment this is not considered yet.
ave_target_degree = 3; % Only a degree of target nodes is considered.
num_instances = 1; % Number of instances you want to make with this configuration.

%% Algorithm

% Initialization
total_num_primitive = num_robot * num_primitive;
primitive_start = num_robot + 1;
target_start = num_robot + total_num_primitive + 1;
total_num_nodes = num_robot + total_num_primitive + num_target;

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
   
    
    
    % Lower part of the graph generation. (Randomness applied)
    
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

    % Plot a graph instance for debugging. (Note that this does not draw a nice three layered graph as you expect.)
   %  plot(G_generated);
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

    % Generate output files.
    filename = sprintf('output_%d.txt', num);
    fileID = fopen(filename,'w');
    fprintf(fileID,'%d\n',num_robot);
    fprintf(fileID,'%d\n',num_primitive);
    fprintf(fileID,'%d\n',total_num_primitive);
    fprintf(fileID,'%d\n',num_target);
    fprintf(fileID,'%d\n',ave_primitive_degree);
    fprintf(fileID,'%d\n',ave_target_degree);
    fprintf(fileID,'\n');
    fprintf(fileID, [repmat('%d ', 1, size(A,2)) '\n'], A');
    fprintf(fileID,'\n');
    fprintf(fileID, [repmat('%d ', 1, size(C,2)) '\n'], C');
    fclose(fileID);
end




