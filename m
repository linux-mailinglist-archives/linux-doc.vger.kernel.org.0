Return-Path: <linux-doc+bounces-92889-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r9EJEgnuNGpdkQYAu9opvQ
	(envelope-from <linux-doc+bounces-92889-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 09:21:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AE86A44DE
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 09:21:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=Gs+sQMDs;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=IUbUgx7h;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92889-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92889-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1304B3015162
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jun 2026 07:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5144D3264C8;
	Fri, 19 Jun 2026 07:21:37 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9BA3128D7;
	Fri, 19 Jun 2026 07:21:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781853697; cv=none; b=OzZnZweiyF+mCe+CRaBEgAvUuVazOiv4UetFHUKLmzx6coJVVyCI2NhRvPYotC4qcWid7ls61Jpw6Fie1zk7+Z1yjQ0I3x4uDg648Dr6tcnU/fv7LXsdl9YjLSawi8HIGIzbK1ccO56v7oVMbCM4y6WUbi7Jma4Qk6WRe0IeJtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781853697; c=relaxed/simple;
	bh=LRepsmua+esowugaVO/r42GDSHHWMN0ZNhoR4nr53SM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SSwBbaAltnVZy5LtiG6ZaiysLNUP5jvyxRvCnuS/nPKvfnGYaDZxipnSazewIs8j28m+90gWLUqHx8RICQvU9zdvtRqNaTKVhDyu62vhP8UQBLCxDz4aZeks3iRiHRRptr8o5hPVrBmbOJ7nbrRqp5E/j3TfCx1oM3qPeMfcX1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Gs+sQMDs; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IUbUgx7h; arc=none smtp.client-ip=193.142.43.55
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781853694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vtCUvvNusLIdXtO5kPex9kafcH+VPIiosEkS/xM338w=;
	b=Gs+sQMDsl6wyKsVhHx8ajp6FZZXKqG4j9FOQuGZDih7pGwi9ebSauGS/zRVpjlOqKwVHws
	iF7/Iq42di6kMEwWXxsdhNxhU4343V2OnZTsAn4oaK63OJ0UTuZbK9VwMmznEC27DRMF5J
	qfLs0EFt/2u0lFRYeWgu3Jotg1roRHGGgK7zEcVfcd2gl15+U2EaZFySXe6pQrilTo1fit
	X3y2tyz3XYi1tbDNt6wh7+BUICEUSpu7wU5yp9IE2GdsxACrAwAXVNTFsYacxfTUwVFPBi
	Szy3aaLY7GYZA+FBxwtsb0tjPwBSZ17Wo2J4XHNG9CDoB2j+42wGQU8MvRtj5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781853694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vtCUvvNusLIdXtO5kPex9kafcH+VPIiosEkS/xM338w=;
	b=IUbUgx7hqBt5SFp3IOf+NaWbuHQK/6g7runDMOP6V6/O2ByeRlTsc0CX46kVvlOQE3dcZ1
	xfxXpbDHT/C3AeCg==
To: Gabriele Monaco <gmonaco@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v2 0/4] rv: rtapp monitor update
Date: Fri, 19 Jun 2026 09:21:18 +0200
Message-ID: <cover.1781852967.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92889-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gmonaco@redhat.com,m:rostedt@goodmis.org,m:linux-trace-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:namcao@linutronix.de,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[namcao@linutronix.de,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[namcao@linutronix.de,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:dkim,linutronix.de:mid,linutronix.de:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07AE86A44DE

A couple of minor improvements to the rtapp monitor:

  - Making the monitor more informative to user by changing the
    context of the tracepoint into the monitored task itself, not the
    IPI wakeup path.

  - and update the allow list regarding clock_nanosleep syscall.

  - Stop monitoring the kernel threads to simplify the monitors.

  - Add a new rtapp/wakeup monitor to give complement the rtapp/sleep
    monitor.

v2..v1 https://lore.kernel.org/lkml/cover.1779176466.git.namcao@linutronix.=
de/
  - Use clearer waker/wakee terminologies
  - Fix build issue
  - Add new patch "rv/rtapp/sleep: Stop monitoring kernel threads"
  - Require RV_PER_TASK_MONITORS >=3D 3

Nam Cao (4):
  rv/rtapp/sleep: Make the error more informative for user
  rv/rtapp/sleep: Update nanosleep rule
  rv/rtapp/sleep: Stop monitoring kernel threads
  rv/rtapp: Add wakeup monitor

 Documentation/trace/rv/monitor_rtapp.rst      |  61 ++++---
 kernel/trace/rv/Kconfig                       |   1 +
 kernel/trace/rv/Makefile                      |   1 +
 kernel/trace/rv/monitors/rtapp/Kconfig        |   2 +-
 kernel/trace/rv/monitors/sleep/Kconfig        |   1 -
 kernel/trace/rv/monitors/sleep/sleep.c        |  59 ++-----
 kernel/trace/rv/monitors/sleep/sleep.h        | 142 +++++++---------
 kernel/trace/rv/monitors/wakeup/Kconfig       |  16 ++
 kernel/trace/rv/monitors/wakeup/wakeup.c      | 153 ++++++++++++++++++
 kernel/trace/rv/monitors/wakeup/wakeup.h      |  92 +++++++++++
 .../trace/rv/monitors/wakeup/wakeup_trace.h   |  14 ++
 kernel/trace/rv/rv_trace.h                    |   1 +
 tools/verification/models/rtapp/sleep.ltl     |  11 +-
 tools/verification/models/rtapp/wakeup.ltl    |   5 +
 14 files changed, 396 insertions(+), 163 deletions(-)
 create mode 100644 kernel/trace/rv/monitors/wakeup/Kconfig
 create mode 100644 kernel/trace/rv/monitors/wakeup/wakeup.c
 create mode 100644 kernel/trace/rv/monitors/wakeup/wakeup.h
 create mode 100644 kernel/trace/rv/monitors/wakeup/wakeup_trace.h
 create mode 100644 tools/verification/models/rtapp/wakeup.ltl

--=20
2.47.3


