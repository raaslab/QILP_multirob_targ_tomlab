
txt_targ_100_2_tomlab = zeros(20,5); % rob 10 20 30 40 50  instance 20 each
txt_targ_100_4_tomlab = zeros(20,5);
txt_targ_100_8_tomlab = zeros(20,5);


txt_targ_200_2_tomlab = zeros(20,5); % rob 10 20 30 40 50  instance 20 each
txt_targ_200_4_tomlab = zeros(20,5);
txt_targ_200_8_tomlab = zeros(20,5);


txt_targ_50_2_tomlab = zeros(20,5); % rob 10 20 30 40 50  instance 20 each
txt_targ_50_4_tomlab = zeros(20,5);
txt_targ_50_8_tomlab = zeros(20,5);

fold_nam = './cases/saved_data/output/t100/';
rob_row = [10 20 30 40 50];
deg_ree_row = [2 4 8];
for deg_ree = deg_ree_row
    for rob = rob_row
        
        deg_fold = sprintf('t100d%d/', deg_ree);
        last_fold = sprintf('%d_100_%d/', rob, deg_ree);
        file_nam = 'output.txt';
        txtfile_nam = [fold_nam deg_fold last_fold file_nam];

        fileID = fopen(txtfile_nam,'r');
        formatSpec = '%d %d';
        size_loc = [2 Inf];
        loc = fscanf(fileID,formatSpec,size_loc);
        loc = loc';
        loc = [loc;zeros(20-length(loc), 2)];
        txt_targ_tomlab_nam = sprintf('txt_targ_100_%d_tomlab', deg_ree);
        eval([txt_targ_tomlab_nam '(:, find(rob_row==rob)) = loc(:,2);']);
           
        
    end
end


fold_nam = './cases/saved_data/output/t200/';
rob_row = [20 40 60 80 100];
deg_ree_row = [2 4 8];
for deg_ree = deg_ree_row
    for rob = rob_row
        
        deg_fold = sprintf('t200d%d/', deg_ree);
        last_fold = sprintf('%d_200_%d/', rob, deg_ree);
        file_nam = 'output.txt';
        txtfile_nam = [fold_nam deg_fold last_fold file_nam];

        fileID = fopen(txtfile_nam,'r');
        formatSpec = '%d %d';
        size_loc = [2 Inf];
        loc = fscanf(fileID,formatSpec,size_loc);
        loc = loc';
        loc = [loc;zeros(20-length(loc), 2)];
        txt_targ_tomlab_nam = sprintf('txt_targ_200_%d_tomlab', deg_ree);
        eval([txt_targ_tomlab_nam '(:, find(rob_row==rob)) = loc(:,2);']);
           
        
    end
end


fold_nam = './cases/saved_data/output/t50/';
rob_row = [4 8 12 16 20];
deg_ree_row = [2 4 8];
for deg_ree = deg_ree_row
    for rob = rob_row
        
        deg_fold = sprintf('t50d%d/', deg_ree);
        last_fold = sprintf('%d_50_%d/', rob, deg_ree);
        file_nam = 'output.txt';
        txtfile_nam = [fold_nam deg_fold last_fold file_nam];

        fileID = fopen(txtfile_nam,'r');
        formatSpec = '%d %d';
        size_loc = [2 Inf];
        loc = fscanf(fileID,formatSpec,size_loc);
        loc = loc';
        loc = [loc;zeros(20-length(loc), 2)];
        txt_targ_tomlab_nam = sprintf('txt_targ_50_%d_tomlab', deg_ree);
        eval([txt_targ_tomlab_nam '(:, find(rob_row==rob)) = loc(:,2);']);
           
        
    end
end

