function lock_value=lock_value_extraction(name_value1,values,bands)
    vec1=name_value1(1,:) <= values; %% checks whether the energy values for each band in values lies above the each band energy of name_value1(1,:)  
    vec2=name_value1(2,:) >= values;  %% checks whether the energy values for each band in values lies below the each band energy of name_value1(2,:)
    lock_vec=vec1.*vec2;  %% output array of 1 and 0's to determine whether that band enrgy lies in the range
    lock_value=1;
    for i=1:bands
        lock_value=lock_value*lock_vec(i);  %% output 1 if all the band of energies lies in the given range
    end
end