function values = name_feature_extraction(s1,s2,bands,Fs,fig)
    values=zeros(8,bands);
    figure(fig);
    for i=1:4  %% 1:4 auduio files are recorded at different mornings
        [a,x]=spectrum_extraction(s1+i+".wav"); %outputs frequency response of audio signal and time domain audio signal
        values(i,:)=energy_vector_extraction(x,bands,Fs); %% outputs Enegry vector for particular no.of filter banks (bands)
        subplot(2,4,i); %% Plot the FFT of the particular audio sample.
        N=length(a);  %% length of audio signal
        freq=-Fs/2:Fs/N:(N-1)*Fs/(2*N); %% frequency sampling
        plot(freq,a);
    end
    for i=5:8 %% 5:8 auduio files are recorded at different afternoons
        j=i-4;
        [a,x]=spectrum_extraction(s2+j+".wav"); %outputs frequency response of audio signal and time domain audio signal
        values(i,:)=energy_vector_extraction(x,bands,Fs); %% outputs Enegry vector for particular no.of filter banks (bands)
        subplot(2,4,i);  %% Plot the FFT of the particular audio sample.
        N=length(a);  %% length of audio signal
        freq=-Fs/2:Fs/N:(N-1)*Fs/(2*N);  %% frequency sampling
        plot(freq,a);
    end
end