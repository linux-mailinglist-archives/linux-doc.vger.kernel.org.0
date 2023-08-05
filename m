Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92248771022
	for <lists+linux-doc@lfdr.de>; Sat,  5 Aug 2023 16:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjHEO3V (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 5 Aug 2023 10:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjHEO3U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Aug 2023 10:29:20 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33FDD4236
        for <linux-doc@vger.kernel.org>; Sat,  5 Aug 2023 07:29:17 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-686bc261111so2148792b3a.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Aug 2023 07:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691245756; x=1691850556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4UeYFhY2OhtsbLC9Xytaoxt38tmK7fKPiv0bDxIvBs=;
        b=uwS4PqyAZRSBZquJ6coUuyxVfMOCaFIoSFA1iyjiIPns6dKp4ZxWouI6SyCNn8371u
         mt55kvZJ7XSpPP0OHABPAerV1eou70OlVvGEzEcATtSVBGPwDIkmE+kL0EcMPBt8RQ+e
         C6Yxz50gE5F6qgb/7xnSY77UjF3reYtD5kbBAcG8SlRcmyBuYviExMlt8FIoyevjrp1J
         Cnjpgm5AYde6ya0ePkVO1S1FDxeBYej/gVhUlveFZonq5hFM4lUhDv0VrYdqWqvSt578
         b3/YvQRsyUDSfarZ/UPzirpawosJAoyqh/EYoRRHCAhjX/P/576hZZqYaI28LAlNklmn
         0rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691245756; x=1691850556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4UeYFhY2OhtsbLC9Xytaoxt38tmK7fKPiv0bDxIvBs=;
        b=QUVfSkQhtOP2hEw61rTzkYBRBnMHhBCvUpUPX3SJzB3s82Mu/HA3tQ4n0ri1Tnf1M3
         N5jkql9MQPhqOOE7u1SeHW/69GSL3XxyTYtAhu2ugRhUWESTmy8Gh4l+YtwUVfZN24zM
         QzONJqQqUOz2RNpFZDv+YC48rxAsnT+uUMRKvZ1lWBJHq2HYsSXN/XnN414okkDilbK7
         O3NAhmA7VTfFITppx7G6xUWw/6GwjEElo/d2GBwC0VC0stONHhQmdl16Av1IuxhMMf2m
         EtTwd5fdYtxDW6WZK89MP5SMzqGsOsWKZi+HZJx9CppKVyy6uv/+hrP2NKSMWnxX1FTi
         v+ig==
X-Gm-Message-State: AOJu0YxarF399CdbCzDPY9jGJgjBmx+YJsZFTXf62fvxm9GNTKHyqqtz
        hnPAmIINkMGxp4hSjK1J1uzmlg==
X-Google-Smtp-Source: AGHT+IGmr7bj6oT67CyCSynwJSDhCrOoKzWXhf9Lw0pCZsAkiNAMkJ5MpnHxT6ZBjBh2VN1J0EzS/w==
X-Received: by 2002:a05:6a20:138e:b0:126:f64b:6689 with SMTP id hn14-20020a056a20138e00b00126f64b6689mr3637951pzc.12.1691245756039;
        Sat, 05 Aug 2023 07:29:16 -0700 (PDT)
Received: from leoy-huanghe.lan ([156.59.39.102])
        by smtp.gmail.com with ESMTPSA id l24-20020a62be18000000b00659b8313d08sm3221075pff.78.2023.08.05.07.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 07:29:15 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     onathan Corbet <corbet@lwn.net>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ian Rogers <irogers@google.com>,
        Thomas Richter <tmricht@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        linux-doc@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v4] Documentation: userspace-api: Document perf ring buffer mechanism
Date:   Sat,  5 Aug 2023 22:29:05 +0800
Message-Id: <20230805142905.1852977-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In the Linux perf tool, the ring buffer serves not only as a medium for
transferring PMU event data but also as a vital mechanism for hardware
tracing using technologies like Intel PT and Arm CoreSight, etc.

Consequently, the ring buffer mechanism plays a crucial role by ensuring
high throughput for data transfer between the kernel and user space
while avoiding excessive overhead caused by the ring buffer itself.

This commit documents the ring buffer mechanism in detail.  It explains
the implementation of both the regular ring buffer and the AUX ring
buffer.  Additionally, it covers how these ring buffers support various
tracing modes and explains the synchronization with memory barriers.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---

Changes from v3:
- Converted to RST format and moved from perf folder to the
  userspace-api folder (Jonathan Corbet).

Changes from v2:
- Refined doc for Thomas's suggestions (Thomas Richter).

Changes from v1:
- Addressed Ian's comments and suggestions (Ian Rogers).


 .../userspace-api/perf_ring_buffer.rst        | 823 ++++++++++++++++++
 1 file changed, 823 insertions(+)
 create mode 100644 Documentation/userspace-api/perf_ring_buffer.rst

