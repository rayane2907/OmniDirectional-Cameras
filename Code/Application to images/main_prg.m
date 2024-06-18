% Camera paramaters
K= [425.19303  0       692.86729;  
	0      424.86463  572.11922; 
	0      0       1];
csi=0.98754;

% Load and normalize the reference image
tmp1=imread('images/Im_R0_T0.pgm') ;
img1=double(tmp1(:,:,1));
I1=img1/max(img1(:));

% Generate the spherical reference image
% .. call your function taking as argement the loaded image I1, the
% calibration matrix K, the miror parameter csi and the size of the
% spherical image N and M.
% The function return the spherical image Is
%....USE the function ImToSphere.................................
%.....................................


% use the showing function with spherical option 
% The function is provided.
yashow(Is1,'Spheric'); colormap gray; hold on;
