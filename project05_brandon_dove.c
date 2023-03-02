#include <stdio.h>
#include <stdlib.h>
#include <string.h>


// Our 
#define NUM_OF_GOATS 255
#define COST_OF_FEED 100


int main(int argc, char* argv[]) 

{

    // Defing our variables.
    int goat1;
    int goat2;
    int goat3;
    int goat4;

    // Printing the greeting with two newlines
    printf("👋 Greetings user! ");
    printf("\n\n");
    
    // Asking for first number and storing it into goat1
    printf("Enter number #1: ");
    scanf("%d", &goat1);

    // Asking for second number and storing it into goat2
    printf("Enter number #2: ");
    scanf("%d", &goat2);

    // Adding goat1 and goat2 together
    goat1 += goat2;

    // Asking for third number and storing it into goat3
    printf("Enter number #3: ");
    scanf("%d", &goat3);

    // Multiplying goat3 by NUM_OF_GOATS which is defined as 255
    goat3 *= NUM_OF_GOATS;

    // Adding it to our goat1 value, which is considered our totatl
    goat1 += goat3;

    // Asking for fourth number and reading it into goat4
    printf("Enter number #4: ");
    scanf("%d", &goat4);

    // Multiplying goat4 by COST_OF_FEED which is defined as 100
    goat4 *= COST_OF_FEED;

    // Finally, adding goat4 to goat1 and outputting that value with a newline beforehand.
    goat1 += goat4;

    printf("\n🥳 Answer: %d", goat1);


}