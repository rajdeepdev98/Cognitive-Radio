function cor=analyser(x_t)
   
    
    
    len=1000;       %length(x_t);%in this case its 1000
    N_dash=100;
    L=25;
    p=(len-N_dash)/L;
    a=zeros(p,N_dash);
    for n1=1:p
        a(n1,:)=x_t((n1-1)*L+1:((n1-1)*L+N_dash));
    end
    aa=zeros(p,N_dash);
    for n1=1:p
        aa(n1,:)=a(n1,:).*(hanning(100)');
    end
    af=zeros(p,N_dash);
    for n1=1:p
        af(n1,:)=fft(aa(n1,:));
    end
    for n1=1:p
        for n2=1:100
            af(n1,n2)=af(n1,n2)*exp(-1i*2*pi*(n1-1)*(n2-1)*L/N_dash);
        end
    end
    af_dash=conj(af);
    f=1:0.5:N_dash;
    al=0:(N_dash-1);
    arr_cell=zeros(length(f),length(al));
    for alpha=0:(N_dash-1)
        for colno=1:(N_dash-alpha)
            newarr=af(:,colno).*af_dash(:,colno+alpha);
            arr=fft(newarr');
            mag=mean(abs(arr));
            f_no=(2*colno+alpha)-1;
            arr_cell(f_no,alpha+1)=mag;
        end
    end
            
     cor=arr_cell'; 
     cor=cor/mean(cor(:));
     
end
     