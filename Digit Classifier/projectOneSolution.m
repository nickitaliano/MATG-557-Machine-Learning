%% READ ME

% To Do: erase copyed work and label all script/function sections,compile 
% and format for portfolio 

% Current folder must be defaulted in order for functions to work and files
% to load the files named "Zero.mat" and "One.mat". "Change the filenames 
% if you've saved the files under different names. On some platforms, the 
% files might be saved as"-Dr. Debonis

%% Weekly Project #1 
% Date: Feb. 24, 2016
% Author: Nick Italiano

% Summary:
% This script highlights Object Classification, fundametal to Machine Learning.
% The methods is applied to images belonging to of the MNIST dataset. We created
% a program that extracts the Two best (subjective) features - from (1) dataset containing
% images of only Zeros, and (1) dataset containing images of only Ones- which, 
% when successfully done, results in (2)classes being separated.

% Description:
% The objective is to produce a program that extracts two features and
% classifies the data into two distinct classes. The MNIST data contains images 
% of handwritten Zero's and One's. The results are plotted to convey how
% well our two extracted features split the image data into (2) classes. 
% The histograms included show the distribution of values plotted for each
% feature.

% Note: 
% The more skewed distributions per extraction lead to better
% class seperation based on features.Classes may not be entirely spearable.
% This script is a solution and not a tutorial.


clear 
clc
% Solution:
% • Files Necessary: Zero.mat, One.mat
% – Each file contains a matrix where each row is a single digit of length 784 = 28 × 28
% – Express each row as a 28 × 28 matrix of greyscale values from 0 to 255.
% Let’s name this matrix M
% – To view the image type “imshow(M,[0,255])”

% Load Images
load('Zero.mat')
load('One.mat') 

% View Images
Rz =(Zero(1,:));
Ro =(One(1,:));
Mo = createMNISTArray(Ro);
Mz = createMNISTArray(Rz);

figure 
subplot(1,2,1)
imshow(Mz,[0,255]);
title('Zero Image')
subplot(1,2,2)
imshow(Mo,[0,255]);
title('One Image')


% • Write code to perform the following operations:
% i. Read in each matrix
% ii. Extract two features from each matrix.
% iii. Plot the resulting two dimensional feature points (zeros colored red andC ones colored green).
% iv. Try to separate the two classes as much as possible (you may not be able to completely separate
% them).
% v. If not satisfied, then extract different features.

% First feature extraction 
PCz=[];

for i=1:size(Zero,1);
    Rz =(Zero(i,:));
    Mz = createMNISTArray(Rz);
    PerCovz = sectionCount(Mz);
    PerCovz2 = sectionCountWrtZero(Mz);
    PCz = [PCz;PerCovz PerCovz2];
    
end

% Second feature extraction
PCo=[];
for j=1:size(One,1);
    Ro =(One(j,:));
    Mo = createMNISTArray(Ro);
    PerCovo = sectionCount(Mo);
    PerCovo2 = sectionCountWrtZero(Mo);
    
    PCo = [PCo;PerCovo PerCovo2];
    

end

%Features plotted against one another
figure
plot(PCo(:,1),PCo(:,2),'or');
hold on
plot(PCz(:,1),PCz(:,2),'.g');
dim = [.5 .6 .2 .3];
str = 'Orange Ones, Green Zeros';
annotation('textbox',dim,'String',str,'FitBoxToText','on');
title('Two Best Features')
% Histograms of the values extracted by the features
figure
subplot(2,2,1)
hist(PCz(:,1))
title('Zero Image(feature 1)')
subplot(2,2,2)
hist(PCo(:,1))
dim = [.595 .695 .1 .2];
str = 'High skew indicated better separation';
annotation('textbox',dim,'String',str,'FitBoxToText','on');
title('One Image(feature 1)')
subplot(2,2,3)
hist(PCz(:,2))
title('Zero Image(feature 2)')
subplot(2,2,4)
hist(PCo(:,2))
title('One Image(feature 2)')


