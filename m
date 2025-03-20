Return-Path: <linux-doc+bounces-41392-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFE0A69DE7
	for <lists+linux-doc@lfdr.de>; Thu, 20 Mar 2025 02:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7435119C1FD4
	for <lists+linux-doc@lfdr.de>; Thu, 20 Mar 2025 01:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED871EB1A8;
	Thu, 20 Mar 2025 01:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FrFOxKgV"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE421DE892
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 01:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742435778; cv=none; b=fILL+OaJWNY/w1uGGPyV5BvCXl1M72jySoH6Xl9bBuSb3q2HtZLJYRXN6U5rB9LO8IOwVBQdw4Bz6tMI8i5Pe4RIlGRdffX8H4E1JAFcpPFV+I7n8q8Dbko/nSCE39Xmd9t9GQa/geH9zDnkF3Rnr7uuaNLdv7g8Ij1m2CklLUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742435778; c=relaxed/simple;
	bh=YduT0zZZwUKZCM0bZLy9u+Av8YFPM7RHq5fs4VHJw6s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=umPmR9Jm9VxH4suB/FqokK7xXbsedvQG2LycS7CBv/thy9sSgqto7v8WO3uhrQy9MSfzeJ3A+zhA8Nz0mPqlCEgTBISzsUl0tBzRNz0pEfZ6tBoNrVDTVXWU7X2z0Nt8yaA3sAthU7cA0AwiCT1iv0kTRzXaUh3MPI8OD7EeJqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FrFOxKgV; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-224191d9228so4684665ad.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 18:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742435776; x=1743040576; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8V+X6vapuQnm7T0BErSGY0fSGWOIaeixziHNtlYjz6I=;
        b=FrFOxKgVoBtnNVLAdBcFP9ATQigVVZ+bqNFjJ4/mR6P39JzbJLxYE7UrVT/yA9pIeZ
         yUnfGfZDPwa916AcLv+ZZkatHkvo7kYKKDV2oX5Bu5ia9ElFEXp7jdrNxSG8u3rrC/Iw
         pqq57d0cQCYtXrXAkA0h/9Bavx5LQcyA59txahBGvEWK69x69NSSxkbsPXsJ+nhalT70
         CMQJMQHkQQb7UPzfM26RjY4+cer1A8c3jlcr6VFqGqG0/1nxFEksheGFlehrkSyCknEs
         VAFNphhO7ggjBLY19vZnyT4qRCSJ8jH8hP55KKiwNG4g9R+Rs7XAfKPw03ZWy5xsrgqj
         hehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742435776; x=1743040576;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8V+X6vapuQnm7T0BErSGY0fSGWOIaeixziHNtlYjz6I=;
        b=nzgoa2xgM3ABf0jjbsHL6tXgchuSSsxH9OKC5/+0aF9BxP54sytT7gqOnd4kvF6xyy
         RZAOmFVxdY4+dvHE3bc6UzPsC3Fkn/vgAv5p/5cWLPuD3/f/+RHfnuziHTq/CVEX55dk
         P4O98i+ZsDTTtyZQ0ySsaVdOhvd193vI3ZSfMW9gZhdFUpa4ep8GfOz7vi0mL1sgziWs
         YmtuaHhORzeq7LTCP3ck5NYf1iYrhO4EJFP9Hwva2YeORgfDXxUMohZItgMpVV2lOrMX
         Ss8kzP0H2qZrqN6oYORU6uXlOKcR9rkRMblduz1sihCNkquq71eGlmGEzPt1Y6IafF3J
         fNQA==
X-Forwarded-Encrypted: i=1; AJvYcCW6TIbh0hnDrbOaO6UwlXU70LoVsT68S6iTceEvRY2wCUnJvhdwo5/PH92eJ3njXAdtH4OsNF0T33c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDM7mQhXvtxEVyHlzdx+2ru8vgbDFvvJSxCYJShOTvmrMvtjK4
	o/zvCFzXdu5T4YdY7GVBAzSFWnew2/xtC/qZnzSVVYlCcVXg1aHFzbjtA4RHxLT8q2J/qE/485A
	F3xJKBACeKqTghi9eUw==
X-Google-Smtp-Source: AGHT+IEM1zhUI4aB8FBWWC+mYMClc6ahuDGj6ZxX8EDQ9DE5DKRFOEqA+5eaTn1Hw9R605eYXv4+w1iX7+c1hN7N
X-Received: from pltk7.prod.google.com ([2002:a17:902:6947:b0:223:6930:304e])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:db0a:b0:223:f408:c3f7 with SMTP id d9443c01a7336-2265edc7b36mr19232405ad.16.1742435776171;
 Wed, 19 Mar 2025 18:56:16 -0700 (PDT)
