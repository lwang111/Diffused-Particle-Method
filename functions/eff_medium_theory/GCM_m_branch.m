function [ep, mu] = GCM_m_branch(be, bm)
% This function returns the permittivity (epsilon) and permeability (mu)
% with the inputs beta_e and beta_m. The calculation is based on the
% "- branch" in the generalized Clausius-Mossotti relation.

gamma = be.^2 - 10.*be.*bm - 2.*be + bm.^2 - 2.*bm + 1;
ep = 0.5.* ( 1-be+bm - sqrt(gamma) ) ./ bm;
mu = 0.5.* ( 1-bm+be - sqrt(gamma) ) ./ be;

if bm==0
    ep = (2*be+1)/(1-be);
end
if be==0
    mu = (2*bm+1)/(1-bm);
end

end

