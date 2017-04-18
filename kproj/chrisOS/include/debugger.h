/* 
 * File:   debugger.h
 * Author: yogi
 *
 * Created on June 14, 2016, 8:08 AM
 */

#ifndef DEBUGGER_H
#define	DEBUGGER_H

#ifdef	__cplusplus
extern "C" {
#endif

void activateDebugger();
void debugStep();
#define SET_TRAP_FLAG debugReturnFlags|=0x100;
#define CLEAR_TRAP_FLAG debugReturnFlags&=0xFEFF;

#ifdef	__cplusplus
}
#endif

#endif	/* DEBUGGER_H */

