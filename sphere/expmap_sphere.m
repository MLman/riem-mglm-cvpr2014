function exp_x_y = expmap_sphere(x,y)
%EXPMAP_SPHERE maps a tangent vector y onto the unit sphere.
%
%    exp_x_y = EXPMAP_SPHERE(x,y)
%
%    x, exp_x_y are unit vectors.
%    y is a tangent vector.
%    
%   See also LOGMAP_SPHERE

%   $ Hyunwoo J. Kim $  $ 2016/09/21 07:30:49 (CDT) $

exp_x_y = cos(norm(y))*x+sin(norm(y))*y/zero2one(norm(y));
exp_x_y = exp_x_y/norm(exp_x_y);