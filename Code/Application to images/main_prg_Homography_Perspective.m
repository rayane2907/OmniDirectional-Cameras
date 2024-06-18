clear all;
close all;

%% Image 1
% Load and normalize the image 1
im1 = imread('IMG_1.jpg');
im1_grey = rgb2gray(im1);
figure(1);
imshow(im1_grey); hold on;

% Extract features from image 1 (4 points)
figure(1);
uv1 = zeros(3,4);
for i=1:4
    tmp = ginput(1);
    uv1(:,i) = [tmp'; 1];
    plot(uv1(1,i),uv1(2,i),'+y','LineWidth',2);
end;


%% image 2
% Load and normalize the image 2 
im2 = imread('IMG_2.jpg');
im2_grey = rgb2gray(im2);
figure(2);
imshow(im2_grey); hold on;

% Extract features from image 2 (4 points)
figure(2);
uv2 = zeros(3,4);
for i=1:4
    tmp = ginput(1);
    uv2(:,i) = [tmp'; 1];
    plot(uv2(1,i),uv2(2,i),'+y','LineWidth',2);
end;

%% Homography
%H = homography(uv1', uv2', 0);
H=homography_plan(uv2,uv1)


% test Homography 
% you can reload this part of the code many time as you
% want 
figure(1);
p1 = [ginput(1) 1]';
plot(p1(1),p1(2),'xg','LineWidth',2);

p2 = H*p1;
p2 = p2/p2(3);

figure(2);
plot(p2(1),p2(2),'xg','LineWidth',2);



