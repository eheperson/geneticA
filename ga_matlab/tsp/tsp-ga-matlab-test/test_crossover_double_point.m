clc;
close all;
clear all;

Parent1 = [round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()) ];
Parent2 = [round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()), round(rand()) ];

Gene_No =  length(Parent1);

ub = length(Parent1 - 1); % upper bound
lb = 1; %lower bound

Cross_P1 = round( (ub - lb)*rand() + lb );

Cross_P2 = Cross_P1;

while Cross_P2 == Cross_P1
    ub = length(Parent1 - 1); % upper bound
    lb = 1; %lower bound

    Cross_P2 = round( (ub - lb)*rand() + lb );
end

if Cross_P1 > Cross_P2
   temp = Cross_P1;
   Cross_P1 = Cross_P2;
   Cross_P2 = temp;
end

Part1 = Parent1(1 : Cross_P1);
Part2 = Parent2(Cross_P1 + 1 : Cross_P2); 
Part3 = Parent1(Cross_P2 + 1 : Gene_No);

Child1 = [ Part1, Part2, Part3 ]

Part1 = Parent2(1 : Cross_P1);
Part2 = Parent1(Cross_P1 + 1 : Cross_P2); 
Part3 = Parent2(Cross_P2 + 1 : end);

Child2 = [ Part1, Part2, Part3 ]