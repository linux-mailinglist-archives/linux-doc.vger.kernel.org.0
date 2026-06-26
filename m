Return-Path: <linux-doc+bounces-93711-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fzEaCuKJPmqzHgkAu9opvQ
	(envelope-from <linux-doc+bounces-93711-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 16:17:06 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 661C46CDD69
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 16:17:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=M38BsJyf;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93711-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93711-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C8FD303029D
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jun 2026 14:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F6F3F822C;
	Fri, 26 Jun 2026 14:15:01 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9901A3E559A;
	Fri, 26 Jun 2026 14:15:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782483301; cv=none; b=uWvUX1TO+EjzhARSSAW/dmvJ7Hh0pX/NAbzv0s8lQKfUUoaqmuyMHz4PYtUNfaQBvFYpnl3/tnDzQGsXlFmojvh95vV8y6BJG/uCjX5hHfD1SumaCw6QbGwixYKPaxzFxuRd8YK/pLPdWqXjO1fA+ntecuN4ZKXAGFIFP84Ubvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782483301; c=relaxed/simple;
	bh=o3fcbFp0pBvZ6VeygN5BLrM057jFH+3OjGKMeTl88Ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ISDxKjGwyZzujLmLdE2UYJWLZSzbF5heGfEW1gElXnZtcyV9fsoVO+Y/MYBPB3/BDCTx5BtqXjJxbJqYEjPfJ8LBpUbGmjYL3BE5jeuMlolmmt8Eml7Y2B6occu3d2yGzmiF0t+TObI3aURoenp2PIZtF5RBgzTsC80WuO7O8ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M38BsJyf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391FD1F000E9;
	Fri, 26 Jun 2026 14:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782483300;
	bh=IwXYV//eN/UulKrBQVQ9tKlK1h/PJvqTlVUST+nm2pU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M38BsJyfn6v6rkkQmXzdPQTsybILwhZRcOS5EBtXBah2DvRRbBrLcOmI+jm7QZDlR
	 b2qZokvKVqKrH6RV+ljOp8BJC74hu/QxwMoKGsfs781PjJAE7hDfvy0fMw2f+3nhCy
	 zUOA8TtPkFQoCMuLFRcnMKIkOnyhYKnZ1NbftqT2yHx0Eb6gnRJ4CZ30D4H/LQDUGk
	 a8CIvyQI+mhKdXGSVb95DMVoUEAfxE/e5T8SiZxnjDQ/+qC1aPiAFb3Ea6qsxb5Few
	 Z2J1jTCpbuv7e6Lu6MMT0gtAmeVwz9KhI6tHjwXqZc/NsejcWYqrcmN9I/8ZoM75mo
	 8A4lHtMeVafiw==
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
Subject: [PATCH v11 04/11] perf/probe: Ignore comment lines in dynamic_events/kprobe_events file
Date: Fri, 26 Jun 2026 23:14:56 +0900
Message-ID: <178248329591.841606.4795357924636831995.stgit@devnote2>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178248325671.841606.17344906774310339507.stgit@devnote2>
References: <178248325671.841606.17344906774310339507.stgit@devnote2>
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
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:mhiramat@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-93711-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,devnote2:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 661C46CDD69

From: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Since dynamic_events/kprobe_events files show the fetcharg debug
information as comment lines, its reader needs to ignore it.

Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 tools/perf/util/probe-file.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/util/probe-file.c b/tools/perf/util/probe-file.c
index 4032572cbf55..4d12693a83b3 100644
--- a/tools/perf/util/probe-file.c
+++ b/tools/perf/util/probe-file.c
@@ -197,6 +197,8 @@ struct strlist *probe_file__get_rawlist(int fd)
 		idx = strlen(p) - 1;
 		if (p[idx] == '\n')
 			p[idx] = '\0';
+		if (buf[0] == '#')
+			continue;
 		ret = strlist__add(sl, buf);
 		if (ret < 0) {
 			pr_debug("strlist__add failed (%d)\n", ret);


