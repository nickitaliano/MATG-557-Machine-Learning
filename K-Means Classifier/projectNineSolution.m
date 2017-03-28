clear
clc
load('Data2D.mat')
load('Data3D.mat')
% Machine Learning. Manhattan College. DeBonis. Project 9.
% i. Write the code for K-Means.
%test
xdata = X
k=2
showplot='on'
labeled=kmeans( xdata, k, showplot )
% ii. Apply K-Means clustering to the features collected in Project # 7
xdata = Y
k=2
labeled = kmeanscluster( xdata, k, showplot )
% iii. The goal is to separate Users and Administrators. iv. Use k=2
