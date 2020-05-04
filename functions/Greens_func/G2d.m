function [G] = G2d(k0, rs, rt)
% 2D Green's function, 
% k0 = wave#, rs = source location, rt = target location.

G=1i/4*besselh(0,1,k0*abs(rs-rt));

end

