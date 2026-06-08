Return-Path: <linux-doc+bounces-91387-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id snk5G8DTJmrplAIAu9opvQ
	(envelope-from <linux-doc+bounces-91387-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 16:37:52 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 406586574E7
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 16:37:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="lg/jHuIr";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91387-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91387-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 659E03042FAD
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 14:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6073D891F;
	Mon,  8 Jun 2026 14:25:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CF33CB8F4;
	Mon,  8 Jun 2026 14:25:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928721; cv=none; b=fAVMvQ5ONY56ViqpW5cs9ILyBC8aYRLNX50VQwgSmPumHUZ6/yTXL45v6TNz+H2P2GM+rgTQzHKKHDsoLqhIZdfSDOx5K2QL39+jy7456NJ4pSxKDQsU3odqGi3Fw6aeks0QUT+mqSDEwDVuCwKcfBlK+zzQwH3vlbwux3IGpVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928721; c=relaxed/simple;
	bh=jjC2TroFZ4GHCUKzT+lReLkVA6zya7eZH2JC/izyyPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eViWZFZBSDbmaCaIH9K4ftXdgwuo78fy5A36fFlvkw7L81B1PAwqJsL54PBQVp3Mg4rp6LCa/YIuER7YIR3+vNPBbuCRYhV7ApnZyj351oPCgjM6mm9Z9BkXFhcIhMF/VWwzwUaAXFWmJW94npD+H/+C+9YlKtTSRsVi4dPB+yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lg/jHuIr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E7F1F00893;
	Mon,  8 Jun 2026 14:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928720;
	bh=QaiBhxkgTSsycOO0IquMLBjmDZbI+8btldjP6ELN4Ys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lg/jHuIr4j8JLH030+n/9wcJYAi+zCoL6XWz9P1JTnNlvFYfOuOg5Ez5PtDri0veI
	 lwlFUU+z2iuuu0XGg4imf26Pn2mmK3wHbNbIwUU73MyywQL/auzl9lTrIRla5UN4Ql
	 Jm5XP3weIldrJf6wsd2BoIh9Pfsi7TTk8muwb56r+e9kwkK/NaNDUEDlQKd/YSK6Jb
	 l9m9aJmV9S67J9qD0TO4pXCct3Ewc/JwrUXldpVNQm7diYQt+TBfP5iYgloJ7ubby6
	 KaRafBJEdIwC61o0lJuxuEDrxgkuqwQ5kWEA05QCqukCl2fep7DqbvrKDE/g+kZUAk
	 ip6mU6SrEZ12w==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH 6/7] tracing/probes: Support reserved this_cpu_ptr() method
Date: Mon,  8 Jun 2026 23:25:16 +0900
Message-ID: <178092871603.163648.8025563775854608488.stgit@devnote2>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178092865666.163648.10457567771536160909.stgit@devnote2>
References: <178092865666.163648.10457567771536160909.stgit@devnote2>
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
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:mhiramat@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91387-lists,linux-doc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devnote2:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 406586574E7

From: Masami Hiramatsu (Google) <mhiramat@kernel.org>

The +PCPU() dereference operator was introduced in trace probes to
access a per-CPU pointer of a CPU local variable. However, kernel
developers are more familiar with the "this_cpu_ptr()" macro.

To make trace probe syntax more intuitive and aligned with standard
kernel macros, introduce support for "this_cpu_ptr(<fetcharg>)" as a
reserved method.

Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 kernel/trace/trace.c       |    2 +-
 kernel/trace/trace_probe.c |    7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 2b8c8ac4036a..60ab839d0867 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -4332,7 +4332,7 @@ static const char readme_msg[] =
 	"\t           $stack<index>, $stack, $retval, $comm, $current\n"
 #endif
 	"\t           +|-[u]<offset>(<fetcharg>), \\imm-value, \\\"imm-string\"\n"
-	"\t           +CPU(<fetcharg>), +PCPU(<fetcharg>)\n"
+	"\t           +CPU(<fetcharg>), +PCPU(<fetcharg>), this_cpu_ptr(<fetcharg>)\n"
 	"\t     kernel return probes support: $retval, $arg<N>, $comm\n"
 	"\t     type: s8/16/32/64, u8/16/32/64, x8/16/32/64, char, string, symbol,\n"
 	"\t           b<bit-width>@<bit-offset>/<container-size>, ustring,\n"
diff --git a/kernel/trace/trace_probe.c b/kernel/trace/trace_probe.c
index fa6757222fe6..27be0664cdf3 100644
--- a/kernel/trace/trace_probe.c
+++ b/kernel/trace/trace_probe.c
@@ -1315,6 +1315,7 @@ parse_probe_arg(char *arg, const struct fetch_type *type,
 		struct fetch_insn **pcode, struct fetch_insn *end,
 		struct traceprobe_parse_context *ctx)
 {
+	static const char *THIS_CPU_PTR_STR = "this_cpu_ptr(";
 	struct fetch_insn *code = *pcode;
 	unsigned long param;
 	int deref = FETCH_OP_DEREF;
@@ -1426,6 +1427,7 @@ parse_probe_arg(char *arg, const struct fetch_type *type,
 			ctx->offset += (tmp + 1 - arg) + (arg[0] != '-' ? 1 : 0);
 			arg = tmp + 1;
 		}
+handle_deref:
 		tmp = strrchr(arg, ')');
 		if (!tmp) {
 			trace_probe_log_err(ctx->offset + strlen(arg),
@@ -1476,6 +1478,11 @@ parse_probe_arg(char *arg, const struct fetch_type *type,
 		ret = handle_typecast(arg, pcode, end, ctx);
 		break;
 	default:
+		if (str_has_prefix(arg, THIS_CPU_PTR_STR)) {
+			arg += strlen(THIS_CPU_PTR_STR);
+			deref = FETCH_OP_CPU_PTR;
+			goto handle_deref;
+		}
 		if (isalpha(arg[0]) || arg[0] == '_') {	/* BTF variable */
 			if (!tparg_is_function_entry(ctx->flags) &&
 			    !tparg_is_function_return(ctx->flags)) {


