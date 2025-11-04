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
    
elseif SNR==2
    %% Salinas_corrected
    load('.\Dataset\Salinas Dataset\Salinas scene\Salinas_corrected.mat');
    img=salinas_corrected;
    load('.\Dataset\Salinas Dataset\Salinas scene\Salinas_gt.mat');
    img_gt=salinas_gt;
    cluster_n=17;
    numSuperpixels =500;
    compactness =10;
    Alpha=1;
elseif SNR==3
    load('.\Dataset\Pavia University Dataset\PaviaU.mat');
    img=paviaU;
    load('.\Dataset\Pavia University Dataset\PaviaU_gt.mat');
    img_gt=paviaU_gt;
    numSuperpixels =50;  %超像素数量 参考50
    cluster_n=10;
    compactness =8;       %紧凑度参数
    Alpha=1;
end

%% SAFCM
tic
[obj_fcn]=SAFCM(img,img_gt,numSuperpixels,compactness,cluster_n,Alpha);
toc

%% Objective Function
figure,plot(obj_fcn,'Color', 'b','LineWidth',3)
ylabel('Objective function')
xlabel('Number of iterations')
grid on
set(gca,'FontSize',13)