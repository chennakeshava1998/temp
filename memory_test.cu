#include <cuda.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include <math.h>

// Number of rows in the first input matrix
#define M (int)(pow(2, 32))

// Number of columns in the first input matrix
#define N (int)(pow(2, 32))
int cnt;
void have_fun()
{
    // printf("Number of function calls: %d\n", cnt);
    ++cnt;
    double *A, *B, *C;
    cudaMalloc((void **)&A, M * N * sizeof(double));
    cudaMalloc((void **)&B, M * N * sizeof(double));
    cudaMalloc((void **)&C, M * M * sizeof(double));

    have_fun();
}



int main()
{
    cnt = 0;
    have_fun();

    return 0;
}
