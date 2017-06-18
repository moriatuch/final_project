
function my_hist(picName)
pic=imread(picName);
af_gr_image=rgb2gray(pic);
[X,Y]=size(af_gr_image);
counter=0;

a=0:255;
b=1:256;

for c=1:256
    for i=1:Y
        for j=1:X
            if af_gr_image(j,i)==c-1
                counter=counter+1;
            end
        end
    end
    b(c)=counter;
            counter=0;
end
stem(a,b);
ylabel('pixels');
xlabel('gray');
title('the histogram')

grid on;


end