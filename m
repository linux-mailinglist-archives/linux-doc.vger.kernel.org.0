Return-Path: <linux-doc+bounces-33668-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB9F9FCC51
	for <lists+linux-doc@lfdr.de>; Thu, 26 Dec 2024 18:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCDF6188130E
	for <lists+linux-doc@lfdr.de>; Thu, 26 Dec 2024 17:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400821DBB37;
	Thu, 26 Dec 2024 17:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WyxBxgKk"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A661DB922
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232870; cv=none; b=Im/Ih3pAD+klXvEnORJYsnlF689pz5FP9+hB5jCFuJ+RrRPGQBZTzBq5Qt7NKdWyUezUrcgbQiyo+6q44+VEZIxwqxOqJ4KOyQYwYlKYhygg8SDk22S12ySwA3Swl/arTfTB5wxuuwwC48o7+dlX1LTqZK0FqWw36eSbxpGg678=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232870; c=relaxed/simple;
	bh=GIO0fbE7SQZ1rtlKN8vZekgYlbMsWE+guT+3ZXk1HZ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XPGwNha0oPDxloFmpCeQcKpCfOQfzSz16dYQDn4ml41P+1GuCaOCpVqrno+yYW0yvhQc+UslziZQNOp4fpfZj28E8efOo8kjW6fangUpBerpLvtvnnYQ80hCuxuB0ZaN/YRyh7ejkMyD5nqrMRspUy4GXbbt+6HacBPUU0H5EQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WyxBxgKk; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ee5616e986so12303945a91.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 09:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735232868; x=1735837668; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4HhxNlm5l3oc+a05Upn5SwGTABo4qTWEjrE4UxpsHII=;
        b=WyxBxgKkhEuFt7Gaz9obomkikLL84sLKZ2N+xVPOAUNmDnOB5Gqer5te8fouT8Y9nE
         qF+wF6N3zDNE2oc3PfnQTA6zv2YAIzeUNhtQ0I0Cc31ris2/OIz9jRUurDiB7Rf1Tiiu
         DvOoIGnf+ExMcarudnES+RFdulOvru73YGVjPwzau+b5HO8kQgSMd4wxFoNkvy/ieu0C
         NJ9ozmMi04fE0p8HCHyWcNN9kcpyjaE/rjfpfpybEzJsGEM00eeYdRC8lcKuli3pCsLQ
         iQAq+6b/DVQfgS4Vtiy9pkHJnkDsSP6xHly/mKlNh5/ERh65lq0AgKxtWJgv7o2jQZMg
         KvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735232868; x=1735837668;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4HhxNlm5l3oc+a05Upn5SwGTABo4qTWEjrE4UxpsHII=;
        b=KJuuyxseuC8yUMBSMnFWlGCkpe+Sa4FeKKhzNzHlyJnVhx+0EPmN1iggk664cb5XSQ
         3JG5mjOb8G55Yfqz6Xk9/KeiDykS8bDaEl8bUFGu7Z9ng3LRQfQ4hIOValxWjasUqGGn
         ME5RG3ehi3XPIAQ5yJXnowIhYRx2JvFLkd7wU7nv8wuKT23nYGV+fD8z8p8F/O5iRuwn
         tyCE38d/8UcKFJeHzhw5fj2xX9Ltp17zj5cN67lwwie7/pOmWQPx4vuMzkcs8JchfB6M
         r0OT2Q/gC4+MXG0dxl6dA7KdjeDENTHEQpDCih1ssY6wmdVm5yCVRNc/I5OFABA4wNwt
         XWuA==
X-Forwarded-Encrypted: i=1; AJvYcCVQO7O2oR0zS6Nmp5XpG6/DlrLFupo/Wrstc7xvF+lVwziuNgLYIRrMI30FkKVsC22d9huhhHJda0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAOLDfsNsleSe0Aq5vacnTSbcbl0+wGTCkGwR3EoVENHckF/8w
	tK+Pa0ZWdTTfrLVeao0zENtwoJppx74yEZoxN/SwSvdyBct+Qr2rh5UN5qQqHfw1dJptwB+jGuw
	pHg==
X-Google-Smtp-Source: AGHT+IF7dKgo6NOta05WIlCiTUUdE+0C61M7hMlod7dRoqWPYR+1EhCFaw3EWtQn1lXePDQDqo/d6R5TwFE=
X-Received: from pfbcw3.prod.google.com ([2002:a05:6a00:4503:b0:725:f1d9:f706])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4399:b0:725:8b00:167e
 with SMTP id d2e1a72fcca58-72abdec65e2mr31237080b3a.16.1735232867927; Thu, 26
 Dec 2024 09:07:47 -0800 (PST)
Date: Thu, 26 Dec 2024 09:07:09 -0800
In-Reply-To: <20241226170710.1159679-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226170710.1159679-18-surenb@google.com>
Subject: [PATCH v7 17/17] docs/mm: document latest changes to vm_lock
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

