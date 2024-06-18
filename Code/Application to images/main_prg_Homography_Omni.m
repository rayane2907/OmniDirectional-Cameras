clear all;
close all;

% Camera paramaters
K= [425.19303  0       692.86729;  
	0      424.86463  572.11922; 
	0      0       1];
csi=0.98754;
Bw=2*512;


%% Image 1
% Load and normalize the image 1
tmp=imread('images/Im_R0_T0.pgm') ;
img=double(tmp(:,:,1));
I1=img/max(img(:));
figure(1);
imshow(I1); hold on;

% Extract features from image 1 (4 point)
figure(1);
uv1 = zeros(3,4);
for i=1:4
    tmp = ginput(1);
    uv1(:,i) = [tmp'; 1];
    plot(uv1(1,i),uv1(2,i),'+y','LineWidth',2);
end;
% warp the image point in pixel to the spherical point
% First, you have to warp the pixelic coordinates to the normalized one
% using the calibration matrix
% The, you can use the function inv_omniproj provided in Tools folder
% ... code goes here
% ...................................
% ...................................

% Generate the spherical image
[Is1,phi_vec,theta_vec]=ImToSphere(I1,K,csi,Bw,1);

% draw Spherical point onto the spherical image 
figure(3);
yashow(Is1,'Spheric'); colormap gray; hold on;
plot3(Is1(1,:),Is1(2,:),Is1(3,:),'+y', 'LineWidth',2);



%% image 2
% Load and normalize the image 2
tmp=imread('images/Im_R45_T0.pgm') ;
img=double(tmp(:,:,1));
I2=img/max(img(:));
figure(2);
imshow(I2); hold on;

% Extract features from image 1
figure(2);
uv2 = zeros(3,4);
for i=1:4
    tmp = ginput(1);
    uv2(:,i) = [tmp'; 1];
    plot(uv2(1,i),uv2(2,i),'+y','LineWidth',2);
end;
% Do the same job as before (as done in the image 1)

% Generate the spherical image
[Is2,phi_vec,theta_vec]=ImToSphere(I2,K,csi,Bw,1);

% draw Spherical point onto the spherical image
figure(4);
yashow(Is2,'Spheric'); colormap gray; hold on;
plot3(Is2(1,:),Is2(2,:),Is2(3,:),'+y', 'LineWidth',2);


%% Homography
% compute the homography matrix using the spherical points rather than 2D
% image point used for perspective images
% .... code goes here
% .................................

% test Homography
figure(1);
p1 = [ginput(1) 1]';
plot(p1(1),p1(2),'xg','LineWidth',2);

% generate the corresponding spherical point s1
% .... the code goes here
% ...............................
% ...............................
% plot the spherical point onto the spherical image
figure(3);
plot3(s1(1,:),s1(2,:),s1(3,:),'xg', 'LineWidth',2);

% warp s1 to s2 through the homography matrix
% ... code goes here
% ...................

% Note that when s1 is warped onto the second spherical image, two
% antipodal points are obtaied. Indeed, s2 and -s2 satisfied both the homographic relationship  
% first spherical point
s2 = s2/norm(s2);
x2 = omniproj(s2, csi);
p2 = K*x2;
figure(2);
plot(p2(1),p2(2),'+g','LineWidth',2);
% antipodal point
x2 = omniproj(-s2, csi);
p2 = K*x2;
figure(2);
plot(p2(1),p2(2),'og','LineWidth',2);

figure(4);
plot3(s2(1,:),s2(2,:),s2(3,:),'xg', 'LineWidth',2);
plot3(-s2(1,:),-s2(2,:),-s2(3,:),'og', 'LineWidth',2);