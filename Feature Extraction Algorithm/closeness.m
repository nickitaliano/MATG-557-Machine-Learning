function C=closeness(adj)

C=zeros(length(adj),1);  % initialize closeness vector

for i=1:length(adj); C(i)=1/sum( simpleDijkstra(adj,i) ); end