diff --git a/Documentation/userspace-api/perf_ring_buffer.rst b/Documentation/userspace-api/perf_ring_buffer.rst
new file mode 100644
index 000000000000..00f48db2dcf2
--- /dev/null
+++ b/Documentation/userspace-api/perf_ring_buffer.rst
@@ -0,0 +1,823 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+================
+Perf ring buffer
+================
+
+.. CONTENTS
+
+    1. Introduction
+
+    2. Ring buffer implementation
+    2.1  Basic algorithm
+    2.2  Ring buffer for different tracing modes
+    2.2.1       Default mode
+    2.2.2       Per-thread mode
+    2.2.3       Per-CPU mode
+    2.2.4       System wide mode
+    2.3  Accessing buffer
+    2.3.1       Producer-consumer model
+    2.3.2       Writing samples into buffer
+    2.3.3       Reading samples from buffer
+    2.3.4       Memory synchronization
+
+    3. The mechanism of AUX ring buffer
+    3.1  The relationship between AUX and regular ring buffers
+    3.2  AUX events
+    3.3  Snapshot mode
+
+
+1. Introduction
+===============
+
+The ring buffer is a fundamental mechanism for data transfer.  perf uses
+ring buffers to transfer event data from kernel to user space, another
+kind of ring buffer which is so called auxiliary (AUX) ring buffer also
+plays an important role for hardware tracing with Intel PT, Arm
+CoreSight, etc.
+
+The ring buffer implementation is critical but it's also a very
+challenging work.  On the one hand, the kernel and perf tool in the user
+space use the ring buffer to exchange data and stores data into data
+file, thus the ring buffer needs to transfer data with high throughput;
+on the other hand, the ring buffer management should avoid significant
+overload to distract profiling results.
+
+This documentation dives into the details for perf ring buffer with two
+parts: firstly it explains the perf ring buffer implementation, then the
+second part discusses the AUX ring buffer mechanism.
+
+2. Ring buffer implementation
+=============================
+
+2.1 Basic algorithm
+-------------------
+
+That said, a typical ring buffer is managed by a head pointer and a tail
+pointer; the head pointer is manipulated by a writer and the tail
+pointer is updated by a reader respectively.
+
+::
+
+        +---------------------------+
+        |   |   |***|***|***|   |   |
+        +---------------------------+
+                `-> Tail    `-> Head
+
+        * : the data is filled by the writer.
+
+                Figure 1. Ring buffer
+
+Perf uses the same way to manage its ring buffer.  In the implementation
+there are two key data structures held together in a set of consecutive
+pages, the control structure and then the ring buffer itself.  The page
+with the control structure in is known as the "user page".  Being held
+in continuous virtual addresses simplifies locating the ring buffer
+address, it is in the pages after the page with the user page.
+
+The control structure is named as ``perf_event_mmap_page``, it contains a
+head pointer ``data_head`` and a tail pointer ``data_tail``.  When the
+kernel starts to fill records into the ring buffer, it updates the head
+pointer to reserve the memory so later it can safely store events into
+the buffer; on the other side, the perf tool updates the tail pointer
+after consuming data from the ring buffer.
+
+::
+
+          user page                          ring buffer
+    +---------+---------+   +---------------------------------------+
+    |data_head|data_tail|...|   |   |***|***|***|***|***|   |   |   |
+    +---------+---------+   +---------------------------------------+
+        `          `----------------^                   ^
+         `----------------------------------------------|
+
+              * : the data is filled by the writer.
+
+                Figure 2. Perf ring buffer
+
+When using the ``perf record`` tool, we can specify the ring buffer size
+with option ``-m`` or ``--mmap-pages=``, the given size will be rounded up
+to a power of two that is a multiple of a page size.  Though the kernel
+allocates at once for all memory pages, it's deferred to map the pages
+to VMA area until the perf tool accesses the buffer from the user space.
+In other words, at the first time accesses the buffer's page from user
+space in the perf tool, a data abort exception for page fault is taken
+and the kernel uses this occasion to map the page into process VMA, thus
+the perf tool can continue to access the page after returning from the
+exception.
+
+The function ``perf_mmap_fault()`` is for handling the page fault, which
+invokes ``perf_mmap_to_page()`` to figure out which page should be mapped.
+The structure ``vm_fault`` has a field ``pgoff`` to indicate which page
+should be mapped, if ``pgoff`` is zero it maps the ring buffer's user
+page, otherwise, the ring buffer's page is mapped with index ``pgoff-1``
+(since the first page in VMA is for user page, so we need to decrease 1
+to get the ring buffer's page index).
+
+2.2 Ring buffer for different tracing modes
+-------------------------------------------
+
+The perf profiles programs with different modes: default mode, per thread
+mode, per cpu mode, and system wide mode.  This section describes these
+modes and how the ring buffer meets requirements for them.  At last we
+will review the race conditions caused by these modes.
+
+2.2.1 Default mode
+^^^^^^^^^^^^^^^^^^
+
+Usually we execute ``perf record`` command followed by a profiling program
+name, like below command::
+
+        perf record test_program
+
+This command doesn't specify any options related with ring buffer mode,
+it's called default mode.
+
+As shown below, the perf tool allocates individual ring buffers for each
+CPU, but it only enables events for the profiled program rather than for
+all threads in the system.  The *T1* thread represents the thread context
+of the 'test_program', whereas *T2* and *T3* are irrelevant threads in the
+system.   The perf samples are exclusively collected for the *T1* thread
+and stored in the ring buffer associated with the CPU on which the *T1*
+thread is running.
+
+::
+
+              T1                      T2                 T1
+            +----+              +-----------+          +----+
+    CPU0    |xxxx|              |xxxxxxxxxxx|          |xxxx|
+            +----+--------------+-----------+----------+----+-------->
+              |                                          |
+              v                                          v
+            +-----------------------------------------------------+
+            |                  Ring buffer 0                      |
+            +-----------------------------------------------------+
+
+                   T1
+                 +-----+
+    CPU1         |xxxxx|
+            -----+-----+--------------------------------------------->
+                    |
+                    v
+            +-----------------------------------------------------+
+            |                  Ring buffer 1                      |
+            +-----------------------------------------------------+
+
+                                        T1              T3
+                                      +----+        +-------+
+    CPU2                              |xxxx|        |xxxxxxx|
+            --------------------------+----+--------+-------+-------->
+                                        |
+                                        v
+            +-----------------------------------------------------+
+            |                  Ring buffer 2                      |
+            +-----------------------------------------------------+
+
+                              T1
+                       +--------------+
+    CPU3               |xxxxxxxxxxxxxx|
+            -----------+--------------+------------------------------>
+                              |
+                              v
+            +-----------------------------------------------------+
+            |                  Ring buffer 3                      |
+            +-----------------------------------------------------+
+
+	    T1: Thread 1; T2: Thread 2; T3: Thread 3
+	    x: Thread is in running state
+
+                Figure 3. Ring buffer for default mode
+
+2.2.2 Per-thread mode
+^^^^^^^^^^^^^^^^^^^^^
+
+By specifying option ``--per-thread`` in perf command, the ring buffer is
+allocated for every profiled thread.  An example command is:
+
+::
+
+        perf record --per-thread test_program
+
+In this mode, a profiled thread is scheduled on a CPU, the events on
+that CPU will be enabled; and if the thread is scheduled out from the
+CPU, the events on the CPU will be disabled.  When the thread is
+migrated from one CPU to another, the events will be disabled on the
+previous CPU and enabled on the next CPU correspondingly.
+
+::
+
+              T1                      T2                 T1
+            +----+              +-----------+          +----+
+    CPU0    |xxxx|              |xxxxxxxxxxx|          |xxxx|
+            +----+--------------+-----------+----------+----+-------->
+              |                                           |
+              |    T1                                     |
+              |  +-----+                                  |
+    CPU1      |  |xxxxx|                                  |
+            --|--+-----+----------------------------------|---------->
+              |     |                                     |
+              |     |                   T1            T3  |
+              |     |                 +----+        +---+ |
+    CPU2      |     |                 |xxxx|        |xxx| |
+            --|-----|-----------------+----+--------+---+-|---------->
+              |     |                   |                 |
+              |     |         T1        |                 |
+              |     |  +--------------+ |                 |
+    CPU3      |     |  |xxxxxxxxxxxxxx| |                 |
+            --|-----|--+--------------+-|-----------------|---------->
+              |     |         |         |                 |
+              v     v         v         v                 v
+            +-----------------------------------------------------+
+            |                  Ring buffer                        |
+            +-----------------------------------------------------+
+
+  	    T1: Thread 1
+  	    x: Thread is in running state
+
+                Figure 4. Ring buffer for per-thread mode
+
+When perf runs in per-thread mode, a ring buffer is allocated for the
+profiled thread *T1*.  The ring buffer is dedicated for thread *T1*, if the
+thread *T1* is running, the perf events will be recorded into the ring
+buffer; when the thread is sleeping, all associated events will be
+disabled, thus no trace data will be recorded into the ring buffer.
+
+2.2.3 Per-CPU mode
+^^^^^^^^^^^^^^^^^^
+
+The option ``-C`` is used to collect samples on the list of CPUs, the ring
+buffers are allocated for the specified CPUs.  For the example in below
+command, the perf command receives option ``-C 0,2``, as the result, two
+ring buffers serve CPU0 and CPU2 separately::
+
+	perf record -C 0,2 test_program
+
+In this example, even there have tasks running on CPU1 and CPU3, since
+the ring buffer is absent for them, any activities on these two CPUs
+will be ignored.  A usage case is to combine the options for per-thread
+mode and per-CPU mode, e.g. the options ``–C 0,2`` and ``––per–thread`` are
+specified together, the samples are recorded only when the profiled
+thread is scheduled on any of the listed CPUs.
+
+::
+
+              T1                      T2                 T1
+            +----+              +-----------+          +----+
+    CPU0    |xxxx|              |xxxxxxxxxxx|          |xxxx|
+            +----+--------------+-----------+----------+----+-------->
+              |                       |                  |
+              v                       v                  v
+            +-----------------------------------------------------+
+            |                  Ring buffer 0                      |
+            +-----------------------------------------------------+
+
+                   T1
+                 +-----+
+    CPU1         |xxxxx|
+            -----+-----+--------------------------------------------->
+
+                                        T1              T3
+                                      +----+        +-------+
+    CPU2                              |xxxx|        |xxxxxxx|
+            --------------------------+----+--------+-------+-------->
+                                        |               |
+                                        v               v
+            +-----------------------------------------------------+
+            |                  Ring buffer 1                      |
+            +-----------------------------------------------------+
+
+                              T1
+                       +--------------+
+    CPU3               |xxxxxxxxxxxxxx|
+            -----------+--------------+------------------------------>
+
+  	    T1: Thread 1; T2: Thread 2; T3: Thread 3
+  	    x: Thread is in running state
+
+                Figure 5. Ring buffer for per-CPU mode
+
+2.2.4 System wide mode
+^^^^^^^^^^^^^^^^^^^^^^
+
+By using option ``–a`` or ``––all–cpus``, perf collects samples on all CPUs
+for all tasks, we call it as the system wide mode, the command is::
+
+        perf record -a test_program
+
+In the system wide mode, every CPU has its own ring buffer, all threads
+are monitored during the running state and the samples are recorded into
+the ring buffer belonging to the CPU which the events occurred on.
+
+::
+
+              T1                      T2                 T1
+            +----+              +-----------+          +----+
+    CPU0    |xxxx|              |xxxxxxxxxxx|          |xxxx|
+            +----+--------------+-----------+----------+----+-------->
+              |                       |                  |
+              v                       v                  v
+            +-----------------------------------------------------+
+            |                  Ring buffer 0                      |
+            +-----------------------------------------------------+
+
+                   T1
+                 +-----+
+    CPU1         |xxxxx|
+            -----+-----+--------------------------------------------->
+                    |
+                    v
+            +-----------------------------------------------------+
+            |                  Ring buffer 1                      |
+            +-----------------------------------------------------+
+
+                                        T1              T3
+                                      +----+        +-------+
+    CPU2                              |xxxx|        |xxxxxxx|
+            --------------------------+----+--------+-------+-------->
+                                        |               |
+                                        v               v
+            +-----------------------------------------------------+
+            |                  Ring buffer 2                      |
+            +-----------------------------------------------------+
+
+                              T1
+                       +--------------+
+    CPU3               |xxxxxxxxxxxxxx|
+            -----------+--------------+------------------------------>
+                              |
+                              v
+            +-----------------------------------------------------+
+            |                  Ring buffer 3                      |
+            +-----------------------------------------------------+
+
+  	    T1: Thread 1; T2: Thread 2; T3: Thread 3
+  	    x: Thread is in running state
+
+                Figure 6. Ring buffer for system wide mode
+
+2.3 Accessing buffer
+--------------------
+
+Based on the understanding of how the ring buffer is allocated in
+various modes, this section explains access the ring buffer.
+
+2.3.1 Producer-consumer model
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+In the Linux kernel, the PMU events can produce samples which are stored
+into the ring buffer; the perf command in user space consumes the
+samples by reading out data from the ring buffer and finally saves the
+data into the file for post analysis.  It’s a typical producer-consumer
+model for using the ring buffer.
+
+The perf process polls on the PMU events and sleeps when no events are
+incoming.  To prevent frequent exchanges between the kernel and user
+space, the kernel event core layer introduces a watermark, which is
+stored in the ``perf_buffer::watermark``.  When a sample is recorded into
+the ring buffer, and if the used buffer exceeds the watermark, the
+kernel wakes up the perf process to read samples from the ring buffer.
+
+::
+
+                       Perf
+                       / | Read samples
+             Polling  /  `--------------|               Ring buffer
+                     v                  v    ;---------------------v
+    +----------------+     +---------+---------+   +-------------------+
+    |Event wait queue|     |data_head|data_tail|   |***|***|   |   |***|
+    +----------------+     +---------+---------+   +-------------------+
+             ^                  ^ `------------------------^
+             | Wake up tasks    | Store samples
+          +-----------------------------+
+  	|  Kernel event core layer    |
+          +-----------------------------+
+
+              * : the data is filled by the writer.
+
+                Figure 7. Writing and reading the ring buffer
+
+When the kernel event core layer notifies the user space, because
+multiple events might share the same ring buffer for recording samples,
+the core layer iterates every event associated with the ring buffer and
+wakes up tasks waiting on the event.  This is fulfilled by the kernel
+function ``ring_buffer_wakeup()``.
+
+After the perf process is woken up, it starts to check the ring buffers
+one by one, if it finds any ring buffer containing samples it will read
+out the samples for statistics or saving into the data file.  Given the
+perf process is able to run on any CPU, this leads to the ring buffer
+potentially being accessed from multiple CPUs simultaneously, which
+causes race conditions.  The race condition handling is described in the
+section :ref:`memory_synchronization`.
+
+2.3.2 Writing samples into buffer
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+When a hardware event counter overflows, a sample will be taken and
+saved into the ring buffer; the function ``__perf_event_output()`` is used
+to fill samples into the ring buffer, it calls the below sub functions:
+
+- The sub function ``perf_prepare_sample()`` prepares sample fields based on
+  the sample type;
+- ``output_begin()`` is a function pointer, it’s passed dynamically via the
+  argument for different writing directions, its purpose is to prepare
+  the info for writing ring buffer, when the function returns back the
+  ring buffer info is stored in structure ``perf_output_handle``;
+- ``perf_output_sample()`` outputs the sample into the ring buffer;
+- ``perf_output_end()`` updates the head pointer for user page so perf tool
+  can see the latest value.
+
+Let’s examine ``output_begin()`` in detail.  As the ring buffer allows
+writing in two directions: backward or forward, the function pointer for
+``output_begin()`` is assigned according to the writing type of the buffer,
+it can be ``perf_output_begin_forward()`` or ``perf_output_begin_backward()``.
+
+In the case of the backward ring buffer, where the user page is mapped
+without ``PROT_WRITE``, the tool in user space is unable to update the
+tail pointer.  As a result, only the head pointer is accessed in this
+scenario, and the tail pointer is not used in perf tool.  The head
+pointer indicates the beginning of a sample, perf tool can read out the
+samples one by one based on sample’s event size.
+
+Alternatively, the forward ring buffer uses both head pointer and tail
+pointer for the buffer management.  This method is more commonly used in
+perf tool, to simplify the description, the following explanation
+focuses on the forward ring buffer.
+
+::
+
+      struct perf_output_handle       /---->  struct perf_buffer
+    +---------------------------+     |     +--------------------+
+    |           *rb;            |-----|     |   local_t head;    |
+    +---------------------------+           +--------------------+
+    |        int page;          |           |    *user_page;     |
+    +---------------------------+           +--------------------+
+    |       void *addr;         |                      |
+    +---------------------------+                      v
+    |   unsigned long size;     |         struct perf_event_mmap_page
+    +---------------------------+           +--------------------+
+                                            |   __u64 data_head; |
+                                            +--------------------+
+                                            |   __u64 data_tail; |
+                                            +--------------------+
+
+                Figure 8. Data structures for writing ring buffer
+
+In Linux kernel, the event core layer uses the structure ``perf_buffer`` to
+track the buffer’s latest header, and it keeps the information for
+buffer pages.  The structure ``perf_buffer`` manages ring buffer during its
+life cycle, it is allocated once the ring buffer is created and released
+when the ring buffer is destroyed.
+
+It’s possible for multiple events to write buffer concurrently.  For
+instance, a software event and a hardware PMU event both are enabled for
+profiling, when the software event is in the middle of sampling, the
+hardware event maybe be overflow and its interrupt is triggered in this
+case.  This leads to the race condition for updating ``perf_buffer::head``.
+In ``__perf_output_begin()``, Linux kernel uses compare-and-swap atomicity
+``local_cmpxchg()`` to implement the lockless algorithm for protecting
+``perf_buffer::head``.
+
+The structure ``perf_output_handle`` serves as a temporary context for
+tracking the information related to the buffer.  For instance, the
+``perf_output_handle::rb`` field points to the global ``perf_buffer``
+structure.  Additionally, the ``perf_output_handle::addr`` field, based on the
+lockless algorithm, specifies the destination address where the sample data is
+to be stored.
+
+The advantages of the ``perf_output_handle`` structure is that it enables
+concurrent writing to the buffer by different events.  For the previous
+example, two instances of ``perf_output_handle`` serve as separate contexts
+for software events and hardware events.  This allows each event to
+reserve its own memory space within the ``out_begin()`` function, and
+``perf_output_handle::addr`` is used for populating the specific event.
+
+Once the sample data has been successfully stored in the buffer, the
+header of the ring buffer is synced from ``perf_buffer::head`` to
+``perf_event_mmap_page::data_head``, which is fulfilled in the function
+``perf_output_end()``.  This synchronization indicates to the perf tool that
+it is now safe to read the newly added samples from the user space.
+
+2.3.3 Reading samples from buffer
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+In the user space, the perf tool utilizes the ``perf_event_mmap_page``
+structure to handle the head and tail of the buffer.  It also uses
+``perf_mmap`` structure to keep track of a context for the ring buffer, this
+context includes information about the buffer's starting and ending
+addresses.  Additionally, the mask value can be utilized to compute the
+circular buffer pointer even for an overflow.
+
+Similar to the kernel, the perf tool in the user space first reads out
+the recorded data from the ring buffer, and then updates the buffer's
+tail pointer ``perf_event_mmap_page::data_tail``.
+
+.. _memory_synchronization:
+
+2.3.4 Memory synchronization
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The modern CPUs with relaxed memory model cannot promise the memory
+ordering, this means it’s possible to access the ring buffer and the
+``perf_event_mmap_page`` structure out of order.  To assure the specific
+sequence for memory accessing perf ring buffer, memory barriers are
+used to assure the data dependency.  The rationale for the memory
+synchronization is as below::
+
+  Kernel                          User space
+
+  if (LOAD ->data_tail) {         LOAD ->data_head
+                   (A)            smp_rmb()        (C)
+    STORE $data                   LOAD $data
+    smp_wmb()      (B)            smp_mb()         (D)
+    STORE ->data_head             STORE ->data_tail
+  }
+
+The comments in tools/include/linux/ring_buffer.h gives nice description
+for why and how to use memory barriers, here we will just provide an
+alternative explanation:
+
+(A) is a control dependency so that CPU assures order between checking
+pointer ``perf_event_mmap_page::data_tail`` and filling sample into ring
+buffer;
+
+(D) pairs with (A).  (D) separates the ring buffer data reading from
+writing the pointer ``data_tail``, perf tool first consumes samples and then
+tells the kernel that the data chunk has been released.  Since a reading
+operation is followed by a writing operation, thus (D) is a full memory
+barrier.
+
+(B) is a writing barrier in the middle of two writing operations, which
+makes sure that recording a sample must be prior to updating the head
+pointer.
+
+(C) pairs with (B).  (C) is a read memory barrier to ensure the head
+pointer is fetched before reading samples.
+
+To implement the above algorithm, the ``perf_output_put_handle()`` function
+in the kernel and two helpers ``ring_buffer_read_head()`` and
+``ring_buffer_write_tail()`` in the user space are introduced, they rely
+on memory barriers as described above to ensure the data dependency.
+
+Some architectures support one-way permeable barrier with load-acquire
+and store-release operations, these barriers are more relaxed with less
+performance penalty, so (C) and (D) can be optimized to use barriers
+``smp_load_acquire()`` and ``smp_store_release()`` respectively.
+
+If an architecture doesn’t support load-acquire and store-release in its
+memory model, it will roll back to the old fashion of memory barrier
+operations.  In this case, ``smp_load_acquire()`` encapsulates
+``READ_ONCE()`` + ``smp_mb()``, since ``smp_mb()`` is costly,
+``ring_buffer_read_head()`` doesn't invoke ``smp_load_acquire()`` and it uses
+the barriers ``READ_ONCE()`` + ``smp_rmb()`` instead.
+
+3. The mechanism of AUX ring buffer
+===================================
+
+In this chapter, we will explain the implementation of the AUX ring
+buffer.  In the first part it will discuss the connection between the
+AUX ring buffer and the regular ring buffer, then the second part will
+examine how the AUX ring buffer co-works with the regular ring buffer,
+as well as the additional features introduced by the AUX ring buffer for
+the sampling mechanism.
+
+3.1 The relationship between AUX and regular ring buffers
+---------------------------------------------------------
+
+Generally, the AUX ring buffer is an auxiliary for the regular ring
+buffer.  The regular ring buffer is primarily used to store the event
+samples and every event format complies with the definition in the
+union ``perf_event``; the AUX ring buffer is for recording the hardware
+trace data and the trace data format is hardware IP dependent.
+
+The general use and advantage of the AUX ring buffer is that it is
+written directly by hardware rather than by the kernel.  For example,
+regular profile samples that write to the regular ring buffer cause an
+interrupt.  Tracing execution requires a high number of samples and
+using interrupts would be overwhelming for the regular ring buffer
+mechanism.  Having an AUX buffer allows for a region of memory more
+decoupled from the kernel and written to directly by hardware tracing.
+
+The AUX ring buffer reuses the same algorithm with the regular ring
+buffer for the buffer management.  The control structure
+``perf_event_mmap_page`` extends the new fields ``aux_head`` and ``aux_tail``
+for the head and tail pointers of the AUX ring buffer.
+
+During the initialisation phase, besides the mmap()-ed regular ring
+buffer, the perf tool invokes a second syscall in the
+``auxtrace_mmap__mmap()`` function for the mmap of the AUX buffer;
+``rb_alloc_aux()`` in the kernel allocates pages correspondingly, these
+pages will be deferred to map into VMA when handling the page fault,
+which is the same lazy mechanism with the regular ring buffer.
+
+AUX events and AUX trace data are two different things.  Let's see an
+example::
+
+        perf record -a -e cycles -e cs_etm/@tmc_etr0/ -- sleep 2
+
+The above command enables two events: one is the event *cycles* from PMU
+and another is the AUX event *cs_etm* from Arm CoreSight, both are saved
+into the regular ring buffer while the CoreSight's AUX trace data is
+stored in the AUX ring buffer.
+
+As a result, we can see the regular ring buffer and the AUX ring buffer
+are allocated in pairs.  The perf in default mode allocates the regular
+ring buffer and the AUX ring buffer per CPU-wise, which is the same as
+the system wide mode, however, the default mode records samples only for
+the profiled program, whereas the latter mode profiles for all programs
+in the system.  For per-thread mode, the perf tool allocates only one
+regular ring buffer and one AUX ring buffer for the whole session.  For
+the per-CPU mode, the perf allocates two kinds of ring buffers for CPUs
+specified by the option ``-C``.
+
+The below figure demonstrates the buffers' layout in the system wide
+mode; if there are any activities on one CPU, the AUX event samples and
+the hardware trace data will be recorded into the dedicated buffers for
+the CPU.
+
+::
+
+              T1                      T2                 T1
+            +----+              +-----------+          +----+
+    CPU0    |xxxx|              |xxxxxxxxxxx|          |xxxx|
+            +----+--------------+-----------+----------+----+-------->
+              |                       |                  |
+              v                       v                  v
+            +-----------------------------------------------------+
+            |                  Ring buffer 0                      |
+            +-----------------------------------------------------+
+              |                       |                  |
+              v                       v                  v
+            +-----------------------------------------------------+
+            |               AUX Ring buffer 0                     |
+            +-----------------------------------------------------+
+
+                   T1
+                 +-----+
+    CPU1         |xxxxx|
+            -----+-----+--------------------------------------------->
+                    |
+                    v
+            +-----------------------------------------------------+
+            |                  Ring buffer 1                      |
+            +-----------------------------------------------------+
+                    |
+                    v
+            +-----------------------------------------------------+
+            |               AUX Ring buffer 1                     |
+            +-----------------------------------------------------+
+
+                                        T1              T3
+                                      +----+        +-------+
+    CPU2                              |xxxx|        |xxxxxxx|
+            --------------------------+----+--------+-------+-------->
+                                        |               |
+                                        v               v
+            +-----------------------------------------------------+
+            |                  Ring buffer 2                      |
+            +-----------------------------------------------------+
+                                        |               |
+                                        v               v
+            +-----------------------------------------------------+
+            |               AUX Ring buffer 2                     |
+            +-----------------------------------------------------+
+
+                              T1
+                       +--------------+
+    CPU3               |xxxxxxxxxxxxxx|
+            -----------+--------------+------------------------------>
+                              |
+                              v
+            +-----------------------------------------------------+
+            |                  Ring buffer 3                      |
+            +-----------------------------------------------------+
+                              |
+                              v
+            +-----------------------------------------------------+
+            |               AUX Ring buffer 3                     |
+            +-----------------------------------------------------+
+
+  	    T1: Thread 1; T2: Thread 2; T3: Thread 3
+  	    x: Thread is in running state
+
+                Figure 9. AUX ring buffer for system wide mode
+
+3.2 AUX events
+--------------
+
+Similar to ``perf_output_begin()`` and ``perf_output_end()``'s working for the
+regular ring buffer, ``perf_aux_output_begin()`` and ``perf_aux_output_end()``
+serve for the AUX ring buffer for processing the hardware trace data.
+The structure ``perf_output_handle`` is used as a context to track the AUX
+buffer’s info.
+
+``perf_aux_output_begin()`` initializes the structure perf_output_handle.
+It fetches the AUX head pointer and assigns to ``perf_output_handle::head``,
+afterwards, the low level driver uses ``perf_output_handle::head`` as the
+start address for storing hardware trace data.
+
+Once the hardware trace data is stored into the AUX ring buffer, the PMU
+driver will stop hardware tracing by calling the ``pmu::stop()`` callback.
+Similar to the regular ring buffer, the AUX ring buffer needs to apply
+the memory synchronization mechanism as discussed in the section
+:ref:`memory_synchronization`.  Since the AUX ring buffer is managed by the
+PMU driver, the barrier (B), which is a writing barrier to ensure the trace
+data is externally visible prior to updating the head pointer, is asked
+to be implemented in the PMU driver.
+
+Then ``pmu::stop()`` can safely call the ``perf_aux_output_end()`` function to
+finish two things:
+
+- It fills an event ``PERF_RECORD_AUX`` into the regular ring buffer, this
+  event delivers the information of the start address and data size for a
+  chunk of hardware trace data has been stored into the AUX ring buffer;
+
+- Since the hardware trace driver has stored new trace data into the AUX
+  ring buffer, the argument *size* indicates how many bytes have been
+  consumed by the hardware tracing, thus ``perf_aux_output_end()`` updates the
+  header pointer ``perf_buffer::aux_head`` to reflect the latest buffer usage.
+
+At the end, the PMU driver will restart hardware tracing.  During this
+temporary suspending period, it will lose hardware trace data, which
+will introduce a discontinuity during decoding phase.
+
+The event ``PERF_RECORD_AUX`` presents an AUX event which is handled in the
+kernel, but it lacks the information for saving the AUX trace data in
+the perf file.  When the perf tool copies the trace data from AUX ring
+buffer to the perf data file, it synthesizes a ``PERF_RECORD_AUXTRACE``
+event which includes the offest and size of the AUX trace data in the
+perf file.  Afterwards, the perf tool reads out the AUX trace data from
+the perf file based on the ``PERF_RECORD_AUXTRACE`` events, and the
+``PERF_RECORD_AUX`` event is used to decode a chunk of data by correlating
+with time order.
+
+3.3 Snapshot mode
+-----------------
+
+Perf supports snapshot mode for AUX ring buffer, in this mode, users
+only record AUX trace data at a specific time point which users are
+interested in.  E.g. below gives an example of how to take snapshots
+with 1 second interval with Arm CoreSight::
+
+  perf record -e cs_etm/@tmc_etr0/u -S -a program &
+  PERFPID=$!
+  while true; do
+      kill -USR2 $PERFPID
+      sleep 1
+  done
+
+The main flow for snapshot mode is:
+
+- Before a snapshot is taken, the AUX ring buffer acts in free run mode.
+  During free run mode the perf doesn't record any of the AUX events and
+  trace data;
+
+- Once the perf tool receives the *USR2* signal, it triggers the callback
+  function ``auxtrace_record::snapshot_start()`` to deactivate hardware
+  tracing.  The kernel driver then populates the AUX ring buffer with the
+  hardware trace data, and the event ``PERF_RECORD_AUX`` is stored in the
+  regular ring buffer;
+
+- Then perf tool takes a snapshot, ``record__read_auxtrace_snapshot()``
+  reads out the hardware trace data from the AUX ring buffer and saves it
+  into perf data file;
+
+- After the snapshot is finished, ``auxtrace_record::snapshot_finish()``
+  restarts the PMU event for AUX tracing.
+
+The perf only accesses the head pointer ``perf_event_mmap_page::aux_head``
+in snapshot mode and doesn’t touch tail pointer ``aux_tail``, this is
+because the AUX ring buffer can overflow in free run mode, the tail
+pointer is useless in this case.  Alternatively, the callback
+``auxtrace_record::find_snapshot()`` is introduced for making the decision
+of whether the AUX ring buffer has been wrapped around or not, at the
+end it fixes up the AUX buffer's head which are used to calculate the
+trace data size.
+
+As we know, the buffers' deployment can be per-thread mode, per-CPU
+mode, or system wide mode, and the snapshot can be applied to any of
+these modes.  Below is an example of taking snapshot with system wide
+mode.
+
+::
+
+                                         Snapshot is taken
+                                                 |
+                                                 v
+                        +------------------------+
+                        |  AUX Ring buffer 0     | <- aux_head
+                        +------------------------+
+                                                 v
+                +--------------------------------+
+                |          AUX Ring buffer 1     | <- aux_head
+                +--------------------------------+
+                                                 v
+    +--------------------------------------------+
+    |                      AUX Ring buffer 2     | <- aux_head
+    +--------------------------------------------+
+                                                 v
+         +---------------------------------------+
+         |                 AUX Ring buffer 3     | <- aux_head
+         +---------------------------------------+
+
+                Figure 10. Snapshot with system wide mode
-- 
2.34.1

