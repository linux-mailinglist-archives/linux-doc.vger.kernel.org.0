Return-Path: <linux-doc+bounces-90710-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PXtABXcFIGrAuAAAu9opvQ
	(envelope-from <linux-doc+bounces-90710-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 12:44:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 747D7636AEE
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 12:44:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=EkFXP1tA;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90710-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90710-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 538A83041878
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 10:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098553A16AB;
	Wed,  3 Jun 2026 10:44:02 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ECC38D019;
	Wed,  3 Jun 2026 10:44:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780483441; cv=none; b=uGq6izk/EZYuo3IJVit5mMFNjovab5sqCqhMfhZQop9QilMZM/sHoyQ6irxTSdYSE8vPs47LPE9IWtvYeCg95YtFCdx8MMMH0T8nbW8w8CefbLlsI80CHRbupV2UoypwBqQCGFvD2pIax9Dz+wJZHUgMgPGrcrclRnAw4xjjLWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780483441; c=relaxed/simple;
	bh=oZiUVbmkfwkJjNevEN1GRtwtJQOOjjxR9EYg2bGEtG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TerehilgPmayWJAKs5fsNV5PSn9147vxngf6pjOjYFV31hgodJRy+HTrh8/PpgJ9m7RJezfXJ1+3QdDzor1rLBzfFjxm9DGMW1cRaRE9cSO3IVXqEhzXXSUA9P0jL0c2OIuKSNyVAqtzGNm4PSP5rtdjpE48iydJI4LGwBzTdjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkFXP1tA; arc=none smtp.client-ip=192.198.163.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780483441; x=1812019441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oZiUVbmkfwkJjNevEN1GRtwtJQOOjjxR9EYg2bGEtG4=;
  b=EkFXP1tAvjW0dLdoXx0gvZ9V0dbNluHsmuEuUNg5KgpvDPOrgHQgRPIg
   +9VTIJkav+MypfouaOFmLuqIqPM0M/IH7EJf8YpiarUW51CaKmjKpyR1f
   xW9/uAdR2uXN1AVw8cHKp53ZFpECnTpRsYuW3kBBsdDlHsKg8DbvyR++i
   HKBlQjz9mkCvoLOO6e6cyYUAlA5tuSLpvlBS8jbD0+9YNWyAD1sut/Ms7
   WiRVTZulYN6XddU5dPJBZEkpMt6hjlTEdfKIP6QNLDp1X3vkqPcieRfxT
   8eJ1ARcu/w8k6qv0LCaNfPtC8OXMfpmRjrmBIUCV8S6m7uXofehqrlKP6
   w==;
X-CSE-ConnectionGUID: YSA+NwxLRnaAAlIG0VTQaQ==
X-CSE-MsgGUID: yzg0SKE+TY6RMXiTULBH0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="80429104"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="80429104"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 03:44:00 -0700
X-CSE-ConnectionGUID: Vh2oqqU9QlGBTVxwUybgtQ==
X-CSE-MsgGUID: tsGfTAxgRdGqdZDRdRsYrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="241695746"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jun 2026 03:43:57 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 33B0899; Wed, 03 Jun 2026 12:43:56 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	"Daniel J. Ogorchock" <djogorchock@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	Tamir Duberstein <tamird@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 2/2] HID: nintendo: Use %pM format specifier for MAC addresses
Date: Wed,  3 Jun 2026 12:34:03 +0200
Message-ID: <20260603104351.152085-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260603104351.152085-1-andriy.shevchenko@linux.intel.com>
References: <20260603104351.152085-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90710-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:jikos@kernel.org,m:djogorchock@gmail.com,m:pmladek@suse.com,m:tamird@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:rostedt@goodmis.org,m:linux@rasmusvillemoes.dk,m:senozhatsky@chromium.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:bentiss@kernel.org,m:akpm@linux-foundation.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-doc@vger.kernel.org];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:from_mime,linux.intel.com:mid,intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 747D7636AEE

Convert to %pM instead of using custom code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hid/hid-nintendo.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 29008c2cc530..05c50f2530ef 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -2431,14 +2431,8 @@ static int joycon_read_info(struct joycon_ctlr *ctlr)
 	for (i = 4, j = 0; j < 6; i++, j++)
 		ctlr->mac_addr[j] = report->subcmd_reply.data[i];
 
-	ctlr->mac_addr_str = devm_kasprintf(&ctlr->hdev->dev, GFP_KERNEL,
-					    "%02X:%02X:%02X:%02X:%02X:%02X",
-					    ctlr->mac_addr[0],
-					    ctlr->mac_addr[1],
-					    ctlr->mac_addr[2],
-					    ctlr->mac_addr[3],
-					    ctlr->mac_addr[4],
-					    ctlr->mac_addr[5]);
+	ctlr->mac_addr_str = devm_kasprintf(&ctlr->hdev->dev, GFP_KERNEL, "%pMU",
+					    ctlr->mac_addr);
 	if (!ctlr->mac_addr_str)
 		return -ENOMEM;
 	hid_info(ctlr->hdev, "controller MAC = %s\n", ctlr->mac_addr_str);
-- 
2.50.1


