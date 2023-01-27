Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E27ED67EBB5
	for <lists+linux-doc@lfdr.de>; Fri, 27 Jan 2023 17:55:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234160AbjA0QzA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 Jan 2023 11:55:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234660AbjA0Qyy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Jan 2023 11:54:54 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA051ADF7
        for <linux-doc@vger.kernel.org>; Fri, 27 Jan 2023 08:54:43 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id c66so2126819iof.12
        for <linux-doc@vger.kernel.org>; Fri, 27 Jan 2023 08:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FXPGAQo6R8EiYSAsDjZ79BgcqJdogDKRUAhM+iQ2QKA=;
        b=F7AG2UVtuFjRMeU8N9CP9dE5NDvevkZsogHr7IkM/ceIhWXJmjLK68zElORVmVwTld
         EyjEQvmmoahk/Urio+AetGrupRB8dJWgVxYUYZ7hh/tLUcDkBUuvsZBW1mI6XYnpIZ7j
         g+HdqzZAMyk/RmqiMS+SLizYTU2W7Ukfe056g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXPGAQo6R8EiYSAsDjZ79BgcqJdogDKRUAhM+iQ2QKA=;
        b=CZcZ+FN29bm8059GF0gCkUeP5rla9nz+PnsCrBxNjw3Yhn9te45sRYs4q4Xz1wBIdc
         gbEzOUeEe4QOKjOrEPCzhMayYB510R3I788Qf9DoWvYWWKZptROLZpXf7he1oaFNQkIg
         hAmvRDh6DmAFtIpaeWDlFEvzJSVXd+9CtM2jmWf3XiWAcuVr9DZqRfopmko1IatKg5yl
         UHaj+ghhUcO9XLxCUYRE6M26G1EGVbNGa2jUvy74bYWpCg7AFeEvZf2hSdlVzrwG7wZD
         m65f29UoqQVWB7I99X8bWeJe+kzrh140Le58JmjWFRzcidsrnIVoaJyOa4OhzpU9r2rN
         kDUw==
X-Gm-Message-State: AFqh2kpF2+yB2/rLhxwJZDQ+CN15Kdi5oJ3vBWd5E9iq/5e3Bat+Iuk6
        JifGNXi4aL7VKMx4cWazWK6Cdg==
X-Google-Smtp-Source: AMrXdXuYxei1rQYSHmE9rE2MMPrix6DUUFdT+Xg5iI9ltBDQE/RMFrsdu+cQc/eEqaeSgYKiJZQ5NA==
X-Received: by 2002:a6b:b445:0:b0:707:e4eb:d91c with SMTP id d66-20020a6bb445000000b00707e4ebd91cmr2041475iof.1.1674838482584;
        Fri, 27 Jan 2023 08:54:42 -0800 (PST)
Received: from shuah-tx13.internal ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id u20-20020a6be414000000b006bbddd49984sm1400206iog.9.2023.01.27.08.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 08:54:41 -0800 (PST)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     corbet@lwn.net
Cc:     Shuah Khan <skhan@linuxfoundation.org>, sshefali021@gmail.com,
        kstewart@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] docs: add workload-tracing document to admin-guide
Date:   Fri, 27 Jan 2023 09:54:40 -0700
Message-Id: <20230127165440.19158-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a new section to the admin-guide with information of interest to
application developers and system integrators doing analysis of the
Linux kernel for safety critical applications.

This section will contain documents supporting analysis of kernel
interactions with applications, and key kernel subsystems expectations.

Add a new workload-tracing document to this new section.

Signed-off-by: Shefali Sharma <sshefali021@gmail.com>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 Documentation/admin-guide/index.rst           |  11 +
 .../admin-guide/workload-tracing.rst          | 486 ++++++++++++++++++
 2 files changed, 497 insertions(+)
 create mode 100644 Documentation/admin-guide/workload-tracing.rst

diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 5bfafcbb9562..f475554382e2 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -56,6 +56,17 @@ ABI will be found here.
 
    sysfs-rules
 
+This is the beginning of a section with information of interest to
+application developers and system integrators doing analysis of the
+Linux kernel for safety critical applications. Documents supporting
+analysis of kernel interactions with applications, and key kernel
+subsystems expectations will be found here.
+
+.. toctree::
+   :maxdepth: 1
+
+   workload-tracing
+
 The rest of this manual consists of various unordered guides on how to
 configure specific aspects of kernel behavior to your liking.
 
