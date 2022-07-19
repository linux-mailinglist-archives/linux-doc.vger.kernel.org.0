Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8FA57A531
	for <lists+linux-doc@lfdr.de>; Tue, 19 Jul 2022 19:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239151AbiGSR1m (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Jul 2022 13:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239092AbiGSR1l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jul 2022 13:27:41 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D0949B46;
        Tue, 19 Jul 2022 10:27:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 3D094CE1D2B;
        Tue, 19 Jul 2022 17:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DF7C341C6;
        Tue, 19 Jul 2022 17:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658251655;
        bh=p4qGUwEeG9U8Ca7+G3LHeAy7mfFp4NStufiFuI+wLrc=;
        h=From:To:Cc:Subject:Date:From;
        b=oZ0rlGfjtFPCA7QObzwNTzDlkkBrflhOdOZJZBQHiPCVZ7DeFXG5wpI47r6XASD4r
         1zVCyv0cg7gu4308yeOyD9zkHpVI83a+yTm4kr/Ujch60bPXAk3483WD12n0thqY9F
         EU1Z1iFENqzvH8368xSP2mhjgR4EG2GGZNs7PJ3bDtCDqH9VTibTOCLXXe0I6DVluj
         oXyp3KIq24wOXE3Gn/C1QuplfxF6hI0Qxe0Gwv97dTMQi5g2yZZqDH9Ody5V5dK4eQ
         6Cf7HT4g1wAQDMw9W2eUOIIcMSCNtngf12/VZkvh0SSoAzjVEi5H+avTuB4U9mNosi
         XNtC7dnPI6kKQ==
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Daniel Bristot de Oliveira <bristot@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marco Elver <elver@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Gabriele Paoloni <gpaoloni@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Clark Williams <williams@redhat.com>,
        Tao Zhou <tao.zhou@linux.dev>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-trace-devel@vger.kernel.org
Subject: [PATCH V6 00/16] The Runtime Verification (RV) interface
Date:   Tue, 19 Jul 2022 19:27:05 +0200
Message-Id: <cover.1658244826.git.bristot@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Over the last years, I've been exploring the possibility of
verifying the Linux kernel behavior using Runtime Verification.

Runtime Verification (RV) is a lightweight (yet rigorous) method that
complements classical exhaustive verification techniques (such as model
checking and theorem proving) with a more practical approach for complex
systems.

Instead of relying on a fine-grained model of a system (e.g., a
re-implementation a instruction level), RV works by analyzing the trace of the
system's actual execution, comparing it against a formal specification of
the system behavior.

The usage of deterministic automaton for RV is a well-established
approach. In the specific case of the Linux kernel, you can check how
to model complex behavior of the Linux kernel with this paper:

  De Oliveira, Daniel Bristot; Cucinotta, Tommaso; De Oliveira, Romulo Silva.
  *Efficient formal verification for the Linux kernel.* In: International
  Conference on Software Engineering and Formal Methods. Springer, Cham, 2019.
  p. 315-332.

And how efficient is this approach here:

  De Oliveira, Daniel B.; De Oliveira, Romulo S.; Cucinotta, Tommaso. *A thread
  synchronization model for the PREEMPT_RT Linux kernel.* Journal of Systems
  Architecture, 2020, 107: 101729.

tlrd: it is possible to model complex behaviors in a modular way, with
an acceptable overhead (even for production systems). See this
presentation at 2019's ELCE: https://www.youtube.com/watch?v=BfTuEHafNgg

Here I am proposing a more practical approach for the usage of deterministic
automata for runtime verification, and it includes:

	- An interface for controlling the verification;
	- A tool and set of headers that enables the automatic code
	  generation of the RV monitor (Monitor Synthesis);
	- Sample monitors to evaluate the interface;

Given that RV is a tracing consumer, the code is being placed inside the
tracing subsystem (Steven and I have been talking about it for a while).

Features to be added after this patchset:
	- safe_wtd monitor (requires further discussion with watchdog maintainers)
	- Export symbols for external modules
	- dot2bpf
	- Add a reactor that enables the visualization of the visited
	  states via KCOV (Marco Elver & Dmitry Vyukov)
	- Add a CRC method to check from user-space if the values
	  exported by the monitor were not corrupted by any other
	  kernel task (Gabriele Paoloni)

Changes from v5:
	- Add task monitor slot checks (Daniel/Tao)
	- Reset the monitors only after initializing the data (Daniel)
	- Add static for static data (Daniel/0-day)
	- Change start/stop *functions to enable/disable (like the user-
	  interface (Daniel)
	- s/init/start/ for the functions starting the monitoring (Daniel)
	- Access monitoring_on and reacting_on via functions (Daniel)
	- Improved vector access checks (Tao)
	- cleanups (Daniel/Tao)
Changes from v4:
	- The watchdog monitor will be discussed on another thread (Daniel)
	- s/safe/final/ in the tracepoint definition (Daniel)
	- Improved error handling at __init functions (Daniel)
	- Remove the hostname from example of commands in a shell (Bagas Sanjaya)
	- Added documentation about automata representation in C/DOT/Formal
	  and this documentation is cited in a comment on all model.h
	  (Steven)
	- Make wwnr a single patch (Daniel/Steven)
	- Add the .dot file for each monitor (Daniel)
	- Add a document for each monitor (Daniel)
	- Add an order for documentation in the index.rst (Daniel)
	- Add wip/wwnr/... long description (Steven/Randy)
	- Add comments for helper functions (Steven)
	- Improve checks in da_monitor.h (Tao Zhou)
	- Change final states set to bool (Tao/Daniel)
	- Adjust indentation on enabling monitor/reactor (Steven)
	- Use strim on buffers from user-space (Steven)
	- Remove ifdefs inside functions (Steven)
	- Adjust depends on RV in Kconfig (Steven)
	- Check empty enabled monitor list (Tao Zhou)
	- Fixed Copyright (Steven)
	- Adjusted structures' indentation (Steven)
	- Fix rv/monitors/$monitor/enabled return value (Song Liu)
	- Typos (Punit Agrawal/Randy)
	- Improved python scripts w.r.t. consistency (Steve)
	- Blamed myself for so many problems :-) (Daniel's mind)
Changes from v3:
	- Rebased on 5.19
	(rostedt's request were made on 1x1 meetings)
	- Moved monitors to monitors/$name/ (Rostedt)
	- Consolidate the tracepoints into a single include file in the default
	  directory (trace/events/rv.h) (Rostedt)
	- The tracepoints now record the entire string to the buffer.
	- Change the enable_monitors to disable monitors with ! (instead of -).
	  (Rostedt)
	- Add a suffix to the state/events enums, to avoid conflict in the
	  vmlinux.h used by eBPF.
	- The models are now placed in the $name.h (it used to store the
	  tracepoints, but they are now consolidated in a single file)
	- dot2c and dot2k updated to the changes
	- models re-generated with these new standards.
	- user-space tools moved to an directory outside of tools/tracing as
	  other methods of verification/log sources are planned.
Changes from v2:
	- Tons of checkpatch and kernel test robot
	- Moved files to better places
	- Adjusted watchdog tracepoints patch (Guenter Roeck)
	- Added pretimeout watchdog events (Peter Enderborg) 
	- Used task struct to store per-task monitors (Peter Zijlstra)
	- Changed the instrumentation to use internal definition of tracepoint
	  and check the callback signature (Steven Rostedt)
	- Used printk_deferred() and removed the comment about deadlocks
	  (Shuah Khan/John Ogness)
	- Some simplifications:
		- Removed the safe watchdog nowayout for now (myself)
		- Removed export symbols for now (myself)
Changes from V1:
	- rebased to the latest kernel;
	- code cleanup;
	- the watchdog dev monitor;
	- safety app;

Daniel Bristot de Oliveira (16):
  rv: Add Runtime Verification (RV) interface
  rv: Add runtime reactors interface
  rv/include: Add helper functions for deterministic automata
  rv/include: Add deterministic automata monitor definition via C macros
  rv/include: Add instrumentation helper functions
  Documentation/rv: Add a basic documentation
  tools/rv: Add dot2c
  Documentation/rv: Add deterministic automaton documentation
  tools/rv: Add dot2k
  Documentation/rv: Add deterministic automata monitor synthesis
    documentation
  Documentation/rv: Add deterministic automata instrumentation
    documentation
  rv/monitor: Add the wip monitor skeleton created by dot2k
  rv/monitor: Add the wip monitor
  rv/monitor: Add the wwnr monitor
  rv/reactor: Add the printk reactor
  rv/reactor: Add the panic reactor

 Documentation/trace/index.rst                 |   1 +
 .../trace/rv/da_monitor_instrumentation.rst   | 169 ++++
 .../trace/rv/da_monitor_synthesis.rst         | 147 ++++
 .../trace/rv/deterministic_automata.rst       | 184 +++++
 Documentation/trace/rv/index.rst              |  14 +
 Documentation/trace/rv/monitor_wip.rst        |  55 ++
 Documentation/trace/rv/monitor_wwnr.rst       |  45 ++
 .../trace/rv/runtime-verification.rst         | 231 ++++++
 include/linux/rv.h                            |  36 +
 include/linux/sched.h                         |  11 +
 include/rv/automata.h                         |  75 ++
 include/rv/da_monitor.h                       | 510 ++++++++++++
 include/rv/instrumentation.h                  |  29 +
 include/rv/rv.h                               |  32 +
 include/trace/events/rv.h                     | 142 ++++
 kernel/fork.c                                 |  14 +
 kernel/trace/Kconfig                          |   2 +
 kernel/trace/Makefile                         |   1 +
 kernel/trace/rv/Kconfig                       |  81 ++
 kernel/trace/rv/Makefile                      |   8 +
 kernel/trace/rv/monitors/wip/wip.c            |  91 +++
 kernel/trace/rv/monitors/wip/wip.h            |  46 ++
 kernel/trace/rv/monitors/wwnr/wwnr.c          |  90 +++
 kernel/trace/rv/monitors/wwnr/wwnr.h          |  46 ++
 kernel/trace/rv/reactor_panic.c               |  43 +
 kernel/trace/rv/reactor_printk.c              |  42 +
 kernel/trace/rv/rv.c                          | 739 ++++++++++++++++++
 kernel/trace/rv/rv.h                          |  62 ++
 kernel/trace/rv/rv_reactors.c                 | 494 ++++++++++++
 kernel/trace/trace.c                          |   2 +
 kernel/trace/trace.h                          |   9 +
 tools/verification/dot2/Makefile              |  26 +
 tools/verification/dot2/automata.py           | 174 +++++
 tools/verification/dot2/dot2c                 |  26 +
 tools/verification/dot2/dot2c.py              | 254 ++++++
 tools/verification/dot2/dot2k                 |  47 ++
 tools/verification/dot2/dot2k.py              | 177 +++++
 .../dot2/dot2k_templates/main_global.c        |  94 +++
 .../dot2/dot2k_templates/main_per_cpu.c       |  94 +++
 .../dot2/dot2k_templates/main_per_task.c      |  94 +++
 tools/verification/models/wip.dot             |  16 +
 tools/verification/models/wwnr.dot            |  16 +
 42 files changed, 4469 insertions(+)
 create mode 100644 Documentation/trace/rv/da_monitor_instrumentation.rst
 create mode 100644 Documentation/trace/rv/da_monitor_synthesis.rst
 create mode 100644 Documentation/trace/rv/deterministic_automata.rst
 create mode 100644 Documentation/trace/rv/index.rst
 create mode 100644 Documentation/trace/rv/monitor_wip.rst
 create mode 100644 Documentation/trace/rv/monitor_wwnr.rst
 create mode 100644 Documentation/trace/rv/runtime-verification.rst
 create mode 100644 include/linux/rv.h
 create mode 100644 include/rv/automata.h
 create mode 100644 include/rv/da_monitor.h
 create mode 100644 include/rv/instrumentation.h
 create mode 100644 include/rv/rv.h
 create mode 100644 include/trace/events/rv.h
 create mode 100644 kernel/trace/rv/Kconfig
 create mode 100644 kernel/trace/rv/Makefile
 create mode 100644 kernel/trace/rv/monitors/wip/wip.c
 create mode 100644 kernel/trace/rv/monitors/wip/wip.h
 create mode 100644 kernel/trace/rv/monitors/wwnr/wwnr.c
 create mode 100644 kernel/trace/rv/monitors/wwnr/wwnr.h
 create mode 100644 kernel/trace/rv/reactor_panic.c
 create mode 100644 kernel/trace/rv/reactor_printk.c
 create mode 100644 kernel/trace/rv/rv.c
 create mode 100644 kernel/trace/rv/rv.h
 create mode 100644 kernel/trace/rv/rv_reactors.c
 create mode 100644 tools/verification/dot2/Makefile
 create mode 100644 tools/verification/dot2/automata.py
 create mode 100644 tools/verification/dot2/dot2c
 create mode 100644 tools/verification/dot2/dot2c.py
 create mode 100644 tools/verification/dot2/dot2k
 create mode 100644 tools/verification/dot2/dot2k.py
 create mode 100644 tools/verification/dot2/dot2k_templates/main_global.c
 create mode 100644 tools/verification/dot2/dot2k_templates/main_per_cpu.c
 create mode 100644 tools/verification/dot2/dot2k_templates/main_per_task.c
 create mode 100644 tools/verification/models/wip.dot
 create mode 100644 tools/verification/models/wwnr.dot

-- 
2.35.1

