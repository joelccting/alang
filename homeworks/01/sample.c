#include <stdio.h>
#include <stdlib.h>

int main(void)
{
   int i, sum, A[200], B[200];
   
   sum = 0;

   for (i=0; i<200; i++) {
      A[i] = rand()%100;
      B[i] = rand();
   }

   for (i=0; i<=200; i++)
      sum = sum + B[A[i]];
   
   printf("%d\n", sum);
   
   return 0;
}