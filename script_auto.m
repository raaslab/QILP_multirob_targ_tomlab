%%%%%%% Output format (Text files) %%%%%%%
% The first line of a text file is the number of robots.
% The second line of a text file is the number of motion primitives per
% each robot.
% The third line of a text file is the total number of motion primitives.
% The fourth line of a text file is the number of targets.
% The fifth line of a text file is the actual average degree of motion
% target nodes in the generated graph.
% The sixth line of a text file is the average degree of target nodes required.
% One empty line is added.
% Two matrices will be given. '0' in matrices means there is no edge
% between the corresponding nodes.
% First one is A_{p,r} where the column corresponds to motion primitive IDs
% and the row corresponds to robot IDs. This starts from eighth line to
% eight plus the number of robots line.
% One empty line is added.
% Second matrix is C_{p,t} where the column corresponds to motion primitive
% IDs and the row corresponds to target IDs.

    num_robot = 4;
    num_primitive = 2; % This corresponds to the number of motion primitives per robot.
    num_target = 50;
    actual_ave_targ_deg_round = 0; % At this moment this is not considered yet.
    ave_target_degree = 4; % Only a degree of target nodes is considered.
    num_instances = 20; % Number of instances you want to make with this configuration.


for ave_target_degree = [2 4 8]
    for num_robot = [4 8 12 16 20]


        for num = 1:num_instances



            [total_num_primitive, actual_ave_targ_deg_round, A ,C] =...
                            planned_generator_func( num_robot,  num_primitive, num_target, ave_target_degree);


            fold_nam = sprintf('./cases/%d_%d_%d/', num_robot, num_target, ave_target_degree);

            mkdir(fold_nam);
            % Generate output files.
            filename = [fold_nam sprintf('output_%d.txt', num)];
            fileID = fopen(filename,'w');
            fprintf(fileID,'%d\n',num_robot);
            fprintf(fileID,'%d\n',num_primitive);
            fprintf(fileID,'%d\n',total_num_primitive);
            fprintf(fileID,'%d\n',num_target);
            fprintf(fileID,'%d\n',actual_ave_targ_deg_round);
            fprintf(fileID,'%d\n',ave_target_degree);
            fprintf(fileID,'\n');
            fprintf(fileID, [repmat('%d ', 1, size(A,2)) '\n'], A');
            fprintf(fileID,'\n');
            fprintf(fileID, [repmat('%d ', 1, size(C,2)) '\n'], C');
            fclose(fileID);

            [ Result ] = mutli_targ_prim_rob_qilp( num_robot, num_primitive, num_target, ave_target_degree, A, C);

            mat_nam = [fold_nam  sprintf('output_%d.mat', num)];

            save(mat_nam, '-v7.3'); 
        end
    end
end
