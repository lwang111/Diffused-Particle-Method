function [] = plot_DPM(beta_e,ep,mu,fig_numb)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plots the simulated values of epsilon and mu by diffused particle method
% example: Fig. 4 in Ref
%
% Ref: Lang Wang, Ilia L. Rasskazov, P. Scott Carney, "Clausius-Mossotti 
% relation revisited for media with electric and magnetic response"
%
% Lang Wang, 2020
% -------------------------------------------------------------------------
%                              INPUTS
%
% beta_e         -> 4\pi/3 * electric polarizaibility density
% ep             -> simulated effective permittivity
% mu             -> simulated effective permeability
% fig_numb       -> figure number of the plots
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(fig_numb)
subplot(2, 2, 1)
plot(real(beta_e), real(ep),'o')

subplot(2, 2, 3)
plot(real(beta_e), imag(ep),'o')

subplot(2, 2, 2)
plot(real(beta_e), real(mu),'o')

subplot(2, 2, 4)
plot(real(beta_e), imag(mu),'o')
drawnow
end

