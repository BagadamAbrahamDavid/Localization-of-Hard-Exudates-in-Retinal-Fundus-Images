%--- this is the code for the implementation of 
%--- 
clc;
clear all;
close all;
addpath('support');
cd IMAGES_NW
%%%% step1 Reading the input sirce image
I=uigetfile('.png','select the source image');
I=imread(I);
I=imresize(I,[512 512]);
cd ..
figure,imshow(I);title('INPUT SOURCE IMAGE');
%%% step2 extracting the green channel component
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
figure,imshow(G);title('GREEN CHANNEL COMPONENT');
%---apply  eqn (1) morphological closing operation for removing blobs
se=strel('disk',5);           
C=imbothat(G,se);
figure,imshow(C,[]);title('FUNDUS REGION AFTER APPLYING MORPHOLOGICAL BOTTOM HAT');
%----------------------------------------------------
se=strel('disk',8);           
H=imtophat(G,se);
figure,imshow(H,[]);title('FUNDUS REGION AFTER APPLYING MORPHOLOGICAL TOP HAT');
tmp=im2bw(H-C,.2);
figure,imshow(I);hold on;
u=contour(tmp,'b');


