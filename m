Return-Path: <linux-doc+bounces-96870-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ag1kOHzmVmqeCgEAu9opvQ
	(envelope-from <linux-doc+bounces-96870-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 03:46:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9AA759F20
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 03:46:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Jh2tX1Nt;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96870-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96870-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 430E531073E1
	for <lists+linux-doc@lfdr.de>; Wed, 15 Jul 2026 01:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA9A22B8AB;
	Wed, 15 Jul 2026 01:45:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFF437FF67;
	Wed, 15 Jul 2026 01:45:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784079904; cv=none; b=OFVzIGEw8SH7jTzNKxlFmGUaK8KVIk31Qlnyra8oXCvg9C6rMt/WAREKjY/0s97c2X1ce+7HWGAE0Q/isZP1Wr+0lgSLUs1IXN3IWiRE3F2dx8m06RlsICjyjdLKN0wSe61B7ip+2ynJ+zXSxB2X/G51nAq5PdSu6Izcy6wSByU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784079904; c=relaxed/simple;
	bh=gE5E61SHGyfS34EqmtoCN5wjt/tCHOvKVE5y6Wg2Hp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X3990OhpFq8BNnPlf7BMxRvf2h89TO1jjQbgjyxDSRnHApWihLqEB8VkpuvP+O7GR1DEn/ECT4dT2kcSyNTheg+MN0Q95ZCcKsRNjaGtfu8ysYCbh05UJ/HcFk7LpPay4e7KKXf7dd/nfTifuDlz3U4R5xKUsCctF3ytRMNL1OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jh2tX1Nt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F9081F000E9;
	Wed, 15 Jul 2026 01:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784079903;
	bh=rKR3a2cqrM6Ydesu7cGmeplW+brpFmLVctCH3lJIWws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jh2tX1Nt2GdpvDaJThIV9PmLuPTzpdCBpVI7WjH0Qi5AkKxqizv5FJkQ8QMFd6Wd2
	 swLyxyhB0EY43+L9NZmVlv60+Wq2Dk4MpO6f4Z9mPHBjeMKZzK9Lqfk9UrsvyN6xCu
	 LtZTF2i1vtA7DouHdp1JLpCJ9hY74MLwdjF4V5UZkYxDQkN/mkVTn9OeH0he4MERTa
	 k61qEcngSQZWiMhcpmCw8BeovSEMya9ReYsE4A0JVmXCI5JMKhaZRoBp23psDSK/Zy
	 jGnBKg9mIy2pdll3boGb41ceLMRGtqIYynmWXYffrHhXqNff0Mlx8DcA4Vbu2uCckh
	 SRDpVB/hfahPg==
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
Subject: [PATCH v7 05/10] tracing: wprobe: Use a new seq_print_ip_sym_offset() wrapper
Date: Wed, 15 Jul 2026 10:44:57 +0900
Message-ID: <178407989708.95826.17630423823637072384.stgit@devnote2>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-96870-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devnote2:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C9AA759F20

From: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Use a new seq_print_ip_sym_offset() wrapper function instead of
using TRACE_ITER(SYM_OFFSET) mask directly.

Link: https://lore.kernel.org/all/176226550596.59499.18020648957674458755.stgit@devnote2/

Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 kernel/trace/trace_wprobe.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/trace/trace_wprobe.c b/kernel/trace/trace_wprobe.c
index b52f3eac719f..dd310a87b333 100644
--- a/kernel/trace/trace_wprobe.c
+++ b/kernel/trace/trace_wprobe.c
@@ -20,6 +20,7 @@
 #include <asm/ptrace.h>
 
 #include "trace_dynevent.h"
+#include "trace_output.h"
 #include "trace_probe.h"
 #include "trace_probe_kernel.h"
 #include "trace_probe_tmpl.h"


