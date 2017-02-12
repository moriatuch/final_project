I = imread('one-exp.png');
igr=rgb2gray(I);
p = sum(igr)
p1 = smooth(p)
plot(p1)

