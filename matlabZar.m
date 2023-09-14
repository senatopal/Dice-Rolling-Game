
row=input('Please enter number of row: ');
column=input('Please enter number of column: ');

if (row<=0)||(column<=0)
    disp('Should be entered valid values!');
    return;
end

M=round(2+33*rand(row,column));
disp(M);
counter=0;

while 1 
    dice_1=round(1+5*rand(1));      %the numbers have been taken in a random way.
    dice_2=round(1+5*rand(1));
    dice_3=round(1+5*rand(1));
    fprintf('The value of dice-1 is %d \n',dice_1);
    fprintf('The value of dice-2 is %d \n',dice_2);
    fprintf('The value of dice-3 is %d \n',dice_3);
    fprintf('_______________________________________________________\n');
    if (dice_1>=dice_2)&&(dice_1>=dice_3)    %the maximum number has been founded.
         max=dice_1;
    end
    if (dice_2>=dice_3)&&(dice_2>=dice_1)
         max=dice_2;
    end
    if (dice_3>=dice_2)&&(dice_3>=dice_1)
         max=dice_3;
    end
      
    if (dice_1<=dice_2)&&(dice_1<=dice_3)     %the minumum number has been founded.
         min=dice_1;
    end
    if (dice_2<=dice_3)&&(dice_2<=dice_1)
         min=dice_2;
    end
    if (dice_3<=dice_2)&&(dice_3<=dice_1)
         min=dice_3;
    end

    median=(dice_3+dice_1+dice_2)-(max+min);   %the median has been founded.

    a=(median*max)+min;  %the operation has been done. 
    for i=1:row   %it has been done for looping to find the result where is in the matrix.
        for j=1:column 
            if M(i,j)==a  %if founded result equals to any number in matrix, entered inside the if condition.
                M(i,j)=-1; %founded number turned to -1 inside the matrix.
                disp(M);
                fprintf('The number in row-%d and column-%d (%d) turned into -1.\n',i,j,a);
                fprintf('_______________________________________________________\n');
            end
        end
        if M(i,j)==-1 %when -1 is found,it provides to stop looping.
            break;
        end
    end
    if M(i,j)~=-1
                disp('The number can not be founded.');
                disp('_______________________________________________________');
   end
    for r=1:row %started the find numbers of -1.
        for m=1:column
            if M(r,m)==-1 %if any number in matrix equal to -1, entered inside the if condition.
                counter=counter+1; %counter increases by +1 for every founded number.
            end
        end
        if counter==column %if all numbers equal to -1 in a row,it is mean that number of -1 is equal to column number.
            counter=column;
            fprintf('          The Final State Of The Matrix          \n');
            fprintf('-------------------------------------------------------\n');
            disp(M);
            return;
        else
            counter=0; %if counter does not equal to column number in a row , it is mean that all number is not equal to -1. So,counter is reseted.it starts from 0 for other row. 
        end
    end
end
 