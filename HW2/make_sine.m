function [y, t] = make_sine(f, A, phi0, fs, tfin)
% MAKE_SINE - make sine wave from its frequency, amplitude,
% initial phase, duration and sampling frequency
%
% Syntax:  [y, t] = make_sine(f, A, phi0, fs, tfin)
%
% Inputs:
%   f [Hz]     : sine wave frequency
%   A [1]      : sine wave amplitude
%   phi0 [rad] : sine wave initial phase
%   fs [Hz]    : sampling frequency
%   tfin [s]   : duration (final time)
%    
%
% Outputs:
%    y [n, 1]: sine wave
%    t [n, 1]: corresponding time vector, starting at zero
%              if tfin is not multiple of 1/fs, t(end) < tfin

%find the time duration
t = 0:(1/fs):tfin;

%define the sine function 
y = A*sin(2*pi*f*t+phi0);

%plot it 
%plot(t,y);


