#include <stdio.h>
#include <stdlib.h>
#include <string.h>



int main(int argc, char* argv[]) {

    char* str = calloc(15, sizeof(char));
    int sum = 0, i;
    
    //Creating an array that's 15 characters long, and assigning it to a pointer with calloc.
    
    printf("Enter an all lowercase word, max of 15 characters: ");
    scanf("%15s", str);

    // Scanning input for the user to pick from
 
    int options;
    
    printf("Choose an option: \n  1) Memory dump \n  2) Print hash value \n  3) Determine if your word is a palindrome \n  4) Print the word from an index. \n\nOption (number): ");
    scanf("%d", &options);

    int x = strlen(str);

    /*
    Setting a variable equal to the length of the array.
    This gets used throughout the functions below.
    */ 


// Main four functions.
    
    
    // Function #1
    void memDump() 
    
    {

        for (int i = 0; i < x; i++) 
        {
            
            printf("%p  ", (&str + i));
            printf("%d  ", *(str + i));
            printf("%c  \n", *(str + i));
            
            // Prints out the memory location, ASCII location, and the character per position in the array using pointers.

        }

    }
    
    // Function #2
    int getHash() 

    {

        for (int i = 0; i < x; i++)

        {
           
           sum = sum + *(str + i);

           // Calculates and adds the ASCII values together using pointers.
           
        }
        
        printf("\nHash Value: ");
        printf("%d ", sum / x);

        // Takes the sum of all the ASCII values and divides it by the length of the entire array. This returns the correct hash value.

    }
    
    // Function #3
    int isPalindrome(char *str)

    {
        
        char *h, *l;
        int length = x;

        // h = higher, it is the first character in the string, l = lower, it is the last character of string

        h = str;
        l = h + length - 1;
        
        for (h = str; l >= h; h++)

        {

            if (*l == *h)

            {
                /*
                If the first character and last character are the same in
                the string, decrement last character position and increment
                the first character positon and compare. This will continue until
                the loop is over.
                */ 
                
                l--;
                

            } else
                break;
                // Breaks loop

        }   if (h >= l)
                printf("\nNice, '%s' is a palindrome :)", str);
                // if the positions of the higher characters are greater than or equal to the lower...

        else
            printf("\nSadly, '%s' is not a palindrome :(", str);
            

    }
    
    // Function #4
    int printfromIndex(char *str) 
    
    {
        
        int picker;
        
        printf("What index should I start at? ");
        scanf("%d", &picker);

        // Taking in user input for selected index positon and assigning it to the variable picker.

         if (picker > x - 1) 
         
         {
            
            printf("Oops! That isn't a valid starting index, try again later.");
           
            // If index is greater than the length of the array's last position....

         } else
            
            printf("So, '%s' starting at index %d is ", str, picker);
            
            for(i = picker; i < x; i++) 
            {

                printf("%c", *(str + i));

                /*
                Sets i = selected index, index is less than the length of the array, 
                and it gets incremented so we can return the other letters after 
                the input IF and only if they exist
                */

            }
            
    }

    
    
// Conditionals that allow user to pick which function to run through from input and calling them.
    
    
    if(options == 1) 
    
    {
        
        printf("\nMemory Dump: \n");
        memDump();
    
    }

    
    if(options == 2)

    {
        
        getHash();

    }

    
    if(options == 3)

    {

        isPalindrome(str);

    }

    
    if(options == 4)

    {

        printfromIndex(str);

    }
    
    
    if(options > 4)

    {

        printf("\nSorry, but you cannot pick other options if they don't exist. Run this again.");

    }

    
    if(options <= 0)
    
    {

        printf("\nSorry, but you cannot pick other options if they don't exist. Run this again.");

    }


        
    return 0;

}