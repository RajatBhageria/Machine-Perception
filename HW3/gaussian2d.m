function g = gaussian2d(Sigma, len)
% GAUSSIAN2D - make discrete normalized centered 2D Gaussian
%
% Syntax: g = gaussian2d(Sigma, len);
%
% Output is symmetric with unit sampling period.
% (0,0) is sampled only when len is odd.
%
% Inputs:
%   Sigma: 2x2 covariance matrix
%   len: output is len x len.
%

% Your code goes here %%%%%%%%%%%%%%%%%%%%%%

%1d sampling vals 
if (mod(len,2) == 0)
    samplingVals = -(len-1)/2:1:(len-1)/2;
else 
    absVal = floor(len/2);
    samplingVals = -absVal:1:absVal;
end

%2d sampling vals
x1 = ones(len,len).*samplingVals;
x2 = ones(len,len).*samplingVals';

%get the gaussian 
g = gaussian(x1,x2,Sigma);

%noramlize
g = g / norm(g);

function g = gaussian(x1,x2,Sigma)
    length = size(x1,1);
    g = zeros(length,length); 
    for i = 1:length
        for j = 1:length
            x1i = x1(i,j);
            x2i = x2(i,j);
            x = [x1i;x2i];
            gi  = (1/sqrt(2*pi*norm(Sigma)))*exp(-.5*x'*inv(Sigma)*x);
            g(i,j) = gi; 
        end 
    end 
end 

% End of your code %%%%%%%%%%%%%%%%%%%%%%%%%

end