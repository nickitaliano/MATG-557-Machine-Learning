function [ M ] = createMNISTArray(R)
%createMNISTArray takes input, R, a row from 1 x N array( 28 × 28 matrix 
% of greyscale values from 0 to 255) and creates an 28x28 image.
%   Detailed explanation goes here

M=[];

for i=1:28;
    for j= 1:28;
        M(i,j)=R((i-1)*28+j);
    end
end
end

