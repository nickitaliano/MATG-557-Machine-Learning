function S_w = scatter_within(C0,C1)
    S_w = zeros(size(C0,2));
    for i = 1:size(C0,2)
        mu_0(i) = mean(C0(:,i));
        mu_1(i) = mean(C1(:,i));
    end
    for i = 1:size(C0,1)
        S_w = S_w + (C0(i,:)-mu_0)'*(C0(i,:)-mu_0);
    end
    for i = 1:size(C1,1)
        S_w = S_w + (C1(i,:)-mu_1)'*(C1(i,:)-mu_1);
    end