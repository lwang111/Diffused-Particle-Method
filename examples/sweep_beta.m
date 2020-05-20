close all;
clearvars; clc
addpath(genpath('../functions'));

% Inputs
k0 = 2*pi;                        % / lambda    |  wave number
rho= 4e10 / 4.2^3;                % / lambda^3  |  concentration of particles
Ys = 0.6;                         % * lambda    |  Y size of the sampling region
Zs = 0.3;                         % * lambda    |  Z size of the sampling region
Mij_case = 'load';                % 'generate' Mij by parameters, or 'load' example Mij
beta_e_sweep  = linspace(  0.6+0.06i,   2+0.2i,  6);
beta_m_sweep  = linspace(0.06+0.006i, 0.2+0.02i, 6);
alpha_e_sweep = beta_e_sweep *3/4/pi/rho;   % * lambda^3  |  electric polarizability
alpha_m_sweep = beta_m_sweep *3/4/pi/rho;   % * lambda^3  |  magnetic polarizability
n0 = 2+1i;                        % initial guess of refractive index n

plot_EMT( beta_e_sweep(1), beta_e_sweep(end), beta_m_sweep(1), beta_m_sweep(end), 100 )

% Calculate Mij
switch Mij_case
    case 'generate'
        L  = 2;                   % * lambda    |  side length of the cubic simulation region
        D1 = 0.001;               % * lambda    |  side length of a Lv1 voxel
        D2 = 0.01;                % * lambda    |  side length of a Lv2 voxel
        dF = 0.1;                 % * lambda    |  far field limit
        Mij_row = hier_grouping(L, D1, D2, dF);
        % save('example_Mij/Mij_exmpl2.mat', 'L', 'D1', 'D2', 'dF', 'Mij_row');
    case 'load'
        load('example_Mij/Mij_exmpl1'); 
        % 'Mij_exmpl1': L  = 4.2, D1 = 0.0015, D2 = 0.03, dF = 0.1
        % 'Mij_exmpl2': L  = 2  , D1 = 0.001 , D2 = 0.01, dF = 0.1
end

n   = zeros(1, size(alpha_e_sweep,2));
eta = zeros(1, size(alpha_e_sweep,2));
ep  = zeros(1, size(alpha_e_sweep,2));
mu  = zeros(1, size(alpha_e_sweep,2));
for i=1:size(alpha_e_sweep,2)
    [n(i), eta(i), E, K] = Iteration(Mij_row, k0, rho, alpha_e_sweep(i), alpha_m_sweep(i), L, D2, Ys, Zs, n0);
    ep(i) = n(i)/eta(i);
    mu(i) = n(i)*eta(i);
    plot_DPM(beta_e_sweep(i), ep(i), mu(i), 100)
end
