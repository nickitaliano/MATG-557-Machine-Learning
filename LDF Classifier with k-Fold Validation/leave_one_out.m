function bool = leave_one_out(C0,C1,LLSLDF) % 0 for classified, 1 for misclassified
bool = 0;
index = randi(size(C0,1)+size(C1,1));
if index == 1 %matlab's slicing syntax
    C0_prime = C0(index+1:end,:);
    C1_prime = C1;
elseif index < size(C0,1) && index > 1
    C0_prime = [C0(1:index-1,:);C0(index+1:end,:)];
    C1_prime = C1;
elseif index == size(C0,1)
    C0_prime = C0(1:index-1,:);
    C1_prime = C1;
elseif index == size(C0,1) + 1
    C0_prime = C0;
    C1_prime = C1(2:end,:);
elseif index < size(C0,1) + size(C1,1) && index > size(C0,1) + 1
    C0_prime = C0;
    C1_prime = [C1(1:index-size(C0,1)-1,:);C1(index-size(C0,1)+1:end,:)];
elseif index == size(C0,1) + size(C1,1)
    C0_prime = C0;
    C1_prime = C1(1:end-1,:);
end
[m, b] = LLSLDF(C0_prime,C1_prime);
if index <= size(C0,1)
    if C0(index,2) <= C0(index,1)*m + b
        bool = 1;
    end
else
    if C1(index-size(C0,1),2) >= C1(index-size(C0,1),1)*m + b
        bool = 1;
    end
end

    
end