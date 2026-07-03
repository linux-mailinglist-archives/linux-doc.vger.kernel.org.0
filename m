Return-Path: <linux-doc+bounces-94757-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QupeAJ5yR2p2YQAAu9opvQ
	(envelope-from <linux-doc+bounces-94757-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 10:28:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B42D7000C8
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 10:28:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=utwQtHIg;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=NhmnZYGG;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94757-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94757-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FD8F3147F1E
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 08:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FD037104C;
	Fri,  3 Jul 2026 08:11:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DBE433E7C;
	Fri,  3 Jul 2026 08:11:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066288; cv=none; b=pqhSe6s3QbC9+BE/Vf3EGK0mSPKHGHAiqKSvLLlRFrVbAa872RKFMJmvViWWfce+/fSaA8GVcmSUuadHkAVuziDzZsTMaJUiE6/c2P8UZzJILRcgH3m5zdOwoV6FapptxlxzaxdXV/aKYHz/kxZgdo3bHk5vfH3syXd2UBr2I+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066288; c=relaxed/simple;
	bh=zLx7l5kx04C6KeXdlbIoe+uCZNDrRGzA+phbSWIPNQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gSQLxvBB+lTTrludEz2fdZHiTAQE5wFgF25pJqCoqt0kFtmPJaSy+V8aIA/j1IuAilgnlZmqPZoSR8QKe5fxrqv1fx4v2GLhL3Vps8yeADT3va2TjyWzShADPSK1oHPgdyggY2sbJrQRn18mGA6+RBlFpVujId7RYaSqbGQujb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=utwQtHIg; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NhmnZYGG; arc=none smtp.client-ip=80.241.56.172
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gs60D0SGfz9tZF;
	Fri,  3 Jul 2026 10:11:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783066284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q6tfuCZZi4Yr0K9wDrm5AhdIyW9zDxXqPlusCRAtMWY=;
	b=utwQtHIgiyNgTyulXeCuSBy27Sjir1YOaEKwvGR52iwV5ndLaznZxE7yzZs+lESUldeq1y
	xRLX+SmodYsRfdtOwGgsRehy6l1uiQXZmRKYZWAtAP6qcVk9xp60cH0xlxk1gcx3rXRFqW
	hEI7h4tjQnq3DbSB9hELkxkjAdwWg6k5e+3nIxeVslJaCV2AWPdDU+U5Mg9wE4WqFtiy+Y
	USrfml0baAQwzRUE+6TxefSq1Fbzp7SQl827OC5VCzYe1y8sTeW4zx0MNndi4GL6KhcChH
	NEIUvQ6fMa3em+2+I0RCK1I7EaGhpRlYQSc0U5Q4aby4iz+bCs31Qp6U9d4+FQ==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783066282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q6tfuCZZi4Yr0K9wDrm5AhdIyW9zDxXqPlusCRAtMWY=;
	b=NhmnZYGGpRw/uhE2ToT6OITW7/68XEKGtgoLn6+nrWwM7DeDdzQ/ThyR60bTnG2cnietTh
	96yxCsUSCanVbam/6S9mZMi4mZV0BaHNeJcYN5hJfzJebVZR+XDj+o3T79huCz2YquZgHP
	WPDksE3Y1H5bpncf7NNsQB2bqxhUiHuFE/vtoYYWhhpdl3U0K40Aid2hKvdzLKPC5pQv2M
	lqkXk/TJ5v/ReQx3hs/SoFiZNYhV51NuvYEN6hZ4Fnb0dmfCo3Z00at2Wwh5ztP7FEUR6x
	K1KXHAjYWO9zZVh4ZwnW975KGVMYC8tKwSW4JgILNXXEkPRtAxRP6KbE5j4qVQ==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Kernel Janitors <kernel-janitors@vger.kernel.org>,
	Manuel Ebner <manuelebner@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation/kernel-parameters: fix brackets
Date: Fri,  3 Jul 2026 10:08:06 +0200
Message-ID: <20260703080806.223782-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: rbidibxtzmfnrut3p8essby8txxkahzz
X-MBO-RS-ID: 3dcec43993f7fb0df76
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94757-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:rdunlap@infradead.org,m:kernel-janitors@vger.kernel.org,m:manuelebner@mailbox.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B42D7000C8

Add a few missing ']'s and a ')'.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f22..60777968a063 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6413,9 +6413,9 @@ Kernel parameters
 	reboot=		[KNL]
 			Format (x86 or x86_64):
 				[w[arm] | c[old] | h[ard] | s[oft] | g[pio]] | d[efault] \
-				[[,]s[mp]#### \
+				[[,]s[mp]]#### \
 				[[,]b[ios] | a[cpi] | k[bd] | t[riple] | e[fi] | p[ci]] \
-				[[,]f[orce]
+				[[,]f[orce]]
 			Where reboot_mode is one of warm (soft) or cold (hard) or gpio
 					(prefix with 'panic_' to set mode for panic
 					reboot only),
@@ -6875,7 +6875,7 @@ Kernel parameters
 			xtime_lock contention on larger systems, and/or RCU lock
 			contention on all systems with CONFIG_MAXSMP set.
 			Format: { "0" | "1" }
-			0 -- disable. (may be 1 via CONFIG_CMDLINE="skew_tick=1"
+			0 -- disable. (may be 1 via CONFIG_CMDLINE="skew_tick=1")
 			1 -- enable.
 			Note: increases power consumption, thus should only be
 			enabled if running jitter sensitive (HPC/RT) workloads.
@@ -6916,7 +6916,7 @@ Kernel parameters
 			apic=verbose is specified.
 			Example: apic=debug show_lapic=all
 
-	slab_debug[=options[,slabs][;[options[,slabs]]...]	[MM]
+	slab_debug[=options[,slabs][;[options[,slabs]]...]]	[MM]
 			Enabling slab_debug allows one to determine the
 			culprit if slab objects become corrupted. Enabling
 			slab_debug can create guard zones around objects and
-- 
2.54.0


