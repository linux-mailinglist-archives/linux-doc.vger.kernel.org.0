Return-Path: <linux-doc+bounces-95336-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jYfUHerLTGqLpwEAu9opvQ
	(envelope-from <linux-doc+bounces-95336-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 11:50:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BF0719F67
	for <lists+linux-doc@lfdr.de>; Tue, 07 Jul 2026 11:50:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95336-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95336-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 539D430AB738
	for <lists+linux-doc@lfdr.de>; Tue,  7 Jul 2026 09:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44D13D6690;
	Tue,  7 Jul 2026 09:45:50 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AA03D525F;
	Tue,  7 Jul 2026 09:45:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783417550; cv=none; b=Qugc2nARH3J/YrSRY50A+v9Vs2sC+f1edIzt64wPZ2QM53InoZChFCH9iaNClVtYu1brqtfHh7E0zrFkO+L20RQNGj6it5JNWNPMLrzBylFHpL07X7IOObnFRj9FM8HWE/Ptxr5L1rS6La/V04gv94aXcGbBKruN/h0+wbMBtiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783417550; c=relaxed/simple;
	bh=vPiZ9O9MpD6iISIXOvLhlhqtkDIuhpgFIFdHlmb80Bg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=khU+tFdXIEnz/aT9hirZi6kqZWrRF4soj/o6rj/1tor9dDbn5SPyyW14rFa+PCERXBdGZGZUeYIYK1TC4qGZSOjKEaqO51rPLuA/ciISdlD9TATIHlX5FunrDPe0kZlUxaN9DRKxFMpawttvX8ZPg1eYMdDDzbP4uIqddxc1aq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
X-UUID: 9f0b01ea79e811f1aa26b74ffac11d73-20260707
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b2e96b49-6547-4be8-9b65-652b0a9f4a36,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:f3f7bb9b376452512748743dd6a179ce,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|123|136|850|865|898,TC:nil,Content:0
	|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9f0b01ea79e811f1aa26b74ffac11d73-20260707
X-User: luoliang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <luoliang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2050030750; Tue, 07 Jul 2026 17:45:43 +0800
From: luoliang@kylinos.cn
To: Tejun Heo <tj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrea Righi <arighi@nvidia.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liang Luo <luoliang@kylinos.cn>
Subject: [PATCH] sched_ext: Documentation: Fix ops table header reference
Date: Tue,  7 Jul 2026 17:45:38 +0800
Message-Id: <20260707094538.3033292-1-luoliang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95336-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[kylinos.cn];
	FORGED_RECIPIENTS(0.00)[m:tj@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:arighi@nvidia.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luoliang@kylinos.cn,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[luoliang@kylinos.cn,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luoliang@kylinos.cn,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kylinos.cn:from_mime,kylinos.cn:email,kylinos.cn:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0BF0719F67

From: Liang Luo <luoliang@kylinos.cn>

The "Where to Look" and "ABI Instability" sections state that the ops
table is defined in include/linux/sched/ext.h. However, struct
sched_ext_ops is actually defined in kernel/sched/ext/internal.h, along
with the SCX_OPS_* flags; include/linux/sched/ext.h holds the core data
structures (struct sched_ext_entity, struct scx_dispatch_q, ...) and the
DSQ constants. Point the ops table references to the correct header.

Signed-off-by: Liang Luo <luoliang@kylinos.cn>
---
 Documentation/scheduler/sched-ext.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/scheduler/sched-ext.rst b/Documentation/scheduler/sched-ext.rst
index 4b1ffd03f516..2771ea4cc14a 100644
--- a/Documentation/scheduler/sched-ext.rst
+++ b/Documentation/scheduler/sched-ext.rst
@@ -493,8 +493,9 @@ a freshly woken up task gets on a CPU.
 Where to Look
 =============
 
-* ``include/linux/sched/ext.h`` defines the core data structures, ops table
-  and constants.
+* ``include/linux/sched/ext.h`` defines the core data structures and
+  constants, while the ops table (``struct sched_ext_ops``) is defined in
+  ``kernel/sched/ext/internal.h``.
 
 * ``kernel/sched/ext/ext.c`` contains sched_ext core implementation and helpers.
   The functions prefixed with ``scx_bpf_`` can be called from the BPF
@@ -555,7 +556,8 @@ ABI Instability
 ===============
 
 The APIs provided by sched_ext to BPF schedulers programs have no stability
-guarantees. This includes the ops table callbacks and constants defined in
+guarantees. This includes the ops table callbacks defined in
+``kernel/sched/ext/internal.h`` and the constants defined in
 ``include/linux/sched/ext.h``, as well as the ``scx_bpf_`` kfuncs defined in
 ``kernel/sched/ext/ext.c`` and ``kernel/sched/ext/idle.c``.
 
-- 
2.43.0


