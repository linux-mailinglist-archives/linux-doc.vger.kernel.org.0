Return-Path: <linux-doc+bounces-93942-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JayIC9g/QmrH2gkAu9opvQ
	(envelope-from <linux-doc+bounces-93942-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 11:50:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D60876D8736
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 11:50:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=ZvqXwk1L;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93942-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-93942-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0791B302A4D3
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 09:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B093B5310;
	Mon, 29 Jun 2026 09:47:57 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D383783DE;
	Mon, 29 Jun 2026 09:47:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726477; cv=none; b=qqQcFupjK4eXaUcdC23aRAY9PIxrkZKiSIjA45fu7vMQtXn36ezkoHBofpifRpN6C/RepXLu63u2VEwM9RG0+/RupUVvqH5ygrZaXuobLp17mma5W1oU7R50Ad+cTfzu6CAJ7CeiQqKLVDAHAAsMpfGVRtbMfU5iWUbHd5I5R2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726477; c=relaxed/simple;
	bh=gibIIGy96Bwp47tfWJjcjT5E0rFqiGKcsGu38vfSXqc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FOFWqIQEoRWFVEmQDtosgomq8NxmRWBAGJt59dlcZtb94TwC3S+FVwzv6oRB0MU+S7PSnkSJhRyDgYsYEp5XXoZKVfif/pmu+KP4l7sgBjFm2Jx2pB8qIwJOcATisHGmLGmcz04qex9kom7PiQo5j1hSYdEijqXDefX4tX/T6OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ZvqXwk1L; arc=none smtp.client-ip=113.46.200.221
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=IPyotJxeR5uGcVVLMoJjwubMmXyJTsZGJCp+yFer/oU=;
	b=ZvqXwk1LGLILo1sZWbW4Vwk7DohspdOETHMV+sQ5/kKKv3cidXYNYfIu10fUhh6jkU/DXHzWi
	HUim2EaCJltc0yUZLhMVFyof+5gwRNiiqNjmI7iANvKL0RczTQISUyeGDF4p/4M7fm3xkHv24ie
	VNh/G67tXRbC+w7DEbfgHxE=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gph6r1DL8zRhRT;
	Mon, 29 Jun 2026 17:38:44 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 4C2B440537;
	Mon, 29 Jun 2026 17:47:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 29 Jun
 2026 17:47:48 +0800
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
Subject: [PATCH v17 02/10] powerpc/crash: sort crash memory ranges before preparing elfcorehdr
Date: Mon, 29 Jun 2026 17:47:38 +0800
Message-ID: <20260629094746.191843-3-ruanjinjie@huawei.com>
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
	TAGGED_FROM(0.00)[bounces-93942-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ellerman.id.au:email,linux-foundation.org:email,vger.kernel.org:from_smtp,huawei.com:dkim,huawei.com:email,huawei.com:mid,huawei.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D60876D8736

From: Sourabh Jain <sourabhjain@linux.ibm.com>

During a memory hot-remove event, the elfcorehdr is rebuilt to exclude
the removed memory. While updating the crash memory ranges for this
operation, the crash memory ranges array can become unsorted. This
happens because remove_mem_range() may split a memory range into two
parts and append the higher-address part as a separate range at the end
of the array.

So far, no issues have been observed due to the unsorted crash memory
ranges. However, this could lead to problems once crash memory range
removal is handled by generic code, as introduced in the upcoming
patches in this series.

Currently, powerpc uses a platform-specific function,
remove_mem_range(), to exclude hot-removed memory from the crash memory
ranges. This function performs the same task as the generic
crash_exclude_mem_range() in crash_core.c. The generic helper also
ensures that the crash memory ranges remain sorted. So remove the
redundant powerpc-specific implementation and instead call
crash_exclude_mem_range_guarded() (which internally calls
crash_exclude_mem_range()) to exclude the hot-removed memory ranges.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org
Acked-by: Baoquan He <bhe@redhat.com>
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/powerpc/include/asm/kexec_ranges.h |  4 +-
 arch/powerpc/kexec/crash.c              |  5 +-
 arch/powerpc/kexec/ranges.c             | 87 +------------------------
 3 files changed, 7 insertions(+), 89 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec_ranges.h b/arch/powerpc/include/asm/kexec_ranges.h
index 14055896cbcb..ad95e3792d10 100644
--- a/arch/powerpc/include/asm/kexec_ranges.h
+++ b/arch/powerpc/include/asm/kexec_ranges.h
@@ -7,7 +7,9 @@
 void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
 struct crash_mem *realloc_mem_ranges(struct crash_mem **mem_ranges);
 int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
-int remove_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
+int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
+				    unsigned long long mstart,
+				    unsigned long long mend);
 int get_exclude_memory_ranges(struct crash_mem **mem_ranges);
 int get_reserved_memory_ranges(struct crash_mem **mem_ranges);
 int get_crash_memory_ranges(struct crash_mem **mem_ranges);
diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index e6539f213b3d..2e88ec5c4356 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -493,7 +493,7 @@ static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *
 	struct crash_mem *cmem = NULL;
 	struct kexec_segment *ksegment;
 	void *ptr, *mem, *elfbuf = NULL;
-	unsigned long elfsz, memsz, base_addr, size;
+	unsigned long elfsz, memsz, base_addr, size, end;
 
 	ksegment = &image->segment[image->elfcorehdr_index];
 	mem = (void *) ksegment->mem;
@@ -512,7 +512,8 @@ static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *
 	if (image->hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY) {
 		base_addr = PFN_PHYS(mn->start_pfn);
 		size = mn->nr_pages * PAGE_SIZE;
-		ret = remove_mem_range(&cmem, base_addr, size);
+		end = base_addr + size - 1;
+		ret = crash_exclude_mem_range_guarded(&cmem, base_addr, end);
 		if (ret) {
 			pr_err("Failed to remove hot-unplugged memory from crash memory ranges\n");
 			goto out;
diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
index 867135560e5c..6c58bcc3e130 100644
--- a/arch/powerpc/kexec/ranges.c
+++ b/arch/powerpc/kexec/ranges.c
@@ -553,7 +553,7 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
 #endif /* CONFIG_KEXEC_FILE */
 
 #ifdef CONFIG_CRASH_DUMP
-static int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
+int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
 					   unsigned long long mstart,
 					   unsigned long long mend)
 {
@@ -641,89 +641,4 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges)
 		pr_err("Failed to setup crash memory ranges\n");
 	return ret;
 }
-
-/**
- * remove_mem_range - Removes the given memory range from the range list.
- * @mem_ranges:    Range list to remove the memory range to.
- * @base:          Base address of the range to remove.
- * @size:          Size of the memory range to remove.
- *
- * (Re)allocates memory, if needed.
- *
- * Returns 0 on success, negative errno on error.
- */
-int remove_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
-{
-	u64 end;
-	int ret = 0;
-	unsigned int i;
-	u64 mstart, mend;
-	struct crash_mem *mem_rngs = *mem_ranges;
-
-	if (!size)
-		return 0;
-
-	/*
-	 * Memory range are stored as start and end address, use
-	 * the same format to do remove operation.
-	 */
-	end = base + size - 1;
-
-	for (i = 0; i < mem_rngs->nr_ranges; i++) {
-		mstart = mem_rngs->ranges[i].start;
-		mend = mem_rngs->ranges[i].end;
-
-		/*
-		 * Memory range to remove is not part of this range entry
-		 * in the memory range list
-		 */
-		if (!(base >= mstart && end <= mend))
-			continue;
-
-		/*
-		 * Memory range to remove is equivalent to this entry in the
-		 * memory range list. Remove the range entry from the list.
-		 */
-		if (base == mstart && end == mend) {
-			for (; i < mem_rngs->nr_ranges - 1; i++) {
-				mem_rngs->ranges[i].start = mem_rngs->ranges[i+1].start;
-				mem_rngs->ranges[i].end = mem_rngs->ranges[i+1].end;
-			}
-			mem_rngs->nr_ranges--;
-			goto out;
-		}
-		/*
-		 * Start address of the memory range to remove and the
-		 * current memory range entry in the list is same. Just
-		 * move the start address of the current memory range
-		 * entry in the list to end + 1.
-		 */
-		else if (base == mstart) {
-			mem_rngs->ranges[i].start = end + 1;
-			goto out;
-		}
-		/*
-		 * End address of the memory range to remove and the
-		 * current memory range entry in the list is same.
-		 * Just move the end address of the current memory
-		 * range entry in the list to base - 1.
-		 */
-		else if (end == mend)  {
-			mem_rngs->ranges[i].end = base - 1;
-			goto out;
-		}
-		/*
-		 * Memory range to remove is not at the edge of current
-		 * memory range entry. Split the current memory entry into
-		 * two half.
-		 */
-		else {
-			size = mem_rngs->ranges[i].end - end + 1;
-			mem_rngs->ranges[i].end = base - 1;
-			ret = add_mem_range(mem_ranges, end + 1, size);
-		}
-	}
-out:
-	return ret;
-}
 #endif /* CONFIG_CRASH_DUMP */
-- 
2.34.1


