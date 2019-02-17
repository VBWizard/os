/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "libChrisOS.h"
#include "strings.h"

int getenvI(char *varname, char *value)
{
    for (int cnt=0;cnt<100;cnt++)
        if (strncmpI(processEnvp[cnt],varname, strlenI(varname))==0)
        {
            strncpyI(value, strstrI(processEnvp[cnt],"=")+1,50);
            return cnt+1;
        }
    return 0;
}

VISIBLE int getenv(char *varname, char *value)
{
    return getenvI(varname, value);
}

VISIBLE void  setenv(char *varname, char *value)
{
    uint32_t lastPopulated = 0;
    
    for (int cnt=0;cnt<100;cnt++)
        if (processEnvp[cnt]!=0)
        {
            lastPopulated = (uint32_t)processEnvp[cnt];
            if (strncmpI(processEnvp[cnt],varname, strlenI(varname))==0)
            {
                strcpyI(processEnvp[cnt],varname);
                strcatI(processEnvp[cnt],"=");
                strcatI(processEnvp[cnt],value);
                return;
            }
        }
    for (int cnt=0;cnt<100;cnt++)
        if (processEnvp[cnt]==0)
        {
            processEnvp[cnt]=(char*)lastPopulated+512;
            strcpyI(processEnvp[cnt],varname);
            strcatI(processEnvp[cnt],"=");
            strcatI(processEnvp[cnt],value);
            return;
        }            
    //NOTE: if we get here, the value is thrown away!        
    
}

char* getcwdI(char* buf, size_t size)
{
    return (char*)do_syscall2(SYSCALL_GETCWD,(uint32_t)buf,size);
    
}

VISIBLE char* getcwd(char* buf, size_t size)
{
    return getcwdI(buf,size);
}
