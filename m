Return-Path: <linux-doc+bounces-93943-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /wgdOuQ/QmrN2gkAu9opvQ
	(envelope-from <linux-doc+bounces-93943-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 11:50:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A65576D8747
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 11:50:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=MKsW01v7;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93943-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-93943-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B7E1302E7F6
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 09:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940003B71B4;
	Mon, 29 Jun 2026 09:47:58 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4D53A8732;
	Mon, 29 Jun 2026 09:47:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726478; cv=none; b=q7GD9CKLiIumLZRM4cD4M8HARCL2XGA9vwGY1jgGfSrF+nSvaOxqLsXO0A/yBDUiz5Y13KVcF6qvfUoTYRQmoQOxoGOmtUAo6FZdGqRHRqSc4HoxNii1kZzsHUUkSQSvvUaR5Md+80LCxZC8CH5OId/i0pC2wLI1gR8er/28M3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726478; c=relaxed/simple;
	bh=lOiocNbYTPBNK53nzpjreYcioETi5wTxdyWMCSMKUAQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uy5B//n8vuCuf+liXkmYxVmmeaOaHP44iX+yP1mfIpDFeFNyiM7q2DYf7aMDkWmfMhWtekoEDF3psbK5V722ynJ2oLayK+d+kNVWiWRnOxYavs7QRAos97z8+KMfyWo5FGeVbHxq/0X1fB5f09V9LE5w8UvIorio+kjpOo/+b/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=MKsW01v7; arc=none smtp.client-ip=113.46.200.220
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=o2MfIbIpab6sBV5thXVrF9AYDGvnd3HG9zD/Hp4jR/4=;
	b=MKsW01v71lyzHBKuxcUCGXDG3iC+LjXlgBljdiGZ5GNea3mwcKjmTJ3Sna5AEeAIXHbUyKd7I
	FfGFcBsOdG4OwgLPgjq9m/d4R5wCaqfhOVZrxcAR19U5sPQm8CYu8Of5fG2WJvOnTcVHE47Biyz
	xff7YUvgHUdXIRUyeUgoNLE=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gph7K6Sklz12LJ2;
	Mon, 29 Jun 2026 17:39:09 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 2C79A203C1;
	Mon, 29 Jun 2026 17:47:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 29 Jun
 2026 17:47:51 +0800
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
Subject: [PATCH v17 03/10] crash: Add crash_prepare_headers() to exclude crash kernel memory
Date: Mon, 29 Jun 2026 17:47:39 +0800
Message-ID: <20260629094746.191843-4-ruanjinjie@huawei.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-93943-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:robh@kernel.org,m:saravanak@kernel.org,m:akpm@linux-foundation.org,m:baoquan.he@linux.dev,m:rppt@kernel.org,m:pasha.tatashin@soleen.com,m:pratyush@kernel.org,m:ruirui.yang@linux.dev,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:elver@google.com,m:enelsonmoore@gmail.com,m:kuba@kernel.org,m:ebiggers@kernel.org,m:lirongqing@baidu.com,m:leitao@debian.org,m:kees@kernel.org,m:coxu@redhat.com,m:cfsworks@gmail.com,m:jbohac@suse.cz,m:osandov@fb.com,m:ryan.roberts@arm.com,m:tangyouling@kylinos.cn,m:sourabhjain@linux.ibm.
 com,m:ritesh.list@gmail.com,m:gaohan@iscas.ac.cn,m:david@kernel.org,m:wangruikang@iscas.ac.cn,m:muchun.song@linux.dev,m:vishal.moola@gmail.com,m:junhui.liu@pigmoral.tech,m:guoren@kernel.org,m:namcao@linutronix.de,m:rick.p.edgecombe@intel.com,m:djbw@kernel.org,m:liaoyuanhong@vivo.com,m:fuqiang.wang@easystack.cn,m:vishal.l.verma@intel.com,m:chenjiahao16@huawei.com,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:devicetree@vger.kernel.org,m:kexec@lists.infradead.org,m:ruanjinjie@huawei.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,linux.dev,soleen.com,infradead.org,linux.alibaba.com,google.com,baidu.com,debian.org,suse.cz,fb.com,kylinos.cn,iscas.ac.cn,pigmoral.tech,linutronix.de,intel.com,vivo.com,easystack.cn,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_GT_50(0.00)[70];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,huawei.com:dkim,huawei.com:email,huawei.com:mid,huawei.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A65576D8747

The crash memory alloc, and the exclude of crashk_res, crashk_low_res
and crashk_cma memory are almost identical across different architectures,
handling them in the crash core would eliminate a lot of duplication, so
add crash_prepare_headers() helper to handle them in the common code.

To achieve the above goal, three architecture-specific functions are
introduced:

- arch_get_system_nr_ranges(). Pre-counts the max number of memory ranges.

- arch_crash_populate_cmem(). Collects the memory ranges and fills them
  into cmem.

- arch_crash_exclude_ranges(). Architecture's additional crash memory
  ranges exclusion, defaulting to empty.

Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Acked-by: Baoquan He <bhe@redhat.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/linux/crash_core.h |  5 +++
 kernel/crash_core.c        | 82 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 84 insertions(+), 3 deletions(-)

diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index c1dee3f971a9..583ffcc703d4 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -59,6 +59,8 @@ extern int crash_exclude_mem_range(struct crash_mem *mem,
 				   unsigned long long mend);
 extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 				       void **addr, unsigned long *sz);
