Return-Path: <linux-doc+bounces-15743-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D61318BB351
	for <lists+linux-doc@lfdr.de>; Fri,  3 May 2024 20:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12AD41C22093
	for <lists+linux-doc@lfdr.de>; Fri,  3 May 2024 18:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109D0158207;
	Fri,  3 May 2024 18:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VfGqyzUM"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F92722339
	for <linux-doc@vger.kernel.org>; Fri,  3 May 2024 18:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714761334; cv=none; b=iAw9CM+kg90f/E0Qs3XB9Vvv+ekyePBvl7qQDzf+S2dEGoyN87BJXfj5M4IQ40aRyOSoZSODAdurVnlWDWUmBTBZpq9R3EtCEB2etMoXRRHImgU+S5mjqmtsmmROGkIGZx8/fNLKMmYh6x2YeVSMdIhbg+QrtHzThmPd56roRdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714761334; c=relaxed/simple;
	bh=lctBDKKbaQ0GP8xmsQpbPsTnN5YakI/d7YGn9gn3TMU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NtbHdz0xwB5slZaH45Fn6+HZ90XgpP9OBhgiFb2mC5FLKDc3Ad7IFmbENAKlhunMXa+wXNABVeR4WMJV8tr2SKpsJGZKmpmgt68NXYggU9UYtt161dKiGGROXyE3vrp4hmEdTOt6xFnS+zWiUPol45n4PmRV8C37JF8LVE9FdAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VfGqyzUM; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1e63ff880f5so109782815ad.1
        for <linux-doc@vger.kernel.org>; Fri, 03 May 2024 11:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714761332; x=1715366132; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iVQp8VZ+GT1btk34Ge4A/qMobcmdU0dr1U1FJvarTM0=;
        b=VfGqyzUMv1VAc3hkSHpaH/ikIlB0hkd/EIFgCqQ1Gt5XaferUqyHXtknzcvfuKuOAo
         HRBfJimS1ICbb0DDspqqJMpDMg7BZFLnW8I/0IDR3q+8DLcINoqGUKpQCP2ddbwaT/V6
         hvp8n2JxNLO9zcGXj/+fOwm/y9dYWUCkHzZI/ImNqshZ59nyKFf5ntEC/+Ia3j3cJdBd
         q0lV/NK3NQuwjaVo6N0v+48qMjSmNQh1tRIjRRifixFzTEuVviZpl2ivVjYAmwdwdFn4
         jN499+kFGtUKtSNdZq23mZL+i2g+hsVp+/68lM7WiMk2eVlfTxcJb/6htawaVBZdV8ez
         Q69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714761332; x=1715366132;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iVQp8VZ+GT1btk34Ge4A/qMobcmdU0dr1U1FJvarTM0=;
        b=uz4c90GmNkR3zrKcaHfkhI7AfIJ6bdNLx5Un1AHGG68RZ/Ff5FM54w7JTDsnQxqr9b
         rmC5suzsz7M7xAKJJO9fPQPR1+Bsi7AINKOPC1WS0GrRzh3OlGuA5nX7Aym8rGoFFLEv
         Ndw2cs84kpWT+WCJI//Hocw5uT6CBZnMtszAhiUkOXXLffP+mZBfyOyAi5Z8tqxt9frJ
         1jUwcGMG+xvlkSJ8FynAtV+p8KDLmY0BkaIF3HJU5R5bgNFE6BTE1k9R9SVFpTYqNzC8
         OEMtMFLEoVA8ZeZD0CRoeFDfEPCmaJpAfD4KtrVyonYPdMIwXuoQdZUryjEtnjYWrYv5
         /Xcw==
X-Forwarded-Encrypted: i=1; AJvYcCV3HyVDBp0Czk79LuY8efAQ/TUBp0+bs4qFvtzZWB1V0YOFM8L4KaP0YWyeodKi4LSrIF/26Cz+eLOffXAtl98QcxtRxPLXeRBJ
X-Gm-Message-State: AOJu0YwBkjJAYg4ir2o+Gr1B7elRz7T1d9XhT+LvqH8MBKfLDyJyg54j
	eeNj2ioyP0LlBdfvGGIhR8WlWY7YPs2dUGb75vWf03Q0APBj6kO5eMpJtfWusD3L4ff3VtNzo3h
	kC5J6HGxNExwK9w==
X-Google-Smtp-Source: AGHT+IH43Mgk2bJwNZrlwDJzmhbx9udVERtQckuEWb3sCigBB6T1dsjzWtnv29QEOO5n0WToIxr27/3AIGcP6sU=
X-Received: from tj-virt.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5683])
 (user=tjmercier job=sendgmr) by 2002:a17:902:f94b:b0:1e8:a7fb:c1fc with SMTP
 id kx11-20020a170902f94b00b001e8a7fbc1fcmr7948plb.5.1714761331746; Fri, 03
 May 2024 11:35:31 -0700 (PDT)
Date: Fri,  3 May 2024 18:35:26 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240503183527.1548119-1-tjmercier@google.com>
Subject: [PATCH] swiotlb: iommu/dma: Clarify swiotlb options apply only to dma-direct
From: "T.J. Mercier" <tjmercier@google.com>
To: tjmercier@google.com, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>
Cc: hch@infradead.org, robin.murphy@arm.com, joro@8bytes.org, will@kernel.org, 
	akpm@linux-foundation.org, isaacmanjarres@google.com, iommu@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

IOMMU implementations now sometimes bounce memory through SWIOTLB to
achieve cacheline alignment [1], or prevent DMA attacks by untrusted
devices [2]. These uses of SWIOTLB differ conceptually from historical
use which was a solution to the problem of device addressing
limitations that prevent DMA to some portion of system memory
(typically beyond 4 GiB). IOMMUs also solve the problem of device
addressing limitations and therefore eliminate the need for SWIOTLB for
that purpose. However as mentioned, IOMMUs can use SWIOTLB for other
purposes.

The swiotlb kernel command line parameter does not impact IOMMU related
use of SWIOTLB, and that is intentional. IOMMUs cannot be forced to use
SWIOTLB for all buffers. Update the documentation for the swiotlb
parameter to clarify that SWIOTLB use can only be forced in scenarios
where an IOMMU is not involved.

[1] https://lore.kernel.org/all/20230612153201.554742-16-catalin.marinas@arm.com
[2] https://lore.kernel.org/all/20190906061452.30791-1-baolu.lu@linux.intel.com/
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 1 +
 Documentation/arch/x86/x86_64/boot-options.rst  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 213d0719e2b7..84c582ac246c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6486,6 +6486,7 @@
 				 to a power of 2.
 			force -- force using of bounce buffers even if they
 			         wouldn't be automatically used by the kernel
+			         where a hardware IOMMU is not involved
 			noforce -- Never use bounce buffers (for debugging)
 
 	switches=	[HW,M68k,EARLY]
diff --git a/Documentation/arch/x86/x86_64/boot-options.rst b/Documentation/arch/x86/x86_64/boot-options.rst
index 137432d34109..066b4bc81583 100644
--- a/Documentation/arch/x86/x86_64/boot-options.rst
+++ b/Documentation/arch/x86/x86_64/boot-options.rst
@@ -285,7 +285,7 @@ iommu options only relevant to the AMD GART hardware IOMMU:
       Always panic when IOMMU overflows.
 
 iommu options only relevant to the software bounce buffering (SWIOTLB) IOMMU
-implementation:
+implementation where a hardware IOMMU is not involved:
 
     swiotlb=<slots>[,force,noforce]
       <slots>
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


