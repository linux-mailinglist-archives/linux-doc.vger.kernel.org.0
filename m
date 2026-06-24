Return-Path: <linux-doc+bounces-93387-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gVE3MKrtO2oXfggAu9opvQ
	(envelope-from <linux-doc+bounces-93387-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 16:46:02 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3176BF461
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 16:46:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EdTWVojq;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93387-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93387-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C5BE30E44BF
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 14:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0033CA48E;
	Wed, 24 Jun 2026 14:41:44 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3D13CAA53;
	Wed, 24 Jun 2026 14:41:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782312104; cv=none; b=fPXl3JNYDgoQUO0E3Jiy02hlMznAyrTThBR+bxnoSS2wu0qmXUrgwoCL0Rd8jh5G6qs1IGT8dnEbTWdal37lPc/X4zzuTEnA1p/xOhVBxqJkCPNGE2mc8tEHdsRrDHn+oOT20mlz4+ghgWm2IqKdY/DoAu2pZSzxfFXmfbzNBw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782312104; c=relaxed/simple;
	bh=wOy8eDPln65eIcStjYY3DBmrVz/uGPPTFR9tQLjhrDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XflUcwF4Tl08QowmzQ3LAMw3Hkj6s0YLPyZBZ49yiuJXRWAhcLXV4bRuwe5jO+SHwrOQGN6K+uT28tyWcgrmMT7M+A06nlqda+kUckehtLXfdHkp6CyE9Uaa6c1nb4zmv3P+1kBtIigsy4crzRc8BGHXsbknWAI4rrV1/ENY5y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdTWVojq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2011F000E9;
	Wed, 24 Jun 2026 14:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782312101;
	bh=/qoVN2xxrOkXbxj9Sc51IAOlcEYiH3we051lIIsBY5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EdTWVojqBxwLnm69yqvhZSpXGyvAVF6i5lHHRFmwq6Gi1eyqX56f9Y8A+kLLlERN+
	 IatTtzwfrVxouWianqm6N2ICab2P2pv3evgNB5xpVgvfdHERrLF5k3U2QzAhFJfjQU
	 o5Yh+JjUwoR8/mh6sQC4N/DpsiIWosR/f2PopBCNRIBK3NrQbJ+co/DwvLwiZrtxW1
	 wbv+ik3f25nLh9CjGW2J+Ff/WkUYfa10/steZUne3ycb4LXj+u0YjMqHZDmaYJxLYF
	 FRwNjJ4iQpzmyUYCArybCnlYXeBTXV0J+6ADmrULQlw7oxH9jcY0FH3gzI5pKsr8wT
	 Ye8ir/8V8OEsA==
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
Subject: [PATCH v8 01/10] tracing/probes: Make the $ prefix mandatory for comm access
Date: Wed, 24 Jun 2026 23:41:37 +0900
Message-ID: <178231209724.732967.12049805699091810641.stgit@devnote2>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178231208703.732967.1160700962651040729.stgit@devnote2>
References: <178231208703.732967.1160700962651040729.stgit@devnote2>
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
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_HAS_CURRENCY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:mhiramat@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-93387-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,devnote2:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B3176BF461

From: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Since $comm or $COMM are not event field but special fetcharg
variables to access current->comm, It should not be accessed
without '$' prefix even with typecast.

Fixes: 69efd863a785 ("tracing/eprobes: Allow use of BTF names to dereference pointers")
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 Changes in v8:
  - Newly added.
---
 kernel/trace/trace_probe.c |   12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/trace_probe.c b/kernel/trace/trace_probe.c
index c10bbb0df7b9..0da7c0b53ba7 100644
--- a/kernel/trace/trace_probe.c
+++ b/kernel/trace/trace_probe.c
@@ -342,10 +342,6 @@ static int parse_trace_event(char *arg, struct fetch_insn *code,
 	ret = parse_trace_event_arg(arg, code, ctx);
 	if (!ret)
 		return 0;
-	if (strcmp(arg, "comm") == 0 || strcmp(arg, "COMM") == 0) {
-		code->op = FETCH_OP_COMM;
-		return 0;
-	}
 	return -EINVAL;
 }
 
@@ -1065,8 +1061,14 @@ static int parse_probe_vars(char *orig_arg, const struct fetch_type *t,
 	int len;
 
 	if (ctx->flags & TPARG_FL_TEVENT) {
-		if (parse_trace_event(arg, code, ctx) < 0)
+		if (parse_trace_event(arg, code, ctx) < 0) {
+			/* 'comm' should be checked after field parsing. */
+			if (strcmp(arg, "comm") == 0 || strcmp(arg, "COMM") == 0) {
+				code->op = FETCH_OP_COMM;
+				return 0;
+			}
 			goto inval;
+		}
 		return 0;
 	}
 


