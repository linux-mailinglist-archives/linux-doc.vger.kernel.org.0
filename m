Return-Path: <linux-doc+bounces-32888-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ED39F39B8
	for <lists+linux-doc@lfdr.de>; Mon, 16 Dec 2024 20:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BB79188992B
	for <lists+linux-doc@lfdr.de>; Mon, 16 Dec 2024 19:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC147207679;
	Mon, 16 Dec 2024 19:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fAImfv8N"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B5B20A5DA
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 19:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377075; cv=none; b=Y8q0Bcwx0LeE8/ajg/N/q0XLk5rv6GyF1FpydWS+nbpLCpattXJ0ht9tFqlidRcsV9Z7CXoRGIMRLZU77issjdovgowTavsWQqT/SN0M5xo1gHeLbLWwbxl4xwsjdNNvmRaiKdoayXXanmxa1csELwKyMI9SQb9XzGePUjFST0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377075; c=relaxed/simple;
	bh=x8qaFP1AxURYpa5oiGFQli55lZvdLlf3Vb+7T69X9+M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VSJ7Mp5Do6NoIIR5vQfbbW66XvrfFzWrizKH/vmySMwaAdq9AoHwjK1vHdqGvzcx4YkIq+ZgoiZ9v5nmEPfk8xfusxvCnZviL9if6HoEc/gfONnGlhsqPpA+CKLx35XAUlOzoZhYhO4DuQp/p2mehSx+qW90MFUlIpnV++an4Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fAImfv8N; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21648ddd461so46164345ad.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 11:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734377074; x=1734981874; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ykFNL3Q77su3l1hmkCa41V3LHYM0KyunH48W8conCI=;
        b=fAImfv8NrNn7eSCKI2R9L4Tkc+vS/Xe7mSmJtvKPBuQC7GruIDFWuRDL8s4gsUMyHn
         W/puA+dERxHsoYr7hnXJRYT73sHuZk/S/wulOa3w64/FTxhhvCCQ42v3xA9wvwhB/eMK
         42tKUaf7LbYYn2QiU2fKOTzDK9kvk/ZVWHyUPpxDIREIYPqXF130WmB2HOKR1DgPH3a3
         oqVP8jLkk3tG4q8P/NiSKIQFuKeeRxCJ9ZqSoM1zsXebR46OGse+dJqtwqOxQHZXwhSK
         NYX8OABbGmYPPzdurt9wnZSgWdFWcnum4BzHPadd6iE5s8irOCvDk17I0lItx0yvhoXE
         OZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734377074; x=1734981874;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ykFNL3Q77su3l1hmkCa41V3LHYM0KyunH48W8conCI=;
        b=qX2rSTBHokLAFHT1XJKtgUK9ueoZz/xCwbsvaXftAmxw8IOUV6AMW/pJDX3JP/RLNk
         52MIjFk8v1hvvBn0YcbwzVplk5fBQrTXlvSRh5VLxQx3n0oaOWluwNKBy/0YtjI4/14O
         ZZxhJVWDUYKMaCf7/hBJ4dqAEhO/QtHWRJOPaZ8A0upDKGxBCkKaiNREjgKwnZ6hq1FW
         osEgStXR0IL1vDHzCSMjilaPu5uyM3393D0ddsyOjgA583HBIqib5K1Gje/vnRq9TMXw
         A9gJMBMxcbeQBO6CqR0txKeUAmHQKMtAOUxH91eOeEfRi4SBIIrUHFyVlWcwsnU1Wgp/
         N+RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiLG0ugE31VxcqhKsA3X19wykrK4yrhAybeq03dsavwBWDwtrda74jnnQlq98UVjpsfVb5v+Z15RA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUMgI/lrqnO5wcLzeHmnqqyzxvZFN+kmBGDpRbPyBDvDfAgwjD
	6Jj6RViuopjAOIwTsOo/qtDCB9GGcVTX54LdBsc4zo5OQ94z5EtrC63sJZyhS1CRbTJ16qbDDUq
	5Iw==
X-Google-Smtp-Source: AGHT+IEVw0uJl7cLZP7L5C6hpMFvqcbjARbisNWJ3VdxfhR00byT5nuQon+Itb1c7QrUoZSJH5F454tTzFQ=
X-Received: from pgbel4.prod.google.com ([2002:a05:6a02:4644:b0:7fd:40dd:86a5])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e80d:b0:215:b5d6:5fa8
 with SMTP id d9443c01a7336-21892a441admr219433885ad.22.1734377073676; Mon, 16
 Dec 2024 11:24:33 -0800 (PST)
Date: Mon, 16 Dec 2024 11:24:08 -0800
In-Reply-To: <20241216192419.2970941-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216192419.2970941-6-surenb@google.com>
Subject: [PATCH v6 05/16] types: move struct rcuwait into types.h
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

Move rcuwait struct definition into types.h so that rcuwait can be used
without including rcuwait.h which includes other headers. Without this
change mm_types.h can't use rcuwait due to a the following circular
dependency:

mm_types.h -> rcuwait.h -> signal.h -> mm_types.h

Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/rcuwait.h | 13 +------------
 include/linux/types.h   | 12 ++++++++++++
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/include/linux/rcuwait.h b/include/linux/rcuwait.h
index 27343424225c..9ad134a04b41 100644
--- a/include/linux/rcuwait.h
+++ b/include/linux/rcuwait.h
@@ -4,18 +4,7 @@
 
 #include <linux/rcupdate.h>
 #include <linux/sched/signal.h>
-
-/*
- * rcuwait provides a way of blocking and waking up a single
- * task in an rcu-safe manner.
- *
- * The only time @task is non-nil is when a user is blocked (or
- * checking if it needs to) on a condition, and reset as soon as we
- * know that the condition has succeeded and are awoken.
- */
-struct rcuwait {
-	struct task_struct __rcu *task;
-};
+#include <linux/types.h>
 
 #define __RCUWAIT_INITIALIZER(name)		\
 	{ .task = NULL, }
diff --git a/include/linux/types.h b/include/linux/types.h
index 2d7b9ae8714c..f1356a9a5730 100644
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -248,5 +248,17 @@ typedef void (*swap_func_t)(void *a, void *b, int size);
 typedef int (*cmp_r_func_t)(const void *a, const void *b, const void *priv);
 typedef int (*cmp_func_t)(const void *a, const void *b);
 
+/*
+ * rcuwait provides a way of blocking and waking up a single
+ * task in an rcu-safe manner.
+ *
+ * The only time @task is non-nil is when a user is blocked (or
+ * checking if it needs to) on a condition, and reset as soon as we
+ * know that the condition has succeeded and are awoken.
+ */
+struct rcuwait {
+	struct task_struct __rcu *task;
+};
+
 #endif /*  __ASSEMBLY__ */
 #endif /* _LINUX_TYPES_H */
-- 
2.47.1.613.gc27f4b7a9f-goog


