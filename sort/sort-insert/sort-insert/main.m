//
//  main.m
//  sort-insert
//
//  Created by 宋鹏程 on 15/10/15.
//  Copyright © 2015年 pcSong. All rights reserved.
//

#include <stdio.h>

void swap(int *a, int *b)
{
    if (a != b) {
        *a = *a ^ *b;
        *b = *b ^ *a;
        *a = *a ^ *b;
    }
}

// 插入排序
void sort_insert(int a[], int n)
{
    for (int i = 1; i < n; i++) {
        int j = i;
        while (j > 0 && a[j] < a[j-1]) {
            swap(&a[j], &a[j-1]);
            j--;
        }
    }
}


int main(int argc, const char * argv[])
{
    int a[10] = {3, 2, 5, 8, 9, 0, 1, 6, 7, 4};
    
    sort_insert(a, 10);
    
    for (int i = 0; i < 10; i++)
        printf("%d ", a[i]);
    printf("\n");
    
    return 0;
}
