function mean_values=mean_value_extraction(values,bands) %% For a particular person
    mean_values=zeros(5,bands);
    for i=1:4  %% calculating mean values for morning samples
        for j=1:bands %% calculating mean values for every band
            mean_values(1,j)=mean_values(1,j)+values(i,j);
        end
    end
    for i=5:8  %% calculating mean values for afternoon samples
        for j=1:bands  %% calculating mean values for every band
            mean_values(2,j)=mean_values(2,j)+values(i,j);
        end
    end
    for i=1:2  %% mean of entire samples
        for j=1:bands %% for each band
            mean_values(3,j)=mean_values(1,j)+mean_values(2,j);
        end
    end
    for j=1:bands 
        mean_values(1,j)=mean_values(1,j)/4; %% mean of morning samples
        mean_values(2,j)=mean_values(2,j)/4; %% mean of afternoon samples
        mean_values(3,j)=mean_values(3,j)/8; %% mean of entire samples
    end
    for i=1:8  %% calculating variance for entire samples
        for j=1:bands
            mean_values(4,j)=mean_values(4,j)+(values(i,j)-mean_values(3,j))^2;
        end
    end
    for j=1:bands %% calculating standard deviation for entire samples
        mean_values(4,j)=mean_values(4,j)/7; %% variance of entire samples
        mean_values(5,j)=mean_values(4,j)^0.5; %% standarad deviation of entire samples
    end
end