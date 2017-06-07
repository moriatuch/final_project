function answer = compare_ver3(picName)
I=imread(picName);
imshow(I);
igr=rgb2gray(I);
p = sum(igr)
p1 = smooth(p, 9)

plot(p1)
D=get(gca,'Children'); %get the handle of the line object
XData=get(D,'XData'); %get the x data
YData=get(D,'YData'); %get the y data

%Data=[XData;YData]; %join the x and y data on one array 2xn

ans = fwhm(XData,YData)

%Data=[XData;YData]; %join the x and y data on one array 2xn
end