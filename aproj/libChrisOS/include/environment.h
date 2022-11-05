/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   environment.h
 * Author: yogi
 *
 * Created on December 31, 2018, 8:19 PM
 */

#ifndef ENVIRONMENT_H
#define ENVIRONMENT_H

#ifdef __cplusplus
extern "C" {
#endif

    int getenv(char *varname, char *value);
    int getenvI(char *varname, char *value);
    void  setenv(char *varname, char *value);
    char* getcwdI(char* buf, size_t size);
    char* getcwd(char* buf, size_t size);

#ifdef __cplusplus
}
#endif

#endif /* ENVIRONMENT_H */

