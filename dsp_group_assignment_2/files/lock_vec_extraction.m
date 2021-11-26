function lock_vec=lock_vec_extraction(name_values,values,bands) %%Algorithm for a particular person-1
    lock_vec=zeros(4,8);
    name_value1=zeros(2,bands);
    name_value1(1,:)=name_values(3,:)-2.5*name_values(5,:); %% creationg lower bound energy vector(for each band)
    name_value1(2,:)=name_values(3,:)+2.5*name_values(5,:); %% creationg upper bound energy vector(for each band)
    for i=1:4  %% checking for each and every person-1
        for j=1:8 %% checking for each and every sample of person-2
            z=8*i-8+j;
            lock_vec(i,j)=lock_value_extraction(name_value1,values(z,:),bands); %%function to determine whether to give access or not to the person-2 to the safe of person-1
        end
    end
end