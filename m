Return-Path: <linux-doc+bounces-82639-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG7jF6DP1GksxwcAu9opvQ
	(envelope-from <linux-doc+bounces-82639-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Apr 2026 11:34:24 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D513AC132
	for <lists+linux-doc@lfdr.de>; Tue, 07 Apr 2026 11:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CACA23006469
	for <lists+linux-doc@lfdr.de>; Tue,  7 Apr 2026 09:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE5A2D7BF;
	Tue,  7 Apr 2026 09:34:19 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906482F12A5;
	Tue,  7 Apr 2026 09:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554459; cv=none; b=bXWW5wLw9QI8PFRoAsK3vadLd6GA3rjEKWgUG1aDB9IJPnfhpng4oU/hOKIyNTs2/O9DL3cl530JgWAf2MVNgmSvIfKl7ad/PeSFD5TBkGpUj2gghljDOlKCB61M9Xc2DhKMX6N84I47uZkt+f6AoyLbj7MeoxLudT1V/YCvTiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554459; c=relaxed/simple;
	bh=mMVW9GDF7kXuWd71wyeuLVPf9C6h7JbhLB63rFVbHt0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y+zz6NqNzwDiS/XlbivUvnUXQVjBdr8RwZt8aHHP1FGHvlhKa1R+vmH/CG9QpzhtuMaAZelIawtpkYJFOzSd8/BWHkEGY8QkOR46JHSm+MA5VFKDlqhiCXjXhmNV4RE/8MRGCm1RskQWfInRsSKjdDKWi5+0LRbw16u4a0MWv/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: edf31f7a326411f1aa26b74ffac11d73-20260407
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:2ffba04e-a9dd-41cc-bf31-708e77f1157d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:c8f167c91b069a1979d943a63c2a7a95,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|123|850|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: edf31f7a326411f1aa26b74ffac11d73-20260407
X-User: fangqiurong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fangqiurong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1877109688; Tue, 07 Apr 2026 17:34:09 +0800
From: fangqiurong@kylinos.cn
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: tj@kernel.org,
	corbet@lwn.net
Subject: [PATCH] sched_ext: Documentation: Fix scx_bpf_move_to_local kfunc name
Date: Tue,  7 Apr 2026 17:34:05 +0800
Message-Id: <20260407093405.2573184-1-fangqiurong@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-82639-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[fangqiurong@kylinos.cn,linux-doc@vger.kernel.org];
	DMARC_NA(0.00)[kylinos.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NO_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.897];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,kylinos.com:email]
X-Rspamd-Queue-Id: D4D513AC132
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: fangqiurong <fangqiurong@kylinos.com>

The correct kfunc name is scx_bpf_dsq_move_to_local(), not
scx_bpf_move_to_local(). Fix the two references in the
Scheduling Cycle section.

Signed-off-by: fangqiurong <fangqiurong@kylinos.cn>
---
 Documentation/scheduler/sched-ext.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/scheduler/sched-ext.rst b/Documentation/scheduler/sched-ext.rst
index d74c2c2b9ef3..b106ccf7a0b8 100644
--- a/Documentation/scheduler/sched-ext.rst
+++ b/Documentation/scheduler/sched-ext.rst
@@ -264,9 +264,9 @@ The following briefly shows how a waking task is scheduled and executed.
      rather than performing them immediately. There can be up to
      ``ops.dispatch_max_batch`` pending tasks.
 
-   * ``scx_bpf_move_to_local()`` moves a task from the specified non-local
+   * ``scx_bpf_dsq_move_to_local()`` moves a task from the specified non-local
      DSQ to the dispatching DSQ. This function cannot be called with any BPF
-     locks held. ``scx_bpf_move_to_local()`` flushes the pending insertions
+     locks held. ``scx_bpf_dsq_move_to_local()`` flushes the pending insertions
      tasks before trying to move from the specified DSQ.
 
 4. After ``ops.dispatch()`` returns, if there are tasks in the local DSQ,
-- 
2.25.1


