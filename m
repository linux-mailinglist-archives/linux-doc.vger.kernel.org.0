Return-Path: <linux-doc+bounces-5913-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B44E81E8BC
	for <lists+linux-doc@lfdr.de>; Tue, 26 Dec 2023 18:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 212F22815FA
	for <lists+linux-doc@lfdr.de>; Tue, 26 Dec 2023 17:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FCE4F8B5;
	Tue, 26 Dec 2023 17:34:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38104F8A3;
	Tue, 26 Dec 2023 17:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7843DC433C8;
	Tue, 26 Dec 2023 17:34:41 +0000 (UTC)
Date: Tue, 26 Dec 2023 12:35:25 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, Linux
 Trace Kernel <linux-trace-kernel@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>
Subject: [PATCH] ring-buffer/Documentation: Add documentation on
 buffer_percent file
Message-ID: <20231226123525.71a6d0fb@gandalf.local.home>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

When the buffer_percent file was added to the kernel, the documentation
should have been updated to document what that file does.

Fixes: 03329f9939781 ("tracing: Add tracefs file buffer_percentage")
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 Documentation/trace/ftrace.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index 933e7efb9f1b..16eabb00fa55 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -180,6 +180,21 @@ of ftrace. Here is a list of some of the key files:
 	Only active when the file contains a number greater than 0.
 	(in microseconds)
 
+  buffer_percent:
+
+	This is the water-mark for how much the ring buffer needs to be filled
+	before a waiter is woken up. That is, if an application call a
+	blocking read syscall on one of the per_cpu trace_pipe_raw files, it
+	will block until the given amount of data specified by buffer_percent
+	is in the ring buffer before it wakes the reader up. This also
+	controls how splice system calls are blocked on this file.
+
+	0   - means to wake up as soon as there is any data in the ring buffer.
+	50  - means to wake up when roughly half of the ring buffer sub-buffers
+	      are full.
+	100 - means to block until the ring buffer is totally full and is
+	      about to start overwriting the older data.
+
   buffer_size_kb:
 
 	This sets or displays the number of kilobytes each CPU
-- 
2.42.0


