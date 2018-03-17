
clear all;
close all;
I=imread('statue.jpg');
I=rgb2gray(I);

[m,n] = size(I); 
shape = 100;
cropped = I(round(m/2-shape):round(m/2+shape)-1,round(n/2-shape):round(n/2+shape)-1);

spec = fftshift(log(abs(fft2(cropped))+1));
specForIft = fftshift(fft2(cropped));
 
% %3b
% n = 200^2; 
% M1 = n/8; 
% M2 = n/64;
% 
% %do the square function 
% [m,n] = size(specForIft);
% square = zeros(200); 
% lower = -sqrt(M1)/2+m/2; 
% upper = sqrt(M1)/2+m/2; 
% for row = 1:m
%     for col = 1:n
%         if (row >= lower && row <=upper && col >= lower && col <=upper)
%             square(row,col) = specForIft(row,col); 
%         end 
%     end 
% end 
% 
% %take the inveres
% 
% idft = real(ifft2(square)); 
% figure; imshow(uint8(idft));

%%Part  c
% SNR = zeros(191,1); 
% original=double(cropped(:));
% counter = 1; 
% for M = 10:200
%     newImg = findBlurredImg((M)^2,specForIft); 
%     columnNewImg = double(newImg(:)); 
%     localSNR = findQuality(original,columnNewImg);
%     SNR(counter) = localSNR; 
%     counter = counter + 1; 
% end 
% 
% figure; plot(SNR);
% [m,i] = max(SNR); 
% disp(i); 

%part d 
%sort in ascending order
n0 = 200^2;
M1 = n0/8; 
M2 = n0/64;
[sorted] = sort(abs(specForIft(:)),'descend');
T1 = sorted(M1);
T2 = sorted(M2); 
disp (T1); 
disp (T2); 
trueOrFalse1 = (abs(specForIft) >= T1);
trueOrFalse2 = (abs(specForIft) >= T2); 
newFFT1 = specForIft .* trueOrFalse1;
newFFT2 = specForIft .* trueOrFalse2;
newImg1 = real(ifft2(ifftshift(newFFT1))); 
newImg2 = real(ifft2(ifftshift(newFFT2))); 
figure; imshow(uint8(newImg1));
figure; imshow(uint8(newImg2));

function [quality] = findQuality(f, fapprox)
    inner = norm(f-fapprox)/norm(f); 
    quality = -20*log10(inner);
end 

function [newImg] = findBlurredImg(M,img)
%do the square function 
[m,n] = size(img);
square = zeros(200); 
lower = -sqrt(M)/2+m/2; 
upper = sqrt(M)/2+m/2; 
for row = 1:m
    for col = 1:n
        if (row >= lower && row <=upper && col >= lower && col <=upper)
            square(row,col) = img(row,col); 
        end 
    end 
end 

%take the inveres
newImg = real(ifft2(ifftshift(square))); 
%figure; imshow(uint8(newImg));
end 
