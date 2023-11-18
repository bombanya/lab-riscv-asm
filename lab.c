#include <stdint.h>
#include <stdio.h>

#define N 5
#define M 3

uint32_t find_row_min_sum(int32_t matrix[M][N], uint32_t rows, uint32_t cols) {
    int32_t min_sum = INT32_MAX;
    uint32_t res_row = 0;
    int32_t cur_sum;
    
    for (uint32_t i = 0; i < rows; i++) {
        cur_sum = 0;
        for (uint32_t j = 0; j < cols; j++) {
            cur_sum += matrix[i][j];
        }
        if (cur_sum < min_sum) {
            min_sum = cur_sum;
            res_row = i;
        }
    }

    return res_row;
}

int main() {
    int32_t matrix[M][N];

    for (uint32_t i = 0; i < M; i++) {
        for (uint32_t j = 0; j < N; j++) {
            scanf("%d", &matrix[i][j]);
        }
    }

    uint32_t res = find_row_min_sum(matrix, M, N);
    printf("%d\n", res);

    return 0;
}
