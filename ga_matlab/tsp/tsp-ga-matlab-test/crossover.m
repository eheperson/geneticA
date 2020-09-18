function [Child1, Child2] = crossover(Parent1, Parent2, Pc, CrossoverType)

    switch CrossoverType

        case 'single'
            
            Gene_No =  length(Parent1.Gene);

                ub = length(Parent1.Gene - 1); % upper bound
                lb = 1; %lower bound
                Cross_P = round( (ub - lb)*rand() + lb )


                Part1 = Parent1.Gene(1:Cross_P);
                Part2 = Parent2.Gene(Cross_P+1:Gene_No);
                Child1.Gene = [Part1, Part2]

                Part1 = Parent2.Gene(1:Cross_P);
                Part2 = Parent1.Gene(Cross_P+1:Gene_No);
                Child2.Gene = [Part1, Part2]

        case 'double'

                Gene_No =  length(Parent1.Gene);

                ub = length(Parent1.Gene - 1); % upper bound
                lb = 1; %lower bound

                Cross_P1 = round( (ub - lb)*rand() + lb );

                Cross_P2 = Cross_P1;

                while Cross_P2 == Cross_P1
                    Cross_P2 = round( (ub - lb)*rand() + lb );
                end

                if Cross_P1 > Cross_P2
                   temp = Cross_P1;
                   Cross_P1 = Cross_P2;
                   Cross_P2 = temp;
                end
                    Cross_P1
                    Cross_P2
                Part1 = Parent1.Gene(1 : Cross_P1);
                Part2 = Parent2.Gene(Cross_P1 + 1 : Cross_P2); 
                Part3 = Parent1.Gene(Cross_P2 + 1 : Gene_No);

                Child1.Gene = [ Part1, Part2, Part3 ];

                Part1 = Parent2.Gene(1 : Cross_P1);
                Part2 = Parent1.Gene(Cross_P1 + 1 : Cross_P2); 
                Part3 = Parent2.Gene(Cross_P2 + 1 : end);

                Child2.Gene = [ Part1, Part2, Part3 ];
    end
    
    R1 = rand();
    
    if R1 <= Pc
        Child1 = Child1;
    else
        Child1 = Parent1;
    end
    
    R2 = rand();
    
    if R2 <= Pc
        Child2 = Child2;
    else
        Child2 = Parent2;
    end
end