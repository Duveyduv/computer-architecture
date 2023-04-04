/*
 * file: main5.c
 * main C program that uses assembly routine in sub5.asm
 * to create executable:
 * DJGPP:   gcc -o sub5 main5.c sub5.o asm_io.o
 * Borland: bcc32 sub5.obj main5.c asm_io.obj
 */

#include <stdio.h>

#include "cdecl.h"

int PRE_CDECL binary_to_base10( int ) POST_CDECL; /* prototype for assembly routine */
int PRE_CDECL count_ones( int ) POST_CDECL; /* prototype for assembly routine */

int main( void )
{
  int original_number, decimal_rep, num_ones;

  printf("Enter a binary number: ");
  scanf("%d", &original_number);

  decimal_rep = binary_to_base10(original_number);
  printf("\n%d in base 10 is: %d\n", original_number, decimal_rep);

  num_ones = count_ones(decimal_rep);
  printf("%d has %d 1s in it!", original_number, num_ones);

  return 0;
}
