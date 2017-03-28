%% Weekly Project #1 
% Date: Feb. 1, 2016
% Author: Nick Italiano
% Summary:
% Description: This script features Machine Learning Methods applied to 
% parts of the MNIST dataset. Specifically, we created and________________
% algorithm that discerns betweens images of handwritten Zero's and One's
%%
% Change the filenames if you've saved the files under different names
% On some platforms, the files might be saved as % Load Images
load('Zero.mat') 
load('One.mat') 


%%

% First feature extraction program
PCz=[];
% Fzf=[];
% Fzs=[];
% Fzz=[];
for i=1:size(Zero,1);
    Rz =(Zero(i,:));

%     fz1 = firstFeatureExtract(Rz);
%     fz2 = secondFeatureExtract(Rz);
%     fzz= fz1*fz2;

    Mz = createMNISTArray(Rz);
    PerCovz = sectionCount(Mz);
    PerCovz2 = sectionCountWrtZero(Mz);
    PCz = [PCz;PerCovz PerCovz2];
    
%     Fzf = [Fzf; fz1 fz2];
%     Fzs = [Fzs; fz2];
%     Fzz = [Fzz; fzz];
end
%%
% First feature extraction program
PCo=[];
% Fof=[];
% Fos=[];
% Foo=[];
for i=1:size(One,1);
    Ro =(One(i,:));
    Mo = createMNISTArray(Ro);
    PerCovo = sectionCount(Mo);
    PerCovo2 = sectionCountWrtZero(Mo);
    
    PCo = [PCo;PerCovo PerCovo2];
    
%     fo1 = firstFeatureExtract(Ro);
%     fo2 = secondFeatureExtract(Ro);
%     foo= fo1*fo2;
    
    
%     Fof = [Fof; fo1 fo2];
%     Fos = [Fos; fo2];
%     Foo = [Foo; foo];
end
%%
figure
plot(PCo(:,1),PCo(:,2),'or');
hold on
plot(PCz(:,1),PCz(:,2),'.g');

%%
figure
subplot(2,2,1)
hist(PCz(:,1))
title('Zero Image(feature 1)')
subplot(2,2,2)
hist(PCo(:,1))
title('One Image(feature 1)')
subplot(2,2,3)
hist(PCz(:,2))
title('Zero Image(feature 2)')
subplot(2,2,4)
hist(PCo(:,2))
title('One Image(feature 2)')

%%
figure
plot(Fof(:,1),Fof(:,2),'or');
hold on
plot(Fzf(:,1),Fzf(:,2),'.g');
%%
%stats (binned pixels)
figure
subplot(3,2,1)
hist(Fzf)
title('Zero Image(feature 1)')
subplot(3,2,2)
hist(Fof)
title('One Image(feature 1)')
subplot(3,2,3)
hist(Fzs)
title('Zero Image(feature 2)')
subplot(3,2,4)
hist(Fos)
title('One Image(feature 2)')
subplot(3,2,5)
hist(Fzz)
title('Zero Image(product)')
subplot(3,2,6)
hist(Foo)
title('One Image(product)')
%%
% integration of second feature and logic statements


%%
% image of samples
figure
subplot(1,2,1)
title('One Image')
imshow(Mo,[0,255])
subplot(1,2,2)
title('Zero Image')
imshow(Mz,[0,255])

%%

% Visualize Separation
figure
subplot(2,2,1)
title('f1 vs f2 (for 0 and 1)')
plot(Fof,Fos,'or');
hold on
plot(Fzf,Fzs,'.g');
subplot(2,2,2)
title('f1 vs p (for 0 and 1)')
plot(Fof,Foo,'or');
hold on
plot(Fzf,Fzz,'.g');
subplot(2,2,3)
title('f2 vs p (for 0 and 1)')
plot(Fos,Foo,'or');
hold on
plot(Fzs,Fzz,'.g');
subplot(2,2,4)
title('p vs p (for 0 and 1)')
plot(Foo,'or');
hold on
plot(Fzz,'.g');
%%
% Create image data to classify/discern pattern
% index realization
Ro1 =(One(1,:));
Rz1 =(Zero(1,:));
% Ro2 =(One(2,:));
% Rz2 =(Zero(2,:));

%%
% diagnose feature extraction
Mo = createMNISTArray(Ro1);
Mz = createMNISTArray(Rz1);


%%
%index 9 sectors
%zero
[s1] = Mz(1:10, 1:10);
[s2] = Mz(1:10, 11:20);
[s3] = Mz(1:10, 21:28);
[s4] = Mz(11:20, 1:10);
[s5] = Mz(11:20, 11:20);
[s6] = Mz(11:20, 21:28);
[s7] = Mz(21:28, 1:10);
[s8] = Mz(21:28, 11:20);
[s9] = Mz(21:28, 21:28);

%Number of Elements
s_1=s1(s1>0);
s_2=s2(s2>0);
s_3=s3(s3>0);
s_4=s4(s4>0);
s_5=s5(s5>0);
s_6=s6(s6>0);
s_7=s7(s7>0);
s_8=s8(s8>0);
s_9=s9(s9>0);
S=[]
if (size(s_4,1) > 0 && (size(s_4,1)
    
    S=Zero

S=
end

sizes_1=size(s_1,1);
sizes_2=size(s_2,1);
sizes_3=size(s_3,1);
sizes_4=size(s_4,1);
sizes_5=size(s_5,1);
sizes_6=size(s_6,1);
sizes_7=size(s_7,1);
sizes_8=size(s_8,1);
sizes_9=size(s_9,1);

Sum = sizes_1+ sizes_2 + sizes_3+ sizes_4+sizes_5+sizes_6+sizes_7+sizes_8+sizes_9
Sum1 = 173
Num = sizes_2 + sizes_4 + sizes_5 + sizes_6+ sizes_8

PerCov1= (Num/Sum)
PerCov2= (Num/Sum1)
%one
[s1] = Mo(1:10, 1:10);
[s2] = Mo(1:10, 11:20);
[s3] = Mo(1:10, 21:28);
[s4] = Mo(11:20, 1:10);
[s5] = Mo(11:20, 11:20);
[s6] = Mo(11:20, 21:28);
[s7] = Mo(21:28, 1:10);
[s8] = Mo(21:28, 11:20);
[s9] = Mo(21:28, 21:28);


%%
fo1 = firstFeatureExtract(Ro);
fz1 = firstFeatureExtract(Rz);

%%
fo2 = secondFeatureExtract(Ro);
fz2 = secondFeatureExtract(Rz);
%%
% Future Notes:

% impixel
%classification using KNN
###########################################################
%test for add.sub
R_1=Ro1+Ro2
R0=Rz1+Rz2
R1=Ro1-Ro2
R2=Rz1-Rz2
R3=Ro1+Rz1
R4=Rz1+Ro1
R5=Ro2+Rz2
R6=Rz2+Ro2

R_1s=sum(R_1)
R0s=sum(R0)
R1s=sum(R1)
R2s=sum(R2)
R3s=sum(R3)
R4s=sum(R4)
R5s=sum(R5)
R6s=sum(R6)

%ANOTHER IDEA??
for i=1:784
    if R0(i)> 0
        f1 = f1 + 1;
    end
end
