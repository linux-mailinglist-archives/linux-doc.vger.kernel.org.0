Return-Path: <linux-doc+bounces-93944-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I8dTL5NAQmoH2wkAu9opvQ
	(envelope-from <linux-doc+bounces-93944-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 11:53:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2785E6D87D6
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 11:53:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=S2wal7yL;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93944-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93944-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8951D3052E47
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 09:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778223B8405;
	Mon, 29 Jun 2026 09:47:59 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE3B3B3887;
	Mon, 29 Jun 2026 09:47:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726479; cv=none; b=CBDWaNB6eogb4jJdeutkYl6W3aa5GUjXedmDORpYb9QhYVh6/bAu/Py4IKRmhqEEclhDJGEXWvsS/deO3zjE+86D0SGNGgAAJ1jsh974a22tFV/Jium2L2QnxhKdVGr1OT2rZtpuI2kPMr5X/P2e4MKU3CDi22HgQDX8Bjy7leo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726479; c=relaxed/simple;
	bh=lYIkjbz0lBgyFZf2mGrzCLrcFvAjrqh9w636hqdTyZs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N22JrepzBAgoMukNMehOkGmgA3fNB4f15JyCdVW9VKisJ4TirAMFNDVEgt0wIWd2Y0mSFVQk7wUtC8axhodeOJa6HXlgqTJp9hkwZ4Cyd66V1JALTQRl9AMEI8+8YfpW4FGzKNqJ9Jk2EA6lQFj6BkGORhrCrq9RRsiKeyPot2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=S2wal7yL; arc=none smtp.client-ip=113.46.200.226
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MAA7ivwOtm53DV6AnhV0IJ8L+74dnrWetZ3y5TX4Mgc=;
	b=S2wal7yLNV7jJ8Q8P+0JAaogRSzjR7vZ8brQh+BYlWGO3IbWDbOXTvqQ/fuW21VfJUfJTeM+w
	0K3JWjfGoYGB82ROj31BycneifKEJoJqljV3MLg6cZu3HIVlYK21SiMLzgvZdc5OBfQyYSFl6qc
	UsYrCeVJ+QJ6Z4vYZVhAFb8=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gph6j4n2hzKm7D;
	Mon, 29 Jun 2026 17:38:37 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 939A2402AB;
	Mon, 29 Jun 2026 17:47:48 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 29 Jun
 2026 17:47:45 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <baoquan.he@linux.dev>, <rppt@kernel.org>,
	<pasha.tatashin@soleen.com>, <pratyush@kernel.org>, <ruirui.yang@linux.dev>,
	<rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<elver@google.com>, <enelsonmoore@gmail.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <lirongqing@baidu.com>, <leitao@debian.org>,
	<kees@kernel.org>, <coxu@redhat.com>, <cfsworks@gmail.com>, <jbohac@suse.cz>,
	<osandov@fb.com>, <ryan.roberts@arm.com>, <tangyouling@kylinos.cn>,
	<sourabhjain@linux.ibm.com>, <ritesh.list@gmail.com>, <gaohan@iscas.ac.cn>,
	<david@kernel.org>, <wangruikang@iscas.ac.cn>, <muchun.song@linux.dev>,
	<vishal.moola@gmail.com>, <junhui.liu@pigmoral.tech>, <guoren@kernel.org>,
	<namcao@linutronix.de>, <rick.p.edgecombe@intel.com>, <djbw@kernel.org>,
	<liaoyuanhong@vivo.com>, <fuqiang.wang@easystack.cn>,
	<vishal.l.verma@intel.com>, <chenjiahao16@huawei.com>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v17 01/10] riscv: kexec_file: Fix crashk_low_res not exclude bug
Date: Mon, 29 Jun 2026 17:47:37 +0800
Message-ID: <20260629094746.191843-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629094746.191843-1-ruanjinjie@huawei.com>
References: <20260629094746.191843-1-ruanjinjie@huawei.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-93944-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:robh@kernel.org,m:saravanak@kernel.org,m:akpm@linux-foundation.org,m:baoquan.he@linux.dev,m:rppt@kernel.org,m:pasha.tatashin@soleen.com,m:pratyush@kernel.org,m:ruirui.yang@linux.dev,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:enelsonmoore@gmail.com,m:kuba@kernel.org,m:ebiggers@kernel.org,m:lirongqing@baidu.com,m:leitao@debian.org,m:kees@kernel.org,m:coxu@redhat.com,m:cfsworks@gmail.com,m:jbohac@suse.cz,m:osandov@fb.com,m:ryan.roberts@arm.com,m:tangyouling@kylinos.cn,m:sourabhjain@linux.ibm.
 com,m:ritesh.list@gmail.com,m:gaohan@iscas.ac.cn,m:david@kernel.org,m:wangruikang@iscas.ac.cn,m:muchun.song@linux.dev,m:vishal.moola@gmail.com,m:junhui.liu@pigmoral.tech,m:guoren@kernel.org,m:namcao@linutronix.de,m:rick.p.edgecombe@intel.com,m:djbw@kernel.org,m:liaoyuanhong@vivo.com,m:fuqiang.wang@easystack.cn,m:vishal.l.verma@intel.com,m:chenjiahao16@huawei.com,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:devicetree@vger.kernel.org,m:kexec@lists.infradead.org,m:ruanjinjie@huawei.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,linux.dev,soleen.com,infradead.org,linux.alibaba.com,google.com,baidu.com,debian.org,suse.cz,fb.com,kylinos.cn,iscas.ac.cn,pigmoral.tech,linutronix.de,intel.com,vivo.com,easystack.cn,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_GT_50(0.00)[70];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:dkim,huawei.com:email,huawei.com:mid,huawei.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2785E6D87D6

As done in commit 944a45abfabc ("arm64: kdump: Reimplement crashkernel=X")
and commit 4831be702b95 ("arm64/kexec: Fix missing extra range for
crashkres_low.") for arm64, while implementing crashkernel=X,[high,low],
riscv should have excluded the "crashk_low_res" reserved ranges from
the crash kernel memory to prevent them from being exported through
/proc/vmcore, and the exclusion would need an extra crash_mem range.

Just simply tested on qemu with crashkernel=4G with kexec in [1] mentioned
in [2]. And the second kernel can be started normally.

	# dmesg | grep crash
	[    0.000000] crashkernel low memory reserved: 0xf8000000 - 0x100000000 (128 MB)
	[    0.000000] crashkernel reserved: 0x000000017fe00000 - 0x000000027fe00000 (4096 MB)

Cc: Guo Ren <guoren@kernel.org>
Cc: Baoquan He <bhe@redhat.com>
[1]: https://github.com/chenjh005/kexec-tools/tree/build-test-riscv-v2
[2]: https://lore.kernel.org/all/20230726175000.2536220-1-chenjiahao16@huawei.com/
Fixes: 5882e5acf18d ("riscv: kdump: Implement crashkernel=X,[high,low]")
Reviewed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/riscv/kernel/machine_kexec_file.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 59d4bbc848a8..fa2946aa9b8f 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -62,7 +62,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	unsigned int nr_ranges;
 	int ret;
 
-	nr_ranges = 1; /* For exclusion of crashkernel region */
+	nr_ranges = 2; /* For exclusion of crashkernel region */
 	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
@@ -77,8 +77,16 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	/* Exclude crashkernel region */
 	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
-	if (!ret)
-		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
+	if (ret)
+		goto out;
+
+	if (crashk_low_res.end) {
+		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
+		if (ret)
+			goto out;
+	}
+
+	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
 	kfree(cmem);
-- 
2.34.1


