%function DEMO_karcher_mean_sphere
%
%   $ Hyunwoo J. Kim $  $ 2016/09/21 07:30:49 (CDT) $

clear;
addpath(genpath(pwd));
disp('Start.');

seed = randi(1000);
rng(seed);
synth_sphere_data   
nsamples = size(Y,2);
Ybar = karcher_mean_sphere(Y,[],5000,10-5);
Ybar_euc = mean(Y,2);
Ybar_euc = Ybar_euc/norm(Ybar_euc);

Em = gsqerr_sphere(Y, repmat(Ybar,1,nsamples));
Eeuc = gsqerr_sphere(Y, repmat(Ybar_euc,1,nsamples));

fprintf('Error of intrinsic mean : %f \n',Em);
fprintf('Error of Euclidean mean : %f \n',Eeuc);