Return-Path: <linux-doc+bounces-25797-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC78A986A92
	for <lists+linux-doc@lfdr.de>; Thu, 26 Sep 2024 03:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B8621C217C3
	for <lists+linux-doc@lfdr.de>; Thu, 26 Sep 2024 01:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11ECA1A4E7A;
	Thu, 26 Sep 2024 01:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EadYPUZf"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ua1-f73.google.com (mail-ua1-f73.google.com [209.85.222.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4191A42AD
	for <linux-doc@vger.kernel.org>; Thu, 26 Sep 2024 01:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727314533; cv=none; b=Nfb+b4XJ0O1bDvMgAlS3IKwvYoROfiFeA/uxg/9Lgp0ADaOxMH7MQ9P5cJ/niUv2KBGvoDzLrljME8TX2DDIj0uQ6VB4ayO9WmKH7PMwPTP7iyC20IXf9h50DGWqSVAjTjaLU+XWGY3nVobm+MvoknHx9D9aBSqBV8NM123EqrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727314533; c=relaxed/simple;
	bh=TwJSAlmKBARZz/CI6deRJoTQbU3R7Kx2125IS9QJ4rA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e9FVYzK7glioitimZquezBrVKoiXlCN6qJ9r923172zEkMpt53GQFNcInJcb6F5YSSZigiXbNE7P1fYma2Hl43bAr9komtxWuAK9MD7hrxgYrsWWDwsaL4y15cPbPeKfOn6uPvNHZZMBlaAYE1KmtYDh/vzmungi2tN2T6nVynQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EadYPUZf; arc=none smtp.client-ip=209.85.222.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Received: by mail-ua1-f73.google.com with SMTP id a1e0cc1a2514c-846b7f5c6b6so171152241.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 18:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727314530; x=1727919330; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jwY5XxMaAH9vrNcOxKBlxaXWmYulPCq+P3CKqgHldo8=;
        b=EadYPUZfKnrSS3YLeCYgelEvWLhlKB3uT+jGwO7o8otaPiDZTDs6vPTCDMAMuzexXX
         rgRhn2L+UXm2VO1w7KD5z82x5ev47oSHETuz4a3gvs8Q41oV8LiCE8lC8A2xYqGpfCym
         bKFnQW8z08kxjWRqH3ZzYMRVHaILlsZt5DmsPauiZBobmhkcL4Y7NH+AzJjKnQNDY4j4
         d+w6z5kZA/FThfofQCbd+hqTzOEhqE98fu11+kWfWU3TdyA7s8XrNYOWWyy8alx2rc3F
         kH0vCw6jMeMd383Tr9P45gzfhqAcxTt0J1j5sRhHoQdjQFBz5i/4cFaeNbeq6uoWUxFO
         zxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727314530; x=1727919330;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jwY5XxMaAH9vrNcOxKBlxaXWmYulPCq+P3CKqgHldo8=;
        b=PqphtejHor4Vrnl+zRYgzDq6xH4RvJenQN5luLQB7lQ/DCTQqyt7FiVjiNA6JOeMHp
         RThcLf3D97C91vdnOGX8WCx+zG0pb4FfnkGK6T2V/Xc26EB5Ul/XXdZ8DZiEoALJ3PEh
         hSzajCjj26kKiSu27nAhoCH6jLoDFKnCHSFg8aQEuvruCwO8YD6Gkm8aAwE9Dl+guulS
         tfx6jeetFbWCXFwAVWMsDxE0Jcdjyyqq0/6Qugrl5MkVq+KgeKyE7BmHGeO14+cqNCJh
         xos0pbqUy/oRfIFtsSvh8rtzBCV27uLjKe2JL5Aw/xftj9iuP1FwuAiYA/nw+R5Bh9uM
         FYbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJrrb4eJNtk1RcavHcXpuk5g6TqqAerluvxd85jmPW+4jS85RsYZldGGkrELb5eW2kB+Dn9XVQVy8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8jNZSJHRGKlcmtUC20t12U9gDTGKYE10KasbqBrWOXmpSxVrv
	eUkGAx9b/75ipWJejCI5s2KRdg0ohobt6IxFoHAWuMxeLwIRguuyzAp2ZTLDVAhXSGHMw6Zasv8
	VyQ0q7/3oc6P+p5HC5A==
X-Google-Smtp-Source: AGHT+IFR+2qF3anIZYWl2APj1JzmMbbMXKjDESaaFvEMKsw92aYBHlJKDywpCEXIkyk1bOavtsxa/wF5vSbBnBSJ
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:13d:fb22:ac12:a84b])
 (user=jthoughton job=sendgmr) by 2002:ab0:380d:0:b0:846:d5f9:2186 with SMTP
 id a1e0cc1a2514c-84e83c0a7fdmr10563241.2.1727314529698; Wed, 25 Sep 2024
 18:35:29 -0700 (PDT)
