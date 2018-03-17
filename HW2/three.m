t = 0:50;

w = 2; 

y = sin(w*t);

sigma = ; 

%gprime = (2/(sqrt(2*pi)*sigma))*exp(-t^2/(2*sigma^2));
ftg = e^((-sigma^2*w^2)/2); 

fty = fftshift(fft(y)); 
]

