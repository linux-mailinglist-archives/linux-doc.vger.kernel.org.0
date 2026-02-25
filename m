Return-Path: <linux-doc+bounces-77002-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NTtEDLInmkuXQQAu9opvQ
	(envelope-from <linux-doc+bounces-77002-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Feb 2026 11:00:18 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C12195692
	for <lists+linux-doc@lfdr.de>; Wed, 25 Feb 2026 11:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC906302880C
	for <lists+linux-doc@lfdr.de>; Wed, 25 Feb 2026 09:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E9D38F924;
	Wed, 25 Feb 2026 09:58:39 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6337D3242D8;
	Wed, 25 Feb 2026 09:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.136.29.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772013519; cv=none; b=VoqrxirxMYwM6PgRqUy7WX2z+9yICBPdoWGMzvbQGXot4ZNnunz9OIFpHN54kZIJ1sK3izNMtYn58Oq4HtzpwcO12HidA/0cz7HRJYhDRh6Q5ug/Ye8A8XzZwhrjfP7ZleHFA6lims0g2tu5l0mny9J3s7pJkn6UODXE7sK/UoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772013519; c=relaxed/simple;
	bh=xBH62Z1LMF0U5LLL/D1+BAGVaRAy1YDVP5FPbMvG+XM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A+zS2Qp9ZPreDRrWJgefSNBAfEpVeqi1PVwxULWTtrc+H640+yjvk/NtwoRTCsfljTSAn+sAlzq05C2yRC4GJP6X+VndSU83dpbF83t9jxXw8GXQr1oG2AReY/S3mhordbOPQqn/P7bTA1gETKuKENZ3sGt9/HK0kex5AeEO7Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com; spf=pass smtp.mailfrom=proxmox.com; arc=none smtp.client-ip=94.136.29.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 2F26F48796;
	Wed, 25 Feb 2026 10:58:28 +0100 (CET)
From: Gabriel Goller <g.goller@proxmox.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] docs: net: document neigh gc_interval sysctl
Date: Wed, 25 Feb 2026 10:58:10 +0100
Message-ID: <20260225095822.44050-1-g.goller@proxmox.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1772013491051
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-77002-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[proxmox.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[g.goller@proxmox.com,linux-doc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,proxmox.com:mid,proxmox.com:email]
X-Rspamd-Queue-Id: 53C12195692
X-Rspamd-Action: no action

Add entry for the neigh/default/gc_interval sysctl. This sysctl is
unused since kernel v2.6.8.

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
---
 Documentation/networking/ip-sysctl.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index d1eeb5323af0..265158534cda 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -202,6 +202,13 @@ neigh/default/gc_thresh3 - INTEGER
 
 	Default: 1024
 
+neigh/default/gc_interval - INTEGER
+	Specifies how often the garbage collector for neighbor entries
+	should run. This value applies to the entire table, not
+	individual entries. Unused since kernel v2.6.8.
+
+	Default: 30 seconds
+
 neigh/default/gc_stale_time - INTEGER
 	Determines how long a neighbor entry can remain unused before it is
 	considered stale and eligible for garbage collection. Entries that have
-- 
2.47.3



