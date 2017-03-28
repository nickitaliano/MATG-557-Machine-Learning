function vec = LLSLDF(C0,C1)
% makes a linear discriminant function which minimizes least-squared error;
% C0, C1 are of length n together; seed vector must have length equal to number of eqns
    c0_size = size(C0,1);
    c1_size = size(C1,1);
    
    seed = ones(c0_size+c1_size,1);
    c0_augmented = [C0,ones(c0_size,1)];
    c1_augmented = [C1,ones(c1_size,1)];
    
    C_hat = [c0_augmented;-c1_augmented];
    
    a = inv(C_hat'*C_hat)*(C_hat')*seed;
    a
    m = -a(1:size(a,1)-2)/a(size(a,1)-1);
    b = -a(size(a,1))/a(size(a,1)-1);
    vec = [m b]