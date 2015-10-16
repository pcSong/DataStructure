//
//  main.m
//  sort_quick
//
//  Created by 宋鹏程 on 15/10/15.
//  Copyright © 2015年 pcSong. All rights reserved.
//

#include <stdio.h>

// 快速排序
void sort_quick(int a[], int begin, int end)
{
    if (begin >= end) return ; // 递归出口
    
    int left = begin, right = end, middle = a[begin];

    // 一次遍历处理使：middle左侧都小于middle，middle右侧都大于middle
    while (left < right) {
        while (left < right && a[right] >= middle) {
            right--;
        }
        a[left] = a[right];
        
        while (left < right && a[left] <= middle) {
            left++;
        }
        a[right] = a[left];
    }
    a[left] = middle; // 一趟处理此时结束

    sort_quick(a, begin, right-1); // 递归middle左侧
    sort_quick(a, right+1, end); // 递归middle右侧
}


int main(int argc, const char * argv[])
{
    int a[10] = {3, 2, 5, 8, 9, 0, 1, 6, 7, 4};
    
    sort_quick(a, 0, 9);
    
    for (int i = 0; i < 10; i++)
        printf("%d ", a[i]);
    printf("\n");
    
    return 0;
}
