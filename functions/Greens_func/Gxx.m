function [G] = Gxx(r1,r2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calculates the xx component of the 3D Green's function * 4*pi*k0^2
%
% Ref: https://journals.aps.org/prb/pdf/10.1103/PhysRevB.82.045404
%
% Lang Wang, 2020
% -------------------------------------------------------------------------
%                              INPUTS
%
% rs             -> 3D location of the source
% rt             -> 3D location of the observing point
%
% -------------------------------------------------------------------------
%                              OUTPUTS
%
% G              -> value of the xx component of the Green's function
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

k0 = 2*pi;

R    = r1 - r2;
R0   = norm(R);
eg   = R./R0;
egeg = eg*(eg.');
G    = k0^2*exp(1i*2*pi*R0)*( (1/R0 + 1i/2/pi/R0^2-1/(2*pi)^2/R0^3) + (-1/R0-3i/(2*pi)/R0^2+3/(2*pi)^2/R0^3)*egeg(1) );
%G    =  (-1/R0-3i/(2*pi)/R0^2+3/(2*pi)^2/R0^3)*egeg(1,2) ;

end

