Return-Path: <linux-doc+bounces-42890-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4A9A8533B
	for <lists+linux-doc@lfdr.de>; Fri, 11 Apr 2025 07:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEAFA9A5DC1
	for <lists+linux-doc@lfdr.de>; Fri, 11 Apr 2025 05:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A537E280A3D;
	Fri, 11 Apr 2025 05:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sJFSf8eA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F08B280A2B
	for <linux-doc@vger.kernel.org>; Fri, 11 Apr 2025 05:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744349920; cv=none; b=AqluzYw0rn2IbKYzPhHLfvZmjabns1evvVFtSw+bewXiQjlJWs4n+WUi0AZk5dnwddjsLEEOFKYYUWpymYswCT/+zsTnk74MR3ZucwgTBNnc4alUUxxJR0KeMl7U7TzwPJ87gvENPl35MoFk5Xt4eki6htf3eyaU+GWokajPnbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744349920; c=relaxed/simple;
	bh=v9lrMVZhKNFZxoLDI4hHR+N4Zr7YuKL4/oewG3Z2Ea8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tbkCF6IQjo7rbWRCgSKZDJG1Q9bLfP5ul+QiWutLzrVAChzvGqxDEsPQlbuXwAhGzHrtsra/+KSrMFmn0WixBkAxXbLPJtUs7wZd+B80QVgY4fLPBuzDC/mvpSzr1ZOMolTS5BqfA1ZNTPEopTJJ67K/wCdB8u7aaRkAbxJFjm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sJFSf8eA; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff581215f7so1233858a91.3
        for <linux-doc@vger.kernel.org>; Thu, 10 Apr 2025 22:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744349918; x=1744954718; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lv1l1I9z2A9RMTDP3pEjoh98A/jPPW1Y8prl67P6/Ys=;
        b=sJFSf8eAsINQl+e8RfindwXy+h7LJXW7QWvdrYf/PMChlK66DV3U+7r883PpsiUyB/
         YD51zp6xXQ6oMB61Me5qN6J6puPsy1ejybbRgghofpudfYMb0Zoa4Q5YK7KoVOmtkxfl
         m2wFnBbfQRUwPO9bQt9YfWNLO79frznwdS5U5YlAwZpxcVHhhB7PvjlU7z+CYMcLonSV
         LfiSlkqjGS39JJpiyH0eHrF4gHVt9rxpl8IOpKEX8+PGzYsqM/NeRpnw8/Ob7HRPhzTr
         MrWb5i7EFB7p9ntoVIH/9BtY+qbiyYZvlUgW48Xq4SOqkA+m35muPMVqEMRi7wIUCaTg
         dAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744349918; x=1744954718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lv1l1I9z2A9RMTDP3pEjoh98A/jPPW1Y8prl67P6/Ys=;
        b=Ytv7Ui5+RJZUapuQve9YUhPp40wA194mXoBE2E4dW3Q5SfbZLaRkSTWwmmeS42Rmjk
         JI1H+Dk0MtyKMprZV84dt3KibENFVV8r6D/svr0aB8aSenIOENKaaRXUNEdrNgnMvAzY
         zxPQLEpoNMVeMRs6j5Lrm2Xhe/gcj3b2uiEgtP/Xh2GV4bcIiMx3OYsBDHNIDAwAddfG
         /OwydUVgfYsno5qwyLtBC5xVURDxLJ9CfT/6TGgsLqJ+4jPtSwLTBZuBUcLV7UOcbDe0
         I44wNNE/ZN0DfcBkUSZxYwzA6bwbulPOgKw2nwYlZC1A7jKM901MeygrhceWuDK3MvuH
         SLTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0p+NSz32K5sCld56ojbht/+MnZ5mf9lFdJ1mj5cj+JGkjC6+24JrsYycG9j1Fvv4Kt+kwsdABtL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOycQLyO09trTUfkiiK6mTKOw9kS6yG6RNZ9L3EF2315n6W2Z8
	XcTQ/xHPyF0uIqfEul41f8QhRD0Ymi29pzVlZLrWPPYSAfnrQ61l57dKvQAls7Zd2Ns60jj2Cp9
	60STUXrs3BYe0aBGCxA==
