/*
To compile in linux type:

gcc -g 'FILE NAME' -o 'LOCATION'
*/


// #define means you are defining a macro. It's code you can use later.


// && = and
// || = or


//malloc allocates memory that is uninitialized.
//calloc allocates initialized memory

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MEANING_OF_LIFE 42
#define PI (22/7)

int main(int argc, char* argv[]) {
    printf("Hello World!");
    
    int numberGrade = 84;
    
    if (numberGrade >= 90) {
        printf("\nA!");
    }

    else if (numberGrade >= 80) {
        printf("\nB!");
    }

    else if (numberGrade >= 70) {
        printf("\nC!");
    }
    
    //assigning an integer to a pointer

    int number = 23;
    int* numberPtr = &number;

    printf("\nNumberPtr: %p\n", numberPtr);


    //dereferencing a pointer

    int numberData = *numberPtr;

    *numberPtr = 56;
    printf("Number: %d\n", number);


    int* mallocedInt = malloc(sizeof(int));
    *mallocedInt = 21; 
    
    int* mallocedInt2 = malloc(sizeof(int));
    printf("MallocedInt2: %d\n", *mallocedInt2);


    int* callocedInt = calloc(1, sizeof(int));

    free(mallocedInt);
    printf("Freed MallocedInt: %d\n", *mallocedInt);

    int answer;
    printf("Enter a number: ");
    scanf("%d", &answer); // address of answer
    printf("Echo: %d\n", answer);

    return 0;

    int* intArray = calloc(5, sizeof(int));
    *(intArray + 2) = 45; // 3rd element to 45.

    char* str = calloc(20, sizeof(char));
    printf("Enter a string: ");
    scanf("%s", str);
    printf("Echo: %s\n", str);


    int* fillArray = malloc(5 * sizeof(int));
    for (int x = 0; x < 5; x++) {
        printf("Enter number #%d\n", (x+1));
        scanf("%d", fillArray + x);

    }


    return 0;


    

}
