Return-Path: <linux-doc+bounces-81311-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEitH6PlxGnz4gQAu9opvQ
	(envelope-from <linux-doc+bounces-81311-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2026 08:52:03 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D34C330A64
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2026 08:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12D1D3064F35
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2026 07:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8E534E767;
	Thu, 26 Mar 2026 07:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b="W4DuWM7x"
X-Original-To: linux-doc@vger.kernel.org
Received: from outbound.baidu.com (jpmx.baidu.com [119.63.196.201])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 72CA13B27D8;
	Thu, 26 Mar 2026 07:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=119.63.196.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511257; cv=none; b=tN1jMRGxsW92Eritdox/L+vH6cdJyAzvSdhoSolLoU0kzgfqUTtwEgOvkqqE2gLxiS9P7KERPq7nNJFGLlwEvD+hKQ4NIE/diOVRDuF7SuqCSlGqKXDgQuyAYmraEu9pHWM28l8kt1v+ab0gVvwK8zYUHewD/xNCOKZZhM4EpcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511257; c=relaxed/simple;
	bh=dJLQUXgrA2cZRFPoqmZ8NqvxPoPonBr5Y5UDrfu0QVI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TOHSsgyW6igHYwgWrvMy5mLnNubzhXwnf1hatUGbGVv6l2E0J6/5884a/HuB6/bRkHLZN83ZgKzLs4SF1AoRxsb5j+2J9DvbNbRWwwRI8cNPzxdMpIVE1BFq02B02aOZ7F4Do7Ky+SYbv/vk7aL23pM4jPYAo1PYNl6QM92CchY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b=W4DuWM7x; arc=none smtp.client-ip=119.63.196.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: lirongqing <lirongqing@baidu.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>,
	Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
	Feng Tang <feng.tang@linux.alibaba.com>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>, Li RongQing
	<lirongqing@baidu.com>, "Paul E . McKenney" <paulmck@kernel.org>, Askar Safin
	<safinaskar@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Sohil Mehta
	<sohil.mehta@intel.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] docs: kernel-parameters: fix architecture alignment for pt, nopt, and nobypass
Date: Thu, 26 Mar 2026 03:46:58 -0400
Message-ID: <20260326074658.1899-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: bjhj-exc11.internal.baidu.com (172.31.3.21) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1774511242;
	bh=0qlIez7CHyooxGukv9QKRh8T9+O2lgqml6ysSIP4kks=;
	h=From:To:Subject:Date:Message-ID:Content-Type;
	b=W4DuWM7xJkofK4gXK29QTLVFsXg5ksAavQ/+D2JL3z7hd+jwWfvOVaWul9RBr0NM0
	 YZSh6THa9LSt1Z5kOKucGdmFA3K8kZ8O0U3qH7SYLgQjBmNOXCcHROSSDuM10a/7Xm
	 QMfYvXDNk1FfZd+MxLRhkaTC6W3cBo50CGoi6bjrQDU3/eJCpE5CP5PKMW6Y9kL8wT
	 K1lp9EL9/NVlnIidxj8/NXzsAjvvlfssva6OoGNJx63wjJTGw9W6NqkQFBHAoKqD9v
	 2rOAIq/ZplJwPTRh9TEd0fKD0gyAx0EFjaFBjmy0G4LIOubM+8wE70X19FdfaT8atl
	 L4914HOqPrzXQ==
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[baidu.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baidu.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81311-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,linux-foundation.org,alien8.de,infradead.org,linux.alibaba.com,linux.intel.com,kernel.org,google.com,baidu.com,gmail.com,intel.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lirongqing@baidu.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baidu.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D34C330A64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Li RongQing <lirongqing@baidu.com>

Commit ab0e7f20768a ("Documentation: Merge x86-specific boot options doc
into kernel-parameters.txt") introduced a formatting regression where
architecture tags were placed on separate lines with broken indentation.
This caused the 'nopt' [X86] parameter to appear as if it belonged to
the [PPC/POWERNV] section.

Fix the formatting by placing the architecture tags on the same line as
their respective parameters ('pt', 'nopt', and 'nobypass') and restoring
proper indentation.

Fixes: ab0e7f20768a ("Documentation: Merge x86-specific boot options doc into kernel-parameters.txt")
Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 03a5506..dc1c5bd 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2615,12 +2615,9 @@ Kernel parameters
 			Intel machines). This can be used to prevent the usage
 			of an available hardware IOMMU.
 
-			[X86]
-		pt
-			[X86]
-		nopt
-			[PPC/POWERNV]
-		nobypass
+		pt  	[X86]
+		nopt	[X86]
+		nobypass	[PPC/POWERNV]
 			Disable IOMMU bypass, using IOMMU for PCI devices.
 
 		[X86]
-- 
2.9.4


