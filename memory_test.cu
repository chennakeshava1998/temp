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
    // to prevent a seg-fault
    if(cnt < 130080)
    return;

    // printf("Number of function calls: %d\n", cnt);
    ++cnt;
    double *A, *B, *C;
    cudaMalloc((void **)&A, M * N * sizeof(double));
    cudaMalloc((void **)&B, M * N * sizeof(double));
    cudaMalloc((void **)&C, M * M * sizeof(double));


    cudaMemcpy(A, host_A, M * N * sizeof(double), cudaMemcpyHostToDevice);
    cudaMemcpy(B, host_B, M * N * sizeof(double), cudaMemcpyHostToDevice);
    cudaMemcpy(host_C, C, M * M * sizeof(double), cudaMemcpyDeviceToHost);
    

    have_fun();
    --cnt;
    cudaFree(A);
    cudaFree(B);
    cudaFree(C);
}

int main()
{
    cnt = 0;
    int i = 0;
    while(1)
    {
        printf("i = %d\n", i);
        ++i;
        have_fun();
    }
        

    return 0;
}
