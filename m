Return-Path: <linux-doc+bounces-90267-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Hb2CNxYHWpLZQkAu9opvQ
	(envelope-from <linux-doc+bounces-90267-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 12:03:08 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EA361CFA7
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 12:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B096A31282A5
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jun 2026 09:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552813AE1B9;
	Mon,  1 Jun 2026 09:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="r9ZH1ej6"
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435B839DBF9;
	Mon,  1 Jun 2026 09:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307401; cv=none; b=Xv4bW07ay0TqputbYJp0zQw7ukiTvOqbpDIeXd5Yok+ZpjIPK2paY/lBOQT8dYIka+wVa4l2DmA51jaE57fLPORTz4f1sITCM5voCdffT6TvpprsyrnGNhRTMMA1ZNuDmSdVYJY/sZoNWAwTSSRq1E7OI2sL8PRt8B2trBxWb9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307401; c=relaxed/simple;
	bh=1RE0ggCL1H2sdgdLvrLrLZEad9yWGiCCsWwC54raKX0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dXGlSJkAw2+1Xe5LUScdRU715hKmmhzmedA9ZB11ijBXgmXUwVmw+dsje2jP6w1BWlM3MA6/IN9kMQvqeASuQMtMtqCMb+H0MpnBgqKV5dx6R3FyL68EHxTGGbqMZlk+PUwTpsaltEElSm+EGt5mKZSkdqAiEwygLisIUQP4k4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=r9ZH1ej6; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VWBV2U5yMqcbh55EfObhiotNmBAp32Br2+ez2EoTpng=;
	b=r9ZH1ej6irADfT920XCGsNsznQD6yaMW19Luu1KKuC4Ox05HYGKMHMLbII4nYiAtxt+71DWk0
	1DM+CHqbX5q/kzgSTvf7G65UhYBCRcchDTXMVus5Ri3KMrBxZEbUz1D6gP0zk1Fpt0/im4+E3Ey
	ER+lFBDEgbNoYLR/APqpYQE=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gTTWX1QtdzLlwm;
	Mon,  1 Jun 2026 17:42:00 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 8591A40563;
	Mon,  1 Jun 2026 17:49:48 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 1 Jun
 2026 17:49:44 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <rppt@kernel.org>,
	<pasha.tatashin@soleen.com>, <pratyush@kernel.org>, <ruirui.yang@linux.dev>,
	<rdunlap@infradead.org>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<kuba@kernel.org>, <lirongqing@baidu.com>, <ebiggers@kernel.org>,
	<paulmck@kernel.org>, <sourabhjain@linux.ibm.com>, <thuth@redhat.com>,
	<ardb@kernel.org>, <masahiroy@kernel.org>, <gshan@redhat.com>,
	<james.morse@arm.com>, <maz@kernel.org>, <leitao@debian.org>,
	<yeoreum.yun@arm.com>, <coxu@redhat.com>, <suzuki.poulose@arm.com>,
	<cfsworks@gmail.com>, <osandov@fb.com>, <jbohac@suse.cz>,
	<ryan.roberts@arm.com>, <tangyouling@kylinos.cn>, <ritesh.list@gmail.com>,
	<adityag@linux.ibm.com>, <hbathini@linux.ibm.com>, <bjorn@rivosinc.com>,
	<songshuaishuai@tinylab.org>, <vishal.moola@gmail.com>,
	<junhui.liu@pigmoral.tech>, <djordje.todorovic@htecgroup.com>,
	<austin.kim@lge.com>, <namcao@linutronix.de>, <djbw@kernel.org>,
	<chao.gao@intel.com>, <seanjc@google.com>, <fuqiang.wang@easystack.cn>,
	<liaoyuanhong@vivo.com>, <makb@juniper.net>, <graf@amazon.com>,
	<piliu@redhat.com>, <rafael.j.wysocki@intel.com>,
	<mario.limonciello@amd.com>, <jbouron@amazon.com>, <chenjiahao16@huawei.com>,
	<guoren@kernel.org>, <bauerman@linux.ibm.com>, <bgwin@google.com>,
	<takahiro.akashi@linaro.org>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v15 19/23] LoongArch: kexec_file: Use crash_prepare_headers() helper to simplify code
