function [filter_cos,filter_sin] = gaborFilter1D(T_f, sigma, len)
% This function returns two 1D Gabor quadrature filters
% (vectors).
%
% Unit sampling period; zero is sampled only when filter_length is odd.

% ARGUMENTS
% - T_f: spatial period in pixels
% - sigma: Gaussian envelope sigma
% - len: length of the output

%
% OUTPUT
% filter_cos, filter_sin: (1,len) vectors containing the real part
% and the imaginary part of the filter

% Your code goes here %%%%%%%%%%%%%%%%%%%%%%
% use gaussian1d for the Gaussian envelope

if (mod(len,2) == 0)
    samplingVals = -(len-1)/2:1:(len-1)/2;
else 
    absVal = floor(len/2);
    samplingVals = -absVal:1:absVal;
end

gaussian = gaussian1d(sigma, len); 
freq = (2*pi)/T_f; 
filter_cos = gaussian .* cos(samplingVals*freq);
filter_sin = gaussian .* sin(samplingVals*freq);

% End of your code %%%%%%%%%%%%%%%%%%%%%%%%%

