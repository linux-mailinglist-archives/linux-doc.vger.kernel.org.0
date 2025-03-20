Return-Path: <linux-doc+bounces-41396-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4292A69DF6
	for <lists+linux-doc@lfdr.de>; Thu, 20 Mar 2025 02:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B9BC3BEFC4
	for <lists+linux-doc@lfdr.de>; Thu, 20 Mar 2025 01:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D31C1DFE22;
	Thu, 20 Mar 2025 01:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PdWDc/nn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DC71DF985
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 01:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742435785; cv=none; b=ouBP3IZtKFjhx7m+mpObf6C8mq6Rd6Y1Z2+TWiILrny4v0AkBkg5K47TF8V6ot4fBdEf7yH0UnlM+W2FXiOYDX4s1Uw2SLvYe5W1KoPCEya1obKM+OG3smTp5n52MUJFTfK8xVzS4oJmAxPJjIsL9HA379RPeuLD/DTmt0IMdAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742435785; c=relaxed/simple;
	bh=hfq64nMxgExfbsN7NEEFTnMtJCg3ykSErR6X6YSnQKY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M4lCQPXD4hl9/WN2EK8/iRgWXqSUxTdYdz8MnUfrGIaTcrrTTBIZMLlfmOfIEF36AxvTOltb38PspRNF0BBHRvz5vr7Rhr93DvG3Gq3qfqaWjHU8QWmTGclQpg0EuF8Avxe1lBcz1TPMAM1AzWzqfWWgP/s9DC+SuC0qG85BN8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PdWDc/nn; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff58318acaso846560a91.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 18:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742435783; x=1743040583; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QmV5BWqKnlxPhrRMqlARz/TZT0WTjCpLvcGNlHyxpKs=;
        b=PdWDc/nnfup5NuRz9AI3ve+Wm9yPSHyBiDTNN8rFhuHdxmLO06s74M/fQd3t8gN8BR
         GcRZExNum+yKqaayi+a67jPoATvGoQXzVy2ZsSnm/Pu5Dy/Lo5y3/ZT7IB7ymdJ3RHwU
         oSKNqtXg76osPorTkqotAzf5hd9+9xpLGpuLPNDj41tE3xW2RDF+KC7z0QQmEvNNhE43
         25w7P9I8LcdCmzzUv3JjyGfAuATjoU8TtY6QVgC2BvIhryfIFX9P+aRYcSFGn8/ILLPB
         +91SDikAi8LtE5GhU9UKjYyZmFw0gworMnVN7Pwt3NxIt7hZvlv+re2NB8u2A9/BrB/4
         CK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742435783; x=1743040583;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QmV5BWqKnlxPhrRMqlARz/TZT0WTjCpLvcGNlHyxpKs=;
        b=qZ57n+kuhXpGQB/lEwg9Hy/SE9DDRQY933B5soKSGWRX82HBS0gSPAYxh8nu+7qwBi
         IVrHYlLlielWeHQEL/L+XhR3de8tZWcq5uhwNApeLzMELVwZJK/s+Qjyv3BTgejoormp
         Rvpa2Td7x7jqDrw3ZL0do4aj1P9A0ilBabQu+KJEHtxmsrS2JgBilGhnctmHgjIvwrJ7
         8SQWq0inJbiU1LsNnT+7fZSm6ZifHBdw7CS8JFFRUJ3AxQ6AH3mRDrW7aRer4AXcpktE
         H/7Xb4ApCdajPQ93J9u3q23k1T/jrIpgJ1//5tBHGkT6JOiD8VozQX6c8tCxeQHD02M+
         teDA==
X-Forwarded-Encrypted: i=1; AJvYcCXIcqXrcpR9sQTbzoFW2LQ21XcGm715SVUyp7uhCWXAZNnLXSlgpC0PiSZoR2tH9nMNNeFC703zAY4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc7L5isJT6Z+ry8yz8/lbb+yoRLvFz/ExaU3XRrbclJpDlrKf8
	nQSbT7qHGeVRuJR5dDCKf4NZrjMcz03MAkyB5CRyYlhVWdFbp+NtzQsZyUEBHnLK4YrsHSKCTK7
	BYXv7dmB6WFTu9Ehmsw==
