function [f1] = firstFeatureExtractor(R)
% firstFeatureExtractor is a function that counts the number of pixels in a 28 x 28 
% realization
% Summary_____________________________
%   Detailed ____________________________

f1=0;

for i=1:784
    if R(i)> 0
        f1 = f1 + 1;
    end
end
end

