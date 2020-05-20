function [ Mij_row ] = hier_grouping(L, D1, D2, dF)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generates the interation matrix Mij (diagram in Fig. 2 in Ref)
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
% D1             -> side length of the lv1 voxel
% D2             -> side length of the lv2 voxel
% dF             -> limit between near and far field
%
% -------------------------------------------------------------------------
%                              OUTPUTS
%
% Mij_row        -> the first row of Mij
%    Mij is a Toeplitz matrix. The first row contains all its information
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r1  = cube_mesh(L, D2, D2, D1);             % location of the Lv1 voxels
r2  = cube_mesh(L, D2, D2, D2);             % location of the Lv2 voxels
rM2 = cube_mesh(D2, 2*L-D2, 2*L-D2, D2);    % location of the M2 mesh

% Calculate M2(i,j)
M2  = zeros( 1, size(rM2,2) );
parfor i = 1:size(rM2, 2)
    if norm( rM2(:,i) ) > dF
        for j = 1:size(r2, 2)
            M2(i) = M2(i) + D2 * Gxx( r2(:,j),rM2(:,i) );
        end
    else
        for j = 1:size(r1, 2)
            M2(i) = M2(i) + D1^3/D2^2 * Gxx( r1(:,j),rM2(:,i) );
        end
    end
end
Mij_row = reshape( M2, [int32(2*L/D2-1) int32(2*L/D2-1)] );

end

