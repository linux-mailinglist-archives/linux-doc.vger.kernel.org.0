Return-Path: <linux-doc+bounces-31169-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D3A9D3152
	for <lists+linux-doc@lfdr.de>; Wed, 20 Nov 2024 01:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 485391F23794
	for <lists+linux-doc@lfdr.de>; Wed, 20 Nov 2024 00:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51B99461;
	Wed, 20 Nov 2024 00:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RJIcmSl9"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4836628EC
	for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 00:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732061316; cv=none; b=rue7G321TY7CPpZ1RCQjxsg5V+uRNcMYeLHE44T3OjifsUNAEvVbBdNQzaA8tYMv9k1KZ5+/5qPiLhqNRFS3egR8shTJd9NnQDEH0LmH9dwUCq5kVoDyrjgXzd/85NaV/bvwUHbj0Jf6z/If8Dld+U0yd3LzOl0XzHDbdS/BDR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732061316; c=relaxed/simple;
	bh=+2MqNSKL0W5/WmN9BLrsf2KL69Tx7RrNmJl8Ljhx/WM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XWBvKAqGQAk/NhPMNiGwe58OkcGzF6HHLXe+ZItnkUwkTgphyKOiM6v/rlcN7MyoC98LP8GJAGAZjWX7cpRC9kyZ0Mndwna9gMulwjkJKIGDE1GnHmoTjBECJtZjGAhCEnL2AKNvmJ5mA1Qi+0sGHpki+eQ+0lXQGpBOptNjTC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RJIcmSl9; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e30daaf5928so2543378276.1
        for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2024 16:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732061313; x=1732666113; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ve1WLVFYOSXc3Opo5MHJNWqWiXorXcfFJ5bxi7J2prs=;
        b=RJIcmSl9O17PEkpEQSlpeW9nU3DJF/aiHR4OrPgCBo5PhDywBQG9L6EKyUZiuVXdgJ
         B21Zev5/0FSwWydaV95PwpuM5zgdx1n64glnyWB+SBv6rFi80lkoYKCIuqfy7zFzR821
         yhwh7NvUgr0Sf+zd6guIIrqEsNWn+WW6Timte2segb36o5+7DpY3DsmtPDNcIvGlR32C
         n2mFZu/Qfu5blmNdVt4xz4X2d33ZuJdSt0DPIH+ZPJBYvYWcoH6Sti0hKz1Aax+YMZu7
         S5Arb88ViW68hSKHntycYU9KhBueCMFWe8DSvHpMwjP8TVs0NDE2kzGhKHVYfPkf4ur/
         1mZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732061313; x=1732666113;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ve1WLVFYOSXc3Opo5MHJNWqWiXorXcfFJ5bxi7J2prs=;
        b=eFwLLTDLI/QExEduSn9hFJv+OGI1HTl25SIyvNezZfOnE1w+Rkd9bSXyxGCIfGpQGd
         3NlO8nPQ0vftk7xmy27EhH8Bclb6Q6kVwQTDnFVqcKr8SRDsCn8WZzSERFdoyBb2x3yb
         +jwRqNF+bIPKu2XzTQkH98WNFew+kI9bpxX5tFllP4pZx5hiIO6xtPAdow6fx1Ev9hTd
         LFtPimViDf/IqJFxQAP66o+YVBLD0XlHy10vz1/004RudjFjhvqQ3Wrg36ssnyC1dWqp
         YT9tBBzcWb9lDU2Byy/s+nfNa7I6RKAYc+pNb23OqCwc9xr1dkZvdF9i/kCtIcDBWaCn
         Ph6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpqNsa3wmo600sc7WsSHM7TiNh3+RA12oKH2pBvUKQuRFOC+TEKi05b5HuDkJFvNLsfkkWNnwAyMA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9j1kT2B+8lhXMeF+RRvzwM5lcnL9QRvdt7WGEelr7ZQ6eEXUz
	11I9ZRHODKO8O8WwUjmzwwUCARc4d2muQWa3u5pchvQJH1SIrC7XT5lzG3H54jEe8m+YGQP6UtC
	qCA==