Change the documentation to reflect that vm_lock is integrated into vma
and replaced with vm_refcnt.
Document newly introduced vma_start_read_locked{_nested} functions.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 Documentation/mm/process_addrs.rst | 44 ++++++++++++++++++------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/process_addrs.rst
index 81417fa2ed20..f573de936b5d 100644
--- a/Documentation/mm/process_addrs.rst
+++ b/Documentation/mm/process_addrs.rst
@@ -716,9 +716,14 @@ calls :c:func:`!rcu_read_lock` to ensure that the VMA is looked up in an RCU
 critical section, then attempts to VMA lock it via :c:func:`!vma_start_read`,
 before releasing the RCU lock via :c:func:`!rcu_read_unlock`.
 
-VMA read locks hold the read lock on the :c:member:`!vma->vm_lock` semaphore for
-their duration and the caller of :c:func:`!lock_vma_under_rcu` must release it
-via :c:func:`!vma_end_read`.
+In cases when the user already holds mmap read lock, :c:func:`!vma_start_read_locked`
+and :c:func:`!vma_start_read_locked_nested` can be used. These functions do not
+fail due to lock contention but the caller should still check their return values
+in case they fail for other reasons.
+
+VMA read locks increment :c:member:`!vma.vm_refcnt` reference counter for their
+duration and the caller of :c:func:`!lock_vma_under_rcu` must drop it via
+:c:func:`!vma_end_read`.
 
 VMA **write** locks are acquired via :c:func:`!vma_start_write` in instances where a
 VMA is about to be modified, unlike :c:func:`!vma_start_read` the lock is always
@@ -726,9 +731,9 @@ acquired. An mmap write lock **must** be held for the duration of the VMA write
 lock, releasing or downgrading the mmap write lock also releases the VMA write
 lock so there is no :c:func:`!vma_end_write` function.
 
-Note that a semaphore write lock is not held across a VMA lock. Rather, a
-sequence number is used for serialisation, and the write semaphore is only
-acquired at the point of write lock to update this.
+Note that when write-locking a VMA lock, the :c:member:`!vma.vm_refcnt` is temporarily
+modified so that readers can detect the presense of a writer. The reference counter is
+restored once the vma sequence number used for serialisation is updated.
 
 This ensures the semantics we require - VMA write locks provide exclusive write
 access to the VMA.
@@ -738,7 +743,7 @@ Implementation details
 
 The VMA lock mechanism is designed to be a lightweight means of avoiding the use
 of the heavily contended mmap lock. It is implemented using a combination of a
-read/write semaphore and sequence numbers belonging to the containing
+reference counter and sequence numbers belonging to the containing
 :c:struct:`!struct mm_struct` and the VMA.
 
 Read locks are acquired via :c:func:`!vma_start_read`, which is an optimistic
@@ -779,28 +784,31 @@ release of any VMA locks on its release makes sense, as you would never want to
 keep VMAs locked across entirely separate write operations. It also maintains
 correct lock ordering.
 
-Each time a VMA read lock is acquired, we acquire a read lock on the
-:c:member:`!vma->vm_lock` read/write semaphore and hold it, while checking that
-the sequence count of the VMA does not match that of the mm.
+Each time a VMA read lock is acquired, we increment :c:member:`!vma.vm_refcnt`
+reference counter and check that the sequence count of the VMA does not match
+that of the mm.
 
-If it does, the read lock fails. If it does not, we hold the lock, excluding
-writers, but permitting other readers, who will also obtain this lock under RCU.
+If it does, the read lock fails and :c:member:`!vma.vm_refcnt` is dropped.
+If it does not, we keep the reference counter raised, excluding writers, but
+permitting other readers, who can also obtain this lock under RCU.
 
 Importantly, maple tree operations performed in :c:func:`!lock_vma_under_rcu`
 are also RCU safe, so the whole read lock operation is guaranteed to function
 correctly.
 
-On the write side, we acquire a write lock on the :c:member:`!vma->vm_lock`
-read/write semaphore, before setting the VMA's sequence number under this lock,
-also simultaneously holding the mmap write lock.
+On the write side, we set a bit in :c:member:`!vma.vm_refcnt` which can't be
+modified by readers and wait for all readers to drop their reference count.
+Once there are no readers, VMA's sequence number is set to match that of the
+mm. During this entire operation mmap write lock is held.
 
 This way, if any read locks are in effect, :c:func:`!vma_start_write` will sleep
 until these are finished and mutual exclusion is achieved.
 
-After setting the VMA's sequence number, the lock is released, avoiding
-complexity with a long-term held write lock.
+After setting the VMA's sequence number, the bit in :c:member:`!vma.vm_refcnt`
+indicating a writer is cleared. From this point on, VMA's sequence number will
+indicate VMA's write-locked state until mmap write lock is dropped or downgraded.
 
-This clever combination of a read/write semaphore and sequence count allows for
+This clever combination of a reference counter and sequence count allows for
 fast RCU-based per-VMA lock acquisition (especially on page fault, though
 utilised elsewhere) with minimal complexity around lock ordering.
 
-- 
2.47.1.613.gc27f4b7a9f-goog


