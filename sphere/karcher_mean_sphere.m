function xbar = karcher_mean_sphere(X, W, niter,varargin)
%KARCHER_MEAN_SPHERE calculates the intrinsic mean with weight W on SPD manifolds.
%
%   xbar = KARCHER_MEAN_SPHERE(X, [], niter)
%   xbar = KARCHER_MEAN_SPHERE(X, W, niter)
%
%   W is weights.
%   X is a set of points on the unit sphere.
%   xbar is the Karcher mean of X.
%   niter is the maximum iterations.
%
%   See also LOGMAP_SPHERE, EXPMAP_SPHERE

%   Hyunwoo J. Kim
%   $Revision: 0.1 $  $Date: 2014/06/23 15:20:53 $

%xbar = X(:,1);
xbar = mean(X,2);
xbar = xbar/norm(xbar);

if isempty(W)
   W = ones(size(X,2),1)/size(X,2);
else
   W = W/norm(W,1);
end
if nargin==4
    th = varargin{1};
else
    th = 1e-10;
end
for iter = 1:niter
    phi = logmap_vecs_sphere(xbar,X)*W;
    xbar = expmap_sphere(xbar, phi);
    if phi < th
        break
    end
end