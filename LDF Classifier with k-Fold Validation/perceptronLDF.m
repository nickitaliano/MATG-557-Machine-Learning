function [m, b] = perceptronLDF(C0, C1, a1)
% perceptronLDF is a batch variable incremental perceptron algorithm
% (voted). A perceptron makes an LDF from separable data; LDF is obtained
% from steepest descent process yielding an equation of a plane.

% Input parameters:
% C0: feature points from class 0
% C1: feature points from class 1
% a1: seed vector(augmented)

%Output:
% m: m is the slope of the line from the LDF solution
% b: b is the y-intercept line from the LDF solution


% process feature data and augment data matrix
New_C0 =[ones(size(C0,1),1) , C0]; 
New_C1 =[ones(size(C1,1),1) , C1]; 
Neww_C1 = -1.*New_C1;
C = [New_C0; Neww_C1];

% input starting seed vector, non-empty set and  initialize counts for loss algorithm 
count = 0;
Neg_C = [1,1,1];
ak = a1;
while isempty(Neg_C) == 0
    count = count+1                  % purposely unsupressed to print count 
    Neg_C = [];
    for i = 1:size(C,1)
        if dot(ak,C(i,:)) < 0 
            Neg_C = [Neg_C; C(i,:)]; 
        end
    end
    ak = ak + sum(Neg_C); 
end
ak

% solve for y "algebraically" (also using symbolic expressions)  
syms x                                      
fi = (ak(1,1) + ak(1,2)*x )/ (-1.*ak(1,3));
pretty(fi)                           % purposely unsupressed to print count                                 

% output slope of the line m and  y-intercept line b from the LDF solution
m = (ak(1,2)*x )/ (-1.*ak(1,3));
b = (ak(1,1)/ (-1.*ak(1,3)));

% plot both feature points and LDF
figure
P1 = plot(C0(:,1),C0(:,2),'or')
hold on 
P2 = plot(C1(:,1),C1(:,2),'.g')
hold on
legend ([P1 P2], 'class c0','class c1')

% plot symbolic expressions 
ezplot(fi,[0,15])% 
title('Plot of feature points with the LDF');
xlabel('0 < x < 15');
ylabel('feature points and LDF values');

end


