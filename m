Return-Path: <linux-doc+bounces-76541-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHyBMz4pnGl1AAQAu9opvQ
	(envelope-from <linux-doc+bounces-76541-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 11:17:34 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F10174B47
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 11:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D51793002512
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 10:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5305356A24;
	Mon, 23 Feb 2026 10:13:06 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01D63502A9;
	Mon, 23 Feb 2026 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.136.29.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841586; cv=none; b=dgiFNHwxII3Ut33l4EefEvqsLNOYUkytvb6g4svFyDCiYZ2G/bHmm/J+8s/1g+MQjdviJd/ZN/uHWKt5Gg0vXcoXtIT/YqvfVTZIiD02rhoTryzNqB80B74sgj2seX6OHtLeKob7iV/pjOPCyKRZD9uhfLc1yAD0i/A3tm+i/wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841586; c=relaxed/simple;
	bh=zwS2JvK5j6OUItPsvrHexmjPufJl4RQImGnHKAn+Ano=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FLwKewR4CkYFgDhbkrR4zmQLMPenZVYRUtblv2jcMe/VMQom/J72JDhTkM/NVcPHFjutpPScE/yVRd341Hzj25mmyRHGvk3CMSn12MD6Ax66FXdJPZBLtPyy4eVjUGwZxRgMTUBIWLA4vJXhvkxbS/Fcb3Gyr+flak5yxFieK7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com; spf=pass smtp.mailfrom=proxmox.com; arc=none smtp.client-ip=94.136.29.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id DD86347D3D;
	Mon, 23 Feb 2026 11:13:02 +0100 (CET)
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
Subject: [PATCH net-next v2] docs: net: document neigh gc_stale_time sysctl
Date: Mon, 23 Feb 2026 11:12:54 +0100
Message-ID: <20260223101257.47563-1-g.goller@proxmox.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1771841568260
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-76541-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[proxmox.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[g.goller@proxmox.com,linux-doc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,proxmox.com:mid,proxmox.com:email]
X-Rspamd-Queue-Id: 28F10174B47
X-Rspamd-Action: no action

Add missing documentation for a neighbor table garbage collector sysctl
parameter in ip-sysctl.rst:

neigh/default/gc_stale_time: controls how long an unused neighbor entry
is kept before becoming eligible for garbage collection (default: 60
seconds)

Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
---

Changelog:
v1:
 * removed documentation for gc_interval, as that sysctl is not used
   anymore and doesn't do anything.
 * mention gc_stale_time only being used when we have more than
   gc_thresh1 neighbors.

 Documentation/networking/ip-sysctl.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 28c7e4f5ecf9..85fda3759534 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -202,6 +202,17 @@ neigh/default/gc_thresh3 - INTEGER
 
 	Default: 1024
 
+neigh/default/gc_stale_time - INTEGER
+	Determines how long a neighbor entry can remain unused before it is
+	considered stale and eligible for garbage collection. Entries that have
+	not been used for longer than this time will be removed by the garbage
+	collector, unless they have active references, are marked as PERMANENT,
+	or carry the NTF_EXT_LEARNED or NTF_EXT_VALIDATED flag. Stale entries
+	are only removed by the periodic GC when there are at least gc_thresh1
+	neighbors in the table.
+
+	Default: 60 seconds
+
 neigh/default/unres_qlen_bytes - INTEGER
 	The maximum number of bytes which may be used by packets
 	queued for each	unresolved address by other network layers.
-- 
2.47.3



