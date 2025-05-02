Return-Path: <linux-doc+bounces-45026-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D3AAA66A4
	for <lists+linux-doc@lfdr.de>; Fri,  2 May 2025 00:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F01774C463B
	for <lists+linux-doc@lfdr.de>; Thu,  1 May 2025 22:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC67277026;
	Thu,  1 May 2025 22:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="si/VgPFx"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFD7279327
	for <linux-doc@vger.kernel.org>; Thu,  1 May 2025 22:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140126; cv=none; b=TjYpOOaA1DbTL+VClb/OfaZuutB5n3HrmVWI6CGVNtPs0cApnS30vAKKvho4+AH3uNDKDeuPkIzTTL6lcXkuSsB2RaA6zYEPYesFrMzbvl3QJxOtoyewbZuFJYtPVyFwmMFn1EriGmxCb5DwJiFY46zKddrMrfYHt7OtWEIvgu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140126; c=relaxed/simple;
	bh=06t98HDICDCgMl4HzFJp4ELtosyt/1PD7AifsRCrmEs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ILuhUiWXdi2CsTFiQxTz98ko9Qr6gdZIKUNak5luSDwWRv9R0zZCRb7zqMEU3sGAsEkanDkE88E79l8nP0MAyCy1+0VH4tcWVXcxkuvxWTz4F4i3JtjgnR0iHw++qKiCgrtqjk5pzGmKLWHsYHjgOgWwHT+HM8k/46uULxXhOrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=si/VgPFx; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7401179b06fso1305392b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 01 May 2025 15:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746140124; x=1746744924; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KCC7bKa/se6mYg+6T9wGzMiASCuQ0cecrMrt+P8VCow=;
        b=si/VgPFxV8/40tCs2LpSfhNbk1a43mc5D+QfC3vW589x0QOl4rJYxd9BWNGjEoPguI
         n91a/kgjS6EcDXzNrpywhfzN6BqAB8cRmAfT6caidl+8RV+fKu3ir1IQNRScrhMYRLAG
         724FrdZUNN+trc2RCfyd05iY+vKaiXhR3Rqm7VoXAoJhBnyBpJhDfZEz1Aj64qnLhStZ
         210KbNAYFZdvmwoahpbBx8NQgK9DJmOveXyGVX3jHQPULaTGDkLOhrMjd3rR0GJvxj7/
         j/EnuGVjr0YFgwBHTtT4k00e/fvX+b0rFq6epud3I9cidTFZRsGf3zdqRCZP2yHYnrNV
         Z1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140124; x=1746744924;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KCC7bKa/se6mYg+6T9wGzMiASCuQ0cecrMrt+P8VCow=;
        b=tPD4oVvejDp1mwvGGAEnTyLUC2P2kgzMJY9vr5QOzQbZOTXmcDseBQy/oTNf6umBIh
         m3rKzxe/5UTyIn6XNd4MjE0k9S1gdTGqj3M1ZXluyCujglNVxJBvYDDnrcd3q+9umGuY
         yK6ceEZCpeplFS37OOGEJkyJawzDkylg5WMEO3CWvIBc+Zc4YcPWVejw7Rb2i1/S+k8g
         vQFcte0L8f3quvyFQ2nzThzY5nHje3J6gtUnStlvv/a7cRMAbGHK4ApWUaE8FXCJUert
         P3mFF2lcmVZOSZv7xU8qLOSIKOgznCoM4sqLP/FjO/FpByYZC21wu1s4rKfWfDuP1G3J
         n4bw==
X-Forwarded-Encrypted: i=1; AJvYcCUl4e3H8EqTTGcQ/cbmYiFVzTltuMFbES952wHGV6HkTT6Q2s6w4vjZTnS8hpb1QZk27RlhrXePVWs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/0/DRcoGfzkhFFAXwPID4SGRPsMugjunTSNGJQnA2rAGRcfhh
	Yqh6me9Z/igdRJjuSvj/bKauO7fsGzKOhufNRIQLQ+NJ77xvzB1NfXox2GJMJ+/IpA/lcKWTN3H
	huJCFoaUlJaxtAMcquA==
X-Google-Smtp-Source: AGHT+IG+w15ETdCoK+fHMVjjNvznubiYgRmkIOBeTduHj1HNG9YRODcurbY+TyPTJCH95DRqbicgO/a5HkcDFdV/
X-Received: from pgbd25.prod.google.com ([2002:a63:4f19:0:b0:b15:84fa:ff1f])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:d527:b0:1f5:82ae:69d1 with SMTP id adf61e73a8af0-20cded43612mr889605637.20.1746140124601;
 Thu, 01 May 2025 15:55:24 -0700 (PDT)
Date: Thu,  1 May 2025 15:54:15 -0700
In-Reply-To: <20250501225425.635167-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501225425.635167-9-changyuanl@google.com>
Subject: [PATCH v7 08/18] kexec: add KHO support to kexec file loads
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: changyuanl@google.com, akpm@linux-foundation.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Alexander Graf <graf@amazon.com>

Kexec has 2 modes: A user space driven mode and a kernel driven mode.
For the kernel driven mode, kernel code determines the physical
addresses of all target buffers that the payload gets copied into.

