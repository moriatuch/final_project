compare(picName)
    I=imread(picName);
    igr=rgb2gray(I);
    p = sum(igr)
    y = smooth(p)
    plot(y)
