Return-Path: <linux-doc+bounces-91763-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BpgUIZ21KGqNIQMAu9opvQ
	(envelope-from <linux-doc+bounces-91763-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 02:53:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D66606650A5
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 02:53:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Kh29NEbW;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91763-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91763-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ED303062F63
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 00:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4972A1E5201;
	Wed, 10 Jun 2026 00:51:27 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC0317A305;
	Wed, 10 Jun 2026 00:51:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781052687; cv=none; b=VeLPNFEOPQqXcXmQR9eHftovLc2AcfmEtM4TBNCzh+fOfU65A4fKSw4QnHJoB9Ux+tqMONzSV1yOklIAE9TNTfl9HKUojOB3oWJPDGOxdNONkV7KO4RBbETRmEtOChY/T76WhNOroXDPVtbRWT4eshTEWdc7vUX+kEWUcR5mqE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781052687; c=relaxed/simple;
	bh=hHSweqaoPPOWP//CiRXcgp6ysK37O1r6QEAl6tA6cSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gddaDY3ePmUwINdZILnNKwuGuvuH2PUF4IIWLPB5gWn3wuN9k+MMW6ZjXlwDVbBXCnsyHOAWJpfumwJr7v9RIuASufb235lYx4v9fmkuAryp5RRrc9+uHLKMqR/yNHa30llxhaB28MsMQQaIKliOGkjYy0NB/BvvEVVFaCL3KYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kh29NEbW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14041F00893;
	Wed, 10 Jun 2026 00:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781052685;
	bh=AknOC9ftrQ9npWsX4G287ronaobFlPP7dg7D/271fCg=;
	h=From:To:Cc:Subject:Date;
	b=Kh29NEbWMMf5Dwxam8iyR8o0632/X5Fn4bfelwOtb9BkK11MH65DqlmD0pqOmMqmF
	 PZSo+WesGN+gUdNj6PQ5kwR347apZtnzxRJqiDChzymX97AIfxbbdsKVAkV6tjFUts
	 eccMq3EBPzzvaiLzw1GWYOpA1Qxopto93ZvaUoEb7rgQ9WIeCT44heH9pxv88JuLFF
	 lBUcFJudrS3jIJp1gll1aVlEDwESrUhRQic2HW5hFghoC7zZFihXboBIvlHu3tq9S0
	 uUvXdQm8NaMjWpEV1rFEmx0cZLfOxK97OEwzN60rHaZ0tkbAMyPilMdpJ/2kONOSyw
	 jHbusxyGvOtaw==
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
Subject: [RFC PATCH v2 0/7] tracing/probes: Add more typecast features
Date: Wed, 10 Jun 2026 09:51:21 +0900
Message-ID: <178105268094.21760.13668249930524377840.stgit@devnote2>
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
	TAGGED_FROM(0.00)[bounces-91763-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[devnote2:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D66606650A5

Hi,

Here is the 2nd version of series to introduce more typecast features
to probe events. The previous version is here:

 https://lore.kernel.org/all/178092865666.163648.10457567771536160909.stgit@devnote2/

In this version, I fixed various problems Sashiko reviewed and add
a fix of sample code. Also drop +CPU/PCPU() and introduce this_cpu_read().


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


 Documentation/trace/eprobetrace.rst                |   10 
 Documentation/trace/fprobetrace.rst                |   10 
 Documentation/trace/kprobetrace.rst                |   11 +
 kernel/trace/trace.c                               |    6 
 kernel/trace/trace_probe.c                         |  404 +++++++++++++++-----
 kernel/trace/trace_probe.h                         |   18 +
 kernel/trace/trace_probe_tmpl.h                    |   33 +-
 samples/trace_events/trace-events-sample.c         |   56 ++-
 samples/trace_events/trace-events-sample.h         |   34 ++
 .../ftrace/test.d/dynevent/btf_probe_event.tc      |   51 +++
 10 files changed, 509 insertions(+), 124 deletions(-)
 create mode 100644 tools/testing/selftests/ftrace/test.d/dynevent/btf_probe_event.tc

--
Masami Hiramatsu (Google) <mhiramat@kernel.org>

