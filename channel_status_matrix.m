function [mat len]= channel_status_matrix(n)
    rng('shuffle');
    mat=randi(0:1,1,n);
    len=n;
end
    