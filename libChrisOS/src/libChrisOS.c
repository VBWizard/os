/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#define VISIBLE __attribute__((visibility("default")))

extern void sysEnter_Vector();

void VISIBLE libc_init(void)
{
    asm("mov eax,0\ncld\ncall sysEnter_Vector\n");

}

void initMe()
{
    
}