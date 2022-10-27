/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   rusage.h
 * Author: yogi
 *
 * Created on April 2, 2017, 10:55 AM
 */

#ifndef RUSAGE_H
#define RUSAGE_H

#ifdef __cplusplus
extern "C" {
#endif
    
#define __need_timeval 1
#include "bits/time.h"
    
    
    struct rusage {
//        struct timeval ru_utime; /* user CPU time used */
//        struct timeval ru_stime; /* system CPU time used */
        long   ru_maxrss;        /* maximum resident set size */
        long   ru_ixrss;         /* integral shared memory size */
        long   ru_idrss;         /* integral unshared data size */
        long   ru_isrss;         /* integral unshared stack size */
        long   ru_minflt;        /* page reclaims (soft page faults) */
        long   ru_majflt;        /* page faults (hard page faults) */
        long   ru_nswap;         /* swaps */
        long   ru_inblock;       /* block input operations */
        long   ru_oublock;       /* block output operations */
        long   ru_msgsnd;        /* IPC messages sent */
        long   ru_msgrcv;        /* IPC messages received */
        long   ru_nsignals;      /* signals received */
        long   ru_nvcsw;         /* voluntary context switches */
        long   ru_nivcsw;        /* involuntary context switches */
    };

    /*
     ru_utime
              This is the total amount of time spent executing in user mode,
              expressed in a timeval structure (seconds plus microseconds).

       ru_stime
              This is the total amount of time spent executing in kernel
              mode, expressed in a timeval structure (seconds plus
              microseconds).

       ru_maxrss (since Linux 2.6.32)
              This is the maximum resident set size used (in kilobytes).
              For RUSAGE_CHILDREN, this is the resident set size of the
              largest child, not the maximum resident set size of the
              process tree.

       ru_ixrss (unmaintained)
              This field is currently unused on Linux.

       ru_idrss (unmaintained)
              This field is currently unused on Linux.

       ru_isrss (unmaintained)
              This field is currently unused on Linux.

       ru_minflt
              The number of page faults serviced without any I/O activity;
              here I/O activity is avoided by “reclaiming” a page frame from
              the list of pages awaiting reallocation.

       ru_majflt
              The number of page faults serviced that required I/O activity.

       ru_nswap (unmaintained)
              This field is currently unused on Linux.

       ru_inblock (since Linux 2.6.22)
              The number of times the filesystem had to perform input.

       ru_oublock (since Linux 2.6.22)
              The number of times the filesystem had to perform output.

       ru_msgsnd (unmaintained)
              This field is currently unused on Linux.

       ru_msgrcv (unmaintained)
              This field is currently unused on Linux.

       ru_nsignals (unmaintained)
              This field is currently unused on Linux.

       ru_nvcsw (since Linux 2.6)
              The number of times a context switch resulted due to a process
              voluntarily giving up the processor before its time slice was
              completed (usually to await availability of a resource).

       ru_nivcsw (since Linux 2.6)
              The number of times a context switch resulted due to a higher
              priority process becoming runnable or because the current
              process exceeded its time slice.
     */

#ifdef __cplusplus
}
#endif

#endif /* RUSAGE_H */

