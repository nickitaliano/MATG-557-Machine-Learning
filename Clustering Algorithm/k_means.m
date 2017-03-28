function [indices, clusters] = k_means(k,C_data,num_iter)
    cluster_indices = randperm(size(C_data,1),k);
    cluster_points = C_data(cluster_indices,:);
    clusters = cell(k,1);
    indices = cell(k,1);
    for i = 1:num_iter
        for m = 1:k
            clusters{m} = zeros(0,size(C_data,2));
            indices{m} = zeros(0,1);
        end
        for index = 1:size(C_data,1)
            min_dist = Inf;
            min_k = 0;
            for m = 1:k
                if D(C_data(index,:),cluster_points(m,:)) < min_dist
                    min_dist = D(C_data(index,:),cluster_points(m,:));
                    min_k = m;
                end
            end
            if min_k == 0
                disp(index);
            end
            clusters{min_k} = [clusters{min_k};C_data(index,:)];
            indices{min_k} = [indices{min_k};index];
        end
        for m = 1:k
            for n = 1:size(clusters{m},2)
                cluster_points(m,n) = mean(clusters{m}(:,n));
            end
        end
    end
end
   
function distance = D(x1,x2)
    distance = norm(x1-x2);
end