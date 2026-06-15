Return-Path: <linux-doc+bounces-92347-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bG68N9xRL2qn+QQAu9opvQ
	(envelope-from <linux-doc+bounces-92347-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 03:14:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71028682B0A
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 03:14:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ILZEs0zt;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92347-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92347-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CFC8D30010DC
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 01:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E270221723;
	Mon, 15 Jun 2026 01:14:02 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9401D416C;
	Mon, 15 Jun 2026 01:14:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781486042; cv=none; b=m8A/ldO4olczOQOS2m6+TW1D7eHX3QN2M+oI4HLmRyrjRj/x7Qua5lgVOrc+LZb7XOwvP6GB99hd2m8DcvdNNbSEXGQIDtiBFzPguUeJ4r/jRhr99mLmsrfXHLwy3xHPpSl9qRjsDqabxYkUYBRy338z8aLFddeK+MtqXbukS5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781486042; c=relaxed/simple;
	bh=srTHieG9QuuExlHEw5TlKCwlwwWNy6V4euxanIlNlkE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=maCQ1CCPagyqbtoYRjuPbtxelOrCf+m5E8tPwR7ZGS0coTCxq5SQDS4k82XzDGudxUscIuCwcevJ5CVl1/YjdtgFztxZZeTh/ZoyRr02i0iKXONTOmo3sZZ7y/HzlQBM5jSZ/t+9e5R6YACZGbLOrCrnPrjNPx3McQlyT8qlpgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILZEs0zt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76FEF1F000E9;
	Mon, 15 Jun 2026 01:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781486040;
	bh=IMLryOOflPIA2MeylTVQIkAq8ZoOodmRc9G5qh/vtSo=;
	h=From:To:Cc:Subject:Date;
	b=ILZEs0ztlHZvIev2SkNLzROJupEOQeOpmRE5zgaZhj81x8M6nm8VN6gmNnEf7j5W0
	 dSGRJ/fMvustrl81F3W+mNPPMrV19A7u+3oaQIpRZr14L/0ewWbi4fgKvcjaqfjQ73
	 4pRMnYVoUtyRwRgLDGiaWuqM+Iyg9CQ277pss3bTKRAIr5YnEd+y7EGerb5rw2wWUO
	 5gysc0JgfKesW4e+cL8wReBkJ2+IGojgnKx7TD653lJ51cD+HEwq2qSAJfzfpDyUez
	 rh9I3lC6W4JRntDcoe55KgeKKpw+KzTGb8bMFyVRvQxstv/cuJX8z7tWujbTraQMRz
	 Y1c9zxfjK+h2A==
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
Subject: [PATCH v4 0/7] tracing/probes: Add more typecast features
Date: Mon, 15 Jun 2026 10:13:55 +0900
Message-ID: <178148603548.185520.3389196102475741865.stgit@devnote2>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
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
	TAGGED_FROM(0.00)[bounces-92347-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71028682B0A

Hi,

Here is the 4th version of series to introduce more typecast features
to probe events. The previous version is here:

 https://lore.kernel.org/all/178144880282.159464.16882854283219530040.stgit@devnote2/

In this version, I fixed some issues found by Sashiko reviews.

Steve introduced BTF typecast feature for eprobe[1].
This series extends it and add more options:

1. Expanding BTF typecast to kprobe and fprobe.
   (currently only function entry/exit)

2. Introduce container_of like typecast. This adds a "assigned
   member" option to the typecast.

   (STRUCT,MEMBER)VAR->ANOTHER_MEMBER

   This casts VAR to STRUCT type but the VAR is as the address
   of STRUCT.MEMBER. In C, it is:

   container_of(VAR, STRUCT, MEMBER)->ANOTHER_MEMBER

3. Support nested typecast, e.g.

   (STRUCT)((STRUCT2)VAR->MEMBER2)->MEMBER

   the nest level must be smaller than 3.

4. Add $current variable to point "current" task_struct.
   This is useful with typecast, e.g.

   (task_struct)$current->pid

5. per-cpu dereference support.

   Intrdouce this_cpu_read(VAR) and this_cpu_ptr(VAR) to
   access per-cpu data on the current CPU (accessing other CPU
   data is not stable, because it can be changed.)

   You can access the member of per-cpu data structure using
   typecast like:

   (STRUCT)this_cpu_ptr(VAR)->MEMBER


And added a test script to test part of them.

[1] https://lore.kernel.org/all/20260601130746.2139d926@gandalf.local.home/


---

Masami Hiramatsu (Google) (7):
      tracing/events: Fix to check the simple_tsk_fn creation
      tracing/probes: Support typecast for various probe events
      tracing/probes: Support nested typecast
      tracing/probes: Support field specifier option for typecast
      tracing/probes: Add $current variable support
      tracing/probes: Add this_cpu_read() and this_cpu_ptr() dereference method to fetcharg
      tracing/probes: Add a new testcase for BTF typecasts


 Documentation/trace/eprobetrace.rst                |    9 
 Documentation/trace/fprobetrace.rst                |   10 
 Documentation/trace/kprobetrace.rst                |   11 +
 kernel/trace/trace.c                               |    8 
 kernel/trace/trace_probe.c                         |  413 +++++++++++++++-----
 kernel/trace/trace_probe.h                         |   19 +
 kernel/trace/trace_probe_tmpl.h                    |   33 +-
 samples/trace_events/trace-events-sample.c         |   44 ++
 samples/trace_events/trace-events-sample.h         |   34 ++
 .../ftrace/test.d/dynevent/btf_probe_event.tc      |   51 ++
 .../ftrace/test.d/dynevent/fprobe_syntax_errors.tc |    9 
 .../ftrace/test.d/kprobe/kprobe_syntax_errors.tc   |    9 
 .../ftrace/test.d/kprobe/uprobe_syntax_errors.tc   |    5 
 13 files changed, 540 insertions(+), 115 deletions(-)
 create mode 100644 tools/testing/selftests/ftrace/test.d/dynevent/btf_probe_event.tc

--
Masami Hiramatsu (Google) <mhiramat@kernel.org>

