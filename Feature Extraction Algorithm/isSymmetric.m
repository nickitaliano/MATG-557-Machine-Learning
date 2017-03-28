function S = isSymmetric(mat)

S = 0; % default
if mat == transpose(mat); s = 1; end