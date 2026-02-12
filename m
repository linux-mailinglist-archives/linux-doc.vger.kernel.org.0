Return-Path: <linux-doc+bounces-75906-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDOkDhanjWkK5wAAu9opvQ
	(envelope-from <linux-doc+bounces-75906-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 11:10:30 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E07F12C4A1
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 11:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C6DA3039F0C
	for <lists+linux-doc@lfdr.de>; Thu, 12 Feb 2026 10:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41092E5D17;
	Thu, 12 Feb 2026 10:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="LRBlxtXx"
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2B82ED84C;
	Thu, 12 Feb 2026 10:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890969; cv=none; b=ABZjg9zkeghIFp0AO4HViJSJ5vRiPKMF3XwRg56pQsi7/VvAuVC15PIrt+054QD6PChUGO0YjB0DJwqZaEGHmnYqs/eNZKI/6CK+K+Dn71UGuwoZZ4VDCYm6lGOl+AtQof2UPoWes1B09u5eorHbKBDCHNxyBdOXHbPXhJ9VZY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890969; c=relaxed/simple;
	bh=G7A4daDnIZmUBrGiK8VbVrFXofysLssg7zOYhJ4dJr8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S2pvaOkEh0OtsIi15CgQw3gPK6hFjpz7lif7lIK7JVjx8F7MYE7qwjQ3wzMqLHG2TFjHMqutEKmAfG6olor7ukCxWbbE8SJe5pyH4e8alHjU+zPl1GA7CxNR57Ml2K0Y6N48wS+rnsSOHF7lKwGwcd+kfgp4dJflDu9o0XP2oPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=LRBlxtXx; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VtIO3omn8+PnTjjnD8spJPG7DsNFFnKCkMyH1MFJ9iU=;
	b=LRBlxtXxNIhJUpIXnCI0UUrNFItuoyFQorrQRUdZrd/efDRrIa9FBhjtnlJESaBSGzxQs1CSM
	/z1ydjV90abpxBtjreG9cwQ44wc0KiK+S/l1VZoX45KemCZ+AW3x7pCvV1Hsto62RViiW314c2E
	4q3ASiodvKeF5Ix7Ei7gpeU=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4fBW9x4BbyzmVCn;
	Thu, 12 Feb 2026 18:04:37 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7224F4056D;
	Thu, 12 Feb 2026 18:09:17 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Feb
 2026 18:09:15 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <bhe@redhat.com>,
	<vgoyal@redhat.com>, <dyoung@redhat.com>, <rdunlap@infradead.org>,
	<kees@kernel.org>, <elver@google.com>, <paulmck@kernel.org>, <arnd@arndb.de>,
	<ruanjinjie@huawei.com>, <fvdl@google.com>, <thuth@redhat.com>,
	<ardb@kernel.org>, <leitao@debian.org>, <rppt@kernel.org>, <osandov@fb.com>,
	<cfsworks@gmail.com>, <sourabhjain@linux.ibm.com>, <ryan.roberts@arm.com>,
	<tangyouling@kylinos.cn>, <eajames@linux.ibm.com>, <hbathini@linux.ibm.com>,
	<ritesh.list@gmail.com>, <songshuaishuai@tinylab.org>, <bjorn@rivosinc.com>,
	<samuel.holland@sifive.com>, <kevin.brodsky@arm.com>,
	<junhui.liu@pigmoral.tech>, <vishal.moola@gmail.com>, <dwmw@amazon.co.uk>,
	<pbonzini@redhat.com>, <kai.huang@intel.com>, <ubizjak@gmail.com>,
	<coxu@redhat.com>, <fuqiang.wang@easystack.cn>, <liaoyuanhong@vivo.com>,
	<brgerst@gmail.com>, <jbohac@suse.cz>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<kexec@lists.infradead.org>
Subject: [PATCH v5 4/4] riscv: kexec: Add support for crashkernel CMA reservation
Date: Thu, 12 Feb 2026 18:10:01 +0800
Message-ID: <20260212101001.343158-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260212101001.343158-1-ruanjinjie@huawei.com>
References: <20260212101001.343158-1-ruanjinjie@huawei.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,google.com,arndb.de,huawei.com,debian.org,fb.com,kylinos.cn,tinylab.org,rivosinc.com,sifive.com,pigmoral.tech,amazon.co.uk,intel.com,easystack.cn,vivo.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-75906-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_GT_50(0.00)[65];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4E07F12C4A1
X-Rspamd-Action: no action

Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
crashkernel= command line option") and commit ab475510e042 ("kdump:
implement reserve_crashkernel_cma") added CMA support for kdump
crashkernel reservation. This allows the kernel to dynamically allocate
contiguous memory for crash dumping when needed, rather than permanently
reserving a fixed region at boot time.

So extend crashkernel CMA reservation support to riscv. The following
changes are made to enable CMA reservation:

- Parse and obtain the CMA reservation size along with other crashkernel
  parameters.
- Call reserve_crashkernel_cma() to allocate the CMA region for kdump.
- Include the CMA-reserved ranges for kdump kernel to use.
- Exclude the CMA-reserved ranges from the crash kernel memory to
  prevent them from being exported through /proc/vmcore, which is already
  done in the crash core.

Update kernel-parameters.txt to document CMA support for crashkernel on
riscv architecture.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 16 ++++++++--------
 arch/riscv/kernel/machine_kexec_file.c          | 14 +++++++++++++-
 arch/riscv/mm/init.c                            |  5 +++--
 3 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a2c7c22c60e4..037002b5b867 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1121,14 +1121,14 @@ Kernel parameters
 			It will be ignored when crashkernel=X,high is not used
 			or memory reserved is below 4G.
 	crashkernel=size[KMG],cma
-			[KNL, X86, ARM64, ppc] Reserve additional crash kernel memory from
-			CMA. This reservation is usable by the first system's
-			userspace memory and kernel movable allocations (memory
-			balloon, zswap). Pages allocated from this memory range
-			will not be included in the vmcore so this should not
-			be used if dumping of userspace memory is intended and
-			it has to be expected that some movable kernel pages
-			may be missing from the dump.
+			[KNL, X86, ARM64, RISCV, ppc] Reserve additional crash
+			kernel memory from CMA. This reservation is usable by
+			the first system's userspace memory and kernel movable
+			allocations (memory balloon, zswap). Pages allocated
+			from this memory range will not be included in the vmcore
+			so this should not be used if dumping of userspace memory
+			is intended and it has to be expected that some movable
+			kernel pages may be missing from the dump.
 
 			A standard crashkernel reservation, as described above,
 			is still needed to hold the crash kernel and initrd.
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 2f0e7bbeb2f0..bc10ff157cf0 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -64,8 +64,20 @@ static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
 
 int arch_prepare_elf64_ram_headers(struct crash_mem *cmem)
 {
+	int ret, i;
+
 	cmem->nr_ranges = 0;
-	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
+	ret = walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < crashk_cma_cnt; i++) {
+		cmem->ranges[cmem->nr_ranges].start = crashk_cma_ranges[i].start;
+		cmem->ranges[cmem->nr_ranges].end = crashk_cma_ranges[i].end;
+		cmem->nr_ranges++;
+	}
+
+	return 0;
 }
 
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index addb8a9305be..074d2d5f79ee 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1404,7 +1404,7 @@ static inline void setup_vm_final(void)
  */
 static void __init arch_reserve_crashkernel(void)
 {
-	unsigned long long low_size = 0;
+	unsigned long long low_size = 0, cma_size = 0;
 	unsigned long long crash_base, crash_size;
 	bool high = false;
 	int ret;
@@ -1414,11 +1414,12 @@ static void __init arch_reserve_crashkernel(void)
 
 	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
 				&crash_size, &crash_base,
-				&low_size, NULL, &high);
+				&low_size, &cma_size, &high);
 	if (ret)
 		return;
 
 	reserve_crashkernel_generic(crash_size, crash_base, low_size, high);
+	reserve_crashkernel_cma(cma_size);
 }
 
 void __init paging_init(void)
-- 
2.34.1


