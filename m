Return-Path: <linux-doc+bounces-45031-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E685AA66B5
	for <lists+linux-doc@lfdr.de>; Fri,  2 May 2025 00:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9C6F188A457
	for <lists+linux-doc@lfdr.de>; Thu,  1 May 2025 22:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1653427C164;
	Thu,  1 May 2025 22:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A5RM8FDl"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE6B26FD86
	for <linux-doc@vger.kernel.org>; Thu,  1 May 2025 22:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140137; cv=none; b=OjkB3omyVD2YnEGUc4Yy6ETIbyeuPz3YoSd/HV9LSJU55lO3APeECJdQ9egLsBPb3ju12+hIRSNj/elJpGhBIOTDjzWPtTi7sD1UbMJaXi1DWzA1xLjjeroVbAXH8YZ++60tkZ0scxVC/saYP7SVzMSJs7VNymVkbqAn2s0nYak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140137; c=relaxed/simple;
	bh=6CEelcqc7Be/Y9b2UjlHA3na6nY4HZwgqtUvYQYDtKo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nC2UvEnGD1Lu4PszKtpgdtiCrZXLsY0e9VNE0BpGk7AWNUIpvFHupVMu6qW+d/KGpMvAG3b7b2Q93nDF6sJXzXb5KOkWVEQnPWFKGKxY0bvW8WQPjMaXRPCTeTErEjy7rBSq6EedNQP7ABS5Ame4MzH/Aos+OKz5+1AhM/8T0iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A5RM8FDl; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-225505d1ca5so13145825ad.2
        for <linux-doc@vger.kernel.org>; Thu, 01 May 2025 15:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746140135; x=1746744935; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VphvviRpGC2WLkYAjqaiyvIFs0ocuEHMIPdUSqAExnk=;
        b=A5RM8FDl+nKqfru7yReozhz/uubVGexmO4Rov958BxdhagnKWgWRCACnKB+xqHdKIX
         JlzaDsZPGrVNh8uaQZ/AvVDGdZ6ziPVYnxgJqT0QH7GVHnwk7nJ2kqM/F5U3qEACOBW6
         K+jRmVwxlJNSw+1LE3st9Nt+L0b7oqhQfwtXGiW5RXwb5nCjqO/hZIEx1/sJzQgVhXLx
         EInpALKRAuOWA/Bzd108o+Dw0SqXMt8semtrUFHUlNWN3Kav9Wk2Cq0Se4v7cbHqGB7A
         wrdI3wUben7D+JlHPrgvTI+lWXMfl652Aqtv1gT8OO3j6vG8dU97EH+MtzSsh/rp1ESH
         +4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140135; x=1746744935;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VphvviRpGC2WLkYAjqaiyvIFs0ocuEHMIPdUSqAExnk=;
        b=pi/AFALRx/Vqu2DR50INU/mZGsTSJx8dmRMz72P6pJP7kHO1AcrTjOzfMoeYOFnUyX
         0uhoWYBowI/HhzpaRvlL/w21pXzj1/mLQY/ZJzYFrZ7jSULBMErJPxCpNf8V0jmWjKqI
         sWyBCfy2HRadCvJo2ECJZbCbckZXZt2BVqLuY/INsXxhjIzhc2kkC9hm9TfpruvHvBgk
         XA4zmkxE0ItB8dgaD2WdzZ/+Yb/QId/Ytba9OMjFPa1xV3Y5CM/YA91oKnJDmAQ2DAOO
         AKTt6MFxBAChDlgqQRNsbJ6Sv4SRZQR6AaSFRBqrTWo3e77tXrSaJsOBHl1lLdqDAEPT
         dtKA==
X-Forwarded-Encrypted: i=1; AJvYcCWeFp+m6Rr8p5gQjgWsCBsJG9nhYlcCK/zTOSk7Vsu9/RJ6YrZ1xkudOgIMwhfdSc7JJ80Az5hcrno=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkSqci+M2EvGTUoijhyCDilw6PxLdi+2y/qbQzyNcLcltTYkHj
	x0ztyNGVeez92WBB/z5V/fjuy6XN1kQczCkZwHxrVnf2QPEfPN+w+PMtsPnmt3eHvoVjt03sCTV
	haTPSPXQ5+SGzygFzqQ==
X-Google-Smtp-Source: AGHT+IEUBELohUIuBjZuX1t4KvZ63Sn972imtSEYrAK4n9xeHQS/vygxbNUhLnD35SKxrJi1vU9ISpeHFRO3BtsZ
X-Received: from plou8.prod.google.com ([2002:a17:903:1ae8:b0:220:da6b:5d08])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1ab0:b0:224:24d3:60f4 with SMTP id d9443c01a7336-22e102d05f6mr12139545ad.15.1746140134934;
 Thu, 01 May 2025 15:55:34 -0700 (PDT)
Date: Thu,  1 May 2025 15:54:20 -0700
In-Reply-To: <20250501225425.635167-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501225425.635167-14-changyuanl@google.com>
Subject: [PATCH v7 13/18] x86/e820: temporarily enable KHO scratch for memory
 below 1M
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

KHO kernels are special and use only scratch memory for memblock
allocations, but memory below 1M is ignored by kernel after early boot
and cannot be naturally marked as scratch.

To allow allocation of the real-mode trampoline and a few (if any) other
very early allocations from below 1M forcibly mark the memory below 1M
as scratch.

After real mode trampoline is allocated, clear that scratch marking.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 arch/x86/kernel/e820.c   | 18 ++++++++++++++++++
 arch/x86/realmode/init.c |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 9920122018a0b..c3acbd26408ba 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -1299,6 +1299,24 @@ void __init e820__memblock_setup(void)
 		memblock_add(entry->addr, entry->size);
 	}
 
+	/*
+	 * At this point memblock is only allowed to allocate from memory
+	 * below 1M (aka ISA_END_ADDRESS) up until direct map is completely set
+	 * up in init_mem_mapping().
+	 *
+	 * KHO kernels are special and use only scratch memory for memblock
+	 * allocations, but memory below 1M is ignored by kernel after early
+	 * boot and cannot be naturally marked as scratch.
+	 *
+	 * To allow allocation of the real-mode trampoline and a few (if any)
+	 * other very early allocations from below 1M forcibly mark the memory
+	 * below 1M as scratch.
+	 *
+	 * After real mode trampoline is allocated, we clear that scratch
+	 * marking.
+	 */
+	memblock_mark_kho_scratch(0, SZ_1M);
+
 	/*
 	 * 32-bit systems are limited to 4BG of memory even with HIGHMEM and
 	 * to even less without it.
diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
index f9bc444a3064d..9b9f4534086d2 100644
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
-- 
2.49.0.906.g1f30a19c02-goog


