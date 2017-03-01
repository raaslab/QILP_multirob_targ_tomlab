function [ Result ] = mutli_targ_prim_rob_qilp( num_robot, num_primitive, num_target, ave_target_degree, A, C)
    % input A and C represent packing and covering graph but A_ and c_
    % represent matrices for MIQP
    length_x = (num_primitive*num_robot + num_target*num_robot); % our decision variable
    c_    = zeros(1, length_x);  % check onenote for description
    Name = 'Multi Targ Prim Rob MIQP';
    
    F = zeros(length_x, length_x);
    cnt  = (num_primitive*num_robot +1);
    for t = 1:num_target
        for r = 1:num_robot
            mark_ind = ((r-1)*num_primitive+1); % useful variable to scissor out data from C, check onenote
            cur_C  = C(t, mark_ind:(mark_ind+num_primitive-1));
            F(mark_ind:mark_ind+length(cur_C)-1,cnt) = cur_C';
            cnt = cnt+1;
        end
    end
    
   [F_r, F_c] = size(F);
   F_sym = F' + F;
   F_sym(1:F_r+1:end) = diag(F);
   F = -F_sym;
    
    
    A_ = zeros(length_x, length_x);
    
    for r = 1:num_robot
        mark_ind = (r-1)*num_primitive+1;
        A_(r,mark_ind:mark_ind+num_primitive-1) = ones(1,num_primitive);
    end
    
    
    for t = 1:num_target
        mark_tr_ind = (t-1)*num_robot+1+num_robot*num_primitive;
        A_(num_robot+t,mark_tr_ind:mark_tr_ind+num_robot-1) = ones(1,num_robot);
    end
    
    b_L  = -Inf*ones(length_x,1);
    b_U  = ones(length_x,1);
    x_L  = zeros(length_x, 1);
    x_U  = ones(length_x, 1);

    % Defining all variables as integet
    IntVars   = ones(length_x, 1);

    % Assign routine for defining a MIQP problem.
    Prob = miqpAssign(F, c_, A_, b_L, b_U, x_L, x_U, [], ...
               IntVars, [], [], [], Name, [], []);

    % Calling driver routine tomRun to run the solver.
    % The 1 sets the print level after optimization.

    Result = tomRun('cplex', Prob, 1);
    %Result = tomRun('oqnlp', Prob, 1);
    %Result = tomRun('miqpBB', Prob, 1);
    %Result = tomRun('xpress-mp', Prob, 1);
    %Result = tomRun('minlpBB', Prob, 1);






end

