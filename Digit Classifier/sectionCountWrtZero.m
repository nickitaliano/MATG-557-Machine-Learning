function [PerCov2] = sectionCountWrtZero(M)
%quadrantCount splits MNIST Array into 4 quadrants, counts the number of
% pixels values >1 in each quadrant, and returns an indicator variable
%   Detailed explanation of what the  indicator variable does goes here
%   ________________________________________

%index 9 sections
[s1] = M(1:10, 1:10);
[s2] = M(1:10, 11:20);
[s3] = M(1:10, 21:28);
[s4] = M(11:20, 1:10);
[s5] = M(11:20, 11:20);
[s6] = M(11:20, 21:28);
[s7] = M(21:28, 1:10);
[s8] = M(21:28, 11:20);
[s9] = M(21:28, 21:28);

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

%extract index of size
sizes_1=size(s_1,1);
sizes_2=size(s_2,1);
sizes_3=size(s_3,1);
sizes_4=size(s_4,1);
sizes_5=size(s_5,1);
sizes_6=size(s_6,1);
sizes_7=size(s_7,1);
sizes_8=size(s_8,1);
sizes_9=size(s_9,1);

%Calculate percent coverge(1) and rel percent coverage(2)
Count = (sizes_1+ sizes_2 + sizes_3+ sizes_4+sizes_5+sizes_6+sizes_7+sizes_8+sizes_9);
Num = (sizes_1+ sizes_5+sizes_8);


PerCov2 = (Num/Count);
end

