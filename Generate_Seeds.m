function [M,Seeds]=Generate_Seeds(rows,cols,k)
%% 初始化的种子点  借用SLIC 生成种子点
M=zeros(rows,cols);
S = sqrt(rows*cols / (k * sqrt(3)/2));
% Get nodes per row allowing a half column margin at one end that alternates
% from row to row
nodeCols = round(cols/S - 0.5);
% Given an integer number of nodes per row recompute S
S = cols/(nodeCols + 0.5);
% Get number of rows of nodes allowing 0.5 row margin top and bottom
nodeRows = round(rows/(sqrt(3)/2*S));
vSpacing = rows/nodeRows;
% Recompute k
k = nodeRows * nodeCols;
while nodeRows * nodeCols < k
      numRows = numRows + 1;
end
% Allocate memory and initialise clusters, labels and distances.
C = zeros(2,k);          % Cluster centre data  1:3 is mean Lab value,
% 4:5 is row, col of centre, 6 is No of pixels
U = -ones(rows, cols);   % Pixel labels. 最后所呈现的标签图像
l = inf(rows, cols);     % Pixel distances from cluster centres.  也可以是一个预存储空间问题
% Initialise clusters on a hexagonal grid
kk = 1;
r = vSpacing/2;
%% 没看
for ri = 1:nodeRows
    % Following code alternates the starting column for each row of grid
    % points to obtain a hexagonal pattern. Note S and vSpacing are kept
    % as doubles to prevent errors accumulating across the grid.
    if mod(ri,2),c = S/2; else, c = S;  end
    for ci = 1:nodeCols
        cc = round(c); rr = round(r);
        C(1:2, kk) = [cc; rr];
        M(rr,cc)=1;
        Seeds(kk, :) =[cc; rr];
        c = c+S;
        kk = kk+1;
    end
    r = r+vSpacing;
end
% figure,imshow(M,[]);
% figure,imshow(Cellules)
% Cellules=Cell;







