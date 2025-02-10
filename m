Return-Path: <linux-doc+bounces-37624-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CD7A2F8D2
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 20:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3FBB3A5C5A
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 19:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DB9257AD5;
	Mon, 10 Feb 2025 19:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H4uRtLdm"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF222566F6
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 19:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216294; cv=none; b=ksOhRB5H4vhoU0NyCbd58gIN1bSmTQGJiJmfy7UIrWeiCpvpQ/tscGc5Kv9Go6LsyMQpE4Kp+qVz8d5JIErfO8auqzQQP/aZi3RvraNp1HgZ7+EyOGm/15EWZleOaTh+wSUeIK3qR9AHDw0qbipDnGirenWd1qvQYrj9960OhEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216294; c=relaxed/simple;
	bh=ODeZini8JnqXcIwx+tCC9TEASo3kB4fA5d8uBTr46Z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RgN8DFkKhW961V37imMjayCwftYtp1q574PAqoq2tlyLAUxuw4s+lWHXmPMwTzEWXXTtZTM+ZGPkkfpuh3yIs2IaOCYH7IrZnwnjZylJg14PCtUty1q2elbNwuekDJ1Nf2FS6ALz0/k+UbKSgKfBMjYA6RcZuGZk3wn/XJhaUzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H4uRtLdm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739216291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h7zrLQOHNY2WMB4NJ6M+YTGeviHiiyTUNMzrBj8byNk=;
	b=H4uRtLdmW1Qx/vAND7WqmIRmVsw8cZXf4ZLVsvR0Qu4v5YeyfnZSDj1mEc5A33TGvObCxp
	cjenRbbif3wv4vuPBpPdd6xKjduAO3iOG9UyaLe3f72Os1JISWHCfF2XFIMI1aDSVmGBVf
	Snb8lZ48Ri9vapgiFlDOuPMD6lesk14=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-1waMUN1VOfK8ZOoQkp_OoQ-1; Mon, 10 Feb 2025 14:38:10 -0500
X-MC-Unique: 1waMUN1VOfK8ZOoQkp_OoQ-1
X-Mimecast-MFC-AGG-ID: 1waMUN1VOfK8ZOoQkp_OoQ
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43933bdcce0so16046635e9.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 11:38:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739216289; x=1739821089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7zrLQOHNY2WMB4NJ6M+YTGeviHiiyTUNMzrBj8byNk=;
        b=Nmxen666aPM/C/1oGOnuIIT52IeE2vO4XdJSka1xRcuJ6Nhzhp9xNvlRxaclBHxdPF
         qeQgMTHRcuNgAmVQbY2rTn5YsoFhxWQKovzx0wP7LBqx222RBnda14/fVOKdQ0RTdFzm
         6S4lMY6MDOkzTv+tPIa92vijbdgyPyiyGsH15vtLquRpHgoEQu9SXB1sP43CeNgexvz0
         8Ez7mSXUY5hy/TczvsLNH/XcDP4JXEY+lYK4ohObAdg/TjJot4OTJ1/1c0ASx7bB3mPF
         D9cx46Np7+w1ExjnNtov1rP5MIMSbLGrI/d5I2aHomDndp+nkUS3ACe4vQ5RLpWu1Joa
         IurQ==
X-Gm-Message-State: AOJu0YwaCcxHvE7QIfp+GE95qXlNMTLM/7OrLmIaw+u6ZAYBuwBmW/U2
	kocXDi3QXTpmc6zyAd376KdWUQNIpMSxcgzOP/MUznkThXaGVP9BYLUGkQjsN0VkdlRbmqhZpjq
	gRtfBMpZ7aey0Z1rF1wA7biZLlkQjdPIwjYzOwcfwTTaPuIto+rPspygOfg==
X-Gm-Gg: ASbGnctHIRdvrWvUG5h3JaUVhgTMY73bogehLcPZDW5hnyB1SnoWdm8v/WvBbelLXfT
	EtwKbKEwn01UWNeOj7ocQjh0wA1/6sePYuNBZ0GbyaWdzLsfXEyRN5qYABBBrRfKMpiHkY52h4h
	r1zJgRNXuUlVMUZO0to1uBhwsq4E3SrDjKlebu+0GqCVElvKsbFHaABEkVSsgP0ijOA4YWAJTAc
	1uFHPxJ+l9CFyNG+Z2p38DPy/T7FRxpL2+onsa2EGRKNxeciIawWHTkpulsRou0cebNNqJdgJXX
	apeZmU0U//z82/teVpeFn/fng8f60MQy8NFFyGwvlbLZQjFDEp+Cpxl9e5Hzaci69A==
X-Received: by 2002:a05:600c:3482:b0:439:42c6:f108 with SMTP id 5b1f17b1804b1-43942c6f621mr54495795e9.6.1739216289153;
        Mon, 10 Feb 2025 11:38:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBNHtYM4Npt0edDE/HafeE1RKAAghby0XrE6w/BdutPKy4T8is0nT67O6E9ZhRDeehOSIMcA==
