function [ ep, mu ] = CM( be, bm )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Computes permittivity and permeabiity by the Clausius-Mossotti relation
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

ep=(1+2*be)./(1-be);
mu=(1+2*bm)./(1-bm);

end

