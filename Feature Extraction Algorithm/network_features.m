function features = network_features(adjs)
    features = zeros(length(adjs),10);
    for index = 1:length(adjs)
        sym = symmetrize(adjs{index});
        features(index,1) = length(adjs{index});
        features(index,2) = sum(sum(adjs{index}));
        features(index,3) = edgeDensity(adjs{index});
        if length(adjs{index}) > 1
            features(index,3) = edgeDensity(adjs{index});
        else
            features(index,3) = 0;
        end
        features(index,4) = tanh(diameter(sym));
        features(index,5) = mean(averageNeighborDegree(sym));
        if length(adjs{index}) > 1
            features(index,6) = averagePathLength(adjs{index});
        else
            features(index,6) = 0;
        end
        features(index,7) = averageDegree(adjs{index});
        if length(adjs{index}) > 1
            features(index,8) = mean(closeness(adjs{index}));
        else
            features(index,8) = 0;
        end
        features(index,9) = real(mean(eigenCentrality(adjs{index})));
        features(index,10) = graphRadius(adjs{index});
    end
end

function sym_adj = symmetrize(adj)
    sym_adj = adj;
    for i = 1:length(adj)
        for j = 1:length(adj)
            if adj(i,j) == 1
                sym_adj(j,i) = 1;
            end
        end
    end
end