X-Google-Smtp-Source: AGHT+IFcz6xgCpsdaGMV/lA4NVDUFar/eMRSs8b1l17t60oWu+KTL3OhVFDVjETsYQaFDiZdylma2/Q1A+VwCJiL
X-Received: from pjbrr14.prod.google.com ([2002:a17:90b:2b4e:b0:2ef:82c0:cb8d])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1f86:b0:301:6343:1626 with SMTP id 98e67ed59e1d1-301d507fab7mr2148203a91.1.1742435782874;
 Wed, 19 Mar 2025 18:56:22 -0700 (PDT)
Date: Wed, 19 Mar 2025 18:55:49 -0700
In-Reply-To: <20250320015551.2157511-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250320015551.2157511-15-changyuanl@google.com>
Subject: [PATCH v5 14/16] x86: add KHO support
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	dave.hansen@linux.intel.com, dwmw2@infradead.org, ebiederm@xmission.com, 
	mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, krzk@kernel.org, 
	rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org, tglx@linutronix.de, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, will@kernel.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org, Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Alexander Graf <graf@amazon.com>

We now have all bits in place to support KHO kexecs. This patch adds
awareness of KHO in the kexec file as well as boot path for x86 and
adds the respective kconfig option to the architecture so that it can
use KHO successfully.

In addition, it enlightens it decompression code with KHO so that its
KASLR location finder only considers memory regions that are not already
occupied by KHO memory.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 arch/x86/Kconfig                       |  3 ++
 arch/x86/boot/compressed/kaslr.c       | 52 +++++++++++++++++++++++++-
 arch/x86/include/asm/setup.h           |  4 ++
 arch/x86/include/uapi/asm/setup_data.h | 13 ++++++-
 arch/x86/kernel/e820.c                 | 18 +++++++++
 arch/x86/kernel/kexec-bzimage64.c      | 36 ++++++++++++++++++
 arch/x86/kernel/setup.c                | 25 +++++++++++++
 arch/x86/realmode/init.c               |  2 +
 include/linux/kexec_handover.h         | 13 +++++--
 9 files changed, 161 insertions(+), 5 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 0e27ebd7e36a..acd180e3002f 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2091,6 +2091,9 @@ config ARCH_SUPPORTS_KEXEC_BZIMAGE_VERIFY_SIG
 config ARCH_SUPPORTS_KEXEC_JUMP
 	def_bool y
 
+config ARCH_SUPPORTS_KEXEC_HANDOVER
+	def_bool y
+
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool X86_64 || (X86_32 && HIGHMEM)
 
diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
index f03d59ea6e40..ff1168881016 100644
--- a/arch/x86/boot/compressed/kaslr.c
+++ b/arch/x86/boot/compressed/kaslr.c
@@ -760,6 +760,55 @@ static void process_e820_entries(unsigned long minimum,
 	}
 }
 
