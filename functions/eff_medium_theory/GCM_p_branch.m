function [ep, mu] = GCM_p_branch(be, bm)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Computes theoretical ("+" branch) effective permittivity and permeabiity.
%
% Ref: Lang Wang, Ilia L. Rasskazov, P. Scott Carney, "Clausius-Mossotti 
% relation revisited for media with electric and magnetic response"
%
% Lang Wang, 2020
% -------------------------------------------------------------------------
%                              INPUTS
%
% be             -> beta_e: 4\pi/3 * electric polarizaibility density
% bm             -> beta_m: 4\pi/3 * magnetic polarizaibility density
%
% -------------------------------------------------------------------------
%                              OUTPUTS
%
% ep             -> effective permittivity
% mu             -> effective permeability
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

gamma = be.^2 - 10.*be.*bm - 2.*be + bm.^2 - 2.*bm + 1;
ep = 0.5.* ( 1-be+bm + sqrt(gamma) ) ./ bm;
mu = 0.5.* ( 1-bm+be + sqrt(gamma) ) ./ be;

end

