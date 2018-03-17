close all;

%make signal
signal = sawtooth([1:128]*10*pi/128);

%split into intervals
interval_1 = signal(1:32);
interval_2 = signal(33:64);
interval_3 = signal(65: 96);
interval_4 = signal(97:128);

%fft of intervals
fft_1 = fftshift(fft(interval_1));
fft_2 = fftshift(fft(interval_2));
fft_3 = fftshift(fft(interval_3));
fft_4 = fftshift(fft(interval_4));
% 
% figure(3); clf;
% plot(signal);

%sort in ascending order
fft_1_16 = sort(abs(fft_1));
thresh1 = fft_1_16(16);
fft_2_16 = sort(abs(fft_2));
thresh2 = fft_2_16(16);
fft_3_16 = sort(abs(fft_3));
thresh3 = fft_3_16(16);
fft_4_16 = sort(abs(fft_4));
thresh4 = fft_4_16(16);

%neglect smallest 16 coefficients
fft_1_thresh = find( abs(fft_1) > thresh1);
fft_2_thresh = find( abs(fft_2) > thresh2);
fft_3_thresh = find( abs(fft_3) > thresh3);
fft_4_thresh = find( abs(fft_4) > thresh4);


%inverse dc
signal_concat = [real(ifft(ifftshift(fft_1(fft_1_thresh)))) real(ifft(ifftshift(fft_2(fft_2_thresh)))) ...
    real(ifft(ifftshift(fft_3(fft_3_thresh)))) real(ifft(ifftshift(fft_4(fft_4_thresh))))];


figure(5); clf;
plot(signal_concat);