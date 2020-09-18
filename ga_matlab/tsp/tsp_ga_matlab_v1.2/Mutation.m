function [mutant] = Mutation(os, pm)

    geneSize = length(os);
    
    for k = 1 : geneSize
        
       R = rand();
       
       if R < pm
           
          if k < geneSize
            
              temp = os(k);
              os(k) = os(k + 1);
              os(k) = temp;
              
          elseif k == geneSize
              
              temp = os(k);
              os(k) = os(k - 1);
              os(k - 1) = temp;
            
          end 
          
       end
    end
    
    mutant.Gene = os;


end