clc
clear all
hold off
warning('off','all')
files = dir('*.txt') ;
files=files(1:1000);
NumMove=[] ;
Deter=[] ;
NumStay=[] ;
EigenMax=[] ;
Close=[] ;
Symmetric=[] ;
Directed=[] ;
for file = files'
   name = file.name ;
   output = strrep(name, '._', '') ;
   mat=load(output) ;
   NumMove=[NumMove,length(find(mat>0))] ;
   Deter=[Deter,round(det(mat))] ;
   NumStay=[NumStay,trace(mat)] ;
   EigenMax=[EigenMax,real(max(eig(mat)))] ;
   Close=[Close,sum(closeness(mat))] ;
   Symmetric=[Symmetric,isSymmetric(mat)] ;
   Directed=[Directed,isDirected(mat)] ;
end
NumMove ;
Deter ;
NumStay ;
EigenMax ;
Close ;
Symmetric ;
Directed ;
X=[Close',Symmetric',Directed'] ;
options = statset('UseParallel',1,'MaxFunEvals',100000,'MaxIter',100000);
[idx C] = kmeans(X,2) ;
loc=find(idx~=1) ;
Y=X(loc,:) ;
X = X(setdiff(1:size(X,1),loc),:) ;
g=plot3(X(:,1),X(:,2),X(:,3),'r.') ;
%g=plot(X(:,1),X(:,2),'r.') ;
set(g,'MarkerSize',10)
hold on
h=plot3(Y(:,1),Y(:,2),Y(:,3),'g*') ;
grid on
%h=plot(Y(:,1),Y(:,2),'g*') ;
set(h,'MarkerSize',10) ;
a=MSE(X,Y) ;
[X, Y] = meshgrid(0:.2:2, -1:.2:1) ;
Z=-(a(1)+a(2)*X+a(3)*Y)/a(4) ;
surf(X,Y,Z) ;

xlabel('x')
ylabel('y')
zlabel('z')

legend('\fontsize{10} Type 1','\fontsize{10} Type 2')
