Return-Path: <linux-doc+bounces-92309-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7ohOMcfTLmrL3wQAu9opvQ
	(envelope-from <linux-doc+bounces-92309-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 18:16:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C454681809
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 18:16:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=KYL0wfYW;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92309-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92309-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E412830071CD
	for <lists+linux-doc@lfdr.de>; Sun, 14 Jun 2026 16:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2B2285CA2;
	Sun, 14 Jun 2026 16:16:03 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319BB221DAE
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 16:16:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781453763; cv=none; b=O9bP+Sp0NlOK+qIjEUtCC0bs5emTrH4n59Qg2WL4cyhcNIpg66X1iuOuhTFJeOAZay6Pea7W4davb7m2Fdroi06fwn+K8MeJqB6hppFu/dG1agVG/FPLBOOHXJEjcwBjSe2g64RHnGPzJrnBOEb9vreOao0vOkZ9SMqk1H+n9a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781453763; c=relaxed/simple;
	bh=0KjrcF1RfnmDOL7RpI0DWveoukUXC94l358vI81uumY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uWrp9BoAPOtjxpOVmoxQRyKSKBLWvvkVpX/hmB4D2NlDDmkq6RYlCeWmKD6fhP9TqO2leGphsnHGypnNJZ0XHqYsy6y5bb1fbehHW/P+dpFFJauGBGspdUapsfX9Zos7Oqr3YoF5tartUBTF6w2HXHoL+rcZYT3jKyFd6hrhp8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KYL0wfYW; arc=none smtp.client-ip=95.215.58.188
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781453750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kEYJ7xP+tYTB+MoyRGzw7SP2fpUDIwAj7Q+PSGirzZk=;
	b=KYL0wfYWsGO/SQnhs8bYe00FmsSUGIDbLf2jBy8JeUE9Xqb/txgsOTJvSkHi9pkejt5U91
	YVpvoPFE2Gyy2mtZBX2O/XLOP2qqc2HHQjtId3ItB890B5UboJKaoRe/kKwVdvfuvRR9Wx
	BQtXlEbFz3MRBAnzlnDYsQFQatwYArQ=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: dave@stgolabs.net,
	jic23@kernel.org,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	vishal.l.verma@intel.com,
	ira.weiny@intel.com,
	djbw@kernel.org,
	gourry@gourry.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] cxl: docs/linux/dax-driver - fix typos
Date: Mon, 15 Jun 2026 00:14:58 +0800
Message-ID: <20260614161458.88942-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92309-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-cxl@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dave@stgolabs.net,m:jic23@kernel.org,m:dave.jiang@intel.com,m:alison.schofield@intel.com,m:vishal.l.verma@intel.com,m:ira.weiny@intel.com,m:djbw@kernel.org,m:gourry@gourry.net,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:zenghui.yu@linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[zenghui.yu@linux.dev,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zenghui.yu@linux.dev,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C454681809

Fix two obvious typos in the "kmem conversion" section.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 Documentation/driver-api/cxl/linux/dax-driver.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/cxl/linux/dax-driver.rst b/Documentation/driver-api/cxl/linux/dax-driver.rst
index 10d953a2167b..72c85a0f8606 100644
--- a/Documentation/driver-api/cxl/linux/dax-driver.rst
+++ b/Documentation/driver-api/cxl/linux/dax-driver.rst
@@ -35,9 +35,9 @@ will be exposed to the kernel page allocator in the user-selected memory
 zone.
 
 The :code:`memmap_on_memory` setting (both global and DAX device local)
-dictates where the kernell will allocate the :code:`struct folio` descriptors
+dictates where the kernel will allocate the :code:`struct folio` descriptors
 for this memory will come from.  If :code:`memmap_on_memory` is set, memory
 hotplug will set aside a portion of the memory block capacity to allocate
 folios. If unset, the memory is allocated via a normal :code:`GFP_KERNEL`
-allocation - and as a result will most likely land on the local NUM node of the
+allocation - and as a result will most likely land on the local NUMA node of the
 CPU executing the hotplug operation.
-- 
2.53.0


