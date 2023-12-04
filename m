Return-Path: <linux-doc+bounces-3924-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 204BA8034A3
	for <lists+linux-doc@lfdr.de>; Mon,  4 Dec 2023 14:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43AF81C209DA
	for <lists+linux-doc@lfdr.de>; Mon,  4 Dec 2023 13:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A097D28694;
	Mon,  4 Dec 2023 13:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dkCiX5j4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 710721712
	for <linux-doc@vger.kernel.org>; Mon,  4 Dec 2023 05:24:15 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40b51e26a7aso84895e9.1
        for <linux-doc@vger.kernel.org>; Mon, 04 Dec 2023 05:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701696254; x=1702301054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aE8zXsPfBda9t8ARvJASQplTCIl3JgGGRAv+RnvEkNI=;
        b=dkCiX5j4VedIXUGMPgFjNzqzaalfuq4+dGeNs0z3vnA+C/+bW2NpQvD8tFSWTu1NeJ
         t0wJlPFrnGXT0EudcEaHQ/t6i3Sxko396VSUZewhG0GZF3/l9isn8tKe7zbMyE28dWGc
         5Nfdv2oIbiYxuLcfRyQLrd4hM6NHehQcXHlr9RHeftpWgEqfu6daIHp66s6gUTp5kmer
         O6OFeDXwVsU27ijrDZRsTUGjwGnUSIS/w8ENzMCOX0slxJu6G5POw2ohtHjgOvApRCle
         1R9YzhkvFDWM43bABTAf1+Nutsnev3mz0mQldhxRKnHXbrO7aqS6blUac8ZixlYeSUTX
         dWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701696254; x=1702301054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aE8zXsPfBda9t8ARvJASQplTCIl3JgGGRAv+RnvEkNI=;
        b=TZ2fylbs6K9YL6heb9nWeXgddAOHaVnG+QTicdBKWBRYNoWrgeDJ+aYhuTLJPtqaSb
         3+ampnSXHqzL2DrKLRP4B85XPrM0vw/KbstuVG6MiKWIh3dJOedZd3tSO8map5Zz11gZ
         bY9gvohA51u+TJ2dCLd0MXZDeE94ZbBIEGLyxzKKfjNaAgmj7vOjvpbIqLzjdHxvZG7Z
         HC4s0py9AWwBPF3Mk3N6grMNY2ifIx2dXZ29S9Y3YfnsUc3cDPFoA2LCofi4bOlVzeU2
         9dkPSVZmLje3pMoO+69kf0F1WnYYWjKokJ3jwe6C7USEjUxj3sWNqpGdNfOEwya9egGU
         Xp8Q==
X-Gm-Message-State: AOJu0Ywp8mkel/q2JNziv78ioxNu6PAYuuvYaEWzS4mj1T6UIa9Kda9z
	0FI/htZ6STRa5DFqIZOgJ3Sttw==
X-Google-Smtp-Source: AGHT+IH9XzaYksJqzJRCX12xbqyt+Twm7u0zddxPx/ttC/Kkf/x5zHAraqiUQ4yPErN9a6weoWuFRg==
X-Received: by 2002:a05:600c:3b89:b0:40c:7a3:920c with SMTP id n9-20020a05600c3b8900b0040c07a3920cmr110686wms.0.1701696253655;
        Mon, 04 Dec 2023 05:24:13 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:abeb:af3b:74a8:840a])
        by smtp.gmail.com with ESMTPSA id f15-20020a05600c4e8f00b0040b3632e993sm18666907wmq.46.2023.12.04.05.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 05:24:11 -0800 (PST)
From: Jann Horn <jannh@google.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	David Laight <David.Laight@aculab.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3] locking: Document that some lock types must stay alive during unlock
Date: Mon,  4 Dec 2023 14:22:59 +0100
Message-ID: <20231204132259.112152-1-jannh@google.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have seen several cases of attempts to use mutex_unlock() to release an
object such that the object can then be freed by another task.

This is not safe because mutex_unlock(), in the
MUTEX_FLAG_WAITERS && !MUTEX_FLAG_HANDOFF case, accesses the mutex
structure after having marked it as unlocked; so mutex_unlock() requires
its caller to ensure that the mutex stays alive until mutex_unlock()
returns.

If MUTEX_FLAG_WAITERS is set and there are real waiters, those waiters
have to keep the mutex alive, but we could have a spurious
MUTEX_FLAG_WAITERS left if an interruptible/killable waiter bailed
between the points where __mutex_unlock_slowpath() did the cmpxchg
reading the flags and where it acquired the wait_lock.

( With spinlocks, that kind of code pattern is allowed and, from what I
  remember, used in several places in the kernel. )

