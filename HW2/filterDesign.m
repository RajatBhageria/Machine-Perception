A = 1; 
fs = 44100; 
tfin = 2; 
phi0 = 0; 

[y1, t] = make_sine(220.5, A, phi0, fs, tfin);
[y2, ~] = make_sine(441, A, phi0, fs, tfin);

%sum oftwo sines 
f = y1 + y2; 

%create the gaussian
A = 2; 
mu = 1; 
sigma = 8.5E-4;
g = A*normpdf(t,mu,sigma);

%create the spectra 
ftF = fftshift(abs(fft(f)))/fs; 
ftG = fftshift(abs(fft(g)))/fs; 

figure; 
plot(t,ftF); 
hold on; 
plot(t,ftG); 
hold off; 
legend('Spectra of f', 'Spectra of g'); 

omega = 1;
y=sin(omega*t); 

