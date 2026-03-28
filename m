Return-Path: <linux-doc+bounces-81619-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHI/EvOGx2mbYgUAu9opvQ
	(envelope-from <linux-doc+bounces-81619-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 28 Mar 2026 08:44:51 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E343434DAE4
	for <lists+linux-doc@lfdr.de>; Sat, 28 Mar 2026 08:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBE2630AAC57
	for <lists+linux-doc@lfdr.de>; Sat, 28 Mar 2026 07:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3F0373BE6;
	Sat, 28 Mar 2026 07:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="rPlh5l6P";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="rPlh5l6P"
X-Original-To: linux-doc@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA054371D0A;
	Sat, 28 Mar 2026 07:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774683705; cv=none; b=ERcpvWMdnabWl+154ZwtrsOXfVYbpIsfvKyTHlh19Fh7Mh3nEUl/gVtrVkLf1+VrKV8jKCGzsVKn/s7PfbXL9Mb03mO4Ah3Mr5a7KK8XvgQYjR/I2NON6H/c0EDFROSXH5v8czLEmAQKOpp0bdzl/Hw0zfK6b/RiltzSMXrW/Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774683705; c=relaxed/simple;
	bh=r/BjhLTx/vpPxHHL8yO+ZbDBXi9Jqt2RgKcZoXT6P1s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kp5YhHeavH1DGtoCZDYM9I4A1AxE7lzO9vGhtnsXRzW3zjDBN3v/zq3OIQZ2WQb82KI40jCNGX/EL4xRFOpuW22f2v5I+wyoDVCqW+Akw9a2mOGeAgLi2I2PIvi32eAyckTpc6jsOkMU0i9X35niFZolR51AQluf70NxjIYBH2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=rPlh5l6P; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=rPlh5l6P; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7Kwc6kWIjE6MMFJP+OfVcLTnCUv+ekJ3y6ZVFx802F8=;
	b=rPlh5l6P/r0lCaYwhte4yShjLrdwYBNU0lmIIgw5zLcvDsIThOK9DhT/uaKtGrhCHIM2m/T2E
	E/c7DL3vdFGbipfioCcdgsazyLS5iJjEmcOCqlzDVeWHjNYlk59gPZS+xwcmZ6tAuW17/cQDjHA
	1aexox4eHyMo0rEmFdCoOYA=
Received: from canpmsgout08.his.huawei.com (unknown [172.19.92.156])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4fjTwW11bcz1BFSs;
	Sat, 28 Mar 2026 15:41:31 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=7Kwc6kWIjE6MMFJP+OfVcLTnCUv+ekJ3y6ZVFx802F8=;
	b=rPlh5l6P/r0lCaYwhte4yShjLrdwYBNU0lmIIgw5zLcvDsIThOK9DhT/uaKtGrhCHIM2m/T2E
	E/c7DL3vdFGbipfioCcdgsazyLS5iJjEmcOCqlzDVeWHjNYlk59gPZS+xwcmZ6tAuW17/cQDjHA
	1aexox4eHyMo0rEmFdCoOYA=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fjTnS5Lt2zmV79;
	Sat, 28 Mar 2026 15:35:24 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 850984056C;
	Sat, 28 Mar 2026 15:41:33 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 28 Mar
 2026 15:41:30 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <vgoyal@redhat.com>,
	<dyoung@redhat.com>, <rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <pawan.kumar.gupta@linux.intel.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<paulmck@kernel.org>, <lirongqing@baidu.com>, <rppt@kernel.org>,
	<leitao@debian.org>, <ardb@kernel.org>, <cfsworks@gmail.com>,
	<osandov@fb.com>, <jbohac@suse.cz>, <tangyouling@kylinos.cn>,
	<sourabhjain@linux.ibm.com>, <ritesh.list@gmail.com>,
	<eajames@linux.ibm.com>, <songshuaishuai@tinylab.org>,
	<kevin.brodsky@arm.com>, <vishal.moola@gmail.com>,
	<junhui.liu@pigmoral.tech>, <coxu@redhat.com>, <fuqiang.wang@easystack.cn>,
	<liaoyuanhong@vivo.com>, <guoren@kernel.org>, <chenjiahao16@huawei.com>,
	<hbathini@linux.ibm.com>, <takahiro.akashi@linaro.org>,
	<james.morse@arm.com>, <lizhengyu3@huawei.com>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 06/11] LoongArch: kexec: Fix potential buffer overflow in prepare_elf_headers()
Date: Sat, 28 Mar 2026 15:40:08 +0800
Message-ID: <20260328074013.3589544-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260328074013.3589544-1-ruanjinjie@huawei.com>
References: <20260328074013.3589544-1-ruanjinjie@huawei.com>
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
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,linux.alibaba.com,google.com,baidu.com,debian.org,fb.com,suse.cz,kylinos.cn,tinylab.org,pigmoral.tech,easystack.cn,vivo.com,huawei.com,linaro.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-81619-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:dkim,huawei.com:email,huawei.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_GT_50(0.00)[67];
	DKIM_TRACE(0.00)[huawei.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E343434DAE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is a race condition between the kexec_load() system call
(crash kernel loading path) and memory hotplug operations that can lead
to buffer overflow and potential kernel crash.

During prepare_elf_headers(), the following steps occur:
1. The first for_each_mem_range()  queries current System RAM memory ranges
2. Allocates buffer based on queried count
3. The 2st for_each_mem_range() populates ranges from memblock

If memory hotplug occurs between step 1 and step 3, the number of ranges
can increase, causing out-of-bounds write when populating cmem->ranges[].

This happens because kexec_load() uses kexec_trylock (atomic_t) while
memory hotplug uses device_hotplug_lock (mutex), so they don't serialize
with each other.

Just add bounds checking to prevent out-of-bounds access.

Fixes: 1bcca8620a91 ("LoongArch: Add crash dump support for kexec_file")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/loongarch/kernel/machine_kexec_file.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5584b798ba46..167392c1da33 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -75,6 +75,11 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	cmem->max_nr_ranges = nr_ranges;
 	cmem->nr_ranges = 0;
 	for_each_mem_range(i, &start, &end) {
+		if (cmem->nr_ranges >= cmem->max_nr_ranges) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
 		cmem->ranges[cmem->nr_ranges].start = start;
 		cmem->ranges[cmem->nr_ranges].end = end - 1;
 		cmem->nr_ranges++;
-- 
2.34.1


