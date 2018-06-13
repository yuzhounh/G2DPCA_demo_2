function para_task(i)
% stack the tasks for parallel computing
% 2018-06-13

load sInfo.mat;

fprintf('Beginning the %04dth task...... \n',i);
nCompleted=length(dir('result/*.mat'));
nTotal=(nRho+nS*nP)*4;
ratio=nCompleted/nTotal;
fprintf('The tasks have completed: %d/%d (%0.2f%%).\n\n',nCompleted,nTotal,ratio*100);

m=0;

% classification

n=m+nRho;
if m<i && i<=n
    iRho=i-m;
    if ~exist(sprintf('result/classify_RSPCA_%s_iRho%d.mat',FaceDB,iRho),'file')
        classify_RSPCA(iRho);
    end
end
m=n;

n=m+nRho;
if m<i && i<=n
    iRho=i-m;
    if ~exist(sprintf('result/classify_PCA2DL1S_%s_iRho%d.mat',FaceDB,iRho),'file')
        classify_PCA2DL1S(iRho);
    end
end
m=n;

n=m+nS*nP;
if m<i && i<=n
    iTmp=i-m;
    iS=floor((iTmp-1)/nP)+1;
    iP=iTmp-(iS-1)*nP;
    if ~exist(sprintf('result/classify_GPCA_%s_iS%d_iP%d.mat',FaceDB,iS,iP),'file')
        classify_GPCA(iS,iP);
    end
end
m=n;

n=m+nS*nP;
if m<i && i<=n
    iTmp=i-m;
    iS=floor((iTmp-1)/nP)+1;
    iP=iTmp-(iS-1)*nP;
    if ~exist(sprintf('result/classify_G2DPCA_%s_iS%d_iP%d.mat',FaceDB,iS,iP),'file')
        classify_G2DPCA(iS,iP);
    end
end
m=n;

% reconstruction

n=m+nRho;
if m<i && i<=n
    iRho=i-m;
    if ~exist(sprintf('result/reco_RSPCA_%s_iRho%d.mat',FaceDB,iRho),'file')
        reco_RSPCA(iRho);
    end
end
m=n;

n=m+nRho;
if m<i && i<=n
    iRho=i-m;
    if ~exist(sprintf('result/reco_PCA2DL1S_%s_iRho%d.mat',FaceDB,iRho),'file')
        reco_PCA2DL1S(iRho);
    end
end
m=n;

n=m+nS*nP;
if m<i && i<=n
    iTmp=i-m;
    iS=floor((iTmp-1)/nP)+1;
    iP=iTmp-(iS-1)*nP;
    if ~exist(sprintf('result/reco_GPCA_%s_iS%d_iP%d.mat',FaceDB,iS,iP),'file')
        reco_GPCA(iS,iP);
    end
end
m=n;

n=m+nS*nP;
if m<i && i<=n
    iTmp=i-m;
    iS=floor((iTmp-1)/nP)+1;
    iP=iTmp-(iS-1)*nP;
    if ~exist(sprintf('result/reco_G2DPCA_%s_iS%d_iP%d.mat',FaceDB,iS,iP),'file')
        reco_G2DPCA(iS,iP);
    end
end
m=n;
