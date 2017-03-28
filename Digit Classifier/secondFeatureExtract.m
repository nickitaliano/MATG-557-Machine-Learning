function [f2] = secondFeatureExtract(R)
% secondFeatureExtractor  is a function that counts the number of pixels in a 28 x 28 
% realization (middle 3rd of index values)
% Summary_____________________________
%   Detailed ____________________________

f2=0;
for i=263:532
    if R(i)> 0
        f2 = f2 + 1;
    end
end
end

