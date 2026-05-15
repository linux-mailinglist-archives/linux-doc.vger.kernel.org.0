Return-Path: <linux-doc+bounces-87607-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMbpD4v0Bmo4pgIAu9opvQ
	(envelope-from <linux-doc+bounces-87607-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 12:25:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5C454D49A
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 12:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8C2673003BC9
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 09:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A187743D50C;
	Fri, 15 May 2026 09:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="HTNL3PEs"
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA7F43D4EC;
	Fri, 15 May 2026 09:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778838576; cv=none; b=d7l+dMPESmS1Jnn5FvGc40+Mie/O0fiATTL8hOvKmPeAYBWTKhZFuAJg78o3RBPReocfO3siw6SYF38gFj7s7dWrkP75jnYK/+SmqWVcIFElNNEmfbj6zY1avzG5xc+1tlUNsGRkOShFRBnL6SUR/NZsDKLbIC31it+dbGJBCd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778838576; c=relaxed/simple;
	bh=rWTAaOAOYDmQ6UBxvzKThMN94E4arVA1Gebhj55YfcE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X12EJvK/8ZrrrZH9jCBymLkXoDQG49gLdKnDRr8IddEVU+AHYppmKMpL9gKN3qMhdUBu8nwatHdC0SUEhUPMG+9qQyOJ4mAfVf3aDpOOfZZ2JqbsIrp49hT+wj+g0fPgaWreS0QD6Ct29YPAhNYYh9jdVfWFIrwG6W/GCT/oErc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=HTNL3PEs; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Ddf5rnkcewWB3VTTcGX1fHHmNywN/T2k0aDW7rLyNVA=;
	b=HTNL3PEsw+EhyCcCe/PTiMxfjc/ZA4bYXbJXjsaPSiV7KqUFp0s6fqAOKsidZOcJ8RQYizoXx
	ias266hbyn1eM215+JSc5LTrr6TMbPvkZi9wg6ZjlDMCnBXPiJlPL5riYDI7pnFzI3rZnGvJBCu
	oRWVVL1EW0V9nxXJEF8LWtk=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gH2KG3QJkz1cyPB;
	Fri, 15 May 2026 17:41:54 +0800 (CST)
Received: from kwepemr200004.china.huawei.com (unknown [7.202.195.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 861F940539;
	Fri, 15 May 2026 17:49:31 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr200004.china.huawei.com
 (7.202.195.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 15 May
 2026 17:49:30 +0800
From: Pengjie Zhang <zhangpengjie2@huawei.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <corbet@lwn.net>
CC: <skhan@linuxfoundation.org>, <linux-pm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <lihuisong@huawei.com>, <yubowen8@huawei.com>,
	<linhongye@h-partners.com>, <linuxarm@huawei.com>,
	<zhangpengjie2@huawei.com>, <wangzhi12@huawei.com>
Subject: [PATCH] cpufreq: Documentation: fix sampling_down_factor documentation range
Date: Fri, 15 May 2026 17:49:30 +0800
Message-ID: <20260515094930.273599-1-zhangpengjie2@huawei.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemr200004.china.huawei.com (7.202.195.241)
X-Rspamd-Queue-Id: 7B5C454D49A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87607-lists,linux-doc=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[zhangpengjie2@huawei.com,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[huawei.com:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

The ondemand governor implementation accepts sampling_down_factor values
from 1 to 100000 via MAX_SAMPLING_DOWN_FACTOR, but the documentation in
admin-guide/pm/cpufreq.rst still says the valid range is 1 to 100.

Update the documentation to match the actual code.

Fixes: 2a0e49279850 ("cpufreq: User/admin documentation update and consolidation")
Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
---
 Documentation/admin-guide/pm/cpufreq.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/pm/cpufreq.rst b/Documentation/admin-guide/pm/cpufreq.rst
index dbe6d23a5d67..fdca59c955dc 100644
--- a/Documentation/admin-guide/pm/cpufreq.rst
+++ b/Documentation/admin-guide/pm/cpufreq.rst
@@ -516,7 +516,7 @@ This governor exposes the following tunables:
 	of those tasks above 0 and set this attribute to 1.
 
 ``sampling_down_factor``
-	Temporary multiplier, between 1 (default) and 100 inclusive, to apply to
+	Temporary multiplier, between 1 (default) and 100000 inclusive, to apply to
 	the ``sampling_rate`` value if the CPU load goes above ``up_threshold``.
 
 	This causes the next execution of the governor's worker routine (after
-- 
2.33.0


