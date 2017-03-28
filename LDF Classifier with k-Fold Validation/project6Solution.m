clear
clc
%%(Read Me: Please Press the green "Run Button" to execute code because we are passing a function)
% Machine Learning. Manhattan College. DeBonis. Project 6.


% i. Select the LDF from Projects 2 through 5 which you believe will be most effective 
load('C0.mat')
load('C1.mat')

%chosen LDF vec = LLSLDF(C0,C1)
%%

% ii. Apply Validation using One Left Out 100 times
bool = leave_one_out(C0,C1,LLSLDF(C0,C1))
%%

% iii. Apply Validation using 10 % Left Out 100 times 
percentages = ten_fold_validation(C0,C1,LLSLDF(C0,C1))
%%
% iv. Apply 10-fold Validation 10 times
percentages = ten_fold_validation(C0,C1,LLSLDF(C0,C1))
%%
% v. If results are not satisfactory try using another LDF from projects 2 through 5
a1 = [0,-1,-1];
[m, b] = perceptronLDF(C0, C1, a1)