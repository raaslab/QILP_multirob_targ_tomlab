



% mat_targ_100_2_tomlab = zeros(20,5); % rob 10 20 30 40 50  instance 20 each
% mat_targ_100_4_tomlab = zeros(20,5);
% mat_targ_100_8_tomlab = zeros(20,5);
% 
% % 
% mat_targ_200_2_tomlab = zeros(20,5); % rob 20 40 60 80 100 instance 20 
% mat_targ_200_4_tomlab = zeros(20,5);
% mat_targ_200_8_tomlab = zeros(20,5);
% 
% mat_targ_800_2_tomlab = zeros(20,5); % rob 10 50 100 200 500 instace 20 
% mat_targ_800_4_tomlab = zeros(20,5); 
% mat_targ_800_8_tomlab = zeros(20,5); 
% 
% 
% 
% mat_time_100_2_tomlab = zeros(20,5); % rob 10 20 30 40 50  instance 20 each
% mat_time_100_4_tomlab = zeros(20,5);
% mat_time_100_8_tomlab = zeros(20,5);
% 
% % 
% mat_time_200_2_tomlab = zeros(20,5); % rob 20 40 60 80 100 instance 20 
% mat_time_200_4_tomlab = zeros(20,5);
% mat_time_200_8_tomlab = zeros(20,5);
% 
% mat_time_800_2_tomlab = zeros(20,5); % rob 10 50 100 200 500 instace 20 
% mat_time_800_4_tomlab = zeros(20,5); 
% mat_time_800_8_tomlab = zeros(20,5); 

mat_targ_50_2_tomlab = zeros(20,5); % rob [4 8 12 16 20]; instace 20 each
mat_targ_50_4_tomlab = zeros(20,5); 
mat_targ_50_8_tomlab = zeros(20,5); 

mat_time_50_2_tomlab = zeros(20,5); % rob [4 8 12 16 20]; instace 20 each
mat_time_50_4_tomlab = zeros(20,5); 
mat_time_50_8_tomlab = zeros(20,5); 

% % 
% fold_100_nam = './cases/t100/';
% rob_row = [10 20 30 40 50];
% deg_ree_row = [2 4 8];
% for deg_ree = deg_ree_row
%     for rob = rob_row
%         for ins = 1:20
%             deg_fold = sprintf('t100d%d/', deg_ree);
%             last_fold = sprintf('%d_100_%d/', rob, deg_ree);
%             file_nam = sprintf('output_%d.mat', ins);
%             matfile_nam = [fold_100_nam deg_fold last_fold file_nam];
%             load(matfile_nam, 'Result');
%             mat_targ_tomlab_nam = sprintf('mat_targ_100_%d_tomlab', deg_ree);
%             mat_time_tomlab_nam = sprintf('mat_time_100_%d_tomlab', deg_ree);
%             eval([mat_targ_tomlab_nam '(ins, find(rob_row==rob)) = -Result.f_k;']);
%             eval([mat_time_tomlab_nam '(ins, find(rob_row==rob)) = Result.REALtime;']);
%         end
%     end
% end
% 
% 
% fold_200_nam = './cases/t200/';
% rob_row = [20 40 60 80 100];
% deg_ree_row = [2 4 8];
% for deg_ree = deg_ree_row
%     for rob = rob_row
%         for ins = 1:20
%             deg_fold = sprintf('t200d%d/', deg_ree);
%             last_fold = sprintf('%d_200_%d/', rob, deg_ree);
%             file_nam = sprintf('output_%d.mat', ins);
%             matfile_nam = [fold_200_nam deg_fold last_fold file_nam];
%             load(matfile_nam, 'Result');
%             mat_targ_tomlab_nam = sprintf('mat_targ_200_%d_tomlab', deg_ree);
%             mat_time_tomlab_nam = sprintf('mat_time_200_%d_tomlab', deg_ree);
%             eval([mat_targ_tomlab_nam '(ins, find(rob_row==rob)) = -Result.f_k;']);
%             eval([mat_time_tomlab_nam '(ins, find(rob_row==rob)) = Result.REALtime;']);
%         end
%     end
% end



fold_50_nam = './cases/t50/';
rob_row = [4 8 12 16 20];
deg_ree_row = [2 4 8];
for deg_ree = deg_ree_row
    for rob = rob_row
        for ins = 1:20
            deg_fold = sprintf('t50d%d/', deg_ree);
            last_fold = sprintf('%d_50_%d/', rob, deg_ree);
            file_nam = sprintf('output_%d.mat', ins);
            matfile_nam = [fold_50_nam deg_fold last_fold file_nam];
            load(matfile_nam, 'Result');
            mat_targ_tomlab_nam = sprintf('mat_targ_50_%d_tomlab', deg_ree);
            mat_time_tomlab_nam = sprintf('mat_time_50_%d_tomlab', deg_ree);
            eval([mat_targ_tomlab_nam '(ins, find(rob_row==rob)) = -Result.f_k;']);
            eval([mat_time_tomlab_nam '(ins, find(rob_row==rob)) = Result.REALtime;']);
        end
    end
end