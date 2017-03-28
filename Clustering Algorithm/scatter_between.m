function S_b = scatter_between(C0,C1)
    S_b = zeros(size(C0,2));
    for i = 1:size(C0,2)
        mu_0(i) = mean(C0(:,i));
        mu_1(i) = mean(C1(:,i));
    end
    mu = (size(C0,1)+size(C1,1))*(mu_0/size(C0,1)+mu_1/size(C1,1));
    S_b = (mu_0-mu)'*(mu_0-mu)+(mu_1-mu)'*(mu_1-mu);
end



    
        
        