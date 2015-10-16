//
//  main.m
//  search_binary
//
//  Created by 宋鹏程 on 15/10/16.
//  Copyright © 2015年 pcSong. All rights reserved.
//

#include <stdio.h>

// 二分查找(又称折半查找)
int search_binary(int a[], int n, int key)
{
    int min = 0, max = n-1;

    while (min < max) {
        int middle = (min + max) / 2;
        if (a[middle] == key) return middle;
        
        if (a[middle] < key) {
            min = middle + 1;
        } else {
            max = middle - 1;
        }
    }
    return -1;
}

int main(int argc, const char * argv[])
{
    int a[10] = {0, 11, 22, 33, 44, 55, 66, 77, 88, 99};
    
    int result = search_binary(a, 10, 88);
    
    printf("Index of key is: %d\n", result);
    
    return 0;
}