With KHO, we can only safely copy payloads into the "scratch area".
Teach the kexec file loader about it, so it only allocates for that
area. In addition, enlighten it with support to ask the KHO subsystem
for its respective payloads to copy into target memory. Also teach the
KHO subsystem how to fill the images for file loads.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 include/linux/kexec.h   |  5 +++
 kernel/kexec_file.c     | 13 ++++++++
 kernel/kexec_handover.c | 67 +++++++++++++++++++++++++++++++++++++++++
 kernel/kexec_internal.h | 16 ++++++++++
 4 files changed, 101 insertions(+)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index c8971861521a5..075255de81543 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -371,6 +371,11 @@ struct kimage {
 	size_t ima_buffer_size;
 #endif
 
+	struct {
+		struct kexec_segment *scratch;
+		phys_addr_t fdt;
+	} kho;
+
 	/* Core ELF header buffer */
 	void *elf_headers;
 	unsigned long elf_headers_sz;
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index fba686487e3b5..77758c5331229 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -253,6 +253,11 @@ kimage_file_prepare_segments(struct kimage *image, int kernel_fd, int initrd_fd,
 	/* IMA needs to pass the measurement list to the next kernel. */
 	ima_add_kexec_buffer(image);
 
+	/* If KHO is active, add its images to the list */
+	ret = kho_fill_kimage(image);
+	if (ret)
+		goto out;
+
 	/* Call image load handler */
 	ldata = kexec_image_load_default(image);
 
@@ -648,6 +653,14 @@ int kexec_locate_mem_hole(struct kexec_buf *kbuf)
 	if (kbuf->mem != KEXEC_BUF_MEM_UNKNOWN)
 		return 0;
 
+	/*
+	 * If KHO is active, only use KHO scratch memory. All other memory
+	 * could potentially be handed over.
+	 */
+	ret = kho_locate_mem_hole(kbuf, locate_mem_hole_callback);
+	if (ret <= 0)
+		return ret;
+
 	if (!IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK))
 		ret = kexec_walk_resources(kbuf, locate_mem_hole_callback);
 	else
diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 3bf74b4960f84..ef21db6c59d51 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -26,6 +26,7 @@
  * internal APIs.
  */
 #include "../mm/internal.h"
+#include "kexec_internal.h"
 
 #define KHO_FDT_COMPATIBLE "kho-v1"
 #define PROP_PRESERVED_MEMORY_MAP "preserved-memory-map"
@@ -1192,3 +1193,69 @@ void __init kho_populate(phys_addr_t fdt_phys, u64 fdt_len,
 	if (err)
 		pr_warn("disabling KHO revival: %d\n", err);
 }
+
+/* Helper functions for kexec_file_load */
+
+int kho_fill_kimage(struct kimage *image)
+{
+	ssize_t scratch_size;
+	int err = 0;
+	struct kexec_buf scratch;
+
+	if (!kho_enable)
+		return 0;
+
+	image->kho.fdt = page_to_phys(kho_out.ser.fdt);
+
+	scratch_size = sizeof(*kho_scratch) * kho_scratch_cnt;
+	scratch = (struct kexec_buf){
+		.image = image,
+		.buffer = kho_scratch,
+		.bufsz = scratch_size,
+		.mem = KEXEC_BUF_MEM_UNKNOWN,
+		.memsz = scratch_size,
+		.buf_align = SZ_64K, /* Makes it easier to map */
+		.buf_max = ULONG_MAX,
+		.top_down = true,
+	};
+	err = kexec_add_buffer(&scratch);
+	if (err)
+		return err;
+	image->kho.scratch = &image->segment[image->nr_segments - 1];
+
+	return 0;
+}
+
+static int kho_walk_scratch(struct kexec_buf *kbuf,
+			    int (*func)(struct resource *, void *))
+{
+	int ret = 0;
+	int i;
+
+	for (i = 0; i < kho_scratch_cnt; i++) {
+		struct resource res = {
+			.start = kho_scratch[i].addr,
+			.end = kho_scratch[i].addr + kho_scratch[i].size - 1,
+		};
+
+		/* Try to fit the kimage into our KHO scratch region */
+		ret = func(&res, kbuf);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+int kho_locate_mem_hole(struct kexec_buf *kbuf,
+			int (*func)(struct resource *, void *))
+{
+	int ret;
+
+	if (!kho_enable || kbuf->image->type == KEXEC_TYPE_CRASH)
+		return 1;
+
+	ret = kho_walk_scratch(kbuf, func);
+
+	return ret == 1 ? 0 : -EADDRNOTAVAIL;
+}
diff --git a/kernel/kexec_internal.h b/kernel/kexec_internal.h
index d35d9792402d1..30a733a55a67b 100644
--- a/kernel/kexec_internal.h
+++ b/kernel/kexec_internal.h
@@ -39,4 +39,20 @@ extern size_t kexec_purgatory_size;
 #else /* CONFIG_KEXEC_FILE */
 static inline void kimage_file_post_load_cleanup(struct kimage *image) { }
 #endif /* CONFIG_KEXEC_FILE */
+
+struct kexec_buf;
+
+#ifdef CONFIG_KEXEC_HANDOVER
+int kho_locate_mem_hole(struct kexec_buf *kbuf,
+			int (*func)(struct resource *, void *));
+int kho_fill_kimage(struct kimage *image);
+#else
+static inline int kho_locate_mem_hole(struct kexec_buf *kbuf,
+				      int (*func)(struct resource *, void *))
+{
+	return 1;
+}
+
+static inline int kho_fill_kimage(struct kimage *image) { return 0; }
+#endif /* CONFIG_KEXEC_HANDOVER */
 #endif /* LINUX_KEXEC_INTERNAL_H */
-- 
2.49.0.906.g1f30a19c02-goog


