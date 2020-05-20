function [] = plot_E_colormap(L, D2, E)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plots the electric field in the middle plane of the simulation region
% example: Fig. 1 and Fig. 4 in Ref
%
% Ref: Lang Wang, Ilia L. Rasskazov, P. Scott Carney, "Diffused particle
% method for calculating the multiple scattering of electromagnetic dipoles
% to extract the effective refractive index"
%
% Lang Wang, 2020
% -------------------------------------------------------------------------
%                              INPUTS
%
% L              -> side length of the cubic simulation region
% D2             -> side length of the lv2 voxel
% E              -> electric field distributed in the middle plane
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
imagesc(-L/2:D2:L/2, -L/2:D2:L/2, real(E.'))
set(gca,'YDir','normal')
colormap jet
caxis([-0.5*max(max(E)) 0.5*max(max(E))])
colorbar
axis equal
axis([-L/2 L/2 -L/2 L/2])
title('E_{simu}-E_{plane}')
xlabel('y/\lambda') 
ylabel('z/\lambda') 
end