X-Google-Smtp-Source: AGHT+IEyLwXvDXLnYSqPv5azfkHnhcNjKGMYmPlWD8dNq1sLWn2jjgJONFBDd+BEsDvXmrivA7Y5d4vobs8=
X-Received: from surenb-desktop.mtv.corp.google.com ([2a00:79e0:2e3f:8:af45:bbc1:fc75:e695])
 (user=surenb job=sendgmr) by 2002:a25:aa22:0:b0:e2e:3401:ea0f with SMTP id
 3f1490d57ef6-e38cb70b565mr451276.7.1732061312659; Tue, 19 Nov 2024 16:08:32
 -0800 (PST)
Date: Tue, 19 Nov 2024 16:08:22 -0800
In-Reply-To: <20241120000826.335387-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241120000826.335387-1-surenb@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241120000826.335387-2-surenb@google.com>
Subject: [PATCH v4 1/5] mm: introduce vma_start_read_locked{_nested} helpers
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: willy@infradead.org, liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, 
	oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com, 
	peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, 
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	minchan@google.com, jannh@google.com, shakeel.butt@linux.dev, 
	souravpanda@google.com, pasha.tatashin@soleen.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

Introduce helper functions which can be used to read-lock a VMA when
holding mmap_lock for read. Replace direct accesses to vma->vm_lock
with these new helpers.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
---
 include/linux/mm.h | 24 ++++++++++++++++++++++++
 mm/userfaultfd.c   | 22 +++++-----------------
 2 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index fecd47239fa9..1ba2e480ae63 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -722,6 +722,30 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
 	return true;
 }
 
+/*
+ * Use only while holding mmap read lock which guarantees that locking will not
+ * fail (nobody can concurrently write-lock the vma). vma_start_read() should
+ * not be used in such cases because it might fail due to mm_lock_seq overflow.
+ * This functionality is used to obtain vma read lock and drop the mmap read lock.
+ */
+static inline void vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
+{
+	mmap_assert_locked(vma->vm_mm);
+	down_read_nested(&vma->vm_lock->lock, subclass);
+}
+
+/*
+ * Use only while holding mmap read lock which guarantees that locking will not
+ * fail (nobody can concurrently write-lock the vma). vma_start_read() should
+ * not be used in such cases because it might fail due to mm_lock_seq overflow.
+ * This functionality is used to obtain vma read lock and drop the mmap read lock.
+ */
+static inline void vma_start_read_locked(struct vm_area_struct *vma)
+{
+	mmap_assert_locked(vma->vm_mm);
+	down_read(&vma->vm_lock->lock);
+}
+
 static inline void vma_end_read(struct vm_area_struct *vma)
 {
 	rcu_read_lock(); /* keeps vma alive till the end of up_read */
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 60a0be33766f..87db4b32b82a 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -84,16 +84,8 @@ static struct vm_area_struct *uffd_lock_vma(struct mm_struct *mm,
 
 	mmap_read_lock(mm);
 	vma = find_vma_and_prepare_anon(mm, address);
-	if (!IS_ERR(vma)) {
-		/*
-		 * We cannot use vma_start_read() as it may fail due to
-		 * false locked (see comment in vma_start_read()). We
-		 * can avoid that by directly locking vm_lock under
-		 * mmap_lock, which guarantees that nobody can lock the
-		 * vma for write (vma_start_write()) under us.
-		 */
-		down_read(&vma->vm_lock->lock);
-	}
+	if (!IS_ERR(vma))
+		vma_start_read_locked(vma);
 
 	mmap_read_unlock(mm);
 	return vma;
@@ -1476,14 +1468,10 @@ static int uffd_move_lock(struct mm_struct *mm,
 	mmap_read_lock(mm);
 	err = find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, src_vmap);
 	if (!err) {
-		/*
-		 * See comment in uffd_lock_vma() as to why not using
-		 * vma_start_read() here.
-		 */
-		down_read(&(*dst_vmap)->vm_lock->lock);
+		vma_start_read_locked(*dst_vmap);
 		if (*dst_vmap != *src_vmap)
-			down_read_nested(&(*src_vmap)->vm_lock->lock,
-					 SINGLE_DEPTH_NESTING);
+			vma_start_read_locked_nested(*src_vmap,
+						SINGLE_DEPTH_NESTING);
 	}
 	mmap_read_unlock(mm);
 	return err;
-- 
2.47.0.338.g60cca15819-goog


