 
% READ ME:

%TODO: review convergence and difference form other procedures,compile and 
%format for portfolio


%% Weekly Project #4
% Date: Aprl. 7, 2016
% Author: Nick Italiano

% Summary:
%Ho-Kashyap coded in MATLAB

% Description:
%Ho-Kashyap coded LDF by completly separating data; LDF is obtained from steepest
%descent process yielding an equation of a plane. 

% Note: 
% Adhere to convergence proof, example from class solved below 


% i. Write code for Ho-Kashyap in augmented space
% ii. Apply Ho-Kashyap to the features collected in Project # 1, however 
% if your data is not separated then apply the Ho-Kashyap to the data provided 
% in Project 2.
% iii. Plot the feature points and the LDF


clear
clc

%Example

% %create example data
% c01= [1 1];
% c02= [1 2];
% c11= [2 1];
% c12= [3 1];
% c0 = [ c01 ; c02];
% c1 = [ c11; c12];

% % augment matrices
% New_c0 =[ones(size(c0,1),1) , c0]; 
% New_c1 =[ones(size(c1,1),1) , c1]; 
% Neww_c1 = -1.*New_c1;
% Y = [New_c0; Neww_c1];


% Solution
%load separable data
load('C0.mat')
load('C1.mat')

% augment feature space
New_C0 =[ones(size(C0,1),1) , C0]; 
New_C1 =[ones(size(C1,1),1) , C1]; 
Neww_C1 = -1.*New_C1;
Y= [New_C0; Neww_C1];


%create starting marginal vectors b1
% b1 = [ 1; 1; 1; 1] 

b1 = [ones(size(Y,1),1)];
bmin=b1;
bk=b1;
kmax=15000;
j=0;

%ho-kashyap steps (refer to notes or slides)
for k=1:kmax
% step 1
%use psedoinverse
YTdagr= pinv(Y);
ak=YTdagr*bk;
 
%define gradient with respect to a
% compute error vector (machine precision wont allow compute zero)
% step 2
ek=(Y*ak)-bk;

eplus=.5*(ek+abs(ek));

% step 3
%define gradient with repspect to b

bk = bk + eplus;
% step 4
j=j+1

end

% Solve system by taking pseduoinverse (check conditons)
a=YTdagr*bk;

% if abs(e)<=bmin

if abs(ek)<=  bmin
    a
    bk
else
    fprintf('No Solution Found')
end


% Create plottable function for both solutions
syms x                                      
fi = (a(1,1) + a(2,1)*x )/ (-1.*a(3,1));
pretty(fi)                                 

figure
% Feature points with LDF and plot feature points (seperable data)
% subplot(1,2,1)
P1 = plot(C0(:,1),C0(:,2),'or');
hold on 
P2 = plot(C1(:,1),C1(:,2),'.g');
hold on
legend ([P1 P2], 'class c0','class c1')

ezplot(fi,[0,15])
title('Plot of feature points with the Ho-Kashyap LDF');
xlabel('0 < x < 15');
ylabel('feature points and LDF values');


% Feature points with LDF and and plot feature points (example data)
P1 = plot(c0(:,1),c0(:,2),'or');
hold on 
P2 = plot(c1(:,1),c1(:,2),'.g');
hold on
legend ([P1 P2], 'class c0','class c1')

ezplot(fi,[0,15])
title('Plot of feature points with the Ho-Kashyap LDF');
xlabel('0 < x < 15');
ylabel('feature points and LDF values');

hold off
%%
%(extra)
%symbolically evaluate function phi of t
phit=((Y*ak)-e).^2;

%absolute value... no, magnitude
phit_e=expand(phit(4));

phit_derv=diff(phit_e,t);


t_inflectionpt=double(solve(phit_derv,'MaxDegree',3));%returns explicit solution that may contain 3rd degree polynomials; in double precision 

syms t
e = bk +(-1)*(t.*eplus);

