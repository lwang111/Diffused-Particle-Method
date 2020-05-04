function [] = plot_E_colormap(L, D2, E)
% This function plots the electric field in the middle plane of the cubic
% simulation region
figure
imagesc(-L/2:D2:L/2, -L/2:D2:L/2, real(E))
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

