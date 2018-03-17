function []  = five()
    I = imread('statue.jpg');
    I = rgb2gray(I);
    
    f = createKernel(1); 
    
    conv = conv2(I,f,'same'); 
    newImg = mat2gray(conv);
    imshow(newImg); 
    
    %create for .1
    figure; imagesc(log(fftshift(abs(fft2(newImg)))+1));

    
end


function g = gaussian(x,y, sigma)
    g = (1/(sqrt(2*pi)*sigma))*exp(-(x^2+y^2)/(2*sigma^2)); 
end 

function f = createKernel(sigma)
    %create the f
    f = zeros(5); 
    for row = -2:2
        for col = -2:2
            g = gaussian(col,row,sigma)*255;
            f(row+3,col+3) = g; 
        end
    end 
end 