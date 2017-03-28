


%% Weekly Project #2 
% Date: Mar. 18, 2016
% Author: Nick Italiano

% Summary:
%perceptron coded in MATLAB

% Description:
%perceptron makes an LDF from separable data; LDF is obtained from steepest
%descent process yielding an equation of a plane. Solution does not
%converge with non-separable data; need linearly seperable data for
%procedure to yield weights

% Note: 
% example from class below


clear
clc
load('C0.mat')
load('C1.mat')
echo on
% Solution:
% i. Write code for the Perceptron in augmented space

% ii. Apply the Perceptron to the features collected in Project # 1, however if your data is not separated
% then apply the Perceptron to the data provided.

% iii. Plot the feature points and the LDF

% iv. Function call should look like [m, b] = perceptronLDF(C0, C1, a1), where a1 is the seed vector, m
% is the slope of the line and b is the y-intercept. Best to not call your function simply “perceptron”
% since such a function exists in a Matlab toolbox.
% I would suggest you get the perceptron to work on our in class example first.

% example data
% c01= [1 1];
% c02= [1 2];
% c11= [2 1];
% c12= [3 1];
% c0 = [ c01 ; c02];
% c1 = [ c11; c12];

% augment matrices
New_c0 =[ones(size(C0,1),1) , C0]; 
New_c1 =[ones(size(C1,1),1) , C1]; 
Neww_c1 = -1.*New_c1;
c = [New_c0; Neww_c1];
% clear c0 c01 c02 c1 c11 c12 New_c0 New_c1 Neww_c1

a1 = [0,-1,-1];
% ak = a1 - [0,-1,-1];
% ak_new = a1;

count = 0;
Neg_C = [1,1,1];
ak = a1;
while isempty(Neg_C) == 0
    count = count+1
    Neg_C = [];
    for i = 1:size(c,1)
        if dot(ak,c(i,:)) < 0 
            Neg_C = [Neg_C; c(i,:)]; 
        end
    end
    ak = ak + sum(Neg_C); 
end
ak
%%
% solve for y "algebraically" (also using symbolic expressions)  
syms x                                      
fi = (ak(1,1) + ak(1,2)*x )/ (-1.*ak(1,3));
pretty(fi)                           % purposely unsupressed to print count
% output slope of the line m and  y-intercept line b from the LDF solution
m = (ak(1,2)*x )/ (-1.*ak(1,3))
b = (ak(1,1)/ (-1.*ak(1,3)))
%%
% plot both feature points and LD
% orange is class c0, green is class c1
p1 = plot(C0(1,1),C0(1,2),'or')
hold on 
p2 =plot(C0(2,1),C0(2,2),'or')
hold on 
p3 =plot(C1(1,1),C1(1,2),'.g')
hold on
p4 =plot(C1(2,1),C1(2,2),'.g')
hold on

legend ([p1 p3], 'class C0','class C1')

hold on
% plot symbolic expressions 
ezplot(fi,[0,5])% 
title('Plot of feature points with the LDF');
xlabel('0 < x < 15');
ylabel('feature point values and LDF solution');


%%
c1(2,2)