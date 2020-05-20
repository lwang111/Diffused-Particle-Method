function [n, eta, E, i] = Iteration(Mij_row, k0, rho, alpha_e, alpha_m,...
    L, D2, Ys, Zs, n0)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The iteration of the diffused particle method (diagram in Fig. 3 in Ref)
%
% Ref: Lang Wang, Ilia L. Rasskazov, P. Scott Carney, "Diffused particle
% method for calculating the multiple scattering of electromagnetic dipoles
% to extract the effective refractive index"
%
% Lang Wang, 2020
% -------------------------------------------------------------------------
%                              INPUTS
%
% Mij_row        -> The first row of matrix Mij
% k0             -> free-space wave number
% rho            -> concentration of particles
% alpha_e        -> electric polarizaibility of the particles
% alpha_m        -> magnetic polarizaibility of the particles
% L              -> side length of the cubic simulation region
% D2             -> side length of the lv2 voxel
% Ys             -> Y size of the field-sampling rectangle (Fig. 4 in Ref)
% Zs             -> Z size of the field-sampling rectangle (Fig. 4 in Ref)
% n0             -> initial guess of the refractive index
%
% -------------------------------------------------------------------------
%                              OUTPUTS
%
% n              -> refractive index
% eta            -> relative wave impedance
% E              -> electric field distributed in the middle plane
% i              -> number of iterations before reaching convergence
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate the Toeplix matrix M(i,j) by its first row
[X,Y]  = meshgrid(1:int32(L/D2), 1:int32(L/D2));
indexM = [reshape(X, [1 int32(L^2/D2^2)]);reshape(Y, [1 int32(L^2/D2^2)])];
M      = zeros( int32(L^2/D2^2), int32(L^2/D2^2) );
for i = 1:size(indexM, 2)
    for j = 1:size(indexM, 2)
        M(i,j) = Mij_row( int32(L/D2)+indexM(1,i)-indexM(1,j),...
            int32(L/D2)+indexM(2,i)-indexM(2,j) );
    end
end
rM = cube_mesh(D2, L, L, D2);   % * lambda  |  location of the M mesh

n  = n0;
Ei = exp(1i*k0*rM(3,:)).';   % incident field

ni = zeros(1,40);
for i = 1:40
    fprintf('n(%d) = %f%+fi\n',i,real(n),imag(n));
    ni(i) = n;
    eta = ( alpha_e-alpha_m+...
        sqrt((alpha_m-alpha_e)^2+4*alpha_e*alpha_m*n^2 ))/( 2*alpha_e*n );
    E_1d  = ( eye(size(M)) - D2^2*(rho*alpha_e+rho*alpha_m*n/eta)*M )\Ei;
    E  = reshape( E_1d, [int16(L/D2) int16(L/D2)] );
    Es=E(int16((L-Ys)/2/D2:(L+Ys)/2/D2),1:int16(Zs/D2));
    Esz=mean(Es);
    Esz_amp=abs(Esz);
    bE_amp=D2.*(0:size(Esz_amp,2)-1).'...
        \(log(abs(Esz_amp))-log(abs(Esz_amp(1)))).';
    Esz_ang=unwrap(angle(Esz));
    bE_ang=D2.*(0:size(Esz_amp,2)-1).'\(Esz_ang-Esz_ang(1)).';
    n=( bE_ang/2/pi-1i*bE_amp/2/pi );
    if abs(ni(i)-n)/abs(ni(i))<0.001
        break
    end
end
if i == 40
    disp('Iteration does not converge.')
end

E  = reshape( E_1d, [int16(L/D2) int16(L/D2)] );

end