+extern int crash_prepare_headers(int need_kernel_map, void **addr,
+				 unsigned long *sz, unsigned long *nr_mem_ranges);
 
 struct kimage;
 struct kexec_segment;
@@ -76,6 +78,9 @@ int kexec_should_crash(struct task_struct *p);
 int kexec_crash_loaded(void);
 void crash_save_cpu(struct pt_regs *regs, int cpu);
 extern int kimage_crash_copy_vmcoreinfo(struct kimage *image);
+extern unsigned int arch_get_system_nr_ranges(void);
+extern int arch_crash_populate_cmem(struct crash_mem *cmem);
+extern int arch_crash_exclude_ranges(struct crash_mem *cmem);
 
 #else /* !CONFIG_CRASH_DUMP*/
 struct pt_regs;
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 4f21fc3b108b..481babc29131 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -168,9 +168,6 @@ static inline resource_size_t crash_resource_size(const struct resource *res)
 	return !res->end ? 0 : resource_size(res);
 }
 
-
-
-
 int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 			  void **addr, unsigned long *sz)
 {
@@ -272,6 +269,85 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 	return 0;
 }
 
+static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
+{
+	struct crash_mem *cmem;
+
+	cmem = kvzalloc_flex(*cmem, ranges, nr_ranges);
+	if (!cmem)
+		return NULL;
+
+	cmem->max_nr_ranges = nr_ranges;
+	return cmem;
+}
+
+unsigned int __weak arch_get_system_nr_ranges(void) { return 0; }
+int __weak arch_crash_populate_cmem(struct crash_mem *cmem) { return -1; }
+int __weak arch_crash_exclude_ranges(struct crash_mem *cmem) { return 0; }
+
+static int crash_exclude_core_ranges(struct crash_mem *cmem)
+{
+	int ret, i;
+
+	/* Exclude crashkernel region */
+	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
+	if (ret)
+		return ret;
+
+	if (crashk_low_res.end) {
+		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < crashk_cma_cnt; ++i) {
+		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
+					      crashk_cma_ranges[i].end);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			  unsigned long *nr_mem_ranges)
+{
+	unsigned int max_nr_ranges;
+	struct crash_mem *cmem;
+	int ret;
+
+	max_nr_ranges = arch_get_system_nr_ranges();
+	if (!max_nr_ranges)
+		return -ENOMEM;
+
+	cmem = alloc_cmem(max_nr_ranges);
+	if (!cmem)
+		return -ENOMEM;
+
+	ret = arch_crash_populate_cmem(cmem);
+	if (ret)
+		goto out;
+
+	ret = crash_exclude_core_ranges(cmem);
+	if (ret)
+		goto out;
+
+	ret = arch_crash_exclude_ranges(cmem);
+	if (ret)
+		goto out;
+
+	/* Return the computed number of memory ranges, for hotplug usage */
+	if (nr_mem_ranges)
+		*nr_mem_ranges = cmem->nr_ranges;
+
+	ret = crash_prepare_elf64_headers(cmem, need_kernel_map, addr, sz);
+
+out:
+	kvfree(cmem);
+	return ret;
+}
+
 /**
  * crash_exclude_mem_range - exclude a mem range for existing ranges
  * @mem: mem->range contains an array of ranges sorted in ascending order
-- 
2.34.1


