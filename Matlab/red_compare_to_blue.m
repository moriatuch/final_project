function red_compare_to_blue(redpic, bluepic)
B=imread(bluepic);
R=imread(redpic);
B1 = B(:,:,3);
R1 = R(:,:,1);
meanred  = mean2(R1);
meanblue = mean2(B1);

answer  = meanblue/meanred;
fileID = fopen('red&blue.txt','wt');
fprintf(fileID,'%f : %f : %f',answer ,meanred, meanblue );
fclose(fileID);
end