#include <stdio.h>
#include <stdlib.h>

int main() {
    int* favoritePointer = malloc(8);

    printf("Enter your favorite number: ");
    scanf("%d", favoritePointer);

    printf("\n");

    printf("%d\n", *favoritePointer);

    int favoriteTimes9 = *favoritePointer * 9;
    printf("%d\n", favoriteTimes9);

    int favoriteTimes24 = *favoritePointer * 24;
    printf("%d\n", favoriteTimes24);

    free(favoritePointer);

    return 0;

}
