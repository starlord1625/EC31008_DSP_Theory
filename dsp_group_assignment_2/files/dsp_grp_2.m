clear;
Fs=8000; 
bands=20;  %% for equal spacing
%bands=12;  %% For unequal spacing 0 to 1200 Hz equal spacing with BW 150Hz and remaining 1200 to 4000 Hz with BW 700 Hz 
%%
rudra_values=name_feature_extraction("rudra_Morning_","rudra_Afterlunch_",bands,Fs,1); %% extract energy values for each band of frequencies for all samples and plot the FFT of all the 8 samples
rudra_mean_var_sd_values=mean_value_extraction(rudra_values,bands); %% Extract mean ,variance and standard deviation for each band of rudra audio samples
%%
shouvik_values=name_feature_extraction("shouvik_Morning_","shouvik_Aftlnch_",bands,Fs,2);  %% extract energy values for each band of frequencies for all samples and plot the FFT of all the 8 samples
shouvik_mean_var_sd_values=mean_value_extraction(shouvik_values,bands); %% Extract mean ,variance and standard deviation for each band of shouvik audio samples
%%
prerna_values=name_feature_extraction("prerna_morning","prerna_afti",bands,Fs,3);  %% extract energy values for each band of frequencies for all samples and plot the FFT of all the 8 samples
prerna_mean_var_sd_values=mean_value_extraction(prerna_values,bands); %% Extract mean ,variance and standard deviation for each band of prerna audio samples
%%
nivedita_values=name_feature_extraction("nivedita_morn","nivedita_afti",bands,Fs,4);  %% extract energy values for each band of frequencies for all samples and plot the FFT of all the 8 samples
nivedita_mean_var_sd_values=mean_value_extraction(nivedita_values,bands); %% Extract mean ,variance and standard deviation for each band of Nivedita audio samples
%%
values=zeros(32,bands); %% creating a 2-D matrix which contain all the 32 energy vectors
values(1:8,:)=rudra_values(:,:);
values(9:16,:)=shouvik_values(:,:);
values(17:24,:)=prerna_values(:,:);
values(25:32,:)=nivedita_values(:,:);
%% To get euclidean distance for each and every pair
dist=zeros(32,32);
for i=1:32
    for j=1:32
        y=values(i)-values(j);
        dist(i,j)=sqrt(y*transpose(y));
    end
end
%% Finding algorithm accuracy for each and every sample(where algorithm is only accessable for a particular person)
rudra_lock=lock_vec_extraction(rudra_mean_var_sd_values,values,bands);
shouvik_lock=lock_vec_extraction(shouvik_mean_var_sd_values,values,bands);
prerna_lock=lock_vec_extraction(prerna_mean_var_sd_values,values,bands);
nivedita_lock=lock_vec_extraction(nivedita_mean_var_sd_values,values,bands);
%% Displaying which algorithm gives access to which samples
disp("rudra:-");
disp(rudra_lock);
disp("shouvik:-");
disp(shouvik_lock);
disp("prerna:-");
disp(prerna_lock);
disp("nivedita:-");
disp(nivedita_lock);