X-Google-Smtp-Source: AGHT+IFDqnNrJ1yb2xJtOtea7MkZiHxum/paNcnypq1SzNi+wbhuEeT68KNiC92Vyv1O3vh0BoBg+A6LFRWhbKjQ
X-Received: from pjc12.prod.google.com ([2002:a17:90b:2f4c:b0:2f4:465d:5c61])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:274e:b0:2fe:80cb:ac05 with SMTP id 98e67ed59e1d1-3082367024emr2450558a91.9.1744349918309;
 Thu, 10 Apr 2025 22:38:38 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:37:41 -0700
In-Reply-To: <20250411053745.1817356-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250411053745.1817356-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250411053745.1817356-11-changyuanl@google.com>
Subject: [PATCH v6 10/14] x86/setup: use memblock_reserve_kern for memory used
 by kernel
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

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

memblock_reserve() does not distinguish memory used by firmware from memory
used by kernel.

The distinction is nice to have for accounting of early memory allocations
and reservations, but it is essential for kexec handover (kho) to know how
much memory kernel consumes during boot.

Use memblock_reserve_kern() to reserve kernel memory, such as kernel image,
initrd and setup data.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 arch/x86/kernel/setup.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 9d2a13b37833c..766176c4f5ee8 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -286,8 +286,8 @@ static void __init cleanup_highmap(void)
 static void __init reserve_brk(void)
 {
 	if (_brk_end > _brk_start)
-		memblock_reserve(__pa_symbol(_brk_start),
-				 _brk_end - _brk_start);
+		memblock_reserve_kern(__pa_symbol(_brk_start),
+				      _brk_end - _brk_start);
 
 	/* Mark brk area as locked down and no longer taking any
 	   new allocations */
@@ -360,7 +360,7 @@ static void __init early_reserve_initrd(void)
 	    !ramdisk_image || !ramdisk_size)
 		return;		/* No initrd provided by bootloader */
 
-	memblock_reserve(ramdisk_image, ramdisk_end - ramdisk_image);
+	memblock_reserve_kern(ramdisk_image, ramdisk_end - ramdisk_image);
 }
 
 static void __init reserve_initrd(void)
@@ -413,7 +413,7 @@ static void __init add_early_ima_buffer(u64 phys_addr)
 	}
 
 	if (data->size) {
-		memblock_reserve(data->addr, data->size);
+		memblock_reserve_kern(data->addr, data->size);
 		ima_kexec_buffer_phys = data->addr;
 		ima_kexec_buffer_size = data->size;
 	}
@@ -553,7 +553,7 @@ static void __init memblock_x86_reserve_range_setup_data(void)
 		len = sizeof(*data);
 		pa_next = data->next;
 
-		memblock_reserve(pa_data, sizeof(*data) + data->len);
+		memblock_reserve_kern(pa_data, sizeof(*data) + data->len);
 
 		if (data->type == SETUP_INDIRECT) {
 			len += data->len;
@@ -567,7 +567,7 @@ static void __init memblock_x86_reserve_range_setup_data(void)
 			indirect = (struct setup_indirect *)data->data;
 
 			if (indirect->type != SETUP_INDIRECT)
-				memblock_reserve(indirect->addr, indirect->len);
+				memblock_reserve_kern(indirect->addr, indirect->len);
 		}
 
 		pa_data = pa_next;
@@ -770,8 +770,8 @@ static void __init early_reserve_memory(void)
 	 * __end_of_kernel_reserve symbol must be explicitly reserved with a
 	 * separate memblock_reserve() or they will be discarded.
 	 */
-	memblock_reserve(__pa_symbol(_text),
-			 (unsigned long)__end_of_kernel_reserve - (unsigned long)_text);
+	memblock_reserve_kern(__pa_symbol(_text),
+			      (unsigned long)__end_of_kernel_reserve - (unsigned long)_text);
 
 	/*
 	 * The first 4Kb of memory is a BIOS owned area, but generally it is
-- 
2.49.0.604.gff1f9ca942-goog


