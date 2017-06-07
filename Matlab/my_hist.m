
function my_hist(picName)
I=imread(picName);
I2=rgb2gray(I);
[M,N]=size(I2);
i=0;
t=1:256;

for z=1:256
    for r=1:M
        for j=1:N 
            if I2(r,j)==z-1
                i=i+1;
            end
        end
    end
    t(z)=i;
    i=0;
end

n=0:255;
stem(n,t);
grid on;


end