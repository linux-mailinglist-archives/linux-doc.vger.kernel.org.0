Return-Path: <linux-doc+bounces-78149-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP53HNCtqmluVQEAu9opvQ
	(envelope-from <linux-doc+bounces-78149-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 11:34:56 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E911B21ED4F
	for <lists+linux-doc@lfdr.de>; Fri, 06 Mar 2026 11:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CBC33065F25
	for <lists+linux-doc@lfdr.de>; Fri,  6 Mar 2026 10:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FD0146D5A;
	Fri,  6 Mar 2026 10:31:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388D333E37B;
	Fri,  6 Mar 2026 10:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793077; cv=none; b=emBdsgs30RuslE71o0n4A+m4cobp3ATZlh+syN32LrjUkmO31L0K5u5G7NHJl4TNnBMgK2PXi2YshL44cBL7Bdy2sFfjlvBNSVAyp5mUTerTMq5iEFCDO+OxIdwxHt6OkjJt5Uj6/osD3EbnjYFXQ6gJb2Hro9v+TsUpLo41+7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793077; c=relaxed/simple;
	bh=kw2XtYZN3Kr84aIBUsDMUgvLsYNsSuOOpGAKDmubLBU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CWYarJECCgxLFA2uiDUh6Dj0I1Ao9Sf4gjbFIXJt2XNZG0Q83lqeSg+If/YI5rLSknQu9/wysxMeqZ8MStgaFXwveKBrZ9xCF69RQTUvGAmWHgNmuKMK6Z2mQ+LoF1JaOETcjO2A9t5WAmGhrJ48el62ZLVHvfx1jUSFGUMVCVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15A30497;
	Fri,  6 Mar 2026 02:31:09 -0800 (PST)
Received: from e127648.cambridge.arm.com (e127648.arm.com [10.1.27.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1764A3F694;
	Fri,  6 Mar 2026 02:31:13 -0800 (PST)
From: Christian Loehle <christian.loehle@arm.com>
To: tj@kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org
Cc: arighi@nvidia.com,
	linux-doc@vger.kernel.org,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH] sched_ext: Documentation: Mention scheduling class precedence
Date: Fri,  6 Mar 2026 10:30:51 +0000
Message-Id: <20260306103051.1038604-1-christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E911B21ED4F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-78149-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.loehle@arm.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-doc];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Mention the scheduling class precedence of fair and sched_ext to
clear up how sched_ext partial mode works.

Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 Documentation/scheduler/sched-ext.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/scheduler/sched-ext.rst b/Documentation/scheduler/sched-ext.rst
index 9e2882d937b4..100d45963781 100644
--- a/Documentation/scheduler/sched-ext.rst
+++ b/Documentation/scheduler/sched-ext.rst
@@ -58,7 +58,8 @@ in ``ops->flags``, all ``SCHED_NORMAL``, ``SCHED_BATCH``, ``SCHED_IDLE``, and
 However, when the BPF scheduler is loaded and ``SCX_OPS_SWITCH_PARTIAL`` is
 set in ``ops->flags``, only tasks with the ``SCHED_EXT`` policy are scheduled
 by sched_ext, while tasks with ``SCHED_NORMAL``, ``SCHED_BATCH`` and
-``SCHED_IDLE`` policies are scheduled by the fair-class scheduler.
+``SCHED_IDLE`` policies are scheduled by the fair-class scheduler which has
+higher sched_class precedence than ``SCHED_EXT``.
 
 Terminating the sched_ext scheduler program, triggering `SysRq-S`, or
 detection of any internal error including stalled runnable tasks aborts the
-- 
2.34.1


