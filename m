Return-Path: <linux-doc+bounces-42889-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3EAA85335
	for <lists+linux-doc@lfdr.de>; Fri, 11 Apr 2025 07:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 557B89A5A8E
	for <lists+linux-doc@lfdr.de>; Fri, 11 Apr 2025 05:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E40E27F4FD;
	Fri, 11 Apr 2025 05:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JIR/nXO2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39F427F4DF
	for <linux-doc@vger.kernel.org>; Fri, 11 Apr 2025 05:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744349918; cv=none; b=EjqcroDFFot9A5uBOzy1oEZAHn2DslwWwlD6zEVPGyqQZwcv6oTHrvT7euBG9PuUuFT2HcQor4Ofvx9/WR0VbXsF1hDqzup4nlGyTkb4JgrvHOwdB6sKzXvtSnmfpXJ0vAPt+8eWIpTtNMzEHc63B+0MAn/F0E9NKCWGig0FoMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744349918; c=relaxed/simple;
	bh=rjICgeUIqy4q+6BA6gJjSL9PfHRSNpxlfOZzBViefZQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Vk0tz/fzqjW7LoF8jGy41z/HmZg2+zW3MZrmJ7PkzjuA+6nCK9A5ZFzhCxIZY8Vngq0RjwAqhR/9a9odn+AluOTsBa88tUJ6m6gH6clvPCE8DW4eFXzH9NG+/FJ/D0YcdP8xslx22Ol3+1Lfgbl9QY6Gp0tHLwrVHFtxcBJ3VRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JIR/nXO2; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2255ae39f8fso25014415ad.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Apr 2025 22:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744349916; x=1744954716; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XwVp4OOgPlRngbn5ra+015ZDy9PB79QtA1kcHgCX6xE=;
        b=JIR/nXO2Anwt3RYgl5HWlTOXA3NHOeJE8V8gU/xDJCIIe/p9DEfIcdOyL39mOEOm9+
         J4LBM6AJsOsK7MZ3wJdVin6Wm7nMarl/+Jclt9oosxqKuLoF84+03v3DdiGYB5eFPh48
         +KcRgtXGzwB5lXjZvUHACBopJHSvAEKfu7yGabVft4HvISQxHzPI/WcIY060NgxVfqNp
         GD+Pm2ScnvOVplIzsvYa4ROwdeM5LROBP2J41aYIU11e63hYaqp7hUG7sUPazLrqOoQf
         mIG/DVVN62UT67iahbvbs97UvUqbmMD8LnbFsu+8DZo7WmYIQs/DPThsEEWfgIVDsveQ
         CWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744349916; x=1744954716;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwVp4OOgPlRngbn5ra+015ZDy9PB79QtA1kcHgCX6xE=;
        b=f7nCbv5UzvKM/kfcADDHzAyG1m5ZpK7cAt4kP75SSQA2W8wLJgZv+nXYtz65Z2BLNf
         zCom4qoWla/P2AshgxVjg8Ft/20U0A+bwyalOdGCgrRjhTHMPW7axnm9NVnnkdG+Accm
         iMUeA+weE1gW8koRCbTWxRoTIScGEsqIyqFsnJbu3b173UlF3NplgnS2KEhrlA4XZ1o1
         49uywAp3Tcc5HVrhXW44FPU2UApumieRVK846iojdMsDwsInuJDE6C4i+REpbVgBmNLQ
         RNdzqt3IP/zPWZ6pp7O4Ts215ANtvTTcKQfr8qjpfBtmikx05j/fm80FdoM9X32FlybQ
         ygeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB8zV1bkXhO+jl7J3f/6YvIc3yGJy+s8//M+tuzjlQ2pKe9+ybGc6QKMOCjH3l9O9W3+ADqfF4cXU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6DrWPZxebEz/Qd5UECdtg1Acmka0lKEIMZruR40zCb+ox7Sce
	OuIDjKl/+Sk/Xfh9A/Smu7Avbgbe0Yn8N0xHg4PyTmP7mNgoJRU624gT/I0p+0OTY/zL21R2tfX
	Cc0M2Ryq1qeTVcTTLxQ==
X-Google-Smtp-Source: AGHT+IHxdPnuc2TYfLwCd9IDe8ouX7KQHFzd57k3DfleSG8BDX2oEcNCF76lTSltuytpC8emM71yRGFfu+F93+HC
X-Received: from plgf6.prod.google.com ([2002:a17:902:ce86:b0:223:fb3a:ac08])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ebcb:b0:21a:7e04:7021 with SMTP id d9443c01a7336-22bea0c6794mr26802705ad.24.1744349915769;
 Thu, 10 Apr 2025 22:38:35 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:37:40 -0700
In-Reply-To: <20250411053745.1817356-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250411053745.1817356-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250411053745.1817356-10-changyuanl@google.com>
Subject: [PATCH v6 09/14] arm64: add KHO support
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com, 
	graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de, robh@kernel.org, 
	rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	will@kernel.org, x86@kernel.org, Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Alexander Graf <graf@amazon.com>

We now have all bits in place to support KHO kexecs. Add awareness of
KHO in the kexec file as well as boot path for arm64 and adds the
respective kconfig option to the architecture so that it can use KHO
successfully.

