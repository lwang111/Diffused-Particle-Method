function [r] = ran_cube(X, Y, Z, n)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generates random 3D locations in a cube
%
% Lang Wang, 2020
% -------------------------------------------------------------------------
%                              INPUTS
%
% X              -> x side length of the cube
% Y              -> y side length of the cube
% Z              -> z side length of the cube
% n              -> number of locations
%
% -------------------------------------------------------------------------
%                              OUTPUTS
%
% r              -> random 3D locations
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r = [-X/2+X*rand(1, n); -Y/2+Y*rand(1, n); -Z/2+Z*rand(1, n)];