Date: Mon, 1 Jun 2026 17:48:01 +0800
Message-ID: <20260601094805.2928614-20-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260601094805.2928614-1-ruanjinjie@huawei.com>
References: <20260601094805.2928614-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Spamd-Result: default: False [4.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUSPICIOUS_URL_IN_SUSPICIOUS_MESSAGE(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	URIBL_RED(0.50)[kylinos.cn:email];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	HAS_ANON_DOMAIN(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	TAGGED_FROM(0.00)[bounces-90267-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[huawei.com:s=dkim];
	RCVD_COUNT_FIVE(0.00)[6];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,soleen.com,linux.dev,infradead.org,linux.alibaba.com,google.com,baidu.com,debian.org,fb.com,suse.cz,kylinos.cn,rivosinc.com,tinylab.org,pigmoral.tech,htecgroup.com,lge.com,linutronix.de,intel.com,easystack.cn,vivo.com,juniper.net,amazon.com,amd.com,huawei.com,linaro.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_GT_50(0.00)[88];
	DKIM_TRACE(0.00)[huawei.com:+];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.838];
	DMARC_POLICY_ALLOW(0.00)[huawei.com,quarantine];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 97EA361CFA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the newly introduced crash_prepare_headers() function to replace
the existing prepare_elf_headers(), allocate cmem and exclude crash kernel
memory in the crash core, which reduce code duplication.

Only the following two architecture functions need to be implemented:
- arch_get_system_nr_ranges(). Use for_each_mem_range to traverse
  and pre-count the max number of memory ranges.

- arch_crash_populate_cmem(). Use for_each_mem_range to traverse
  and collect the memory ranges and fills them into cmem.

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Youling Tang <tangyouling@kylinos.cn>
Cc: Baoquan He <bhe@redhat.com>
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Acked-by: Baoquan He <bhe@redhat.com>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/loongarch/kernel/machine_kexec_file.c | 48 +++++++---------------
 1 file changed, 15 insertions(+), 33 deletions(-)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 3c369124586e..f3101bea9e45 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -56,52 +56,34 @@ static void cmdline_add_initrd(struct kimage *image, unsigned long *cmdline_tmpl
 }
 
 #ifdef CONFIG_CRASH_DUMP
-
-static int prepare_elf_headers(void **addr, unsigned long *sz)
+unsigned int arch_get_system_nr_ranges(void)
 {
-	int ret, nr_ranges;
-	uint64_t i;
+	/* for exclusion of crashkernel region */
+	int nr_ranges = 2 + CRASH_HOTPLUG_SAFETY_PADDING;
 	phys_addr_t start, end;
-	struct crash_mem *cmem;
+	uint64_t i;
 
-	/* for exclusion of crashkernel region */
-	nr_ranges = 2 + CRASH_HOTPLUG_SAFETY_PADDING;
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
 
-	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
-	if (!cmem)
-		return -ENOMEM;
+	return nr_ranges;
+}
+
+int arch_crash_populate_cmem(struct crash_mem *cmem)
+{
+	phys_addr_t start, end;
+	uint64_t i;
 
-	cmem->max_nr_ranges = nr_ranges;
-	cmem->nr_ranges = 0;
 	for_each_mem_range(i, &start, &end) {
-		if (unlikely(cmem->nr_ranges >= cmem->max_nr_ranges)) {
-			ret = -EAGAIN;
-			goto out;
-		}
+		if (unlikely(cmem->nr_ranges >= cmem->max_nr_ranges))
+			return -EAGAIN;
 
 		cmem->ranges[cmem->nr_ranges].start = start;
 		cmem->ranges[cmem->nr_ranges].end = end - 1;
 		cmem->nr_ranges++;
 	}
 
-	/* Exclude crashkernel region */
-	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
-	if (ret < 0)
-		goto out;
-
-	if (crashk_low_res.end) {
-		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
-		if (ret < 0)
-			goto out;
-	}
-
-	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
-
-out:
-	kfree(cmem);
-	return ret;
+	return 0;
 }
 
 /*
@@ -169,7 +151,7 @@ int load_other_segments(struct kimage *image,
 		void *headers;
 		unsigned long headers_sz;
 
-		ret = prepare_elf_headers(&headers, &headers_sz);
+		ret = crash_prepare_headers(true, &headers, &headers_sz, NULL);
 		if (ret < 0) {
 			pr_err("Preparing elf core header failed\n");
 			goto out_err;
-- 
2.34.1


