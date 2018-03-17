L1 = 8; 
L2 = 20; 
w1 = 2*pi/L1;
w2 = 2*pi/L2;

N = 128; 
x = 1:N;

f = cos(w1*x) +cos(w2*x);

stem(x,f);

f = fftshift(abs(fft(f))); 
plot(f); 