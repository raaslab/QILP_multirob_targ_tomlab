%t50 ashish + yoon data
%%
rob_row_50 = [4 8 12 16 20];


% degree2 
mean_mat_targ_50_2_tomlab = mean(mat_targ_50_2_tomlab(1:10,:),1);
minbar = mean_mat_targ_50_2_tomlab(1:end)- min(mat_targ_50_2_tomlab(1:10,:),[],1);
maxbar = mean_mat_targ_50_2_tomlab(1:end)- max(mat_targ_50_2_tomlab(1:10,:),[],1);

figure(122); hold on;

errorbar(rob_row_50(1:end),mean_mat_targ_50_2_tomlab, minbar, maxbar, ':*b');

% degree4
mean_mat_targ_50_4_tomlab = mean(mat_targ_50_4_tomlab(1:10,:),1);
minbar = mean_mat_targ_50_4_tomlab(1:end)- min(mat_targ_50_4_tomlab(1:10,:),[],1);
maxbar = mean_mat_targ_50_4_tomlab(1:end)- max(mat_targ_50_4_tomlab(1:10,:),[],1);

figure(122); hold on;

errorbar(rob_row_50(1:end),mean_mat_targ_50_4_tomlab, minbar, maxbar, '--+m');

% degree8 

mean_mat_targ_50_8_tomlab = mean(mat_targ_50_8_tomlab(1:10,:),1);
minbar = mean_mat_targ_50_8_tomlab(1:end)- min(mat_targ_50_8_tomlab(1:10,:),[],1);
maxbar = mean_mat_targ_50_8_tomlab(1:end)- max(mat_targ_50_8_tomlab(1:10,:),[],1);

figure(122); hold on;

errorbar(rob_row_50(1:end),mean_mat_targ_50_8_tomlab, minbar, maxbar, '-ok');


%%

%t50 100 200 degree 2


%t50
mean_mat_targ_50_2_tomlab = mean(mat_targ_50_2_tomlab(1:10,:),1);
minbar = mean_mat_targ_50_2_tomlab(1:end)- min(mat_targ_50_2_tomlab(1:10,:),[],1);
maxbar = mean_mat_targ_50_2_tomlab(1:end)- max(mat_targ_50_2_tomlab(1:10,:),[],1);

figure(123); hold on;

errorbar([1:5],mean_mat_targ_50_2_tomlab, minbar, maxbar, ':*b');

mean_txt_targ_50_2_tomlab = mean(txt_targ_50_2_tomlab(1:10,:),1);
minbar = mean_txt_targ_50_2_tomlab(1:end)- min(txt_targ_50_2_tomlab(1:10,:),[],1);
maxbar = mean_txt_targ_50_2_tomlab(1:end)- max(txt_targ_50_2_tomlab(1:10,:),[],1);

figure(123); hold on;

errorbar([1:5],mean_txt_targ_50_2_tomlab, minbar, maxbar, '-ok');

%t100

mean_mat_targ_100_2_tomlab = mean(mat_targ_100_2_tomlab(1:10,:),1);
minbar = mean_mat_targ_100_2_tomlab(1:end)- min(mat_targ_100_2_tomlab(1:10,:),[],1);
maxbar = mean_mat_targ_100_2_tomlab(1:end)- max(mat_targ_100_2_tomlab(1:10,:),[],1);

figure(123); hold on;

errorbar([1:5],mean_mat_targ_100_2_tomlab, minbar, maxbar, ':*b');

mean_txt_targ_100_2_tomlab = mean(txt_targ_100_2_tomlab(1:10,:),1);
minbar = mean_txt_targ_100_2_tomlab(1:end)- min(txt_targ_100_2_tomlab(1:10,:),[],1);
maxbar = mean_txt_targ_100_2_tomlab(1:end)- max(txt_targ_100_2_tomlab(1:10,:),[],1);

figure(123); hold on;

errorbar([1:5],mean_txt_targ_100_2_tomlab, minbar, maxbar, '-ok');

%t200
mean_mat_targ_200_2_tomlab = mean(mat_targ_200_2_tomlab(1:10,:),1);
minbar = mean_mat_targ_200_2_tomlab(1:end)- min(mat_targ_200_2_tomlab(1:10,:),[],1);
maxbar = mean_mat_targ_200_2_tomlab(1:end)- max(mat_targ_200_2_tomlab(1:10,:),[],1);

figure(123); hold on;

errorbar([1:5],mean_mat_targ_200_2_tomlab, minbar, maxbar, ':*b');

mean_txt_targ_200_2_tomlab = mean(txt_targ_200_2_tomlab(1:10,:),1);
minbar = mean_txt_targ_200_2_tomlab(1:end)- min(txt_targ_200_2_tomlab(1:10,:),[],1);
maxbar = mean_txt_targ_200_2_tomlab(1:end)- max(txt_targ_200_2_tomlab(1:10,:),[],1);

figure(123); hold on;

errorbar([1:5],mean_txt_targ_200_2_tomlab, minbar, maxbar, '-ok');