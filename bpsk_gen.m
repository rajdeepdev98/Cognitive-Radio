function x=bpsk_gen
    d=[1 0 1 1 0]; % Data sequence
    b=2*d-1; % Convert unipolar to bipolar
    T=1; % Bit duration
    Eb=T/2; % This will result in unit amplitude waveforms
    fc=5/T; % Carrier frequency
    t=linspace(0,5,1000); % discrete time sequence between 0 and 5*T (1000 samples)
    N=length(t); % Number of samples
    Nsb=N/length(d); % Number of samples per bit
    dd=repmat(d',1,Nsb); % replicate each bit Nsb times
    bb=repmat(b',1,Nsb); dw=dd'; % Transpose the rows and columns
    dw=dw(:)'; 
    % Convert dw to a column vector (colum by column) and convert to a row vector
    bw=bb';
    bw=bw(:)'; % Data sequence samples
    w=sqrt(2*Eb/T)*cos(2*pi*fc*t); % carrier waveform
    bpsk_w=bw.*w;
    x=bpsk_w;
end