Return-Path: <linux-doc+bounces-96868-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3OpxIEXmVmqGCgEAu9opvQ
	(envelope-from <linux-doc+bounces-96868-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 03:45:41 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD512759EF7
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 03:45:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=av0+6RgK;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96868-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96868-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E2653066260
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 01:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3DC837FF67;
	Wed, 15 Jul 2026 01:44:41 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6552E8897;
	Wed, 15 Jul 2026 01:44:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784079881; cv=none; b=e5ZUvYKd1q02hR6mKhIcQwYPKLw1HAd5ISjQayjLOEW/xa4ueHsuKe83DHM1AaTKv4D3lggUr6e7Oc2EgBzCQVywJb7IckYVZPIwwOpKcRcngy59FUlyUee96AvASVQej/sqVFc+uPvA0zKCznp6Vv2Yl+cbKQZjSPFG4XY5bro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784079881; c=relaxed/simple;
	bh=XkgXf+BmWb1gm42X0hFSsPY2QiN+40F9WNZpKmrmhe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M24yiK3WUHOFAR0foK0OQXpiuCCPGhPKHTEA56rvmn7pd0m3U52P8nCtaZ96brcHbUtpMhdq8SEKCpWm3u1scCmPgthq+rcTdnD2ytXLlqOt0gbJWGDbddRRKreqiQ/htRF5SLF29ocCjRY8xvemEMdxL2L94J1tN4r5ejO6cxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=av0+6RgK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76B51F000E9;
	Wed, 15 Jul 2026 01:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784079880;
	bh=1dNoqBTEg7S9Qpsv/+4QI0aTEXe3+f5Z++F4nY+50YU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=av0+6RgKGKhGad+TlsGrTD8wxX4RWSxNYMUn//2Pz+sWzdrc4kXA8Slw3F/di9v7z
	 h+Bl58rYbxXn1EUpSOuLke91DTPl5NmpiZdCmlx91XS1NeUFtI1ymyOX3ElcJXF+OA
	 1JGfsiULSJzNd4Eovu280th2K2dJdgI3WNLHARfasEfa6MYdIRBziaqH3Zv7MC9/lW
	 Mo8iQ+iQMWCxYcx0sIASOXO01joXc/JuxwB1eX+7fLi88S1FTzjBP3bIjl3G7VExNc
	 qsllo8CKSni6NQK/yu0hJUMwBpo+QKlmnNiQkF+mmZVWDl7RqorW5p/JT6onnlTeCk
	 6CNiQtPT1mUqg==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	x86@kernel.org
Cc: Jinchao Wang <wangjinchao600@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH v7 03/10] selftests: tracing: Add a basic testcase for wprobe
Date: Wed, 15 Jul 2026 10:44:34 +0900
Message-ID: <178407987428.95826.3097357125404908509.stgit@devnote2>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178407983818.95826.12714571928538799781.stgit@devnote2>
References: <178407983818.95826.12714571928538799781.stgit@devnote2>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:peterz@infradead.org,m:mingo@kernel.org,m:x86@kernel.org,m:wangjinchao600@gmail.com,m:mathieu.desnoyers@efficios.com,m:mhiramat@kernel.org,m:tglx@linutronix.de,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:alexander.shishkin@linux.intel.com,m:irogers@google.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-perf-users@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-96868-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,efficios.com,kernel.org,linutronix.de,alien8.de,linux.intel.com,zytor.com,google.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devnote2:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,add_remove_wprobe.tc:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD512759EF7

From: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Add 'add_remove_wprobe.tc' testcase for testing wprobe event that
tests adding and removing operations of the wprobe event.

Link: https://lore.kernel.org/all/175859026716.374439.14852239332989324292.stgit@devnote2/

Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 tools/testing/selftests/ftrace/config              |    1 
 .../ftrace/test.d/dynevent/add_remove_wprobe.tc    |   68 ++++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/test.d/dynevent/add_remove_wprobe.tc

diff --git a/tools/testing/selftests/ftrace/config b/tools/testing/selftests/ftrace/config
index 544de0db5f58..d2f503722020 100644
--- a/tools/testing/selftests/ftrace/config
+++ b/tools/testing/selftests/ftrace/config
@@ -27,3 +27,4 @@ CONFIG_STACK_TRACER=y
 CONFIG_TRACER_SNAPSHOT=y
 CONFIG_UPROBES=y
 CONFIG_UPROBE_EVENTS=y
+CONFIG_WPROBE_EVENTS=y
diff --git a/tools/testing/selftests/ftrace/test.d/dynevent/add_remove_wprobe.tc b/tools/testing/selftests/ftrace/test.d/dynevent/add_remove_wprobe.tc
new file mode 100644
index 000000000000..20774c7f69f8
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/dynevent/add_remove_wprobe.tc
@@ -0,0 +1,68 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Generic dynamic event - add/remove wprobe events
+# requires: dynamic_events "w[:[<group>/][<event>]] [r|w|rw]@<addr>[:<len>]":README
+
+echo 0 > events/enable
+echo > dynamic_events
+
+# Use jiffies as a variable that is frequently written to.
+TARGET=jiffies
+
+echo "w:my_wprobe w@$TARGET" >> dynamic_events
+
+grep -q my_wprobe dynamic_events
+if [ $? -ne 0 ]; then
+    echo "Failed to create wprobe event"
+    exit_fail
+fi
+
+test -d events/wprobes/my_wprobe
+if [ $? -ne 0 ]; then
+    echo "Failed to create wprobe event directory"
+    exit_fail
+fi
+
+echo 1 > events/wprobes/my_wprobe/enable
+
+# Check if the event is enabled
+cat events/wprobes/my_wprobe/enable | grep -q 1
+if [ $? -ne 0 ]; then
+    echo "Failed to enable wprobe event"
+    exit_fail
+fi
+
+# Let some time pass to trigger the breakpoint
+sleep 1
+
+# Check if we got any trace output
+if !grep -q my_wprobe trace; then
+    echo "wprobe event was not triggered"
+fi
+
+echo 0 > events/wprobes/my_wprobe/enable
+
+# Check if the event is disabled
+cat events/wprobes/my_wprobe/enable | grep -q 0
+if [ $? -ne 0 ]; then
+    echo "Failed to disable wprobe event"
+    exit_fail
+fi
+
+echo "-:my_wprobe" >> dynamic_events
+
+! grep -q my_wprobe dynamic_events
+if [ $? -ne 0 ]; then
+    echo "Failed to remove wprobe event"
+    exit_fail
+fi
+
+! test -d events/wprobes/my_wprobe
+if [ $? -ne 0 ]; then
+    echo "Failed to remove wprobe event directory"
+    exit_fail
+fi
+
+clear_trace
+
+exit 0


