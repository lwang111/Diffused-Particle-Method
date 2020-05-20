close all;
clearvars; clc
addpath(genpath('../functions'));

% Inputs
k0 = 2*pi;                        % / lambda    |  wave number
rho     = 4e10 / 4.2^3;           % / lambda^3  |  concentration of particles
alpha_e = 1.12e-10+1.04e-11i;     % * lambda^3  |  electric polarizability
alpha_m = 4.47e-11+1.42e-12i;     % * lambda^3  |  magnetic polarizability
Ys =0.2;                          % * lambda    |  Y size of the sampling region
Zs =0.1;                          % * lambda    |  Z size of the sampling region
Mij_case = 'load';                % 'generate' Mij by parameters, or 'load' example Mij
n0 = 1;                           % initial guess of refractive index n

%Mij_row=0;L=0;D2=0;D1=0;dF=0;
% Calculate Mij

%switch Mij_case
%    case 'generate'
        L  = 4.2;                 % * lambda    |  side length of the cubic simulation region
        D1 = 0.0015;              % * lambda    |  side length of a Lv1 voxel
        D2 = 0.03;                % * lambda    |  side length of a Lv2 voxel
        dF = 0.1;                 % * lambda    |  far field limit
        Mij_row = hier_grouping(L, D1, D2, dF);
%        save('example_Mij/Mij_exmpl1.mat', 'L', 'D1', 'D2', 'dF', 'Mij_row');
switch Mij_case
    case 'load'
        Mij_load = load('example_Mij/Mij_exmpl1'); % 'Mij_exmpl1': L  = 4.2, D1 = 0.0015, D2 = 0.03, dF = 0.1
end

% Iteratively calculate n, eta and E
[n, eta, E, K] = Iteration(Mij_row, k0, rho, alpha_e, alpha_m, L, D2, Ys, Zs, n0);

% Plot the difference between the simulated field and the field of planewave: E - E_plane
E_pl = repmat( E(ceil(end/2),1)*exp(1i*n*k0*(0:D2:L-D2)), int32(L/D2), 1); % electric field of the planewave
plot_E_colormap(L, D2, real(E-E_pl)/abs(E(ceil(end/2),1)) );