X-Received: by 2002:a05:600c:3482:b0:439:42c6:f108 with SMTP id 5b1f17b1804b1-43942c6f621mr54495475e9.6.1739216288775;
        Mon, 10 Feb 2025 11:38:08 -0800 (PST)
Received: from localhost (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-439452533ecsm23523535e9.0.2025.02.10.11.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:38:07 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	damon@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>,
	Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 01/17] mm/gup: reject FOLL_SPLIT_PMD with hugetlb VMAs
Date: Mon, 10 Feb 2025 20:37:43 +0100
Message-ID: <20250210193801.781278-2-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We only have two FOLL_SPLIT_PMD users. While uprobe refuses hugetlb
early, make_device_exclusive_range() can end up getting called on
hugetlb VMAs.

Right now, this means that with a PMD-sized hugetlb page, we can end
up calling split_huge_pmd(), because pmd_trans_huge() also succeeds
with hugetlb PMDs.

For example, using a modified hmm-test selftest one can trigger:

[  207.017134][T14945] ------------[ cut here ]------------
[  207.018614][T14945] kernel BUG at mm/page_table_check.c:87!
[  207.019716][T14945] Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
[  207.021072][T14945] CPU: 3 UID: 0 PID: ...
[  207.023036][T14945] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-2.fc40 04/01/2014
[  207.024834][T14945] RIP: 0010:page_table_check_clear.part.0+0x488/0x510
[  207.026128][T14945] Code: ...
[  207.029965][T14945] RSP: 0018:ffffc9000cb8f348 EFLAGS: 00010293
[  207.031139][T14945] RAX: 0000000000000000 RBX: 00000000ffffffff RCX: ffffffff8249a0cd
[  207.032649][T14945] RDX: ffff88811e883c80 RSI: ffffffff8249a357 RDI: ffff88811e883c80
[  207.034183][T14945] RBP: ffff888105c0a050 R08: 0000000000000005 R09: 0000000000000000
[  207.035688][T14945] R10: 00000000ffffffff R11: 0000000000000003 R12: 0000000000000001
[  207.037203][T14945] R13: 0000000000000200 R14: 0000000000000001 R15: dffffc0000000000
[  207.038711][T14945] FS:  00007f2783275740(0000) GS:ffff8881f4980000(0000) knlGS:0000000000000000
[  207.040407][T14945] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  207.041660][T14945] CR2: 00007f2782c00000 CR3: 0000000132356000 CR4: 0000000000750ef0
[  207.043196][T14945] PKRU: 55555554
[  207.043880][T14945] Call Trace:
[  207.044506][T14945]  <TASK>
[  207.045086][T14945]  ? __die+0x51/0x92
[  207.045864][T14945]  ? die+0x29/0x50
[  207.046596][T14945]  ? do_trap+0x250/0x320
[  207.047430][T14945]  ? do_error_trap+0xe7/0x220
[  207.048346][T14945]  ? page_table_check_clear.part.0+0x488/0x510
[  207.049535][T14945]  ? handle_invalid_op+0x34/0x40
[  207.050494][T14945]  ? page_table_check_clear.part.0+0x488/0x510
[  207.051681][T14945]  ? exc_invalid_op+0x2e/0x50
[  207.052589][T14945]  ? asm_exc_invalid_op+0x1a/0x20
[  207.053596][T14945]  ? page_table_check_clear.part.0+0x1fd/0x510
[  207.054790][T14945]  ? page_table_check_clear.part.0+0x487/0x510
[  207.055993][T14945]  ? page_table_check_clear.part.0+0x488/0x510
[  207.057195][T14945]  ? page_table_check_clear.part.0+0x487/0x510
[  207.058384][T14945]  __page_table_check_pmd_clear+0x34b/0x5a0
[  207.059524][T14945]  ? __pfx___page_table_check_pmd_clear+0x10/0x10
[  207.060775][T14945]  ? __pfx___mutex_unlock_slowpath+0x10/0x10
[  207.061940][T14945]  ? __pfx___lock_acquire+0x10/0x10
[  207.062967][T14945]  pmdp_huge_clear_flush+0x279/0x360
[  207.064024][T14945]  split_huge_pmd_locked+0x82b/0x3750
...

Before commit 9cb28da54643 ("mm/gup: handle hugetlb in the generic
follow_page_mask code"), we would have ignored the flag; instead, let's
simply refuse the combination completely in check_vma_flags(): the
caller is likely not prepared to handle any hugetlb folios.

We'll teach make_device_exclusive_range() separately to ignore any hugetlb
folios as a future-proof safety net.

Fixes: 9cb28da54643 ("mm/gup: handle hugetlb in the generic follow_page_mask code")
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index 3883b307780ea..61e751baf862c 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1283,6 +1283,9 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
 	if ((gup_flags & FOLL_LONGTERM) && vma_is_fsdax(vma))
 		return -EOPNOTSUPP;
 
+	if ((gup_flags & FOLL_SPLIT_PMD) && is_vm_hugetlb_page(vma))
+		return -EOPNOTSUPP;
+
 	if (vma_is_secretmem(vma))
 		return -EFAULT;
 
-- 
2.48.1


