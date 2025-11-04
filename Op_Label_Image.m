function [fs]=Op_Label_Image(f,L)
%fs is the result of segmentation, center_p is the center pixel of each
%areas
% f is the original image
% s2 is the segmented image using waterhsed transformation
%% 修正L，如果L中存在0，则需依据局部信息去掉
f=double(f);
num_area=max(max(L)); %The number of segmented areas
Num_p=zeros(num_area,1);
Alab = f;
fs=f;
pixel_idx = label2idx(L);
center_p=zeros(num_area,1); %各个区域的中值点，聚类中心点
N=size(setdiff(unique(L(:)), 0),1);
Ln = numel(L);

if size(f,3)<2
    for k = 1:N
        idx = pixel_idx{k};  %第一个超像素里的位置
        center_p(k,1) = median(Alab(idx)); %像素的均值来代替
        fs(idx) = median(Alab(idx)); %像素的均值来代替
        Num_p(k)=size(idx,1);
    end
    fs=uint8(fs);
    %% Color image
else
    for k = 1:N
        idx = pixel_idx{k};  %第一个超像素里的位置
        center_p(k,1) = mean(Alab(idx)); %像素的均值来代替
        center_p(k,2) = mean(Alab(idx+Ln));  %第2层median
        center_p(k,3)= mean(Alab(idx+2*Ln));  %第3层median
        
        fs(idx) = mean(Alab(idx)); %像素的均值来代替
        fs(idx+Ln) = mean(Alab(idx+Ln));  %第2层
        fs(idx+2*Ln) = mean(Alab(idx+2*Ln));  %第3层
        Num_p(k)=size(idx,1);
    end
    fs=uint8(fs);
end