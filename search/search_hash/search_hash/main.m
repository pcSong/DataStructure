//
//  main.m
//  search_hash
//
//  Created by 宋鹏程 on 15/10/16.
//  Copyright © 2015年 pcSong. All rights reserved.
//

#include <stdio.h>
#include <string.h>

/*
 *  POJ 1200——Crazy Search
 *
 *  Description
    Many people like to solve hard puzzles some of which may lead them to madness. One such puzzle could be finding a hidden prime number in a given text. Such number could be the number of different substrings of a given size that exist in the text. As you soon will discover, you really need the help of a computer and a good algorithm to solve such a puzzle.
    Your task is to write a program that given the size, N, of the substring, the number of different characters that may occur in the text, NC, and the text itself, determines the number of different substrings of size N that appear in the text.
 
    As an example, consider N=3, NC=4 and the text "daababac". The different substrings of size 3 that can be found in this text are: "daa"; "aab"; "aba"; "bab"; "bac". Therefore, the answer should be 5.
 
    Input
    The first line of input consists of two numbers, N and NC, separated by exactly one space. This is followed by the text where the search takes place. You may assume that the maximum number of substrings formed by the possible set of characters does not exceed 16 Millions.
    
    Output
    The program should output just an integer corresponding to the number of different substrings of size N found in the given text.
    
    Sample Input
    3 4 daababac
 *
 */
int flag[20000000];
int a[300];
char s[20000000];

int main(int argc, const char * argv[])
{
    int n, m;
    while(scanf("%d%d", &n, &m) != EOF) {
        memset(flag, 0, sizeof(flag));
        scanf("%s", s);
        int i, j = 0, len = strlen(s);
        memset(a, 0, sizeof(a));
        
        for (i = 0; i < len; i++)
            a[s[i]] = 1;
        
        for (i = 0; i < 256; i++)
            if (a[i] == 1)
                a[i] = j++;
        
        int mod = 1, res = 0;
        for (i = 0; i < n-1; i++)
            mod = mod * m;
        
        for (i = 0; i < n; i++)
            res = res * m + a[s[i]];
        
        flag[res] = 1;
        for (i = n; i < len; i++) {
            res = res % mod * m + a[s[i]];
            flag[res] = 1;
        }
        
        int count = 0; mod = mod * m;
        for (i = 0; i <= mod; i++)
            if (flag[i] == 1)
                count++;
        
        printf("%d\n", count);
    }
}