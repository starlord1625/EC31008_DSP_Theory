function [spectrum,x] = spectrum_extraction(inpfile)
    [x,Fs]=audioread(inpfile); %% read audio file which has inpfile as name
    spectrum=transpose(abs(fftshift(fft(x)))/(length(x))); %% Extracting the Frequency response of the audio signal
end