Document this, such a semantic difference between mutexes and spinlocks
is fairly unintuitive. Based on feedback on the list, this should be
documented as a general locking caveat, not as a mutex-specific thing.

(changelog with some input from mingo)

Signed-off-by: Jann Horn <jannh@google.com>
---
Based on feedback on the list, I've gotten rid of the confusing
"atomic" wording.
Also, based on Peter Zijlstra's feedback that this more of a general
thing with sleeping locks and not specific to mutexes, I have rewritten
the patch to have some central documentation on the caveat in
Documentation/locking/locktypes.rst, and then just sprinkle some
references to that in a few other places.

I saw that the first version of this patch already landed in tip tree;
can you still yank that back out of the tree? If not, maybe revert that
for now, and then later land this new version (or a future revision of
it) once we've figured out if the new wording is good?


 Documentation/locking/locktypes.rst    | 23 +++++++++++++++++++++++
 Documentation/locking/mutex-design.rst |  2 ++
 kernel/locking/mutex.c                 |  5 +++++
 kernel/locking/rwsem.c                 | 10 ++++++++++
 4 files changed, 40 insertions(+)

diff --git a/Documentation/locking/locktypes.rst b/Documentation/locking/locktypes.rst
index 80c914f6eae7..c9a4bcc967ea 100644
--- a/Documentation/locking/locktypes.rst
+++ b/Documentation/locking/locktypes.rst
@@ -95,6 +95,29 @@ rw_semaphores have a special interface which allows non-owner release for
 readers.
 
 
+Releasing and freeing
+=====================
+For some lock types, such as spinlocks, the lock release operation is designed
+to allow another concurrent task to free the lock as soon as the lock has been
+released - in other words, similarly to refcounts, the unlock operation will not
+access the lock object anymore after marking it as unlocked.
+
+This behavior is guaranteed for:
+
+ - spinlock_t (including in PREEMPT_RT kernels, where spinlock_t is
+   implemented as an rtmutex)
+
+There are other lock types where the lock release operation makes no such
+guarantee and the caller must ensure that the lock is not destroyed before the
+unlock operation has returned.
+Most sleeping locks are in this category.
+
+This is the case in particular for (not an exhaustive list):
+
+ - mutex
+ - rw_semaphore
+
+
 rtmutex
 =======
 
diff --git a/Documentation/locking/mutex-design.rst b/Documentation/locking/mutex-design.rst
index 78540cd7f54b..bbb4c4d56ed0 100644
--- a/Documentation/locking/mutex-design.rst
+++ b/Documentation/locking/mutex-design.rst
@@ -101,6 +101,8 @@ features that make lock debugging easier and faster:
     - Detects multi-task circular deadlocks and prints out all affected
       locks and tasks (and only those tasks).
 
+The mutex user must ensure that the mutex is not destroyed while a unlock
+operation is still in progress, see Documentation/locking/locktypes.rst.
 
 Interfaces
 ----------
diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index 2deeeca3e71b..fa4834dba407 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -532,6 +532,11 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
  * This function must not be used in interrupt context. Unlocking
  * of a not locked mutex is not allowed.
  *
+ * The caller must ensure that the mutex stays alive until this function has
+ * returned - mutex_unlock() can NOT directly be used to release an object such
+ * that another concurrent task can free it.
+ * See Documentation/locking/locktypes.rst.
+ *
  * This function is similar to (but not equivalent to) up().
  */
 void __sched mutex_unlock(struct mutex *lock)
diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
index 2340b6d90ec6..cbc00a269deb 100644
--- a/kernel/locking/rwsem.c
+++ b/kernel/locking/rwsem.c
@@ -1615,6 +1615,11 @@ EXPORT_SYMBOL(down_write_trylock);
 
 /*
  * release a read lock
+ *
+ * The caller must ensure that the rw_semaphore stays alive until this function
+ * has returned - up_read() can NOT directly be used to release an object such
+ * that another concurrent task can free it.
+ * See Documentation/locking/locktypes.rst.
  */
 void up_read(struct rw_semaphore *sem)
 {
@@ -1625,6 +1630,11 @@ EXPORT_SYMBOL(up_read);
 
 /*
  * release a write lock
+ *
+ * The caller must ensure that the rw_semaphore stays alive until this function
+ * has returned - up_write() can NOT directly be used to release an object such
+ * that another concurrent task can free it.
+ * See Documentation/locking/locktypes.rst.
  */
 void up_write(struct rw_semaphore *sem)
 {

base-commit: 3b47bc037bd44f142ac09848e8d3ecccc726be99
-- 
2.43.0.rc2.451.g8631bc7472-goog


