function [] = plot_EMT(beta_e_start, beta_e_end, beta_m_start,...
    beta_m_end, fig_numb)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plots the theoretical values of epsilon and mu vs. real part of beta_e
% example: Fig. 4 in Ref
%
% Ref: Lang Wang, Ilia L. Rasskazov, P. Scott Carney, "Clausius-Mossotti 
% relation revisited for media with electric and magnetic response"
%
% Lang Wang, 2020
% -------------------------------------------------------------------------
%                              INPUTS
%
% beta_e_start   -> start value of beta_e array
% beta_e_end     -> last value of beta_e array
% beta_m_start   -> start value of beta_m array
% beta_m_end     -> last value of beta_m array
% fig_numb       -> figure number of the plots
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beta_e = linspace(beta_e_start, beta_e_end, 1000);
beta_m = linspace(beta_m_start, beta_m_end, 1000);
[ep_theo_m, mu_theo_m] = GCM_m_branch(beta_e, beta_m);
[ep_theo_p, mu_theo_p] = GCM_p_branch(beta_e, beta_m);

figure(fig_numb)
subplot(2, 2, 1)
plot(real(beta_e) , real(ep_theo_m))
hold on
plot(real(beta_e) , real(ep_theo_p))
legend('- branch','+ branch')
xlabel('Re(\beta_e)')
ylabel('Re(\epsilon)')
subplot(2, 2, 3)
plot(real(beta_e) , imag(ep_theo_m))
hold on
plot(real(beta_e) , imag(ep_theo_p))
xlabel('Re(\beta_e)')
ylabel('Im(\epsilon)')
subplot(2, 2, 2)
plot(real(beta_e) , real(mu_theo_m))
hold on
plot(real(beta_e) , real(mu_theo_p))
xlabel('Re(\beta_e)')
ylabel('Re(\mu)')
subplot(2, 2, 4)
plot(real(beta_e) , imag(mu_theo_m))
hold on
plot(real(beta_e) , imag(mu_theo_p))
xlabel('Re(\beta_e)')
ylabel('Im(\mu)')

drawnow

end

