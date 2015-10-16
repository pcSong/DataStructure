//
//  main.m
//  search_order
//
//  Created by 宋鹏程 on 15/10/16.
//  Copyright © 2015年 pcSong. All rights reserved.
//

#include <stdio.h>

// 顺序查找
int search_order(int a[], int n, int key)
{
    for (int i = 0; i < n; i++) {
        if (a[i] == key)
            return i;
    }
    return -1;
}


int main(int argc, const char * argv[])
{
    int a[10] = {3, 2, 5, 8, 9, 0, 1, 6, 7, 4};
    
    int result = search_order(a, 10, 8);
    
    printf("Index of key is: %d\n", result);
    
    return 0;
}