Date: Wed, 19 Mar 2025 18:55:45 -0700
In-Reply-To: <20250320015551.2157511-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250320015551.2157511-11-changyuanl@google.com>
Subject: [PATCH v5 10/16] kexec: add KHO support to kexec file loads
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
 include/linux/kexec.h   |   7 +++
 kernel/kexec_core.c     |   4 ++
 kernel/kexec_file.c     |  19 +++++++
 kernel/kexec_handover.c | 108 ++++++++++++++++++++++++++++++++++++++++
 kernel/kexec_internal.h |  18 +++++++
 5 files changed, 156 insertions(+)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index fad04f3bcf1d..d59eee60e36e 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -364,6 +364,13 @@ struct kimage {
 	size_t ima_buffer_size;
 #endif
 
+#ifdef CONFIG_KEXEC_HANDOVER
+	struct {
+		struct kexec_segment *scratch;
+		struct kexec_segment *fdt;
+	} kho;
+#endif
+
 	/* Core ELF header buffer */
 	void *elf_headers;
 	unsigned long elf_headers_sz;
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index 640d252306ea..67fb9c0b3714 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -1053,6 +1053,10 @@ int kernel_kexec(void)
 		goto Unlock;
 	}
 
+	error = kho_copy_fdt(kexec_image);
+	if (error)
+		goto Unlock;
+
 #ifdef CONFIG_KEXEC_JUMP
 	if (kexec_image->preserve_context) {
 		/*
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 3eedb8c226ad..070ef206f573 100644
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
 
@@ -636,6 +641,14 @@ int kexec_locate_mem_hole(struct kexec_buf *kbuf)
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
@@ -764,6 +777,12 @@ static int kexec_calculate_store_digests(struct kimage *image)
 		if (ksegment->kbuf == pi->purgatory_buf)
 			continue;
 
+#ifdef CONFIG_KEXEC_HANDOVER
+		/* Skip KHO FDT as its contects are copied in kernel_kexec(). */
+		if (ksegment == image->kho.fdt)
+			continue;
+#endif
+
 		ret = crypto_shash_update(desc, ksegment->kbuf,
 					  ksegment->bufsz);
 		if (ret)
diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 592563c21369..5108e2cc1a22 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -245,6 +245,85 @@ int kho_node_check_compatible(const struct kho_in_node *node,
 }
 EXPORT_SYMBOL_GPL(kho_node_check_compatible);
 
+int kho_fill_kimage(struct kimage *image)
+{
+	ssize_t scratch_size;
+	int err = 0;
+
+	if (!kho_enable)
+		return 0;
+
+	/* Allocate target memory for KHO FDT */
+	struct kexec_buf fdt = {
+		.image = image,
+		.buffer = NULL,
+		.bufsz = 0,
+		.mem = KEXEC_BUF_MEM_UNKNOWN,
+		.memsz = kho_out.fdt_max,
+		.buf_align = SZ_64K, /* Makes it easier to map */
+		.buf_max = ULONG_MAX,
+		.top_down = true,
+	};
+	err = kexec_add_buffer(&fdt);
+	if (err) {
+		pr_err("failed to reserved a segment for KHO FDT: %d\n", err);
+		return err;
+	}
+	image->kho.fdt = &image->segment[image->nr_segments - 1];
+
+	scratch_size = sizeof(*kho_scratch) * kho_scratch_cnt;
+	struct kexec_buf scratch = {
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
+
 /*
  * Keep track of memory that is to be preserved across KHO.
  *
@@ -1141,6 +1220,35 @@ static int kho_finalize(void)
 	return err;
 }
 
+int kho_copy_fdt(struct kimage *image)
+{
+	int err = 0;
+	void *fdt;
+
+	if (!kho_enable || !image->file_mode)
+		return 0;
+
+	if (!kho_out.fdt) {
+		err = kho_finalize();
+		kho_out_update_debugfs_fdt();
+		if (err)
+			return err;
+	}
+
+	fdt = kimage_map_segment(image, image->kho.fdt->mem,
+				 PAGE_ALIGN(kho_out.fdt_max));
+	if (!fdt) {
+		pr_err("failed to vmap fdt ksegment in kimage\n");
+		return -ENOMEM;
+	}
+
+	memcpy(fdt, kho_out.fdt, fdt_totalsize(kho_out.fdt));
+
+	kimage_unmap_segment(fdt);
+
+	return 0;
+}
+
 /* Handling for debug/kho/out */
 static int kho_out_finalize_get(void *data, u64 *val)
 {
diff --git a/kernel/kexec_internal.h b/kernel/kexec_internal.h
index d35d9792402d..ec9555a4751d 100644
--- a/kernel/kexec_internal.h
+++ b/kernel/kexec_internal.h
@@ -39,4 +39,22 @@ extern size_t kexec_purgatory_size;
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
+int kho_copy_fdt(struct kimage *image);
+#else
+static inline int kho_locate_mem_hole(struct kexec_buf *kbuf,
+				      int (*func)(struct resource *, void *))
+{
+	return 1;
+}
+
+static inline int kho_fill_kimage(struct kimage *image) { return 0; }
+static inline int kho_copy_fdt(struct kimage *image) { return 0; }
+#endif /* CONFIG_KEXEC_HANDOVER */
 #endif /* LINUX_KEXEC_INTERNAL_H */
-- 
2.48.1.711.g2feabab25a-goog


