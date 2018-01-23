function M = conv_matrix_1d(k, m)
%CONV_MATRIX_1D - discrete convolution matrix
%
% Syntax:  M = conv_matrix_1d(k, m)
%
% Inputs:
%    k [n, 1] - 1D convolution kernel
%    m [int] - dimension of convolved vector (not necessarily == n)
%
% Outputs:
%    M [m-n+1, m] - convolution matrix. k * x = Mx, where x is [m, 1]
%                   'valid' padding is assumed

%find the number of elements in n
[n,~] = size(k);

%flip k because it's a convolution
k = fliplr(k'); 

%pad kernel to dimension of m
k = [k zeros(1,m-n)];

%create the circulant matrix 
M = toeplitz([k(1) fliplr(k(2:end))], k);

%concaconate to make it 'valid' padding 
M = M(1:m-n+1,1:m);