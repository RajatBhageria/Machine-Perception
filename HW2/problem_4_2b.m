close all;

%make signal
signal = sawtooth((1:128)*10*pi/128);

%split into intervals
interval_1 = signal(1:32);
interval_2 = signal(33:64);
interval_3 = signal(65: 96);
interval_4 = signal(97:128);

%DCT of intervals
dct_1 = dct(interval_1);
dct_2 = dct(interval_2);
dct_3 = dct(interval_3);
dct_4 = dct(interval_4);

% figure(3); clf;
% plot(signal);

%sort in ascending order
dct_1_16 = sort(abs(dct_1));
thresh1 = dct_1_16(16);
dct_2_16 = sort(abs(dct_2));
thresh2 = dct_2_16(16);
dct_3_16 = sort(abs(dct_3));
thresh3 = dct_3_16(16);
dct_4_16 = sort(abs(dct_4));
thresh4 = dct_4_16(16);

%neglect smallest 16 coefficients
dct_1_thresh = find( abs(dct_1) > thresh1);
dct_2_thresh = find( abs(dct_2) > thresh2);
dct_3_thresh = find( abs(dct_3) > thresh3);
dct_4_thresh = find( abs(dct_4) > thresh4);

% figure(4); clf;
% plot(dct_1);

disp(dct_1(dct_1_thresh)); 

%inverse dc
signal_concat = [idct(dct_1(dct_1_thresh)) idct(dct_2(dct_2_thresh)) ...
    idct(dct_3(dct_3_thresh)) idct(dct_4(dct_4_thresh))];

figure(5); clf;
plot(signal_concat);