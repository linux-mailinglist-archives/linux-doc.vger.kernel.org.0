Return-Path: <linux-doc+bounces-74239-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI28Ie8YemlS2QEAu9opvQ
	(envelope-from <linux-doc+bounces-74239-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 28 Jan 2026 15:10:55 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0153BA2877
	for <lists+linux-doc@lfdr.de>; Wed, 28 Jan 2026 15:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EADF03047BDD
	for <lists+linux-doc@lfdr.de>; Wed, 28 Jan 2026 14:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F3824A058;
	Wed, 28 Jan 2026 14:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3yv3qQC"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504072459CF;
	Wed, 28 Jan 2026 14:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609367; cv=none; b=roQQ8ARKe15/45cyAT2JQystu8MwhDFIa9nyTVKD1+493vZoonl8CIrP21yJW+qiXR2XW8olSo4DE7WxIjxzLcIm6MoZYQ1SjSjcLWMdODpzmP6QriVnt+GxbdFHrUXcYygmroAy68MterZE727dTsqQBPTASn9k3yt05quLPno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609367; c=relaxed/simple;
	bh=IOA1nulwhlQiMwwdC60wxKYixclv7M0o/Z/A6GZogk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SkuxmRDWmqZaAosTBVw/yZiHoUvBNtLolO5gsN+E40Cm2qSgK9Td1dKd0dRlmije7TdfhHjcGFWGLCJA/geQfZMTu5NyDNFpia3W8/Qig2ex8G9/uBbm5dQOqKbRqQ/z5xdfLWLSvjAPm646YEeXigYsi6ax8ykCFuAurs8Ouxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3yv3qQC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404F2C4CEF1;
	Wed, 28 Jan 2026 14:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769609367;
	bh=IOA1nulwhlQiMwwdC60wxKYixclv7M0o/Z/A6GZogk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C3yv3qQC9L30CI2ktH6zkw/TixbhdD/RVPjHJcTcvR5KJBL9dD3O9Op2dD5yxj0Ln
	 4NVlxDGKqiueX4yiDxzdDTzvhvWNp7biKUoF6nJMXRzY8b4XCo0RrhPcw1+tq7ZXnC
	 UMq9GIfF1Xk0NgocKMU5TVHjwITbPOvewY2qWGKkvS3h6E8I6aj7YL699TJUDtcUxx
	 jeTlTCp6nzTpIOCSbSPVkLWf29LGznreUMDsWBXBMYgF+GUW8uS3Uv4hI4rhsAqGsF
	 IUAqOLcNfVf5jT9G+nFD1dF8QhqkreQ6Ooiqj9jJI8+JldCVj6BeDN83lt0RkvFS9D
	 C9C0cxoa5UjvQ==
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
Subject: [PATCH v6 02/11] x86: hw_breakpoint: Add a kconfig to clarify when a breakpoint fires
Date: Wed, 28 Jan 2026 23:09:21 +0900
Message-ID: <176960936178.182525.3819325751118979093.stgit@devnote2>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <176960933881.182525.11984731584313026309.stgit@devnote2>
References: <176960933881.182525.11984731584313026309.stgit@devnote2>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-74239-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[gmail.com,efficios.com,kernel.org,linutronix.de,alien8.de,linux.intel.com,zytor.com,google.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0153BA2877
X-Rspamd-Action: no action

From: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Add CONFIG_HAVE_POST_BREAKPOINT_HOOK which indicates the hw_breakpoint
on that architecture fires after the target memory has been modified.
This is currently x86 only behavior.

Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 arch/Kconfig         |   10 ++++++++++
 arch/x86/Kconfig     |    1 +
 kernel/trace/Kconfig |    1 +
 3 files changed, 12 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index 31220f512b16..64adda21c5f6 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -453,6 +453,16 @@ config HAVE_MIXED_BREAKPOINTS_REGS
 	  Select this option if your arch implements breakpoints under the
 	  latter fashion.
 
+config HAVE_POST_BREAKPOINT_HOOK
+	bool
+	depends on HAVE_HW_BREAKPOINT
+	help
+	  Depending on the arch implementation of hardware breakpoints,
+	  some of them provide breakpoint hook after the target memory
+	  is modified.
+	  Select this option if your arch implements breakpoints overflow
+	  handler hooks after the target memory is modified.
+
 config HAVE_USER_RETURN_NOTIFIER
 	bool
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 80527299f859..755fd3bd4334 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -246,6 +246,7 @@ config X86
 	select HAVE_FUNCTION_TRACER
 	select HAVE_GCC_PLUGINS
 	select HAVE_HW_BREAKPOINT
+	select HAVE_POST_BREAKPOINT_HOOK
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_EXIT_ON_IRQ_STACK	if X86_64
 	select HAVE_IRQ_TIME_ACCOUNTING
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index e09494c09cd5..087a27b56eb1 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -851,6 +851,7 @@ config WPROBE_EVENTS
 	bool "Enable wprobe-based dynamic events"
 	depends on TRACING
 	depends on HAVE_HW_BREAKPOINT
+	depends on HAVE_POST_BREAKPOINT_HOOK
 	select PROBE_EVENTS
 	select DYNAMIC_EVENTS
 	help


