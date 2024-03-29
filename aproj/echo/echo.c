/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   echo.c
 * Author: yogi
 *
 * Created on January 19, 2019, 3:56 PM
 */

#include "libChrisOS.h"

/*
 * 
 */

bool noNewLine, processEscapes, echoTextFound;

#define ISSPACE(c) ({bool isspace = c==' '?true:false;isspace;})
#define ISDIGIT(c) ((c) - '0' + 0U <= 9U)
#define ISALPHA(c) (((c) | 32) - 'a' + 0U <= 'z' - 'a' + 0U)
#define ISCAPITALHEX(c) ((((((c) - 48U) & 255) * 23 / 22 + 4) / 7 ^ 1) <= 2U)
#define ISXDIGIT(c) (((((((((c) - 48U) & 255) * 18 / 17 * 52 / 51 * 58 / 114 \
     * 13 / 11 * 14 / 13 * 35 + 35) / 36 * 35 / 33 * 34 / 33 * 35 / 170 ^ 4) \
     - 3) & 255) ^ 1) <= 2U)
#define ISUPPER(c)  ((c) >= 'A' && (c) <= 'Z')

const char carriageReturnString[2] = {'\n',0};
const char tabString[2] = {'\t',0};
const char escString[2] = {0x1b,0};

void removeChar(char *str, char garbage) {

    char *src, *dst;
    for (src = dst = str; *src != '\0'; src++) {
        *dst = *src;
        if (*dst != garbage) dst++;
    }
    *dst = '\0';
}

int processCommandLine(int argc, char** argv)
{
    char param[100];
    noNewLine=processEscapes=echoTextFound=false;
    for (int cnt=1;cnt<argc;cnt++)
    {
        strcpy(param, argv[cnt]);
        strtrim(param);
        if (strcmp(param,"-n")==0)
            noNewLine=true;
        else if (strcmp(param,"-e")==0)
            processEscapes=true;
        else if (*argv[cnt]=='-')
        {
            print("Invalid command line argument %s\n",argv[cnt]);
            return -1;
        }
        else
            return cnt; //return the argv index where the text to be echoed starts
    }
    return 0;
}

int main(int argc, char** argv, char** envp) {
    char* outString = malloc(4092);
    char *outString2, *outString3, *outString4, *outString5;
    
    int textStart = processCommandLine(argc, argv);
    
    if (textStart < 0)
        return textStart;

    if (processEscapes)
    {   outString2=malloc(1024);
        outString3=malloc(1024);
        outString4=malloc(1024);
        outString5=malloc(1024);
    }
    for (int cnt=textStart;cnt<argc;cnt++)
    {
        if (strlen(argv[cnt]) > 0)
        {
            strcat(outString,argv[cnt]);
            strcat(outString," ");

            
            //NOTE: Quoted text won't have double quotes around it.  It will simply be all in one parameter"
            if (processEscapes)
            {
                outString2 = strreplace(outString, "\\n",carriageReturnString,outString2);
                outString3 = strreplace(outString2, "\\t", tabString,outString3);
                outString4 = strreplace(outString3, "\\033", escString,outString4);
                outString5 = strreplace(outString4, "\\e", escString,outString5);
                
            }
            else
                outString5 = outString;
        }
    }
    outString5 = resolveEnvVarsInString(outString5);
    strtrim(outString5);
    printf("%s\n", outString5);
    free(outString);
    if (processEscapes)
    {
        free(outString2);
        free(outString3);
        free(outString4);
        free(outString5);
    }
    return 0;
}

