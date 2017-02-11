/* 
 * File:   sysloader.h
 * Author: yogi
 *
 * Created on June 9, 2016, 3:12 PM
 */

#ifndef SYSLOADER_H
#define	SYSLOADER_H

int sysExec(char* fileName,int argc,char** argv);
uint32_t sysLoadElf(void* file);   //returns entry point;

#endif	/* SYSLOADER_H */
