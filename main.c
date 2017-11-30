/*
 * file: main.c
 * This program tests the 32-bit read_doubles() assembly procedure.
 * It reads the doubles from stdin. 
 * (Use redirection to read from file.)
 */

#include <stdio.h>

#include "cdecl.h"

extern void PRE_CDECL get_array( double *, int ) POST_CDECL;
extern int PRE_CDECL read_doubles( FILE *, double *, int ) POST_CDECL;
extern double PRE_CDECL standard_dev( double *, int ) POST_CDECL;

#define MAX 100

int main()
{
  int i,n;
  double *a;
  double stdev;
  
  get_array(a,MAX);

  n = read_doubles((fopen("numbers.txt", "r")), a, MAX);

//  for( i=0; i < n; i++ )
 //   printf("%3d %g\n", i, a[i]);

  printf("The standard deviation is: %f\n",standard_dev(a,MAX));

  return 0;
}
