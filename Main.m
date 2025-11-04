close all
clear all
clear addpath
warning off
%% Load data
SNR=1;
if SNR==1
    %% Indian_pines_corrected
    load('.\Dataset\Indian Pines Dataset\Indian_pines_corrected.mat');
    img=indian_pines_corrected;
    load('.\Dataset\Indian Pines Dataset\Indian_pines_gt.mat');
    img_gt=indian_pines_gt;
    cluster_n=17;
    numSuperpixels =50;
    compactness =10;
    Alpha=1;
end

%% SAFCM
tic
[obj_fcn]=SAFCM(img,img_gt,numSuperpixels,compactness,cluster_n,Alpha);
toc