Date: Thu, 26 Sep 2024 01:35:00 +0000
In-Reply-To: <20240926013506.860253-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240926013506.860253-1-jthoughton@google.com>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240926013506.860253-13-jthoughton@google.com>
Subject: [PATCH v7 12/18] mm: Add has_fast_aging to struct mmu_notifier
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Wei Xu <weixugc@google.com>, Yu Zhao <yuzhao@google.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

has_fast_aging should be set by subscribers that non-trivially implement
fast-only versions of both test_young() and clear_young().

Fast aging must be opt-in. For a subscriber that has not been
enlightened with "fast aging", the test/clear_young() will behave
identically whether or not fast_only is given. Have KVM always opt out
for now; specific architectures can opt-in later.

Given that KVM is the only test/clear_young() implementer, we could
instead add an equivalent check in KVM, but doing so would incur an
indirect function call every time, even if the notifier ends up being a
no-op.

Add mm_has_fast_young_notifiers() in case a caller wants to know if it
should skip many calls to the mmu notifiers that may not be necessary
(like MGLRU look-around).

Signed-off-by: James Houghton <jthoughton@google.com>
---
 include/linux/mmu_notifier.h | 14 ++++++++++++++
 mm/mmu_notifier.c            | 20 ++++++++++++++++++++
 virt/kvm/kvm_main.c          |  1 +
 3 files changed, 35 insertions(+)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index e2dd57ca368b..37643fa43687 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -231,6 +231,7 @@ struct mmu_notifier {
 	struct mm_struct *mm;
 	struct rcu_head rcu;
 	unsigned int users;
+	bool has_fast_aging;
 };
 
 /**
@@ -383,6 +384,7 @@ extern int __mmu_notifier_clear_young(struct mm_struct *mm,
 				      unsigned long end);
 extern int __mmu_notifier_test_young(struct mm_struct *mm,
 				     unsigned long address);
+extern bool __mm_has_fast_young_notifiers(struct mm_struct *mm);
 extern int __mmu_notifier_invalidate_range_start(struct mmu_notifier_range *r);
 extern void __mmu_notifier_invalidate_range_end(struct mmu_notifier_range *r);
 extern void __mmu_notifier_arch_invalidate_secondary_tlbs(struct mm_struct *mm,
@@ -428,6 +430,13 @@ static inline int mmu_notifier_test_young(struct mm_struct *mm,
 	return 0;
 }
 
+static inline bool mm_has_fast_young_notifiers(struct mm_struct *mm)
+{
+	if (mm_has_notifiers(mm))
+		return __mm_has_fast_young_notifiers(mm);
+	return 0;
+}
+
 static inline void
 mmu_notifier_invalidate_range_start(struct mmu_notifier_range *range)
 {
@@ -619,6 +628,11 @@ static inline int mmu_notifier_test_young(struct mm_struct *mm,
 	return 0;
 }
 
+static inline bool mm_has_fast_young_notifiers(struct mm_struct *mm)
+{
+	return 0;
+}
+
 static inline void
 mmu_notifier_invalidate_range_start(struct mmu_notifier_range *range)
 {
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index 8982e6139d07..c405e5b072cf 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -382,6 +382,26 @@ int __mmu_notifier_clear_flush_young(struct mm_struct *mm,
 	return young;
 }
 
+bool __mm_has_fast_young_notifiers(struct mm_struct *mm)
+{
+	struct mmu_notifier *subscription;
+	bool has_fast_aging = false;
+	int id;
+
+	id = srcu_read_lock(&srcu);
+	hlist_for_each_entry_rcu(subscription,
+				 &mm->notifier_subscriptions->list, hlist,
+				 srcu_read_lock_held(&srcu)) {
+		if (subscription->has_fast_aging) {
+			has_fast_aging = true;
+			break;
+		}
+	}
+	srcu_read_unlock(&srcu, id);
+
+	return has_fast_aging;
+}
+
 int __mmu_notifier_clear_young(struct mm_struct *mm,
 			       unsigned long start,
 			       unsigned long end)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 7d5b35cfc1ed..f6c369eccd2a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -930,6 +930,7 @@ static const struct mmu_notifier_ops kvm_mmu_notifier_ops = {
 static int kvm_init_mmu_notifier(struct kvm *kvm)
 {
 	kvm->mmu_notifier.ops = &kvm_mmu_notifier_ops;
+	kvm->mmu_notifier.has_fast_aging = false;
 	return mmu_notifier_register(&kvm->mmu_notifier, current->mm);
 }
 
-- 
2.46.0.792.g87dc391469-goog


