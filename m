Return-Path: <linux-doc+bounces-94775-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a5Y0MFGKR2p1agAAu9opvQ
	(envelope-from <linux-doc+bounces-94775-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 12:09:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1EE701015
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 12:09:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=SeRFVmYx;
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94775-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94775-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2623830B72BE
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 10:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077D93C09ED;
	Fri,  3 Jul 2026 10:02:41 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8303BAD84;
	Fri,  3 Jul 2026 10:02:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072960; cv=none; b=Dan5SXXqc5dbfAox5braHCtnph9+MyM6J9pyvkIGvRCJZ+NSlUG0SPMTapO8pbCvowShTKjdXnEVZDa6arCHhFIRdKbA8MODkdGYqBhEbcYxPSEa+NmJaIWggZSgTTQKrPwjN7W4/uf+HuDypM021KEV0HiiNAbr+1ECUyrDi8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072960; c=relaxed/simple;
	bh=SRtg+s9wfqaqL0DSxOns6RHLqzBRyCiBUZlbrAVh5W4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZDTjjWfTzZ3fkRGnXCa6TtaQ5XoO5eOIxB/e/BORFjRzwKPED7IUp5+z17eSL3oQ8sdtIYrrmzzzmkDVEoe0xpZpPWVTiAZzvdrZUugWz15sJGxp9DmgYFeP/fMKpu+or0u/yD8qO/hv2n2JvcBhJ8zBDCg4GizGw2rbeRxGSCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=SeRFVmYx; arc=none smtp.client-ip=113.46.200.218
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zv0c5Bp+Ni7SDy08c3MShPj1xh4MMQp9KUzxhv5EIjo=;
	b=SeRFVmYxcBxmCDplNemhKbTB0vIFqmp0EY0WkNYInGZTFCXQDk5kO9kMv5QTkSAyRfrifK3+t
	2LTcb7PNd2YA+IcUeR5rdO7daGx6rig9hPabRzDBmzFSMrDNeDOkh3tq85Iw6Frkx5/ze0hV45s
	DuNLswq9Y2emajh4WU4GAN0=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gs8Gh5Bx1zpSyy;
	Fri,  3 Jul 2026 17:54:04 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 2107A4057D;
	Fri,  3 Jul 2026 18:02:36 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 3 Jul
 2026 18:02:32 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <maz@kernel.org>, <ardb@kernel.org>,
	<ilias.apalodimas@linaro.org>, <oupton@kernel.org>, <joey.gouly@arm.com>,
	<seiden@linux.ibm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<oleg@redhat.com>, <mark.rutland@arm.com>, <lpieralisi@kernel.org>,
	<tglx@kernel.org>, <ada.coupriediaz@arm.com>, <anshuman.khandual@arm.com>,
	<ruanjinjie@huawei.com>, <ebiggers@kernel.org>, <broonie@kernel.org>,
	<mrigendra.chaubey@gmail.com>, <baohua@kernel.org>, <lucaswei@google.com>,
	<james.morse@arm.com>, <zengheng4@huawei.com>, <thuth@redhat.com>,
	<yang@os.amperecomputing.com>, <leo.bras@arm.com>, <Sascha.Bischoff@arm.com>,
	<james.clark@linaro.org>, <peterz@infradead.org>, <leitao@debian.org>,
	<ben.horgan@arm.com>, <punit.agrawal@oss.qualcomm.com>, <gshan@redhat.com>,
	<osama.abdelkader@gmail.com>, <fengchengwen@huawei.com>,
	<ryan.roberts@arm.com>, <yangyicong@hisilicon.com>, <kevin.brodsky@arm.com>,
	<kees@kernel.org>, <jeson.gao@unisoc.com>, <zhaoyang.huang@unisoc.com>,
	<ryotkkr98@gmail.com>, <wsw9603@163.com>, <pasha.tatashin@soleen.com>,
	<jeremy.linton@arm.com>, <schuster.simon@siemens-energy.com>,
	<osandov@fb.com>, <arnd@arndb.de>, <zhangpengjie2@huawei.com>,
	<smostafa@google.com>, <vladimir.murzin@arm.com>, <tabba@google.com>,
	<vdonnefort@google.com>, <kaleshsingh@google.com>, <jic23@kernel.org>,
	<timothy.hayes@arm.com>, <alexandru.elisei@arm.com>, <zenghui.yu@linux.dev>,
	<david@kernel.org>, <akpm@linux-foundation.org>, <ljs@kernel.org>,
	<memxor@gmail.com>, <qperret@google.com>, <chaitanyas.prakash@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-efi@vger.kernel.org>,
	<kvmarm@lists.linux.dev>
Subject: [PATCH 06/17] arm64/booting: Document boot requirements for FEAT_NMI
Date: Fri, 3 Jul 2026 18:01:24 +0800
Message-ID: <20260703100135.2512312-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703100135.2512312-1-ruanjinjie@huawei.com>
References: <20260703100135.2512312-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94775-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:maz@kernel.org,m:ardb@kernel.org,m:ilias.apalodimas@linaro.org,m:oupton@kernel.org,m:joey.gouly@arm.com,m:seiden@linux.ibm.com,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:oleg@redhat.com,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:ada.coupriediaz@arm.com,m:anshuman.khandual@arm.com,m:ruanjinjie@huawei.com,m:ebiggers@kernel.org,m:broonie@kernel.org,m:mrigendra.chaubey@gmail.com,m:baohua@kernel.org,m:lucaswei@google.com,m:james.morse@arm.com,m:zengheng4@huawei.com,m:thuth@redhat.com,m:yang@os.amperecomputing.com,m:leo.bras@arm.com,m:Sascha.Bischoff@arm.com,m:james.clark@linaro.org,m:peterz@infradead.org,m:leitao@debian.org,m:ben.horgan@arm.com,m:punit.agrawal@oss.qualcomm.com,m:gshan@redhat.com,m:osama.abdelkader@gmail.com,m:fengchengwen@huawei.com,m:ryan.roberts@arm.com,m:yangyicong@hisilicon.com,m:kevin.brodsky@arm.com,m:kees@kernel.org,m:je
 son.gao@unisoc.com,m:zhaoyang.huang@unisoc.com,m:ryotkkr98@gmail.com,m:wsw9603@163.com,m:pasha.tatashin@soleen.com,m:jeremy.linton@arm.com,m:schuster.simon@siemens-energy.com,m:osandov@fb.com,m:arnd@arndb.de,m:zhangpengjie2@huawei.com,m:smostafa@google.com,m:vladimir.murzin@arm.com,m:tabba@google.com,m:vdonnefort@google.com,m:kaleshsingh@google.com,m:jic23@kernel.org,m:timothy.hayes@arm.com,m:alexandru.elisei@arm.com,m:zenghui.yu@linux.dev,m:david@kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:memxor@gmail.com,m:qperret@google.com,m:chaitanyas.prakash@arm.com,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-efi@vger.kernel.org,m:kvmarm@lists.linux.dev,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,lwn.net,linuxfoundation.org,linaro.org,linux.ibm.com,huawei.com,redhat.com,gmail.com,google.com,os.amperecomputing.com,infradead.org,debian.org,oss.qualcomm.com,hisilicon.com,unisoc.com,163.com,soleen.com,siemens-energy.com,fb.com,arndb.de,linux.dev,linux-foundation.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_GT_50(0.00)[72];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,huawei.com:from_mime,huawei.com:email,huawei.com:mid,huawei.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E1EE701015

From: Mark Brown <broonie@kernel.org>

In order to use FEAT_NMI we must be able to use ALLINT, require that it
behave as though not trapped when it is present.

Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20221112151708.175147-2-broonie@kernel.org
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/arch/arm64/booting.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 13ef311dace8..aaabe8fa4cdd 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -419,6 +419,12 @@ Before jumping into the kernel, the following conditions must be met:
 
     - HCR_EL2.ATA (bit 56) must be initialised to 0b1.
 
+  For CPUs with Non-maskable Interrupts (FEAT_NMI):
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HCRX_EL2.TALLINT must be initialised to 0b0.
+
   For CPUs with the Scalable Matrix Extension version 2 (FEAT_SME2):
 
   - If EL3 is present:
-- 
2.34.1