Changes to the "chosen" node have been sent to
https://github.com/devicetree-org/dt-schema/pull/158.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 arch/arm64/Kconfig |  3 +++
 drivers/of/fdt.c   | 34 ++++++++++++++++++++++++++++++++++
 drivers/of/kexec.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08b..34c79f4fee3f9 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1602,6 +1602,9 @@ config ARCH_SUPPORTS_KEXEC_IMAGE_VERIFY_SIG
 config ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
 	def_bool y
 
+config ARCH_SUPPORTS_KEXEC_HANDOVER
+	def_bool y
+
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index aedd0e2dcd890..0edd639898a63 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -25,6 +25,7 @@
 #include <linux/serial_core.h>
 #include <linux/sysfs.h>
 #include <linux/random.h>
+#include <linux/kexec_handover.h>
 
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
@@ -875,6 +876,36 @@ void __init early_init_dt_check_for_usable_mem_range(void)
 		memblock_add(rgn[i].base, rgn[i].size);
 }
 
+/**
+ * early_init_dt_check_kho - Decode info required for kexec handover from DT
+ */
+static void __init early_init_dt_check_kho(void)
+{
+	unsigned long node = chosen_node_offset;
+	u64 fdt_start, fdt_size, scratch_start, scratch_size;
+	const __be32 *p;
+	int l;
+
+	if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER) || (long)node < 0)
+		return;
+
+	p = of_get_flat_dt_prop(node, "linux,kho-fdt", &l);
+	if (l != (dt_root_addr_cells + dt_root_size_cells) * sizeof(__be32))
+		return;
+
+	fdt_start = dt_mem_next_cell(dt_root_addr_cells, &p);
+	fdt_size = dt_mem_next_cell(dt_root_addr_cells, &p);
+
+	p = of_get_flat_dt_prop(node, "linux,kho-scratch", &l);
+	if (l != (dt_root_addr_cells + dt_root_size_cells) * sizeof(__be32))
+		return;
+
+	scratch_start = dt_mem_next_cell(dt_root_addr_cells, &p);
+	scratch_size = dt_mem_next_cell(dt_root_addr_cells, &p);
+
+	kho_populate(fdt_start, fdt_size, scratch_start, scratch_size);
+}
+
 #ifdef CONFIG_SERIAL_EARLYCON
 
 int __init early_init_dt_scan_chosen_stdout(void)
@@ -1169,6 +1200,9 @@ void __init early_init_dt_scan_nodes(void)
 
 	/* Handle linux,usable-memory-range property */
 	early_init_dt_check_for_usable_mem_range();
+
+	/* Handle kexec handover */
+	early_init_dt_check_kho();
 }
 
 bool __init early_init_dt_scan(void *dt_virt, phys_addr_t dt_phys)
diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index 5b924597a4deb..1ee2d31816aeb 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -264,6 +264,43 @@ static inline int setup_ima_buffer(const struct kimage *image, void *fdt,
 }
 #endif /* CONFIG_IMA_KEXEC */
 
+static int kho_add_chosen(const struct kimage *image, void *fdt, int chosen_node)
+{
+	int ret = 0;
+#ifdef CONFIG_KEXEC_HANDOVER
+	phys_addr_t fdt_mem = 0;
+	phys_addr_t fdt_len = 0;
+	phys_addr_t scratch_mem = 0;
+	phys_addr_t scratch_len = 0;
+
+	ret = fdt_delprop(fdt, chosen_node, "linux,kho-fdt");
+	if (ret && ret != -FDT_ERR_NOTFOUND)
+		return ret;
+	ret = fdt_delprop(fdt, chosen_node, "linux,kho-scratch");
+	if (ret && ret != -FDT_ERR_NOTFOUND)
+		return ret;
+
+	if (!image->kho.fdt || !image->kho.scratch)
+		return 0;
+
+	fdt_mem = image->kho.fdt;
+	fdt_len = PAGE_SIZE;
+	scratch_mem = image->kho.scratch->mem;
+	scratch_len = image->kho.scratch->bufsz;
+
+	pr_debug("Adding kho metadata to DT");
+
+	ret = fdt_appendprop_addrrange(fdt, 0, chosen_node, "linux,kho-fdt",
+				       fdt_mem, fdt_len);
+	if (ret)
+		return ret;
+	ret = fdt_appendprop_addrrange(fdt, 0, chosen_node, "linux,kho-scratch",
+				       scratch_mem, scratch_len);
+
+#endif /* CONFIG_KEXEC_HANDOVER */
+	return ret;
+}
+
 /*
  * of_kexec_alloc_and_setup_fdt - Alloc and setup a new Flattened Device Tree
  *
@@ -414,6 +451,11 @@ void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
 #endif
 	}
 
+	/* Add kho metadata if this is a KHO image */
+	ret = kho_add_chosen(image, fdt, chosen_node);
+	if (ret)
+		goto out;
+
 	/* add bootargs */
 	if (cmdline) {
 		ret = fdt_setprop_string(fdt, chosen_node, "bootargs", cmdline);
-- 
2.49.0.604.gff1f9ca942-goog


