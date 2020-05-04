function [r] = ran_cube(X, Y, Z, n)
% Generate n random locations

r = [-X/2+X*rand(1, n); -Y/2+Y*rand(1, n); -Z/2+Z*rand(1, n)];

