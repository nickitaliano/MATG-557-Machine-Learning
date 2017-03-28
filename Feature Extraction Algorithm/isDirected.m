function S=isDirected(adj)

S = 0;
if adj==transpose(adj); S = 1; end