diff --git a/Documentation/admin-guide/workload-tracing.rst b/Documentation/admin-guide/workload-tracing.rst
new file mode 100644
index 000000000000..a04359a4f858
--- /dev/null
+++ b/Documentation/admin-guide/workload-tracing.rst
@@ -0,0 +1,486 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR CC-BY-4.0)
+.. See the bottom of this file for additional redistribution information.
+
+Discovering Linux kernel subsystems used by a workload
+++++++++++++++++++++++++++++++++++++++++++++++++++++++
+
+:Authors: - Shuah Khan <skhan@linuxfoundation.org>
+          - Shefali Sharma <sshefali021@gmail.com>
+
+Key Points
+==========
+
+ * Understanding system resources necessary to build and run a workload
+   is important.
+ * Linux tracing and strace can be used to discover the system resources
+   in use by a workload. The completeness of the system usage information
+   depends on the completeness of coverage of a workload.
+ * Performance and security of the operating system can be analyzed with
+   the help of tools such as `perf <https://man7.org/linux/man-pages/man1/perf.1.html>`_, `stress-ng <https://www.mankier.com/1/stress-ng>`_, `paxtest <https://github.com/opntr/paxtest-freebsd/blob/hardenedbsd/0.9.14-hbsd/README>`_.
+ * Once we discover and understand the workload needs, we can focus on them
+   to avoid regressions and use it to evaluate safety considerations.
+
+Methodology
+===========
+
+`strace <https://man7.org/linux/man-pages/man1/strace.1.html>`_ is a diagnostic, instructional, and debugging tool and can be used to discover the system resources in use by a workload. Once we discover and understand the workload needs, we can focus on them to avoid regressions and use it to evaluate safety considerations. We chose strace tool to trace workloads.
+
+This method of tracing tells us the system calls invoked by the workload and doesn't include all the system calls that can be invoked by it. In addition to that this trace tells us just the code paths within these system calls that are invoked. As an example, if a workload opens a file and reads from it successfully, then the success path is the one that is traced. Any error paths in that system call will not be traced. If there is a workload that provides full coverage the method outlined here will trace and find all possible code paths. The completeness of the system usage information depends on the completeness of coverage of a workload.
+
+The goal is tracing a workload on a system running a default kernel without requiring custom kernel installs.
+
+How do we gather fine grained system information?
+==================================================
+
+strace tool can be used to trace system calls made by a process and signals it receives. a process to the perf, stress-ng, paxtest workloads. System calls are the fundamental interface between an application and the operating system kernel. They enable a program to request services from the kernel. For instance, the open() system call in Linux is used to provide access to a file in the file system. strace enables us to track all the system calls made by an application. It lists all the system calls made by a process with the outputs of those calls.
+
+You can generate profiling data combining strace and perf record tools to record the events and information associated with a process. This provides insight into the process and "perf annotate" generates the statistics of each instruction of the program. This document goes over the details of how to gather fine grained information on a workload's usage of system resources.
+
+Getting the system ready for tracing
+====================================
+
+Before we can get started we will have to get our system ready. We assume that you have a Linux distribution running on a physical system or virtual machine. Most distributions will include strace command. Let’s install other tools that aren’t usually included to build Linux kernel. Please note that the following works on Debian based distributions. You might have to find equivalent packages on other Linux distributions.
+
+Install tools to build Linux kernel and tools in kernel repository. scripts/ver_linux is a good way to check if your system already has the necessary tools.
+::
+
+  sudo apt-get build-essentials flex bison yacc
+  sudo apt install libelf-dev systemtap-sdt-dev libaudit-dev libslang2-dev libperl-dev libdw-dev
+
+Browsing kernel sources
+::
+
+  sudo apt-get install cscope
+
+Install stress-ng and paxtest
+::
+
+  apt-get install stress-ng
+  apt-get install paxtest
+
+Workload overview
+=================
+
+We used strace to trace perf bench, stress-ng and paxtest workloads to show how to analyze a workload and identify Linux subsystems used by these workloads. We hope this process can be applied to trace workload(s). We will go over the workloads first.
+
+perf bench (all) workload:
+--------------------------
+
+The perf bench command contains multiple multi-threaded microkernel benchmarks for executing different subsystems in the Linux kernel and system calls. This allows us to easily measure the impact of changes, which can help mitigate performance regressions. It also acts as a common benchmarking framework, enabling developers to easily create test cases, integrate transparently, and use performance-rich tooling subsystems.
+
+Stress-ng netdev stressor workload:
+-----------------------------------
+
+stress-ng is used for performing stress testing on the kernel. It allows you to exercise various physical subsystems of the computer, as well as interfaces of the OS kernel, using "stressor-s". They are available for CPU, CPU cache, devices, I/O, interrupts, file system, memory, network, operating system, pipelines, schedulers, virtual machines. Please refer to the `stress-ng man-page <https://www.mankier.com/1/stress-ng>`_ to find the description of all the available stressor-s. The netdev stressor starts specified number (N) of workers that exercise various netdevice ioctl commands across all the available network devices.
+
+paxtest kiddie workload:
+------------------------
+
+paxtest is a program that tests buffer overflows in the kernel. It tests kernel enforcements over memory usage. Generally, execution in some memory segments makes buffer overflows possible. It runs a set of programs that attempt to subvert memory usage. It is used as a regression test suite for PaX, but might be useful to test other memory protection patches for the kernel. We used paxtest kiddie mode which looks for simple vulnerabilities.
+
+What is strace and how do we use it?
+====================================
+
+As mentioned earlier, strace which is a useful diagnostic, instructional, and debugging tool and can be used to discover the system resources in use by a workload. It can be used:
+
+ * To see how a process interacts with the kernel.
+ * To see why a process is failing or hanging.
+ * For reverse engineering a process.
+ * To find the files on which a program depends.
+ * For analyzing the performance of an application.
+ * For troubleshooting various problems related to the operating system.
+
+In addition, strace can generate run-time statistics on time, calls, and errors for each system call and report a summary on program exit, suppressing the regular output. This attempts to show system time (CPU time spent running in the kernel) independent of wall clock time. We plan to use these features to get information on workload system usage.
+
+strace command supports basic, verbose, and stats modes. strace command when run in verbose mode gives more detailed information about the system calls. Running strace -c generates a report of the percentage of time spent in each system call, the total time in seconds, the microseconds per call, the total number of calls, the count of each system call that has failed with an error and the type of system call made.
+
+ * Usage: strace <command we want to trace>
+ * Verbose mode usage: strace -v <command>
+ * Gather statistics: strace -c <command>
+
+We used the “-c” option to gather fine grained information.
+
+What is cscope and how do we use it?
+====================================
+
+Now let’s look at `cscope <https://cscope.sourceforge.net/>`_, a command line tool for browsing C, C++ or Java code-bases. We can use it to find all the references to a symbol, global definitions, functions called by a function, functions calling a function, text strings, regular expression patterns, files including a file.
+
+We can use cscope to find which system call belongs to which subsystem. This way we can find the kernel subsystems used by a process when it is executed. To use it navigate to the source code directory. Here we are analyzing the kernel source tree.
+
+First let’s checkout the latest Linux repository and build cscope database:
+::
+
+  git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git linux
+  cd linux
+  cscope -R -p10  # builds cscope.out database before starting browse session
+  cscope -d -p10  # starts browse session on cscope.out database
+
+Note: Run cscope -R to build the database (run it only once) and cscope -d -p10 to enter into the interactive mode of cscope. To get out of this mode press ctrl+d.
+
+What is perf and how do we use it?
+====================================
+
+Perf is an analysis tool based on Linux 2.6+ systems, which abstracts the CPU hardware difference in performance measurement in Linux, and provides a simple command line interface. Perf is based on the perf_events interface exported by the kernel. It is very useful for profiling the system and finding performance bottlenecks in an application.
+
+If you haven't already checkout the Linux mainline repository, you can do so and then build kernel and perf tool:
+::
+
+  git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git linux
+  cd linux
+  make -j3 all
+  cd tools/perf
+  make
+
+Note: The perf command can be built without building the kernel in the repo and can be run on older kernels. However matching the kernel and perf revisions gives more accurate information on the subsystem usage.
+
+We used perf stat and perf bench options. For a detailed information on the prof tool, run perf -h.
+
+perf stat
+---------
+The perf stat command generates a report of various hardware and software events. It does so with the help of hardware counter registers found in modern CPUs that keep the count of these activities. "perf stat cal" shows stats for cal command.
+
+Perf bench
+----------
+The perf bench command contains multiple multi-threaded microkernel benchmarks for executing different subsystems in the Linux kernel and system calls. This allows us to easily measure the impact of changes, which can help mitigate performance regressions. It also acts as a common benchmarking framework, enabling developers to easily create test cases, integrate transparently, and use performance-rich tooling. "perf bench all" runs sched/messaging, sched/pipe, syscall/basic, mem/memcpy, and mem/memset benchmarks.
+
+What is stress-ng and how do we use it?
+=======================================
+
+stress-ng is used for performing stress testing on the kernel. It allows you to exercise various physical subsystems of the computer, as well as interfaces of the OS kernel, using stressor-s. They are available for CPU, CPU cache, devices, I/O, interrupts, file system, memory, network, operating system, pipelines, schedulers, virtual machines. You may find the description of all the available stressors here.
+
+Running the netdev stressor (It starts N workers that exercise various netdevice ioctl commands across all the available network devices. The ioctls exercised by this stressor are as follows: SIOCGIFCONF, SIOCGIFINDEX, SIOCGIFNAME, SIOCGIFFLAGS, SIOCGIFADDR, SIOCGIFNETMASK, SIOCGIFMETRIC, SIOCGIFMTU, SIOCGIFHWADDR, SIOCGIFMAP and SIOCGIFTXQLEN). The following command runs the stressor:
+::
+
+  stress-ng --netdev 1 -t 60 --metrics command.
+
+We can use the perf record command to record the events and information associated with a process. This command records the profiling data in the perf.data file in the same directory.
+
+Using the following commands you can record the events associated with the netdev stressor, view the generated report perf.data and annotate the to see the statistics of each instruction of the program.
+::
+
+  perf record stress-ng --netdev 1 -t 60 --metrics command.
+  perf report
+  perf annotate
+
+What is paxtest and how do we use it?
+=====================================
+
+paxtest is a program that tests buffer overflows in the kernel. It tests kernel enforcements over memory usage. Generally, execution in some memory segments makes buffer overflows possible. It runs a set of programs that attempt to subvert memory usage. It is used as a regression test suite for PaX, and will be useful to test other memory protection patches for the kernel. paxtest provided kiddie and blackhat modes. paxtest kiddie mode runs in normal mode, whereas blackhat mode tries to get around the protection of the kernel testing for vulnerabilities. We focus on the kiddie mode here and combine "paxtest kiddie" run with "perf record" to collect CPU stack traces for the paxtest kiddie run to see which function is calling other functions in the performance profile. Then the "dwarf" (DWARF's CFI - Call Frame Information) mode can be used to unwind the stack. The resulting report can be viewed in call-graph format as follows:
+::
+
+  perf record --call-graph dwarf paxtest kiddie
+  perf report --stdio
+
+Tracing workloads
+=================
+
+Now that we understand the workloads, let's start tracing them.
+
+Tracing perf bench all workload
+-------------------------------
+
+Run the following command to trace perf bench all workload:
+::
+
+ strace -c perf bench all
+
+**System Calls made by the workload:**
+
+The following table shows you the system calls, number of times the system call was invoked, and the Linux subsystem they fall under.
+
++-------------------+-----------+-----------------+-------------------------+
+| System Call       | # calls   | Linux Subsystem | System Call (API)       |
++===================+===========+=================+=========================+
+| getppid           | 10000001  | Process Mgmt    | sys_getpid()            |
++-------------------+-----------+-----------------+-------------------------+
+| clone             | 1077      | Process Mgmt.   | sys_clone()             |
++-------------------+-----------+-----------------+-------------------------+
+| prctl             | 23        | Process Mgmt.   | sys_prctl()             |
++-------------------+-----------+-----------------+-------------------------+
+| prlimit64         | 7         | Process Mgmt.   | sys_prlimit64()         |
++-------------------+-----------+-----------------+-------------------------+
+| getpid            | 10        | Process Mgmt.   | sys_getpid()            |
++-------------------+-----------+-----------------+-------------------------+
+| uname             | 3         | Process Mgmt.   | sys_uname()             |
++-------------------+-----------+-----------------+-------------------------+
+| sysinfo           | 1         | Process Mgmt.   | sys_sysinfo()           |
++-------------------+-----------+-----------------+-------------------------+
+| getuid            | 1         | Process Mgmt.   | sys_getuid()            |
++-------------------+-----------+-----------------+-------------------------+
+| getgid            | 1         | Process Mgmt.   | sys_getgid()            |
++-------------------+-----------+-----------------+-------------------------+
+| geteuid           | 1         | Process Mgmt.   | sys_geteuid()           |
++-------------------+-----------+-----------------+-------------------------+
+| getegid           | 1         | Process Mgmt.   | sys_getegid             |
++-------------------+-----------+-----------------+-------------------------+
+| close             | 49951     | Filesystem      | sys_close()             |
++-------------------+-----------+-----------------+-------------------------+
+| pipe              | 604       | Filesystem      | sys_pipe()              |
++-------------------+-----------+-----------------+-------------------------+
+| openat            | 48560     | Filesystem      | sys_opennat()           |
++-------------------+-----------+-----------------+-------------------------+
+| fstat             | 8338      | Filesystem      | sys_fstat()             |
++-------------------+-----------+-----------------+-------------------------+
+| stat              | 1573      | Filesystem      | sys_stat()              |
++-------------------+-----------+-----------------+-------------------------+
+| pread64           | 9646      | Filesystem      | sys_pread64()           |
++-------------------+-----------+-----------------+-------------------------+
+| getdents64        | 1873      | Filesystem      | sys_getdents64()        |
++-------------------+-----------+-----------------+-------------------------+
+| access            | 3         | Filesystem      | sys_access()            |
++-------------------+-----------+-----------------+-------------------------+
+| lstat             | 1880      | Filesystem      | sys_lstat()             |
++-------------------+-----------+-----------------+-------------------------+
+| lseek             | 6         | Filesystem      | sys_lseek()             |
++-------------------+-----------+-----------------+-------------------------+
+| ioctl             | 3         | Filesystem      | sys_ioctl()             |
++-------------------+-----------+-----------------+-------------------------+
+| dup2              | 1         | Filesystem      | sys_dup2()              |
++-------------------+-----------+-----------------+-------------------------+
+| execve            | 2         | Filesystem      | sys_execve()            |
++-------------------+-----------+-----------------+-------------------------+
+| fcntl             | 8779      | Filesystem      | sys_fcntl()             |
++-------------------+-----------+-----------------+-------------------------+
+| statfs            | 1         | Filesystem      | sys_statfs()            |
++-------------------+-----------+-----------------+-------------------------+
+| epoll_create      | 2         | Filesystem      | sys_epoll_create()      |
++-------------------+-----------+-----------------+-------------------------+
+| epoll_ctl         | 64        | Filesystem      | sys_epoll_ctl()         |
++-------------------+-----------+-----------------+-------------------------+
+| newfstatat        | 8318      | Filesystem      | sys_newfstatat()        |
++-------------------+-----------+-----------------+-------------------------+
+| eventfd2          | 192       | Filesystem      | sys_eventfd2()          |
++-------------------+-----------+-----------------+-------------------------+
+| mmap              | 243       | Memory Mgmt.    | sys_mmap()              |
++-------------------+-----------+-----------------+-------------------------+
+| mprotect          | 32        | Memory Mgmt.    | sys_mprotect()          |
++-------------------+-----------+-----------------+-------------------------+
+| brk               | 21        | Memory Mgmt.    | sys_brk()               |
++-------------------+-----------+-----------------+-------------------------+
+| munmap            | 128       | Memory Mgmt.    | sys_munmap()            |
++-------------------+-----------+-----------------+-------------------------+
+| set_mempolicy     | 156       | Memory Mgmt.    | sys_set_mempolicy()     |
++-------------------+-----------+-----------------+-------------------------+
+| set_tid_address   | 1         | Process Mgmt.   | sys_set_tid_address()   |
++-------------------+-----------+-----------------+-------------------------+
+| set_robust_list   | 1         | Futex           | sys_set_robust_list()   |
++-------------------+-----------+-----------------+-------------------------+
+| futex             | 341       | Futex           | sys_futex()             |
++-------------------+-----------+-----------------+-------------------------+
+| sched_getaffinity | 79        | Scheduler       | sys_sched_getaffinity() |
++-------------------+-----------+-----------------+-------------------------+
+| sched_setaffinity | 223       | Scheduler       | sys_sched_setaffinity() |
++-------------------+-----------+-----------------+-------------------------+
+| socketpair        | 202       | Network         | sys_socketpair()        |
++-------------------+-----------+-----------------+-------------------------+
+| rt_sigprocmask    | 21        | Signal          | sys_rt_sigprocmask()    |
++-------------------+-----------+-----------------+-------------------------+
+| rt_sigaction      | 36        | Signal          | sys_rt_sigaction()      |
++-------------------+-----------+-----------------+-------------------------+
+| rt_sigreturn      | 2         | Signal          | sys_rt_sigreturn()      |
++-------------------+-----------+-----------------+-------------------------+
+| wait4             | 889       | Time            | sys_wait4()             |
++-------------------+-----------+-----------------+-------------------------+
+| clock_nanosleep   | 37        | Time            | sys_clock_nanosleep()   |
++-------------------+-----------+-----------------+-------------------------+
+| capget            | 4         | Capability      | sys_capget()            |
++-------------------+-----------+-----------------+-------------------------+
+
+Tracing stress-ng netdev stressor workload
+------------------------------------------
+
+Run the following command to trace stress-ng netdev stressor workload:
+::
+
+  strace -c  stress-ng --netdev 1 -t 60 --metrics
+
+**System Calls made by the workload:**
+
+The following table shows you the system calls, number of times the system call was invoked, and the Linux subsystem they fall under.
+
++-------------------+-----------+-----------------+-------------------------+
+| System Call       | # calls   | Linux Subsystem | System Call (API)       |
++===================+===========+=================+=========================+
+| openat            | 74        | Filesystem      | sys_openat()            |
++-------------------+-----------+-----------------+-------------------------+
+| close             | 75        | Filesystem      | sys_close()             |
++-------------------+-----------+-----------------+-------------------------+
+| read              | 58        | Filesystem      | sys_read()              |
++-------------------+-----------+-----------------+-------------------------+
+| fstat             | 20        | Filesystem      | sys_fstat()             |
++-------------------+-----------+-----------------+-------------------------+
+| flock             | 10        | Filesystem      | sys_flock()             |
++-------------------+-----------+-----------------+-------------------------+
+| write             | 7         | Filesystem      | sys_write()             |
++-------------------+-----------+-----------------+-------------------------+
+| getdents64        | 8         | Filesystem      | sys_getdents64()        |
++-------------------+-----------+-----------------+-------------------------+
+| pread64           | 8         | Filesystem      | sys_pread64()           |
++-------------------+-----------+-----------------+-------------------------+
+| lseek             | 1         | Filesystem      | sys_lseek()             |
++-------------------+-----------+-----------------+-------------------------+
+| access            | 2         | Filesystem      | sys_access()            |
++-------------------+-----------+-----------------+-------------------------+
+| getcwd            | 1         | Filesystem      | sys_getcwd()            |
++-------------------+-----------+-----------------+-------------------------+
+| execve            | 1         | Filesystem      | sys_execve()            |
++-------------------+-----------+-----------------+-------------------------+
+| mmap              | 61        | Memory Mgmt.    | sys_mmap()              |
++-------------------+-----------+-----------------+-------------------------+
+| munmap            | 3         | Memory Mgmt.    | sys_munmap()            |
++-------------------+-----------+-----------------+-------------------------+
+| mprotect          | 20        | Memory Mgmt.    | sys_mprotect()          |
++-------------------+-----------+-----------------+-------------------------+
+| mlock             | 2         | Memory Mgmt.    | sys_mlock()             |
++-------------------+-----------+-----------------+-------------------------+
+| brk               | 3         | Memory Mgmt.    | sys_brk()               |
++-------------------+-----------+-----------------+-------------------------+
+| rt_sigaction      | 21        | Signal          | sys_rt_sigaction()      |
++-------------------+-----------+-----------------+-------------------------+
+| rt_sigprocmask    | 1         | Signal          | sys_rt_sigprocmask()    |
++-------------------+-----------+-----------------+-------------------------+
+| sigaltstack       | 1         | Signal          | sys_sigaltstack()       |
++-------------------+-----------+-----------------+-------------------------+
+| rt_sigreturn      | 1         | Signal          | sys_rt_sigreturn()      |
++-------------------+-----------+-----------------+-------------------------+
+| getpid            | 8         | Process Mgmt.   | sys_getpid()            |
++-------------------+-----------+-----------------+-------------------------+
+| prlimit64         | 5         | Process Mgmt.   | sys_prlimit64()         |
++-------------------+-----------+-----------------+-------------------------+
+| arch_prctl        | 2         | Process Mgmt.   | sys_arch_prctl()        |
++-------------------+-----------+-----------------+-------------------------+
+| sysinfo           | 2         | Process Mgmt.   | sys_sysinfo()           |
++-------------------+-----------+-----------------+-------------------------+
+| getuid            | 2         | Process Mgmt.   | sys_getuid()            |
++-------------------+-----------+-----------------+-------------------------+
+| uname             | 1         | Process Mgmt.   | sys_uname()             |
++-------------------+-----------+-----------------+-------------------------+
+| setpgid           | 1         | Process Mgmt.   | sys_setpgid()           |
++-------------------+-----------+-----------------+-------------------------+
+| getrusage         | 1         | Process Mgmt.   | sys_getrusage()         |
++-------------------+-----------+-----------------+-------------------------+
+| geteuid           | 1         | Process Mgmt.   | sys_geteuid()           |
++-------------------+-----------+-----------------+-------------------------+
+| getppid           | 1         | Process Mgmt.   | sys_getppid()           |
++-------------------+-----------+-----------------+-------------------------+
+| sendto            | 3         | Network         | sys_sendto()            |
++-------------------+-----------+-----------------+-------------------------+
+| connect           | 1         | Network         | sys_connect()           |
++-------------------+-----------+-----------------+-------------------------+
+| socket            | 1         | Network         | sys_socket()            |
++-------------------+-----------+-----------------+-------------------------+
+| clone             | 1         | Process Mgmt.   | sys_clone()             |
++-------------------+-----------+-----------------+-------------------------+
+| set_tid_address   | 1         | Process Mgmt.   | sys_set_tid_address()   |
++-------------------+-----------+-----------------+-------------------------+
+| wait4             | 2         | Time            | sys_wait4()             |
++-------------------+-----------+-----------------+-------------------------+
+| alarm             | 1         | Time            | sys_alarm()             |
++-------------------+-----------+-----------------+-------------------------+
+| set_robust_list   | 1         | Futex           | sys_set_robust_list()   |
++-------------------+-----------+-----------------+-------------------------+
+
+Tracing paxtest kiddie workload
+-------------------------------
+
+Run the following command to trace paxtest kiddie workload:
+::
+
+ strace -c paxtest kiddie
+
+**System Calls made by the workload:**
+
+The following table shows you the system calls, number of times the system call was invoked, and the Linux subsystem they fall under.
+
++-------------------+-----------+-----------------+----------------------+
+| System Call       | # calls   | Linux Subsystem | System Call (API)    |
++===================+===========+=================+======================+
+| read              | 3         | Filesystem      | sys_read()           |
++-------------------+-----------+-----------------+----------------------+
+| write             | 11        | Filesystem      | sys_write()          |
++-------------------+-----------+-----------------+----------------------+
+| close             | 41        | Filesystem      | sys_close()          |
++-------------------+-----------+-----------------+----------------------+
+| stat              | 24        | Filesystem      | sys_stat()           |
++-------------------+-----------+-----------------+----------------------+
+| fstat             | 2         | Filesystem      | sys_fstat()          |
++-------------------+-----------+-----------------+----------------------+
+| pread64           | 6         | Filesystem      | sys_pread64()        |
++-------------------+-----------+-----------------+----------------------+
+| access	    | 1         | Filesystem      | sys_access()         |
++-------------------+-----------+-----------------+----------------------+
+| pipe              | 1         | Filesystem      | sys_pipe()           |
++-------------------+-----------+-----------------+----------------------+
+| dup2              | 24        | Filesystem      | sys_dup2()           |
++-------------------+-----------+-----------------+----------------------+
+| execve            | 1         | Filesystem      | sys_execve()         |
++-------------------+-----------+-----------------+----------------------+
+| fcntl             | 26        | Filesystem      | sys_fcntl()          |
++-------------------+-----------+-----------------+----------------------+
+| openat            | 14        | Filesystem      | sys_openat()         |
++-------------------+-----------+-----------------+----------------------+
+| rt_sigaction      | 7         | Signal          | sys_rt_sigaction()   |
++-------------------+-----------+-----------------+----------------------+
+| rt_sigreturn      | 38        | Signal          | sys_rt_sigreturn()   |
++-------------------+-----------+-----------------+----------------------+
+| clone             | 38        | Process Mgmt.   | sys_clone()          |
++-------------------+-----------+-----------------+----------------------+
+| wait4             | 44        | Time            | sys_wait4()          |
++-------------------+-----------+-----------------+----------------------+
+| mmap              | 7         | Memory Mgmt.    | sys_mmap()           |
++-------------------+-----------+-----------------+----------------------+
+| mprotect          | 3         | Memory Mgmt.    | sys_mprotect()       |
++-------------------+-----------+-----------------+----------------------+
+| munmap            | 1         | Memory Mgmt.    | sys_munmap()         |
++-------------------+-----------+-----------------+----------------------+
+| brk               | 3         | Memory Mgmt.    | sys_brk()            |
++-------------------+-----------+-----------------+----------------------+
+| getpid            | 1         | Process Mgmt.   | sys_getpid()         |
++-------------------+-----------+-----------------+----------------------+
+| getuid            | 1         | Process Mgmt.   | sys_getuid()         |
++-------------------+-----------+-----------------+----------------------+
+| getgid            | 1         | Process Mgmt.   | sys_getgid()         |
++-------------------+-----------+-----------------+----------------------+
+| geteuid           | 2         | Process Mgmt.   | sys_geteuid()        |
++-------------------+-----------+-----------------+----------------------+
+| getegid           | 1         | Process Mgmt.   | sys_getegid()        |
++-------------------+-----------+-----------------+----------------------+
+| getppid           | 1         | Process Mgmt.   | sys_getppid()        |
++-------------------+-----------+-----------------+----------------------+
+| arch_prctl        | 2         | Process Mgmt.   | sys_arch_prctl()     |
++-------------------+-----------+-----------------+----------------------+
+
+Conclusion
+==========
+
+This document is intended to be used as a guide on how to gather fine grained information on workloads using strace.
+
+References
+==========
+
+ * `Discovery Linux Kernel Subsystems used by OpenAPS <https://elisa.tech/blog/2022/02/02/discovery-linux-kernel-subsystems-used-by-openaps>`_
+ * `ELISA-White-Papers-Discovering Linux kernel subsystems used by a workload <https://github.com/elisa-tech/ELISA-White-Papers/blob/master/Processes/Discovering_Linux_kernel_subsystems_used_by_a_workload.md>`_
+ * `strace <https://man7.org/linux/man-pages/man1/strace.1.html>`_
+ * `perf <https://man7.org/linux/man-pages/man1/perf.1.html>`_
+ * `paxtest <https://github.com/opntr/paxtest-freebsd/blob/hardenedbsd/0.9.14-hbsd/README>`_
+ * `stress-ng <https://www.mankier.com/1/stress-ng>`_
+ * `Monitoring and managing system status and performance <https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/monitoring_and_managing_system_status_and_performance/index>`_
+
+SPDX-License-Identifier: CC-BY-4.0
+==================================
+This document is released under the Creative Commons Attribution 4.0 International License, available at https://creativecommons.org/licenses/by/4.0/legalcode. Pursuant to Section 5 of the license, please note that the following disclaimers apply (capitalized terms have the meanings set forth in the license). To the extent possible, the Licensor offers the Licensed Material as-is and as-available, and makes no representations or warranties of any kind concerning the Licensed Material, whether express, implied, statutory, or other. This includes, without limitation, warranties of title, merchantability, fitness for a particular purpose, non-infringement, absence of latent or other defects, accuracy, or the presence or absence of errors, whether or not known or discoverable. Where disclaimers of warranties are not allowed in full or in part, this disclaimer may not apply to You.
+
+To the extent possible, in no event will the Licensor be liable to You on any legal theory (including, without limitation, negligence) or otherwise for any direct, special, indirect, incidental, consequential, punitive, exemplary, or other losses, costs, expenses, or damages arising out of this Public License or use of the Licensed Material, even if the Licensor has been advised of the possibility of such losses, costs, expenses, or damages. Where a limitation of liability is not allowed in full or in part, this limitation may not apply to You.
+
+The disclaimer of warranties and limitation of liability provided above shall be interpreted in a manner that, to the extent possible, most closely approximates an absolute disclaimer and waiver of all liability.
+
+Note: Only the content of this RST file as found in the Linux kernel sources
+is available under CC-BY-4.0, as versions of this text that were processed
+(for example by the kernel's build system) might contain content taken from
+files which use a more restrictive license.
+
+..
+   end-of-content
+..
+   This document is maintained by Shuah Khan <skhan@linuxfoundation.org>.
+   Please Send update patches to Shuah and CC linux-doc@vger.kernel.org.
-- 
2.34.1

