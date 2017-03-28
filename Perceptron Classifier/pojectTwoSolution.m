% READ ME:

%TODO plot 3D separating hyperplane,compile and format for portfolio


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
a1 = [0,-1,-1];

[m, b] = perceptronLDF(C0, C1, a1)

