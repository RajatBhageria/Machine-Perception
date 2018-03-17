n = 0:29;
x = cos(2*pi*n/10);

% 1a
% N = 64
% spectrum = fftshift(abs(fft(x,N)));
% figure; 
% plot(spectrum);

% 1b
% spectrum = fftshift(abs(fft(x,2048)));
% spectrum2 = fftshift(abs(fft([x x],2048)));
% spectrum3 = fftshift(abs(fft([x x x],2048)));
% 
% figure; 
% plot(spectrum);
% figure; 
% plot(spectrum2);
% figure; 
% plot(spectrum3);

%1c
spectrum = fftshift(abs(fft(x,30)));
spectrum2 = fftshift(abs(fft([x x],60)));

figure; 
plot(spectrum);

figure; 
plot(spectrum2);