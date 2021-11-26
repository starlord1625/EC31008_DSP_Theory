function value = energy_band_extraction(x,F1,F2,Fs)
    w1=2*F1/Fs;
    w2=2*F2/Fs;
    N= 512;  %% filter length
    hd1 = zeros(1,N); %% initialsing the desired impulse response
    k= ceil((N-1)/2);  %% defining the centre for the impulse response
    for i=1:N
        if(i==k)
            continue
        end
        hd1(i)= -(sin(w1*pi*(i-k)))/(pi*(i-k));  %% defining the desired impulse response:sinc function
    end
    hd1(k) = -w1;
    hd2 = zeros(1,N); %% initialsing the desired impulse response
    for i=1:N
        if(i==k)
            continue
        end
        hd2(i)= (sin(w2*pi*(i-k)))/(pi*(i-k));  %% defining the desired impulse response:sinc function
    end
    hd2(k)=w2;
    hd=hd1+hd2;
    w = zeros(1,N);
    for i=1:N
        %w(i)=0.42-0.5*cos(2*pi*((i-1)/(N-1)))+0.08*cos(4*pi*((i-1)/(N-1)));  %% defining the Blackman window
        %w(i)=0.54-0.46*cos(2*pi*((i-1)/(N-1)));  %% defining the hamming window
        %w(i)=0.5-0.5*cos(2*pi*((i-1)/(N-1)));  %% defining the hanning window
        %w(i)=1-2*(i-1-(N-1)/2)/(N-1);  %% defining the triangular window
        w(i)=1;  %% defining the rectangular window
    end
    h = hd.*w;  %% product of desired impulse response and window function:FIR filter. 
    xout=filtfilt(h,1,x);
    value=sum(abs(xout).^2);  %% summed squared magnitude of the filtered signal, xout
end