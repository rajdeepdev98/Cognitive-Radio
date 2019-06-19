

clc;
clear all; 
close all;
db_stat1=zeros(1,51);
db_stat2=zeros(1,51);
db_stat3=zeros(1,51);
noise_level=(10:-1:-40);
for n_dash=1:51
    
   %arr=zeros(1,5);
    %for num=1:10
        iterate_no=100;
        result_mat1=zeros(1,iterate_no);
        %result_mat2=zeros(1,iterate_no);
        %result_mat3=zeros(1,iterate_no);
        [mat, len]=channel_status_matrix(iterate_no);
        for n1=1:iterate_no
            x_t=bpsk_gen;
            xnoise=awgn(x_t,noise_level(n_dash),'measured');
            if mat(n1)==1
                sig=xnoise;
            else
                sig=xnoise-x_t;
            end
            zsig=analyser(sig);

            if(max(zsig(:))>=9)
                result_mat1(n1)=1;
            end
        end
        correctly_sensed_mat=(~xor(result_mat1,mat));
        correct_sum=sum(correctly_sensed_mat);
        false_alarm_mat=(~mat)&(result_mat1);
        false_alarm_sum=sum(false_alarm_mat);
       % arr(num)=correct_sum;
   % end
    %avg_correct_sensed=mean(arr);
   % db_stat(n_dash)=avg_correct_sensed;
     db_stat1(n_dash)=correct_sum;
     db_stat2(n_dash)=false_alarm_sum;
    
end
    db_stat3=db_stat1-db_stat2;
    
    
    

    
    
    
    