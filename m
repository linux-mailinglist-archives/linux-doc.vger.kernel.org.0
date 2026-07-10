Return-Path: <linux-doc+bounces-96280-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t2pOIHAJUWpc+QIAu9opvQ
	(envelope-from <linux-doc+bounces-96280-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 17:02:08 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D82C73C050
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 17:02:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=UCvB8fsI;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=i3qdUi3R;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96280-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96280-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5405C30459DD
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 14:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8D34307A8;
	Fri, 10 Jul 2026 14:46:13 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5741F42F6F2;
	Fri, 10 Jul 2026 14:46:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694773; cv=none; b=enQ9hT9FnH4niSletZiZ2kaTIvoa/6J5kXzN3lu87pUoUUn5xEPxTBvKlCSvdtK3XOUpIjj8qNaFgGfpRny6RgCipT2ILA2QSlXSrlY3FjQcHRSspD55sHvHG1nIZlkGnPiYCMEMpqnHgS3/65IpuJ5BXEt/btj0WAbzKEv3WDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694773; c=relaxed/simple;
	bh=elAE6D5Z++pEyg1DyynZG9mJNbmNvM6lzkncroj9yek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GHJl6Jz6EQ9qnlNsbXUa1eXxYmD13t7BmicWV6qV7KJJBjxYtL9eW8QVQ/2TVehyvZDD0nGM1HCAbZfOP1OGeYRABDYuh+q36EwLqv/GasWrtHCp5Qmv2gylLXVtYEELJ5JNrcRyGZl82nJRrIe57RUL4aJBBLK/DHAxlwjhET4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UCvB8fsI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=i3qdUi3R; arc=none smtp.client-ip=193.142.43.55
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783694770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cNxbM391+Qm3cGBLaONG5xv7fKBiXEdYVvGFwCkYBdE=;
	b=UCvB8fsIfRz7eQbjSvm6R9nnSsi87XOTbOFr0pgLS61IhnuME60Icy4fA1BuCN0xuA/3Q0
	pzVTHNMU8hiZsJ7Wdi5x/4WhxuqIGHLpM1L40/8sCUTP4lKc5BJjc7mRpOT5dZC6oEebDH
	cWee3AYJcwW2Y8mrdA1sJHTQib6RP2Hc6b3+U7lzpzqBs3q7c2Pzi2xN+HvFwAXTOUjzxo
	jqNlg4TavjdQRSzdTOl8JpsOVOvQMMyuYT43cCjYZyqooX5MeIHh4Bp31pCZJeMTk8uMpp
	6JSB/OZUB1fHeviN1x1E1bK+jE2A2gb0e+LBH2JOvUKkBpIya9O1Ln6fsamM1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783694770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cNxbM391+Qm3cGBLaONG5xv7fKBiXEdYVvGFwCkYBdE=;
	b=i3qdUi3RLz8QnJDBe0cnUZKhqk+V4oSoxswgo7rphDJqxbGp8JJCmgscnz+QUO3rHyA4Ys
	+5/Fb4y4A2bMAzCg==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Murray <amurray@thegoodpenguin.co.uk>,
	Chris Down <chris@chrisdown.name>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fsdevel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH printk 0/3] Introduce sync mode
Date: Fri, 10 Jul 2026 16:51:50 +0206
Message-ID: <20260710144609.194487-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96280-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[john.ogness@linutronix.de,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pmladek@suse.com,m:senozhatsky@chromium.org,m:rostedt@goodmis.org,m:amurray@thegoodpenguin.co.uk,m:chris@chrisdown.name,m:linux-kernel@vger.kernel.org,m:gregkh@linuxfoundation.org,m:linux-fsdevel@vger.kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.ogness@linutronix.de,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D82C73C050

Hi,

As proposed in an LKML thread [0], here is a series to introduce a
new console feature to use synchronous printing. The feature is
activated using the keyword "sync" in the console= command line
argument. For example:

   console=ttyS0,115200,sync

Sync mode is only available for nbcon consoles that provide a
safe write_atomic() callback. Specifying it for other consoles
will have no effect other than a log entry that sync mode is not
supported.

Patch 3/3 shamelessly copied an implementation from Chris Down
to parse and update the console options. (Chris's version of 
find_and_remove_console_option() is here [1]). I slightly extended
the function to support valueless-options.

At some point we may want to add a sysfs interface to toggle sync
mode.

John Ogness

[0] https://lore.kernel.org/lkml/87v7aruub1.fsf@jogness.linutronix.de
[1] https://lore.kernel.org/lkml/77aa59337507e067f3a4ad7e15375893612bcfa3.1763492585.git.chris@chrisdown.name

John Ogness (3):
  printk: Introduce console sync mode
  proc: Add console sync support for /proc/consoles
  printk: Support setting console sync mode via console=

 Documentation/admin-guide/serial-console.rst |   8 ++
 fs/proc/consoles.c                           |   1 +
 include/linux/console.h                      |   2 +
 kernel/printk/console_cmdline.h              |   1 +
 kernel/printk/internal.h                     |   2 +
 kernel/printk/nbcon.c                        |  42 ++++++--
 kernel/printk/printk.c                       | 104 +++++++++++++++++++
 7 files changed, 154 insertions(+), 6 deletions(-)


base-commit: 080d60fffa8e0d285871cde8395438006a9b5b0c
-- 
2.47.3


