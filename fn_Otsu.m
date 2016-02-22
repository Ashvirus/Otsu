% This program demonstrates Otsu's Method.
% Reference: http://angeljohnsy.blogspot.com/2011/06/otsus-thresholding-without-using-matlab.html
% Author : Ashwini Singh-Homework 1 Computer Vision
% Input  : valley.jpg(RGB image)
% Output : valley.jpg(Binary image)

function[]= fn_Otsu(filename)
data=imread(filename);                                                          % Read an Image
gray=rgb2gray(data);                                                            % Convert to gray scale
pixelCounts=zeros(256,1);
for i=0:255
    pixelCounts(i+1,1)=size(gray(gray==i),1);                                   % Histogram (Occurrence of pixels)
end
Index=[0:255]';
total_no_pixels=sum(pixelCounts);
result=zeros(size([1 256]));
% Now create 2 classes for OTSU
% 1 class is for 0 to i, another class for i to 255
% Calculate weight and variance for each Index[0:255] for each class.
% let's call them as Upper and Lower class.
% Now Multiply Lower Class weight and variance then multiply Upper Class
% weight and variance. Now add these two.
% Now, index with minimum variance is considered as threshold index. 
for i=0:255
    % Lower Class
    Cummulative_weight_fromStart=sum(pixelCounts(1:i))/total_no_pixels;         % Cummulative Weight of Lower Class
    value=pixelCounts(1:i).*Index(1:i);
    mean=sum(value)/sum(pixelCounts(1:i));                                      % Mean of Lower Class
    if(isnan(mean)==1)
        mean=0;
    end
    value2=(Index(1:i)-mean).^2;                                                % Variance of Lower Class
    var_fromStart=sum(value2.*pixelCounts(1:i))/sum(pixelCounts(1:i));
    if(isnan(var_fromStart)==1)
        var_fromStart=0;
    end
    Cummulative_weight_tillEnd=sum(pixelCounts(i+1:255))/total_no_pixels;       % Cummulative Weight of Upper Class
    value=pixelCounts(i+1:255).*Index(i+1:255);
    mean=sum(value)/sum(pixelCounts(i+1:255));                                  % Mean of Upper Class
    if(isnan(mean)==1)
        mean=0;
    end
    value2=(Index(i+1:255)-mean).^2;                                            % Variance of Upper Class
    var_tillEnd=sum(value2.*pixelCounts(i+1:255))/sum(pixelCounts(i+1:255));
    if(isnan(var_tillEnd)==1)
        var_tillEnd=0;
    end
    
    result(i+1)=(Cummulative_weight_fromStart*var_fromStart)+(Cummulative_weight_tillEnd*var_tillEnd);
end
val=find(result==(min(result)));                                                % Index, which has minimum weighted variance
thresh_val=(val-1)/256;                                                         % threshold value
bin_im=im2bw(data,thresh_val);
figure('name','ASHWINI SINGH','NumberTitle','off');
imshow(bin_im);                                                                 % Binary Image with minimum threshold value
title('Binary Image','FontSize',10);

end