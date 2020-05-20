function [ r ] = cube_mesh(ax, ay, az, dr)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generates 3D mesh in a cube
%
% Lang Wang, 2020
% -------------------------------------------------------------------------
%                              INPUTS
%
% ax             -> side length in x
% ay             -> side length in y
% az             -> side length in z
% dr             -> distance between neighbor mesh nodes
%
% -------------------------------------------------------------------------
%                              OUTPUTS
%
% r              -> 3D locations of mesh nodes
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x= (-ax/2+dr/2):dr:(ax/2-dr/2);
y= (-ay/2+dr/2):dr:(ay/2-dr/2);
z= (-az/2+dr/2):dr:(az/2-dr/2);
[X,Y,Z] = meshgrid(x,y,z);

[mX,nX,pX] = size(X);
X1d = reshape(X, [1 mX*nX*pX]);
Y1d = reshape(Y, [1 mX*nX*pX]);
Z1d = reshape(Z, [1 mX*nX*pX]);

r=[X1d; Y1d; Z1d];

end

