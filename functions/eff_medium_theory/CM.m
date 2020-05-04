function [ ep, mu ] = CM( be, bm )
% This function returns permittivity (epsilon) and permeability (mu) with
% inputs of beta_e and beta_m. The calculation is based on the Clausius-
% Mossotti relation and Poision's equation.

ep=(1+2*be)./(1-be);
mu=(1+2*bm)./(1-bm);

end

