function [G] = G2d(k0, rs, ro)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calculates the 2D Green's function
%
% Lang Wang, 2020
% -------------------------------------------------------------------------
%                              INPUTS
%
% k0             -> free-space wave number
% rs             -> 3D location of the source
% rt             -> 3D location of the observing point
%
% -------------------------------------------------------------------------
%                              OUTPUTS
%
% G              -> value of the Green's function
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

G=1i/4*besselh(0,1,k0*abs(rs-ro));

end

