clear
clc
load('C1.mat')
load('C0.mat')
load('Data2D.mat')
load('Data3D.mat')
%%
% Machine Learning. Manhattan College. DeBonis. Project 11.
% ? Score your clusterings in Projects #8 - #10 using the following scoring schemes:
% i. SSE
New_c0 =[ones(size(C0,1),1) , C0]; 
New_c1 =[ones(size(C1,1),1) , C1]; 
Neww_c1 = -1.*New_c1;
C = [New_c0; Neww_c1];
opts=statset('Display','Final');
[idx,C] = kmeans(C,2,'Distance','cityblock',...
'Replicates',12,'Options',opts);

Score1 = det(S_t) - det(S_b)
%%
S_w = scatter_within(C0,C1)
S_b = scatter_between(C0,C1)
S_t = S_w + S_b
% ii. 1/tr(SWS?1) T
Score2=(1/trace(inv(S_t).*S_w))

% iii. |SW|/|ST|

Score3= det(S_w)/det(S_t)

% ? Can you conclude that one of the three clustering schemes is the best?
