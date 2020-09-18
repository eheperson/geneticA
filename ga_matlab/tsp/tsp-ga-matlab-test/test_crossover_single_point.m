clc;
close all;
clear all;

Parent1 = [round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()) ];
Parent2 = [round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()) ];

Gene_No =  length(Parent1);



ub = length(Parent1 - 1); % upper bound
lb = 1; %lower bound

%       Cross_P = randi([ 0, Gene_no])

Cross_P = round( (ub - lb)*rand() + lb )


% % single-point crossover using loop
% for i = 1 : Cross_P
%     Child1(i) = Parent1(i);
%     Child2(i) = Parent2(i);
% end
% 
% for i = Cross_P + 1 : Gene_No
%     Child1(i) = Parent2(i);
%     Child2(i) = Parent1(i);
% end


% single point cross-over using vectors
Part1 = Parent1(1:Cross_P);
Part2 = Parent2(Cross_P+1:Gene_No);

Child1 = [Part1, Part2]

Part1 = Parent2(1:Cross_P);
Part2 = Parent1(Cross_P+1:Gene_No);

Child2 = [Part1, Part2]