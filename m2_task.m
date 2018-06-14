% all tasks including reconstruction and classification
% 2018-06-12

clear,clc;

load sInfo.mat;

n=(nRho+nS*nP)*4;
fprintf('The number of tasks: %d. \n\n',n);
para_worker(nPar);
parfor i=1:n
    para_task(i);
end
