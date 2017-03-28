
% READ ME:

%TODO: make project 1 features converge, compile and format for portfolio


%% Weekly Project #3
% Date: Aprl. 7, 2016
% Author: Nick Italiano

% Summary:
%MSE and special case MSE Fisher LDF coded in MATLAB

% Description: 
%MSE LDF and special case MSE Fisher LDF use marginal vector b with an augmented
% feature vector yielding an equation of a plane. Solution does not
%converge with non-separable data; need linearly seperable data for
%procedure to yield weights


% Note: 
% There is no class example provided for this solution.

% Comment: MSE and Special case MSE (Fisher) yeilded similiar results; both
% methods classified 99.99% of the data correctly

 
%Solution:
% i. Write code for MSE (with b = 1 and the b used for Fisher)
% ii. Apply the MSE to the features collected in Project # 1
% iii. Plot the feature points and the LDF
% iv. Determine the percentage of data points which were properly classified.


clear
clc
%load separable data
load('C0.mat')
load('C1.mat')

% augment feature space
New_C0 =[ones(size(C0,1),1) , C0]; 
New_C1 =[ones(size(C1,1),1) , C1]; 
Neww_C1 = -1.*New_C1;
C = [New_C0; Neww_C1];


%create marginal vectors for b-- b1(first case) and b2 (FisherLDF special case)
%a)MSE LDF 
b1 = [ones(size(C,1),1)];

% b)FisherLDF 
n0=size(C0,1);
n1=size(C1,1);
n = n0+n1;

b2 = [];
for i = 1: ((size(C,1))/2)
    b = [n/n0 ; n/n1];
    b2 = [b2;b];
    
end

% Solve system by taking inverse or pseduoinverse because we have infinitley 
% many solutions for this over detemined system( reference conditons below
%-- not based on svd)

%Conditions:
% A= pinv(C)
% C*(A*C) = C
% A*(C*A) = A
% %%
% %C*A is hermitian
% %A*C is hermitian

%MSE LDF 
z =  pinv(C)*b1;

%FisherLDF 
a = pinv(C)*b2;


% Calculate percentage of data points classified correctly

%MSE LDF 
zT = transpose(z)
x=0
for i = 1:size(C,1)
        if dot(zT,C(i,:)) <= 0 
            x = x+1
        end
end
percClassCorrMSE=1-(x/size(C,1))

%FisherLDF 
aT = transpose(a);
y=0
for i = 1:size(C,1)
        if dot(aT,C(i,:)) <= 0 
            y = y+1
        end
end
p2=y/size(C,1)
percClassCorrMSEFisher=1-p2


% Create plottable function for both solutions
syms x                                     % use MATLAB's symbolic expressions 
fo = (z(1,1) + z(2,1).*x )/ (-1.*z(3,1)) % solving for y "algebraically" 
pretty(fo)                                 % nice output

syms x                                      
fi = (a(1,1) + a(2,1).*x )/ (-1.*a(3,1))  
pretty(fi)                                 

figure
% Feature points with LDF and plot symbolic expression (b1)
subplot(1,2,1)
P1 = plot(C0(:,1),C0(:,2),'or');
hold on 
P2 = plot(C1(:,1),C1(:,2),'.g');
hold on
legend ([P1 P2], 'class c0','class c1')

ezplot(fo,[0,15])
title('Plot of feature points with the MSE LDF');
xlabel('0 < x < 15');
ylabel('feature points and LDF values');

% Feature points with LDF and plot symbolic expression for fisher (b2)
subplot(1,2,2)
P3 = plot(C0(:,1),C0(:,2),'or');
hold on 
P4 = plot(C1(:,1),C1(:,2),'.g');
hold on
legend ([P3 P4], 'class c0','class c1')

ezplot(fi,[0,15])
title('Plot of feature points with the Fisher LDF');
xlabel('0 < x < 15');
ylabel('feature points and LDF values');


hold off

