Return-Path: <linux-doc+bounces-91809-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MYx7FuYXKWoOQgMAu9opvQ
	(envelope-from <linux-doc+bounces-91809-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 09:53:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 457CF666CC1
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 09:53:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=ukJNKBbD;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91809-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-91809-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DED683004DAB
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 07:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1EF374A09;
	Wed, 10 Jun 2026 07:52:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE74385D85;
	Wed, 10 Jun 2026 07:52:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077948; cv=none; b=nWLsUQs4oeMy6m9NPEtknqvuBPP6u1KHcu9NSlS3z66hop54shqWrcFueobKTJMcySm1wV0wZ/6pGtKcXCUkurzMjlqunPVDMt6hDaPH+BpByL9ThN2NmDUejFNfKPz0wzL+r3F8iyU7eJE6NeA9/+9bQpIB+nudotG8oyounb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077948; c=relaxed/simple;
	bh=theACnp7YRT1PazD6ob1nnXrzWhdZUA6D1SeJLCJY8k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FYuPH8oWmphYTPP9N/fIUAnNcPge3PWQ843pBKZgEhXVLBIst3sOte7volPt9RJdyMVDvxHHcR0nueyG/huKAU8jsQYJ13AxMlU1k3rDRtEOgDYmbDGAghrhwfQCIPTDmOnWd2vjZ3fX/qhuYuCDprrogc2TIWxyUDbdmFfc0no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ukJNKBbD; arc=none smtp.client-ip=113.46.200.220
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yVn4qwgMjrPkAleC73oRCX8Q22/zQZPdCGnjlPSiigU=;
	b=ukJNKBbDTadA46loMmO9Y/SM25+i1LZZ193Hb9zzEn7QoZoVRWrJv89YoA2pnK+++ZRydEKW/
	Uy9BpycOIoIfmSfnSAMT/2e+AkQcdw0ZpNhwBAEee7sYgZxSPUEQZDEwpGAuolP946gerUoaMKa
	NpjIq3bnVCHFLXLLANCeElA=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gZyTj3Mj1z12LCq;
	Wed, 10 Jun 2026 15:44:25 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 367B8203B1;
	Wed, 10 Jun 2026 15:52:17 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 10 Jun
 2026 15:52:15 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <punit.agrawal@oss.qualcomm.com>,
	<ruanjinjie@huawei.com>, <mrigendra.chaubey@gmail.com>,
	<suzuki.poulose@arm.com>, <chenl311@chinatelecom.cn>,
	<fengchengwen@huawei.com>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <arnd@arndb.de>, <gshan@redhat.com>,
	<jic23@kernel.org>, <dietmar.eggemann@arm.com>, <sudeep.holla@kernel.org>,
	<pierre.gondois@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/2] arm64: acpi: Fix NULL kobject warning in cpuhp_smt_enable()
Date: Wed, 10 Jun 2026 15:52:00 +0800
Message-ID: <20260610075202.3597031-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91809-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,lwn.net,linuxfoundation.org,oss.qualcomm.com,huawei.com,gmail.com,chinatelecom.cn,arndb.de,redhat.com,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:punit.agrawal@oss.qualcomm.com,m:ruanjinjie@huawei.com,m:mrigendra.chaubey@gmail.com,m:suzuki.poulose@arm.com,m:chenl311@chinatelecom.cn,m:fengchengwen@huawei.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:arnd@arndb.de,m:gshan@redhat.com,m:jic23@kernel.org,m:dietmar.eggemann@arm.com,m:sudeep.holla@kernel.org,m:pierre.gondois@arm.com,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,huawei.com:dkim,huawei.com:mid,huawei.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 457CF666CC1

Fix NULL kobject warning in cpuhp_smt_enable().

Change in v4:
- Fix hot-unplug tearing as Sashiko AI code review pointed out
  by forcing unregistration.
- Update the arm64 hotplug doc.
- Update the commit message.

Jinjie Ruan (2):
  arm64: smp: Fix hot-unplug tearing by forcing unregistration
  cpu/hotplug: Fix NULL kobject warning in cpuhp_smt_enable()

 Documentation/arch/arm64/cpu-hotplug.rst | 28 ++++++++++++++----------
 arch/arm64/kernel/acpi.c                 |  2 ++
 arch/arm64/kernel/smp.c                  | 28 ++++++++++++------------
 3 files changed, 32 insertions(+), 26 deletions(-)

-- 
2.34.1


