Return-Path: <linux-doc+bounces-23632-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA44095C2E5
	for <lists+linux-doc@lfdr.de>; Fri, 23 Aug 2024 03:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AF431C2225F
	for <lists+linux-doc@lfdr.de>; Fri, 23 Aug 2024 01:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487A91D68F;
	Fri, 23 Aug 2024 01:39:47 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244B61CAB1;
	Fri, 23 Aug 2024 01:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724377187; cv=none; b=XoFD4vJv7jyohS4xkpcRuia4cCVH44SyEk5IwKHSWdtydcNUNIQ7NaRWKjQQAfx4XmoZDMYqMn1VWiF9K7tTnJPKcxpUXLR91A7JVgkgIDg0j6I88pyzFI74XR5YTSOjP5IGDTpPWLUnzzhe+xqEN3HXdNFxaR14eO4pF7fZxGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724377187; c=relaxed/simple;
	bh=YU0QIbXtgoAbgVwROAdDdrWELtxzSNwB9GOOMj6ww5s=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=awmYuMfV4h05jbOzAe/4jedt4ezOeoTBIDX0is8WvbY09hDngoiGczxppONwyXLhOAEx06TNNL5DhcVegJtEpOlmymDBF6o0YJ4ZNGuPQEcUNHCdzRF0pR4n2cP1YsX3By9vT6MZxsGDuWVk/UY64VqMzCiKaIWIDEdiLosBV7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96F1C4AF51;
	Fri, 23 Aug 2024 01:39:46 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98)
	(envelope-from <rostedt@goodmis.org>)
	id 1shJHn-00000003Zj3-3XjD;
	Thu, 22 Aug 2024 21:40:19 -0400
Message-ID: <20240823014019.702433486@goodmis.org>
User-Agent: quilt/0.68
Date: Thu, 22 Aug 2024 21:39:07 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 suleiman@google.com,
 Thomas Gleixner <tglx@linutronix.de>,
 Vineeth Pillai <vineeth@bitbyteword.org>,
 Beau Belgrave <beaub@linux.microsoft.com>,
 Alexander Graf <graf@amazon.com>,
 Baoquan He <bhe@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 David Howells <dhowells@redhat.com>,
 Mike Rapoport <rppt@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Tony Luck <tony.luck@intel.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Ross Zwisler <zwisler@google.com>,
 Kees Cook <keescook@chromium.org>,
 Alexander Aring <aahringo@redhat.com>,
 "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
 Tomas Glozar <tglozar@redhat.com>,
 John Kacur <jkacur@redhat.com>,
 Clark Williams <williams@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Jonathan Corbet" <corbet@lwn.net>
Subject: [PATCH 5/5] tracing/Documentation: Start a document on how to debug with tracing
References: <20240823013902.135036960@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

Add a new document Documentation/trace/debugging.rst that will hold
various ways to debug tracing.

This initial version mentions trace_printk and how to create persistent
buffers that can last across bootups.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 .../admin-guide/kernel-parameters.txt         |   2 +
 Documentation/trace/debugging.rst             | 159 ++++++++++++++++++
 2 files changed, 161 insertions(+)
 create mode 100644 Documentation/trace/debugging.rst

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 9e507e6cb4c8..9bb50dc78338 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6785,6 +6785,8 @@
 
 				reserve_mem=12M:4096:trace trace_instance=boot_map^traceoff^traceprintk@trace,sched,irq
 
+			See also Documentation/trace/debugging.rst
+
 
 	trace_options=[option-list]
 			[FTRACE] Enable or disable tracer options at boot.
