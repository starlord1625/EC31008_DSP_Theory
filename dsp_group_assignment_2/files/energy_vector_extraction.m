function energy_values = energy_vector_extraction(x,bands,Fs)
    energy_values=zeros(1,bands);
    spacing=linspace(0,4000,bands+1);   %%for equal spacing from 0 to 4000 Hz
    %spacing=zeros(1,bands+1);     %% for semi equal spacing from 0 to 4000 Hz
    %spacing(1:9)=linspace(0,1200,9);    %% for semi equal spacing from 0 to 4000 Hz
    %spacing(9:bands+1)=linspace(1200,4000,bands-8+1);   %% for semi equal spacing from 0 to 4000 Hz
    energy_values(1,1)=energy_low_extraction(x,spacing(2),Fs);  %% apply low-pass filter with cut-off frequency spacing(2) and extract the filtered energy value
    for i=2:bands
       energy_values(1,i)=energy_band_extraction(x,spacing(i),spacing(i+1),Fs);   %% apply band-pass filter with band of [spcing(i),spacing(i+1) and extract the filtered energy value
    end
end