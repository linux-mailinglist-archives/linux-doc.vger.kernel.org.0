Return-Path: <linux-doc+bounces-21648-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1E9940B65
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jul 2024 10:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9C381F24301
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jul 2024 08:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B428194C72;
	Tue, 30 Jul 2024 08:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BEBCQBC3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53A819412C;
	Tue, 30 Jul 2024 08:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722327899; cv=none; b=jaE3KQE8Fo5rA/bsr4rdpiWZIPrajHH44axq+Qwu+uZ4n4VLMD+bTQPF/AyhyqX2Tu/j/4ykLjosrQI41+v0HEGjkMliJbfYT3qhhKLN2riW3rA2M2dl8ghapQnu3P9NILpD1+DPHOKZv0RDwLhAiDCktfK0oAsRObRhFmLJuIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722327899; c=relaxed/simple;
	bh=i8MAVvp/EH/UEep57a1+QinRROJGgtj0YOEDhoGfyyU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TFU0g9ZPCi8kct3AyeSG1pxKgSvcQVXTUqxYzzSoKDG2CiJCQoPfz9T/V+yq9AkkLyqfBiHKeIT8XnjukVFF3CF888APCTDumNxXnRl9Cb75FTxhyGeMxdQzA1OYxEG9C9rSrGLV7JKr420KbHn0cBHyvuOqXg6ckxEqoDBL7Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=BEBCQBC3; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 2d7c89864e4d11efb5b96b43b535fdb4-20240730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gYgStmbZvjfBmYB1Py0PxIJNyoiDEwO5O7I+7Y+R+gk=;
	b=BEBCQBC3zqn3fBe/pz55nnySSAohHXsMYS8JbALevh2rodqyc9QH0rmDIJyl4eRupXJTRBAEdsR1gjvFd81dXPxIfDU6wLr3cqaLbXHlujxYOYprHzyvtABYDWuzTyDz0NeL2EucoMuLbVYp6OO7n6cNiyX3PypsEPrUerJCqFE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:20ba99d3-4f4d-40b7-8549-18dab4fa9470,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:6dc6a47,CLOUDID:41d0edd5-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2d7c89864e4d11efb5b96b43b535fdb4-20240730
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <liju-clr.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 595852185; Tue, 30 Jul 2024 16:24:45 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 30 Jul 2024 16:24:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 30 Jul 2024 16:24:38 +0800
From: Liju-clr Chen <liju-clr.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	"Catalin Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	"Steven Rostedt" <rostedt@goodmis.org>, Masami Hiramatsu
	<mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Richard Cochran <richardcochran@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Liju-clr Chen
	<Liju-clr.Chen@mediatek.com>, Yingshiuan Pan <Yingshiuan.Pan@mediatek.com>,
	Ze-yu Wang <Ze-yu.Wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-trace-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <PeiLun.Suei@mediatek.com>, Chi-shen Yeh
	<Chi-shen.Yeh@mediatek.com>, Kevenny Hsieh <Kevenny.Hsieh@mediatek.com>
Subject: [PATCH v12 14/24] virt: geniezone: Optimize performance of protected VM memory
Date: Tue, 30 Jul 2024 16:24:26 +0800
Message-ID: <20240730082436.9151-15-liju-clr.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240730082436.9151-1-liju-clr.chen@mediatek.com>
References: <20240730082436.9151-1-liju-clr.chen@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.074600-8.000000
X-TMASE-MatchedRID: BJPdprqM2v0Z6xRDKEbMaNiE0w2W/7Q3/Hd4CUWIS/FpG3YgOhBCuQjF
	DcaUmBsUpS2cZKjpLToO4n8yU3xhRxUBkTmMruyZhK8o4aoss8pKPIx+MJF9o99RlPzeVuQQ3oz
	JRX7b4NkmfcNIN7VbRo1dWY54wxAFmllju3jrF/fk7k9yXJiqqqX1XMd/Sqvu/NpLPdn/hpoxus
	Ts+1Wml74pbmY0xUgVJaKl+0U6UWPiimiHGwu19nV7tdtvoibaA5bHoxALwINRRWt1xglknYIV2
	4CuYj50lB6IdnaWhV0QPp8asBKmaqNu8YiLlIJQ4bl1FkKDELd9LQinZ4QefJOK2Na/r7MIF70J
	Bot7Y8+OhzOa6g8Krf72guZeNShm6wcvbhSRMMYbIhYrQ5sWAdIO0mwFbwp1RqQRUKA613Q30l9
	P97+NEPf7eWFbcEvsWN8ezso0RAdc1X6J/UO/DcGQYFMiVRG5ehcPPz6UzEWlb5ogMngNpHOTEn
	5IiRSOUASbXCnDmH6UTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.074600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B10339F6233B01F2E931FCF81E6DD1DB48749ACE1068B55AB92AEB7547E394C62000:8
