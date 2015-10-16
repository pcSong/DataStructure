//
//  main.m
//  sort_merge
//
//  Created by 宋鹏程 on 15/10/15.
//  Copyright © 2015年 pcSong. All rights reserved.
//

#include <stdio.h>

// 归并排序
void sort_merge(int a[], int begin, int end)
{
    if (begin == end) return ; // 递归出口
    
    int left = begin, middle = (begin+end)/2, right = middle+1;
    sort_merge(a, begin, middle); // 注意递归要先于单次归并
    sort_merge(a, right, end);
    
    int c[10] = {0}, k = 0;
    while (left <= middle && right <= end) {
        if (a[left] <= a[right]) {
            c[k++] = a[left++];
        } else {
            c[k++] = a[right++];
        }
    }
    while (left <= middle) {
        c[k++] = a[left++];
    }
    while (right <= middle) {
        c[k++] = a[right++];
    }
    
    for (int i = 0; i < k; i++) {
        a[begin++] = c[i]; // 注意：要排序的a的起始位置应加上偏移量
    }
    /* 与上面for循环等同
    for (int i = begin; i < begin+k; i++) {
        a[i] = c[i-begin];
    }
    */
}


int main(int argc, const char * argv[])
{
    int a[10] = {3, 2, 5, 8, 9, 0, 1, 6, 7, 4};
    
    sort_merge(a, 0, 9);
    
    for (int i = 0; i < 10; i++)
        printf("%d ", a[i]);
    printf("\n");
    
    return 0;
}
