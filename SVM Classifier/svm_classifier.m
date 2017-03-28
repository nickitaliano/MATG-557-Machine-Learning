function [m, b] = svm_classifier(C0,C1)
 
 
j = 0;
 
c0_size = size(C0, 1);
c1_size = size(C1, 1);
 
C_hat = [ones(c0_size,1) C0;-ones(c1_size,1) -C1];
C_hat_size = c0_size + c1_size; 
 
z = [ones(c0_size,1); -ones(c1_size,1)]';
 
y_matrix = C_hat*C_hat';
 
fun = @(lambda) (1/2)*lambda(1:C_hat_size)*y_matrix*lambda(1:C_hat_size)' - sum(lambda(1:C_hat_size));

 
z0 = zeros(1, C_hat_size);
lb = zeros(1,C_hat_size);
 
argmax = fmincon(fun, z0, [],[], z,0, lb);
 
a = argmax* C_hat(:,2:3);
 
for i = 1:size(argmax, 1)
    if round(argmax(i),2) ~= 0
        disp(i)
        disp(argmax(i))
        j = i;
        break
    end
end
 
a0 = z(j) * (1-a*C_hat(j,1:2)')
m = -a(1) / a(2)
b = -a0/a(2)
 
end