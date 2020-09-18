clc;
clear;
close all;
%%

fitness_values = [10, 100, 5.5, 34, 1000, 1, 200, 100, 150, 90];

% Step 1 : Normalize Fitness Value
normalized_fitness_values = fitness_values./sum(fitness_values);

%Step 2 :To sort the normalized fitness values
sorted_fitness_values = sort(normalized_fitness_values, 'descend');


% Cumulatif Sum
cumsum = zeros(1, length(fitness_values));

for i = 1 : length(fitness_values)
    for j = i : length(fitness_values)
        
        cumsum(i) = cumsum(i) + sorted_fitness_values(j);
    end
end

% Step 3 : To select one of the individuals
R = rand(); %in[0,1]

for i = 1  :length(cumsum)
    if R > cumsum(i);
        Parent1 = i -1
        break;
    end
end

R = rand(); %in[0,1]

for i = 1  :length(cumsum)
    if R > cumsum(i);
        Parent2 = i -1
        break;
    end
end

