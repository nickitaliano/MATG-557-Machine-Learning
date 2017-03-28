function labeled = kmeans( xdata, k, showplot )
%Given a set of data, kmeans will group data into k clusters.
%Plots can be shown for 2 or 3 dimensional data.
    if nargin < 2
        k = 2;
    end
    [maxR] = size(xdata,1);
    if maxR <= k 
        labeled = [xdata, 1:maxR];
    else
        randnum=randperm(maxR);
        for i = 1:k
            c(i, :) = xdata(randnum(i), :);
        end 
        y0 = zeros( maxR, 1 );
        while 1
            d=distmat(xdata, c);
            [~, g] = min(d, [], 2);
            if g == y0
                break;
            else
                y0 = g;
            end
            for j = 1:k
                f = find(g == i);
                if f
                    c(i, :)= mean(xdata(f, :), 1);
                end
            end  
        end
    end
    labeled = [xdata, g];
    [~, m] = size(labeled);
    if nargin == 3
        loc1 = find(labeled(:, m) == 1);
        loc2 = find(labeled(:, m) == 2);
        X = labeled(loc1, :);
        Y = labeled(loc2, :);
        C1 = X(:, 1:m-1);
        C2 = Y(:, 1:m-1);
        if strcmp(showplot,'on')
            if m == 3
                plot(C1(:,1),C1(:,2),'r.')
                hold on
                plot(C2(:,1),C2(:,2),'g.')                
            elseif m == 4
                plot3(C1(:,1),C1(:,2),C1(:,3),'r.')
                hold on
                plot3(C2(:,1),C2(:,2),C2(:,3),'g.')
            else
                disp('Too many dimensions, plot cannot be displayed.')
            end
        end
    end
    
end