X-MTK: N

From: Yingshiuan Pan <yingshiuan.pan@mediatek.com>

The memory protection mechanism performs better with batch operations on
memory pages. To leverage this, we pre-allocate memory for VMs that are
set to protected mode. As a result, the memory protection mechanism can
proactively protect the pre-allocated memory in advance through batch
operations, leading to improved performance during VM booting.

Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Co-developed-by: Jerry Wang <ze-yu.wang@mediatek.com>
Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
---
 arch/arm64/geniezone/vm.c             | 127 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/gzvm_drv.h |   1 +
 2 files changed, 128 insertions(+)

diff --git a/arch/arm64/geniezone/vm.c b/arch/arm64/geniezone/vm.c
index 00c74a4bcfd7..db16716f5b8d 100644
--- a/arch/arm64/geniezone/vm.c
+++ b/arch/arm64/geniezone/vm.c
@@ -11,6 +11,8 @@
 #include <linux/soc/mediatek/gzvm_drv.h>
 #include "gzvm_arch_common.h"
 
+#define PAR_PA47_MASK GENMASK_ULL(47, 12)
+
 /**
  * gzvm_hypcall_wrapper() - the wrapper for hvc calls
  * @a0: arguments passed in registers 0
@@ -201,6 +203,126 @@ static int gzvm_vm_ioctl_get_pvmfw_size(struct gzvm *gzvm,
 	return 0;
 }
 
+/**
+ * fill_constituents() - Populate pa to buffer until full
+ * @consti: Pointer to struct mem_region_addr_range.
+ * @consti_cnt: Constituent count.
+ * @max_nr_consti: Maximum number of constituent count.
+ * @gfn: Guest frame number.
+ * @total_pages: Total page numbers.
+ * @slot: Pointer to struct gzvm_memslot.
+ *
+ * Return: how many pages we've fill in, negative if error
+ */
+static int fill_constituents(struct mem_region_addr_range *consti,
+			     int *consti_cnt, int max_nr_consti, u64 gfn,
+			     u32 total_pages, struct gzvm_memslot *slot)
+{
+	u64 pfn = 0, prev_pfn = 0, gfn_end = 0;
+	int nr_pages = 0;
+	int i = -1;
+
+	if (unlikely(total_pages == 0))
+		return -EINVAL;
+	gfn_end = gfn + total_pages;
+
+	while (i < max_nr_consti && gfn < gfn_end) {
+		if (pfn == (prev_pfn + 1)) {
+			consti[i].pg_cnt++;
+		} else {
+			i++;
+			if (i >= max_nr_consti)
+				break;
+			consti[i].address = PFN_PHYS(pfn);
+			consti[i].pg_cnt = 1;
+		}
+		prev_pfn = pfn;
+		gfn++;
+		nr_pages++;
+	}
+	if (i != max_nr_consti)
+		i++;
+	*consti_cnt = i;
+
+	return nr_pages;
+}
+
+/**
+ * gzvm_vm_populate_mem_region() - Iterate all mem slot and populate pa to
+ * buffer until it's full
+ * @gzvm: Pointer to struct gzvm.
+ * @slot_id: Memory slot id to be populated.
+ *
+ * Return: 0 if it is successful, negative if error
+ */
+int gzvm_vm_populate_mem_region(struct gzvm *gzvm, int slot_id)
+{
+	struct gzvm_memslot *memslot = &gzvm->memslot[slot_id];
+	struct gzvm_memory_region_ranges *region;
+	int max_nr_consti, remain_pages;
+	u64 gfn, gfn_end;
+	u32 buf_size;
+
+	buf_size = PAGE_SIZE * 2;
+	region = alloc_pages_exact(buf_size, GFP_KERNEL);
+	if (!region)
+		return -ENOMEM;
+
+	max_nr_consti = (buf_size - sizeof(*region)) /
+			sizeof(struct mem_region_addr_range);
+
+	region->slot = memslot->slot_id;
+	remain_pages = memslot->npages;
+	gfn = memslot->base_gfn;
+	gfn_end = gfn + remain_pages;
+
+	while (gfn < gfn_end) {
+		int nr_pages;
+
+		nr_pages = fill_constituents(region->constituents,
+					     &region->constituent_cnt,
+					     max_nr_consti, gfn,
+					     remain_pages, memslot);
+
+		if (nr_pages < 0) {
+			pr_err("Failed to fill constituents\n");
+			free_pages_exact(region, buf_size);
+			return -EFAULT;
+		}
+
+		region->gpa = PFN_PHYS(gfn);
+		region->total_pages = nr_pages;
+		remain_pages -= nr_pages;
+		gfn += nr_pages;
+
+		if (gzvm_arch_set_memregion(gzvm->vm_id, buf_size,
+					    virt_to_phys(region))) {
+			pr_err("Failed to register memregion to hypervisor\n");
+			free_pages_exact(region, buf_size);
+			return -EFAULT;
+		}
+	}
+	free_pages_exact(region, buf_size);
+
+	return 0;
+}
+
+static int populate_all_mem_regions(struct gzvm *gzvm)
+{
+	int ret, i;
+
+	for (i = 0; i < GZVM_MAX_MEM_REGION; i++) {
+		if (gzvm->memslot[i].npages == 0)
+			continue;
+
+		ret = gzvm_vm_populate_mem_region(gzvm, i);
+		if (ret != 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * gzvm_vm_ioctl_cap_pvm() - Proceed GZVM_CAP_PROTECTED_VM's subcommands
  * @gzvm: Pointer to struct gzvm.
@@ -222,6 +344,11 @@ static int gzvm_vm_ioctl_cap_pvm(struct gzvm *gzvm,
 	case GZVM_CAP_PVM_SET_PVMFW_GPA:
 		fallthrough;
 	case GZVM_CAP_PVM_SET_PROTECTED_VM:
+		/*
+		 * To improve performance for protected VM, we have to populate VM's memory
+		 * before VM booting
+		 */
+		populate_all_mem_regions(gzvm);
 		ret = gzvm_vm_arch_enable_cap(gzvm, cap, &res);
 		return ret;
 	case GZVM_CAP_PVM_GET_PVMFW_SIZE:
diff --git a/include/linux/soc/mediatek/gzvm_drv.h b/include/linux/soc/mediatek/gzvm_drv.h
index 982463eea4f6..54ac91670611 100644
--- a/include/linux/soc/mediatek/gzvm_drv.h
+++ b/include/linux/soc/mediatek/gzvm_drv.h
@@ -159,6 +159,7 @@ int gzvm_vm_ioctl_arch_enable_cap(struct gzvm *gzvm,
 
 int gzvm_gfn_to_hva_memslot(struct gzvm_memslot *memslot, u64 gfn,
 			    u64 *hva_memslot);
+int gzvm_vm_populate_mem_region(struct gzvm *gzvm, int slot_id);
 
 int gzvm_vm_ioctl_create_vcpu(struct gzvm *gzvm, u32 cpuid);
 int gzvm_arch_vcpu_update_one_reg(struct gzvm_vcpu *vcpu, __u64 reg_id,
-- 
2.18.0