+/*
+ * If KHO is active, only process its scratch areas to ensure we are not
+ * stepping onto preserved memory.
+ */
+#ifdef CONFIG_KEXEC_HANDOVER
+static bool process_kho_entries(unsigned long minimum, unsigned long image_size)
+{
+	struct kho_scratch *kho_scratch;
+	struct setup_data *ptr;
+	int i, nr_areas = 0;
+
+	ptr = (struct setup_data *)(unsigned long)boot_params_ptr->hdr.setup_data;
+	while (ptr) {
+		if (ptr->type == SETUP_KEXEC_KHO) {
+			struct kho_data *kho = (struct kho_data *)ptr->data;
+
+			kho_scratch = (void *)kho->scratch_addr;
+			nr_areas = kho->scratch_size / sizeof(*kho_scratch);
+
+			break;
+		}
+
+		ptr = (struct setup_data *)(unsigned long)ptr->next;
+	}
+
+	if (!nr_areas)
+		return false;
+
+	for (i = 0; i < nr_areas; i++) {
+		struct kho_scratch *area = &kho_scratch[i];
+		struct mem_vector region = {
+			.start = area->addr,
+			.size = area->size,
+		};
+
+		if (process_mem_region(&region, minimum, image_size))
+			break;
+	}
+
+	return true;
+}
+#else
+static inline bool process_kho_entries(unsigned long minimum,
+				       unsigned long image_size)
+{
+	return false;
+}
+#endif
+
 static unsigned long find_random_phys_addr(unsigned long minimum,
 					   unsigned long image_size)
 {
@@ -775,7 +824,8 @@ static unsigned long find_random_phys_addr(unsigned long minimum,
 		return 0;
 	}
 
-	if (!process_efi_entries(minimum, image_size))
+	if (!process_kho_entries(minimum, image_size) &&
+	    !process_efi_entries(minimum, image_size))
 		process_e820_entries(minimum, image_size);
 
 	phys_addr = slots_fetch_random();
diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index 85f4fde3515c..70e045321d4b 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -66,6 +66,10 @@ extern void x86_ce4100_early_setup(void);
 static inline void x86_ce4100_early_setup(void) { }
 #endif
 
+#ifdef CONFIG_KEXEC_HANDOVER
+#include <linux/kexec_handover.h>
+#endif
+
 #ifndef _SETUP
 
 #include <asm/espfix.h>
diff --git a/arch/x86/include/uapi/asm/setup_data.h b/arch/x86/include/uapi/asm/setup_data.h
index b111b0c18544..c258c37768ee 100644
--- a/arch/x86/include/uapi/asm/setup_data.h
+++ b/arch/x86/include/uapi/asm/setup_data.h
@@ -13,7 +13,8 @@
 #define SETUP_CC_BLOB			7
 #define SETUP_IMA			8
 #define SETUP_RNG_SEED			9
-#define SETUP_ENUM_MAX			SETUP_RNG_SEED
+#define SETUP_KEXEC_KHO			10
+#define SETUP_ENUM_MAX			SETUP_KEXEC_KHO
 
 #define SETUP_INDIRECT			(1<<31)
 #define SETUP_TYPE_MAX			(SETUP_ENUM_MAX | SETUP_INDIRECT)
@@ -78,6 +79,16 @@ struct ima_setup_data {
 	__u64 size;
 } __attribute__((packed));
 
+/*
+ * Locations of kexec handover metadata
+ */
+struct kho_data {
+	__u64 dt_addr;
+	__u64 dt_size;
+	__u64 scratch_addr;
+	__u64 scratch_size;
+} __attribute__((packed));
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _UAPI_ASM_X86_SETUP_DATA_H */
diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 82b96ed9890a..0b81cd70b02a 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -1329,6 +1329,24 @@ void __init e820__memblock_setup(void)
 		memblock_add(entry->addr, entry->size);
 	}
 
+	/*
+	 * At this point with KHO we only allocate from scratch memory.
+	 * At the same time, we configure memblock to only allow
+	 * allocations from memory below ISA_END_ADDRESS which is not
+	 * a natural scratch region, because Linux ignores memory below
+	 * ISA_END_ADDRESS at runtime. Beside very few (if any) early
+	 * allocations, we must allocate real-mode trapoline below
+	 * ISA_END_ADDRESS.
+	 *
+	 * To make sure that we can actually perform allocations during
+	 * this phase, let's mark memory below ISA_END_ADDRESS as scratch
+	 * so we can allocate from there in a scratch-only world.
+	 *
+	 * After real mode trampoline is allocated, we clear scratch
+	 * marking from the memory below ISA_END_ADDRESS
+	 */
+	memblock_mark_kho_scratch(0, ISA_END_ADDRESS);
+
 	/* Throw away partial pages: */
 	memblock_trim_memory(PAGE_SIZE);
 
diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
index 68530fad05f7..09d6a068b14c 100644
--- a/arch/x86/kernel/kexec-bzimage64.c
+++ b/arch/x86/kernel/kexec-bzimage64.c
@@ -233,6 +233,31 @@ setup_ima_state(const struct kimage *image, struct boot_params *params,
 #endif /* CONFIG_IMA_KEXEC */
 }
 
