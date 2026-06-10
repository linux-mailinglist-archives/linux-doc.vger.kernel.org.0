Return-Path: <linux-doc+bounces-91765-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sZtKIi61KGp7IQMAu9opvQ
	(envelope-from <linux-doc+bounces-91765-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 02:51:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 90272665090
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 02:51:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=beHh2r3w;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91765-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-91765-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4AA8D3014017
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 00:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EF81E8332;
	Wed, 10 Jun 2026 00:51:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176281B6CE9;
	Wed, 10 Jun 2026 00:51:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781052706; cv=none; b=uG1v0rd0wlHCxK42jP6dOd1yJVxOtIK5jem4SqIMA92RGu/x1lxxP7HynRWIKRyr5+CL62zOUD0FgNnGP+A6SYAV8RybYc2l0gtYa2bmPdtaBe7yCrVfBcUM+s3wCJ6JIqUFbUPRJVbGkwkETc6AL3S8oaZf2XyzVk0b9QK7MDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781052706; c=relaxed/simple;
	bh=c5WExVv811Iyvj3RxZPs8jJhopjfV6DfLTY11TxGXXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X1mlDk4Uvx/9gtfonJ+j98xVV0Pz6GlPUeGTi0uIcCJ9rX7GMFHnU7U4LptrmSivfrul1s2xYUb5k0CMGBSFwnEC1tEO/eOzjj5jsQwC/2wvBtFXR4hlJ4MWwmQ2ts0zHQPnGls0XbLGbIlta7fFAv6xho6iYd+mj4TcZEiX6CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=beHh2r3w; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D841F00893;
	Wed, 10 Jun 2026 00:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781052704;
	bh=LEB61XnRBSa3cidYk+jjC9e49mqh8zUrA0rZXEJ4Nx4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=beHh2r3wRqHmOr3oXYZ3ezcdWBiMvHR8YaPzi3s5SzEc4UzN/ZS13U+VG2xPtYgQ3
	 Q/HnwyDTRRi9x6L3zjlQwoQPtry8930IEpq3OSamiXmvQi5eKsY4rHdjw+cS/XoJ6X
	 JToWLJVPRIhzXp0xiwtlWPwEZBEgjXh7uRGilfXHbtWh4Ht28wvQOCgc3axNHU0p/g
	 kK4be0r6/ephv3ND0cFkuzXpfm6S0zF/q+G3Z9S/8uiqIm+lqOjiCtZxNPHPbixjm2
	 ThAts6f++TioXtyb28AbGgS/qlAnmmppXub54oYMzNZ3BgQXl/4w42QAg2eolJMUXH
	 FunGK84zlWZGw==
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
Subject: [RFC PATCH v2 2/7] tracing/probes: Support typecast for various probe events
Date: Wed, 10 Jun 2026 09:51:40 +0900
Message-ID: <178105270048.21760.1767177339859084457.stgit@devnote2>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178105268094.21760.13668249930524377840.stgit@devnote2>
References: <178105268094.21760.13668249930524377840.stgit@devnote2>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:mhiramat@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-91765-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,devnote2:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90272665090

From: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Support BTF typecast feature on other probe events (but only if it is
kernel function entry or return.)

To support other probe events, we just need to use last_struct type
when we find a function parameter in parse_btf_arg().

This also update <tracefs>/README file to show struct typecast.

Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 Changes in v2:
  - Fix to re-enable typecast on eprobe.
---
 Documentation/trace/fprobetrace.rst |    3 +++
 Documentation/trace/kprobetrace.rst |    4 ++++
 kernel/trace/trace.c                |    2 +-
 kernel/trace/trace_probe.c          |   14 +++++++++-----
 kernel/trace/trace_probe.h          |    5 +++++
 5 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/Documentation/trace/fprobetrace.rst b/Documentation/trace/fprobetrace.rst
index b4c2ca3d02c1..7435ded2d66d 100644
--- a/Documentation/trace/fprobetrace.rst
+++ b/Documentation/trace/fprobetrace.rst
@@ -57,6 +57,9 @@ Synopsis of fprobe-events
                   (u8/u16/u32/u64/s8/s16/s32/s64), hexadecimal types
                   (x8/x16/x32/x64), "char", "string", "ustring", "symbol", "symstr"
                   and bitfield are supported.
+  (STRUCT)FIELD->MEMBER[->MEMBER] : If BTF is supported, typecast FIELD to
+                  a pointer to STRUCT and then derference the pointer defined by
+                  ->MEMBER.
 
   (\*1) This is available only when BTF is enabled.
   (\*2) only for the probe on function entry (offs == 0). Note, this argument access
diff --git a/Documentation/trace/kprobetrace.rst b/Documentation/trace/kprobetrace.rst
index 3b6791c17e9b..f73614997d52 100644
--- a/Documentation/trace/kprobetrace.rst
+++ b/Documentation/trace/kprobetrace.rst
@@ -61,6 +61,10 @@ Synopsis of kprobe_events
 		  (x8/x16/x32/x64), VFS layer common type(%pd/%pD), "char",
                   "string", "ustring", "symbol", "symstr" and bitfield are
                   supported.
+  (STRUCT)FIELD->MEMBER[->MEMBER] : If BTF is supported, typecast FIELD to
+                  a pointer to STRUCT and then derference the pointer defined by
+                  ->MEMBER. Note that this is available only when the probe is
+		   on function entry.
 
   (\*1) only for the probe on function entry (offs == 0). Note, this argument access
         is best effort, because depending on the argument type, it may be passed on
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 6eb4d3097a4d..aa93e7b01146 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -4325,7 +4325,7 @@ static const char readme_msg[] =
 #ifdef CONFIG_HAVE_FUNCTION_ARG_ACCESS_API
 	"\t           $stack<index>, $stack, $retval, $comm, $arg<N>,\n"
 #ifdef CONFIG_PROBE_EVENTS_BTF_ARGS
-	"\t           <argname>[->field[->field|.field...]],\n"
+	"\t           [(structname)]<argname>[->field[->field|.field...]],\n"
 #endif
 #else
 	"\t           $stack<index>, $stack, $retval, $comm,\n"
diff --git a/kernel/trace/trace_probe.c b/kernel/trace/trace_probe.c
index fd1caa1f9723..9158f1f22a62 100644
--- a/kernel/trace/trace_probe.c
+++ b/kernel/trace/trace_probe.c
@@ -759,7 +759,10 @@ static int parse_btf_arg(char *varname,
 	return -ENOENT;
 
 found:
-	type = btf_type_skip_modifiers(ctx->btf, tid, &tid);
+	if (ctx->struct_btf)
+		type = ctx->last_struct;
+	else
+		type = btf_type_skip_modifiers(ctx->btf, tid, &tid);
 found_type:
 	if (!type) {
 		trace_probe_log_err(ctx->offset, BAD_BTF_TID);
@@ -836,10 +839,11 @@ static int handle_typecast(char *arg, struct fetch_insn **pcode,
 	char *tmp;
 	int ret;
 
-	/* Currently this only works for eprobes */
-	if (!(ctx->flags & TPARG_FL_TEVENT)) {
-		trace_probe_log_err(ctx->offset, TYPECAST_NOT_EVENT);
-		return -EINVAL;
+	if (!(tparg_is_event_probe(ctx->flags) ||
+	      tparg_is_function_entry(ctx->flags) ||
+	      tparg_is_function_return(ctx->flags))) {
+		trace_probe_log_err(ctx->offset, NOSUP_BTFARG);
+		return -EOPNOTSUPP;
 	}
 
 	tmp = strchr(arg, ')');
diff --git a/kernel/trace/trace_probe.h b/kernel/trace/trace_probe.h
index 15758cc11fc6..883938a74aee 100644
--- a/kernel/trace/trace_probe.h
+++ b/kernel/trace/trace_probe.h
@@ -414,6 +414,11 @@ static inline bool tparg_is_function_return(unsigned int flags)
 	return (flags & TPARG_FL_LOC_MASK) == (TPARG_FL_KERNEL | TPARG_FL_RETURN);
 }
 
+static inline bool tparg_is_event_probe(unsigned int flags)
+{
+	return !!(flags & TPARG_FL_TEVENT);
+}
+
 struct traceprobe_parse_context {
 	struct trace_event_call *event;
 	/* BTF related parameters */


