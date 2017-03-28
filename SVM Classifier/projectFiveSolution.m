clear
clc
% *(data not separable)
% load('PCz.mat')
% load('PCo.mat')
load('C1.mat')
load('C0.mat')
% Machine Learning. Manhattan College. DeBonis. Project 5.
% i. Write code for SVM
% ii. Apply SVM to the features collected in Project # 1, however if your 
% data is not separated then apply the SVM to the data provided in Project 2.
% iii. Plot the feature points and the LDF

[m, b] = svm_classifier(C1,C0)