Return-Path: <linux-doc+bounces-35538-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED29CA14856
	for <lists+linux-doc@lfdr.de>; Fri, 17 Jan 2025 03:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B6F5188A27A
	for <lists+linux-doc@lfdr.de>; Fri, 17 Jan 2025 02:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB391F561C;
	Fri, 17 Jan 2025 02:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=t4c.dev header.i=@t4c.dev header.b="eawqDPdw"
X-Original-To: linux-doc@vger.kernel.org
Received: from qs51p00im-qukt01071701.me.com (qs51p00im-qukt01071701.me.com [17.57.155.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF531F63E3
	for <linux-doc@vger.kernel.org>; Fri, 17 Jan 2025 02:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.57.155.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737082001; cv=none; b=s0vB83WFqgXnMDOjavc2QL1BL+oftqer46yW8/CTMjpWJprr7QhXTwKYk/Xo+lU/ttR3IUW9kUcb3xauagIm96J18aeG8p5SpQy2+OxzifrYBu90nNKs9b2WbQ3O5ezsxaxMI/bNzC+/hbPwFYnrSHI17r80fKXhXZyLOZeLk9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737082001; c=relaxed/simple;
	bh=ZRh8T2I08REeas8ttfEOltn34LVt4ZqGngAoXhEyUFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nlTcUeE7ve4mykKOwWRkjAatudyPqKn/SR2UZYs74mJtqjIFOEQVjHFdyxB2deBDef8N/ctBJbPJFhlaD7JiO1n+gl8lKSPxd2VcHf1At314MlscKOfG9wUZLA4R5hYQ/AT13Srem4dYmPrsGDunlUXZ1woULTUctRS9GWsny2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=t4c.dev; spf=pass smtp.mailfrom=t4c.dev; dkim=pass (2048-bit key) header.d=t4c.dev header.i=@t4c.dev header.b=eawqDPdw; arc=none smtp.client-ip=17.57.155.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=t4c.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t4c.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t4c.dev; s=sig1;
	bh=eUqnTLMDZZMuuG/OWtt36qL3mG+IRbBamPvyiSjbXig=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
	b=eawqDPdwvtX35bVupfgmpaKVFgQLvfcPLkzoNnrTX0kqOGxFg6jH9EyrbnBXMNOOL
	 H70IP1GJD0UdRYFxK3DQX3KIb0i+Y0ZRAuuL5EPJVfd3dIYhh3otjB+KusXYR3ODHT
	 gd7zpFOwBX7ItOP0Z/K+nO/2VIpIK0mh5gmAJXgiJvO72PXXYocoCOECCmC1CpWifG
	 ew3m3hYr3hr5L6qmLK05//3rLNSt8NInSMdxJF5oBwgep9+iidj4giAD9MLRclQEcK
	 /Dg7L8NrGimX4yWyfgjbHXSshAZ6nBKOaq3JFrMocouykc68bpo9BAG/AVQok01FHb
	 61YtjnKzRaWeg==
Received: from localhost.localdomain (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
	by qs51p00im-qukt01071701.me.com (Postfix) with ESMTPSA id 065424D00257;
	Fri, 17 Jan 2025 02:46:35 +0000 (UTC)
From: Hendrik 'T4cC0re' Meyer <linux@t4c.dev>
To: ardb@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Hendrik 'T4cC0re' Meyer <linux@t4c.dev>
Subject: [PATCH] efistub: add efi=quiet parameter to selectively silence efistub alone
Date: Fri, 17 Jan 2025 03:44:52 +0100
Message-ID: <20250117024452.2691546-1-linux@t4c.dev>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gS_rpkVaBOuAIkPLpN9WkppTGvumTB_l
X-Proofpoint-ORIG-GUID: gS_rpkVaBOuAIkPLpN9WkppTGvumTB_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_11,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=862 spamscore=0
 clxscore=1030 suspectscore=0 mlxscore=0 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2501170020

While the general `quiet` kernel parameter is available to silence
output from the efistub, setting this comes with side-effects.
This patch adds a parameter efi=quiet to selectively set the loglevel
for the stub alone to quiet, as the polar oppoosite to efi=debug.

Signed-off-by: Hendrik 'T4cC0re' Meyer <linux@t4c.dev>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 ++-
 drivers/firmware/efi/libstub/efi-stub-helper.c  | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 3872bc6ec..94a2f6ae7 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1454,7 +1454,7 @@
 	efi=		[EFI,EARLY]
 			Format: { "debug", "disable_early_pci_dma",
 				  "nochunk", "noruntime", "nosoftreserve",
-				  "novamap", "no_disable_early_pci_dma" }
+				  "novamap", "no_disable_early_pci_dma", "quiet" }
 			debug: enable misc debug output.
 			disable_early_pci_dma: disable the busmaster bit on all
 			PCI bridges while in the EFI boot stub.
@@ -1471,6 +1471,7 @@
 			novamap: do not call SetVirtualAddressMap().
 			no_disable_early_pci_dma: Leave the busmaster bit set
 			on all PCI bridges while in the EFI boot stub
+			quiet: disable most log messages.
 
 	efi_no_storage_paranoia [EFI,X86,EARLY]
 			Using this parameter you can use more than 50% of
diff --git a/drivers/firmware/efi/libstub/efi-stub-helper.c b/drivers/firmware/efi/libstub/efi-stub-helper.c
index c0c81ca42..b8ad629cc 100644
--- a/drivers/firmware/efi/libstub/efi-stub-helper.c
+++ b/drivers/firmware/efi/libstub/efi-stub-helper.c
@@ -97,6 +97,8 @@ efi_status_t efi_parse_options(char const *cmdline)
 				efi_disable_pci_dma = false;
 			if (parse_option_str(val, "debug"))
 				efi_loglevel = CONSOLE_LOGLEVEL_DEBUG;
+			if (parse_option_str(val, "quiet"))
+				efi_loglevel = CONSOLE_LOGLEVEL_QUIET;
 		} else if (!strcmp(param, "video") &&
 			   val && strstarts(val, "efifb:")) {
 			efi_parse_option_graphics(val + strlen("efifb:"));
-- 
2.47.1


