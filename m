Return-Path: <linux-doc+bounces-32891-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F33C9F39BF
	for <lists+linux-doc@lfdr.de>; Mon, 16 Dec 2024 20:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05B5E1630F6
	for <lists+linux-doc@lfdr.de>; Mon, 16 Dec 2024 19:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BDEF20B818;
	Mon, 16 Dec 2024 19:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zl0PUbgR"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2AD20B7EC
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 19:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377082; cv=none; b=Dm1Z/bfc/SenPm0rzuE07fayl2r0yG+VHgQKthUJA0aAb+e9sVgmToJ4aqu2XfoD0CgCTaqkp3VcdtlfPgO44zUN+fsB12qp0YNVrRHw5aUnk0QWoeuTiUggtbJJNBP6I4AhYzT2tmPdptXQtXk2zFie7fBHpcAJM8et+W4gBzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377082; c=relaxed/simple;
	bh=4HVgEs+Z5egjLoYt8HIyu4EWui7/xkUMkpUi/DbY8o0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MYq9msLd2FdReKxJafCN+BvNHkGs1lnzd9plLo2/MMKrGU150+Zg8bwKjV5kdTOG3usIb7+gTwoK2fi7hU89j/jEzeZJmxmLdw9yrKyD2/gC2fqHP46UrQrl628egwbURVpWL3fgRQqdENrkXF4UYmWBAJ06jinb3PZgoSjuYNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zl0PUbgR; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-725e4bee2b0so5662240b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 11:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734377080; x=1734981880; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IlSIABx/zxxF1ijBMV6mDoRgzimHB9QssQ8SIetRkVU=;
        b=Zl0PUbgRvff4heTsRClAa4GLDd5rS/Gc97JTiiC0xEoMBlPxtL6ETeJeJERUXobOY5
         TIRa3E9v/F1s1RcOLTEwNFK9rFGPkf+Z5CdYiM3rxwJhReY+BN6O3zqoxD5ZzgbIFBW/
         Xofn9BNGYEhQyqkeCsD0z1XlGrDrxgAihEmJFd3RbohRtPJ3RdjQzsOsVOkPqtch35Nx
         VUPfTVekH7Q5lvGVR/p8ivmtiV0Z9zCNSCfboglU//M1S4zV4Xe8/mMPDnxzo9LsYw0V
         /fKkrPV23ml0Q++kWdG1+W6NOi9GRGQT/i4rFVt2QB9Eg65fw4EErECQSCKXXu7gq4gA
         8edA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734377080; x=1734981880;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IlSIABx/zxxF1ijBMV6mDoRgzimHB9QssQ8SIetRkVU=;
        b=P+3/rDd5qLzB0wsvTnTcifutzU+H74I1ERkMACWZfKbVujZIB5CFc38iC0JqIMsmDK
         OjBT1KngsILn9jfwY4toWwQAbnWq7G2VESEygZxZcFcEoLrsnRWL1U3fmM2IUjTx6OY6
         batDzg1bxZQq3FKBlrvu5PZoeyRDdx2zbyqhetPxeUfycGWhfYZZEdpLs2KWMHstY0UN
         Y4Bef1sIitHafM2wOnmhpLP/NTVT2RYkhvVTdW5sz7eAb37j2Qm6i3HIivzFJ3YiZVMd
         VRXfZVXY9aT2Klpwnb0+TnW4KcB8t+uRU80f7ghMCwgB567Q6qmVplNK1Fr4+00MvxrJ
         Vr6g==
X-Forwarded-Encrypted: i=1; AJvYcCUQFjhD5cc1uzcVww2M3Q2J6LGvdZpKTTgOuN708FasGK7LMUWHnL6zyQ0QvG12NEZ/nxkOmM20jOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVSEN0Cf1iVtXWTjynzUBS9D1g2rXHf39oRKF1zXFgTG4uKQD7
	ymiVYRtX4lCwoMwXHUgZt3rGogpWwVQi6/RUBDrK4PeTtn9WGqH5Ys1nzUH/rHB4bYGV+fYMBFW
	dsw==
X-Google-Smtp-Source: AGHT+IFInU2/c8WUI1v0xjpwtORb6r7NqVkTkq8OC0u0JtieghImrnI2AnpvFTBaqoW2DCB2chLg/yy/KrA=
X-Received: from pfblh8.prod.google.com ([2002:a05:6a00:7108:b0:728:f1bf:72ad])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9c8d:b0:1dc:790e:3bd0
 with SMTP id adf61e73a8af0-1e1dfd3dbb6mr22228664637.15.1734377079970; Mon, 16
 Dec 2024 11:24:39 -0800 (PST)
Date: Mon, 16 Dec 2024 11:24:11 -0800
In-Reply-To: <20241216192419.2970941-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216192419.2970941-9-surenb@google.com>
Subject: [PATCH v6 08/16] mm: uninline the main body of vma_start_write()
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	surenb@google.com
Content-Type: text/plain; charset="UTF-8"

vma_start_write() is used in many places and will grow in size very soon.
It is not used in performance critical paths and uninlining it should
limit the future code size growth.
No functional changes.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm.h | 12 +++---------
 mm/memory.c        | 14 ++++++++++++++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0ecd321c50b7..ccb8f2afeca8 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -787,6 +787,8 @@ static bool __is_vma_write_locked(struct vm_area_struct *vma, unsigned int *mm_l
 	return (vma->vm_lock_seq == *mm_lock_seq);
 }
 
+void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq);
+
 /*
  * Begin writing to a VMA.
  * Exclude concurrent readers under the per-VMA lock until the currently
@@ -799,15 +801,7 @@ static inline void vma_start_write(struct vm_area_struct *vma)
 	if (__is_vma_write_locked(vma, &mm_lock_seq))
 		return;
 
-	down_write(&vma->vm_lock.lock);
-	/*
-	 * We should use WRITE_ONCE() here because we can have concurrent reads
-	 * from the early lockless pessimistic check in vma_start_read().
-	 * We don't really care about the correctness of that early check, but
-	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
-	 */
-	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
-	up_write(&vma->vm_lock.lock);
+	__vma_start_write(vma, mm_lock_seq);
 }
 
 static inline void vma_assert_write_locked(struct vm_area_struct *vma)
diff --git a/mm/memory.c b/mm/memory.c
index cc7159aef918..c6356ea703d8 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6329,6 +6329,20 @@ struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
 #endif
 
 #ifdef CONFIG_PER_VMA_LOCK
+void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq)
+{
+	down_write(&vma->vm_lock.lock);
+	/*
+	 * We should use WRITE_ONCE() here because we can have concurrent reads
+	 * from the early lockless pessimistic check in vma_start_read().
+	 * We don't really care about the correctness of that early check, but
+	 * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
+	 */
+	WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
+	up_write(&vma->vm_lock.lock);
+}
+EXPORT_SYMBOL_GPL(__vma_start_write);
+
 /*
  * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
  * stable and not isolated. If the VMA is not found or is being modified the
-- 
2.47.1.613.gc27f4b7a9f-goog