+static void setup_kho(const struct kimage *image, struct boot_params *params,
+		      unsigned long params_load_addr,
+		      unsigned int setup_data_offset)
+{
+#ifdef CONFIG_KEXEC_HANDOVER
+	struct setup_data *sd = (void *)params + setup_data_offset;
+	struct kho_data *kho = (void *)sd + sizeof(*sd);
+
+	sd->type = SETUP_KEXEC_KHO;
+	sd->len = sizeof(struct kho_data);
+
+	/* Only add if we have all KHO images in place */
+	if (!image->kho.fdt || !image->kho.scratch)
+		return;
+
+	/* Add setup data */
+	kho->dt_addr = image->kho.fdt->mem;
+	kho->dt_size = image->kho.fdt->memsz;
+	kho->scratch_addr = image->kho.scratch->mem;
+	kho->scratch_size = image->kho.scratch->bufsz;
+	sd->next = params->hdr.setup_data;
+	params->hdr.setup_data = params_load_addr + setup_data_offset;
+#endif /* CONFIG_KEXEC_HANDOVER */
+}
+
 static int
 setup_boot_parameters(struct kimage *image, struct boot_params *params,
 		      unsigned long params_load_addr,
@@ -312,6 +337,13 @@ setup_boot_parameters(struct kimage *image, struct boot_params *params,
 				     sizeof(struct ima_setup_data);
 	}
 
+	if (IS_ENABLED(CONFIG_KEXEC_HANDOVER)) {
+		/* Setup space to store preservation metadata */
+		setup_kho(image, params, params_load_addr, setup_data_offset);
+		setup_data_offset += sizeof(struct setup_data) +
+				     sizeof(struct kho_data);
+	}
+
 	/* Setup RNG seed */
 	setup_rng_seed(params, params_load_addr, setup_data_offset);
 
@@ -479,6 +511,10 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
 		kbuf.bufsz += sizeof(struct setup_data) +
 			      sizeof(struct ima_setup_data);
 
+	if (IS_ENABLED(CONFIG_KEXEC_HANDOVER))
+		kbuf.bufsz += sizeof(struct setup_data) +
+			      sizeof(struct kho_data);
+
 	params = kzalloc(kbuf.bufsz, GFP_KERNEL);
 	if (!params)
 		return ERR_PTR(-ENOMEM);
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index ead370570eb2..e2c54181405b 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -385,6 +385,28 @@ int __init ima_get_kexec_buffer(void **addr, size_t *size)
 }
 #endif
 
+static void __init add_kho(u64 phys_addr, u32 data_len)
+{
+#ifdef CONFIG_KEXEC_HANDOVER
+	struct kho_data *kho;
+	u64 addr = phys_addr + sizeof(struct setup_data);
+	u64 size = data_len - sizeof(struct setup_data);
+
+	kho = early_memremap(addr, size);
+	if (!kho) {
+		pr_warn("setup: failed to memremap kho data (0x%llx, 0x%llx)\n",
+			addr, size);
+		return;
+	}
+
+	kho_populate(kho->dt_addr, kho->scratch_addr, kho->scratch_size);
+
+	early_memunmap(kho, size);
+#else
+	pr_warn("Passed KHO data, but CONFIG_KEXEC_HANDOVER not set. Ignoring.\n");
+#endif
+}
+
 static void __init parse_setup_data(void)
 {
 	struct setup_data *data;
@@ -413,6 +435,9 @@ static void __init parse_setup_data(void)
 		case SETUP_IMA:
 			add_early_ima_buffer(pa_data);
 			break;
+		case SETUP_KEXEC_KHO:
+			add_kho(pa_data, data_len);
+			break;
 		case SETUP_RNG_SEED:
 			data = early_memremap(pa_data, data_len);
 			add_bootloader_randomness(data->data, data->len);
diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
index f9bc444a3064..9b9f4534086d 100644
--- a/arch/x86/realmode/init.c
+++ b/arch/x86/realmode/init.c
@@ -65,6 +65,8 @@ void __init reserve_real_mode(void)
 	 * setup_arch().
 	 */
 	memblock_reserve(0, SZ_1M);
+
+	memblock_clear_kho_scratch(0, SZ_1M);
 }
 
 static void __init sme_sev_setup_real_mode(struct trampoline_header *th)
diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.h
index d52a7b500f4c..2dd51a77d56c 100644
--- a/include/linux/kexec_handover.h
+++ b/include/linux/kexec_handover.h
@@ -3,9 +3,6 @@
 #define LINUX_KEXEC_HANDOVER_H
 
 #include <linux/types.h>
-#include <linux/hashtable.h>
-#include <linux/notifier.h>
-#include <linux/mm_types.h>
 
 struct kho_scratch {
 	phys_addr_t addr;
@@ -18,6 +15,15 @@ enum kho_event {
 	KEXEC_KHO_UNFREEZE = 1,
 };
 
+#ifdef _SETUP
+struct notifier_block;
+struct kho_node;
+struct folio;
+#else
+#include <linux/notifier.h>
+#include <linux/hashtable.h>
+#include <linux/mm_types.h>
+
 #define KHO_HASHTABLE_BITS 3
 #define KHO_NODE_INIT                                        \
 	{                                                    \
@@ -35,6 +41,7 @@ struct kho_node {
 	struct list_head list;
 	bool visited;
 };
+#endif /* _SETUP */
 
 struct kho_in_node {
 	int offset;
-- 
2.48.1.711.g2feabab25a-goog


