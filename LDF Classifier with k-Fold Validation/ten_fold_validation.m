function percentages = ten_fold_validation(C0,C1,LLSLDF)
%performs ten fold validation
   C0_cycled = C0(randperm(size(C0,1)),:);
   C1_cycled = C1(randperm(size(C1,1)),:);
   c0_b = floor(size(C0,1)/10);
   c1_b = floor(size(C1,1)/10);
   C0_partition = cell(1,10);
   C1_partition = cell(1,10);
   ldfs = cell(1,10);
   for i = 1:10
       ldfs{i} = [0 0];
   end
   for i = 1:9
       C0_partition{i} = C0_cycled(((i-1)*c0_b+1):(i*c0_b),:);
       C1_partition{i} = C1_cycled(((i-1)*c1_b+1):(i*c1_b),:);
   end
   C0_partition{10} = C0_cycled(9*c0_b+1:end,:);
   C1_partition{10} = C1_cycled(9*c1_b+1:end,:);
   for i = 1:10
       C0_minus_partition = zeros(0,2);
       C1_minus_partition = zeros(0,2);
       for j = 1:10
           if j ~= i
                C0_minus_partition = [C0_minus_partition;C0_partition{j}];
                C1_minus_partition = [C1_minus_partition;C1_partition{j}];
           end
       end
       [ldfs{i}(1), ldfs{i}(2)] = LLSLDF(C0_minus_partition,C1_minus_partition);
   end
   percentages = zeros(1,10);
   for i = 1:10
       percentages(i) = percent_misclassified(C0_partition{i},C1_partition{i},ldfs{i});
   end
end
   
function proportion = percent_misclassified(C0,C1,line)
    % returns percentage of misclassified entries between two data sets w/ an LDF
    % defined by y = m*x + b
    misclassified = 0;
    for x = 1:size(C0,1)
        if C0(x,2) <= C0(x,1)*line(1) + line(2);
        misclassified = misclassified + 1;
        end
    end
    for x = 1:size(C1,1)
        if C1(x,2) >= C1(x,1)*line(1) + line(2);
            misclassified = misclassified + 1;
        end
    end
    proportion = misclassified/(size(C0,1)+size(C1,1));
end
   
       
       
       