diff --git a/Documentation/trace/debugging.rst b/Documentation/trace/debugging.rst
new file mode 100644
index 000000000000..54fb16239d70
--- /dev/null
+++ b/Documentation/trace/debugging.rst
@@ -0,0 +1,159 @@
+==============================
+Using the tracer for debugging
+==============================
+
+Copyright 2024 Google LLC.
+
+:Author:   Steven Rostedt <rostedt@goodmis.org>
+:License:  The GNU Free Documentation License, Version 1.2
+          (dual licensed under the GPL v2)
+
+- Written for: 6.12
+
+Introduction
+------------
+The tracing infrastructure can be very useful for debugging the Linux
+kernel. This document is a place to add various methods of using the tracer
+for debugging.
+
+First, make sure that the tracefs file system is mounted::
+
+ $ sudo mount -t tracefs tracefs /sys/kernel/tracing
+
+
+Using trace_printk()
+--------------------
+
+trace_printk() is a very lightweight utility that can be used in any context
+inside the kernel, with the exception of "noinstr" sections. It can be used
+in normal, softirq, interrupt and even NMI context. The trace data is
+written to the tracing ring buffer in a lockless way. To make it even
+lighter weight, when possible, it will only record the pointer to the format
+string, and save the raw arguments into the buffer. The format and the
+arguments will be post processed when the ring buffer is read. This way the
+trace_printk() format conversions are not done during the hot path, where
+the trace is being recorded.
+
+trace_printk() is meant only for debugging, and should never be added into
+a subsystem of the kernel. If you need debugging traces, add trace events
+instead. If a trace_printk() is found in the kernel, the following will
+appear in the dmesg::
+
+  **********************************************************
+  **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
+  **                                                      **
+  ** trace_printk() being used. Allocating extra memory.  **
+  **                                                      **
+  ** This means that this is a DEBUG kernel and it is     **
+  ** unsafe for production use.                           **
+  **                                                      **
+  ** If you see this message and you are not debugging    **
+  ** the kernel, report this immediately to your vendor!  **
+  **                                                      **
+  **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
+  **********************************************************
+
+Debugging kernel crashes
+------------------------
+There is various methods of acquiring the state of the system when a kernel
+crash occurs. This could be from the oops message in printk, or one could
+use kexec/kdump. But these just show what happened at the time of the crash.
+It can be very useful in knowing what happened up to the point of the crash.
+The tracing ring buffer, by default, is a circular buffer than will
+overwrite older events with newer ones. When a crash happens, the content of
+the ring buffer will be all the events that lead up to the crash.
+
+There are several kernel command line parameters that can be used to help in
+this. The first is "ftrace_dump_on_oops". This will dump the tracing ring
+buffer when a oops occurs to the console. This can be useful if the console
+is being logged somewhere. If a serial console is used, it may be prudent to
+make sure the ring buffer is relatively small, otherwise the dumping of the
+ring buffer may take several minutes to hours to finish. Here's an example
+of the kernel command line::
+
+  ftrace_dump_on_oops trace_buf_size=50K
+
+Note, the tracing buffer is made up of per CPU buffers where each of these
+buffers is broken up into sub-buffers that are by default PAGE_SIZE. The
+above trace_buf_size option above sets each of the per CPU buffers to 50K,
+so, on a machine with 8 CPUs, that's actually 400K total.
+
+Persistent buffers across boots
+-------------------------------
+If the system memory allows it, the tracing ring buffer can be specified at
+a specific location in memory. If the location is the same across boots and
+the memory is not modified, the tracing buffer can be retrieved from the
+following boot. There's two ways to reserve memory for the use of the ring
+buffer.
+
+The more reliable way (on x86) is to reserve memory with the "memmap" kernel
+command line option and then use that memory for the trace_instance. This
+requires a bit of knowledge of the physical memory layout of the system. The
+advantage of using this method, is that the memory for the ring buffer will
+always be the same::
+
+  memmap==12M$0x284500000 trace_instance=boot_map@0x284500000:12M
+
+The memmap above reserves 12 megabytes of memory at the physical memory
+location 0x284500000. Then the trace_instance option will create a trace
+instance "boot_map" at that same location with the same amount of memory
+reserved. As the ring buffer is broke up into per CPU buffers, the 12
+megabytes will be broken up evenly between those CPUs. If you have 8 CPUs,
+each per CPU ring buffer will be 1.5 megabytes in size. Note, that also
+includes meta data, so the amount of memory actually used by the ring buffer
+will be slightly smaller.
+
+Another more generic but less robust way to allocate a ring buffer mapping
+at boot is with the "reserve_mem" option::
+
+  reserve_mem=12M:4096:trace trace_instance=boot_map@trace
+
+The reserve_mem option above will find 12 megabytes that are available at
+boot up, and align it by 4096 bytes. It will label this memory as "trace"
+that can be used by later command line options.
+
+The trace_instance option creates a "boot_map" instance and will use the
+memory reserved by reserve_mem that was labeled as "trace". This method is
+more generic but may not be as reliable. Due to KASLR, the memory reserved
+by reserve_mem may not be located at the same location. If this happens,
+then the ring buffer will not be from the previous boot and will be reset.
+
+Sometimes, by using a larger alignment, it can keep KASLR from moving things
+around in such a way that it will move the location of the reserve_mem. By
+using a larger alignment, you may find better that the buffer is more
+consistent to where it is placed::
+
+  reserve_mem=12M:0x2000000:trace trace_instance=boot_map@trace
+
+On boot up, the memory reserved for the ring buffer is validated. It will go
+through a series of tests to make sure that the ring buffer contains valid
+data. If it is, it will then set it up to be available to read from the
+instance. If it fails any of the tests, it will clear the entire ring buffer
+and initialize it as new.
+
+The layout of this mapped memory may not be consistent from kernel to
+kernel, so only the same kernel is guaranteed to work if the mapping is
+preserved. Switching to a different kernel version may find a different
+layout and mark the buffer as invalid.
+
+Using trace_printk() in the boot instance
+-----------------------------------------
+By default, the content of trace_printk() goes into the top level tracing
+instance. But this instance is never preserved across boots. To have the
+trace_printk() content, and some other internal tracing go to the preserved
+buffer (like dump stacks), either set the instance to be the trace_printk()
+destination from the kernel command line, or set it after boot up via the
+trace_printk_dest option.
+
+After boot up::
+
+  echo 1 > /sys/kernel/tracing/instances/boot_map/options/trace_printk_dest
+
+From the kernel command line::
+
+  reserve_mem=12M:4096:trace trace_instance=boot_map^traceprintk^traceoff@trace
+
+If setting it from the kernel command line, it is recommended to also
+disable tracing with the "traceoff" flag, and enable tracing after boot up.
+Otherwise the trace from the most recent boot will be mixed with the trace
+from the previous boot, and may make it confusing to read.
-- 
2.43.0



