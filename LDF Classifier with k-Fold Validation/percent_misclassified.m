function proportion = percent_misclassified(C0,C1,line)
% returns percentage of misclassified entries between two data sets w/ an LDF
% defined by y = m*x + b
misclassified = 0;
for x = 1:size(C0,1)
    if C0(x,size(line,1)) <= C0(x,1:size(line,1)-1)*line(1:size(line,1)-1) + line(size(line,1));
        misclassified = misclassified + 1;
    end
end
for x = 1:size(C1,1)
    if C1(x,size(line,1)) <= C1(x,1:size(line,1)-1)*line(1:size(line,1)-1) + line(size(line,1));
        misclassified = misclassified + 1;
    end
end
proportion = misclassified/(size(C0,1)+size(C1,1));