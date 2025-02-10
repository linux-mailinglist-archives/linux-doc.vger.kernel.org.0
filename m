Return-Path: <linux-doc+bounces-37635-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B057A2F909
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 20:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 989B37A3447
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 19:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1111E24E4B7;
	Mon, 10 Feb 2025 19:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IV3E+oh5"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7702524E4B8
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 19:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216335; cv=none; b=MQpK7nzCRAMOnnEBPp7KbVl0n+GtaGBA6PGEwlLQ7ij7hhsISZn8S1TSVsj1Z7FVcWBwmzD4q/n4SwIrUyOE7lsVqPU9idBXidZLPCBklA2e1YL3vv8RC3QxBYwUDOEFA0+k23+Q5NHshE0H+ej9+Rd4qlPdWGSOmB9iEUyC54Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216335; c=relaxed/simple;
	bh=cMJXMPJ9fLW/woS9dzf0yuP4P9GXVUKQkO8wkukVnbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XP1sl8pYMmG1DLwQpz2u3JyHj9NsndR3woTN9FZ8JfdHLwNu5h6aYP+NWGLw8q0pLpDVhYwVV4OAlQDFaj4l2LdiQ4MgZHPXyxYUk8mBnMfuLkzIqZ/aepB+GTZstgQHbYGa/6jYJWmiL+sE8qOOBJi6tqOlVKHm2xSSy+suYW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IV3E+oh5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739216332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LTEWxPe8B8Wum8eXVDX5hUwjNBhNNdMWJNli9ItwISM=;
	b=IV3E+oh5JFt2EQeY8n1ETUHLKzoML4cSdzYheRXm99ljPTM3eaV2TS7O7rz2UGMOkIkLuC
	Jpn/fN7+qDXZEsnW/eiee3KnlJOefY05Ool/52g5M+Xw1pzUa5/nvd2kRQewP6nc3dkPKd
	i3efRgAdNc0hBSIbIjzm71lxD3K3yoc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-UNB0vosnOp6gkA55uABesA-1; Mon, 10 Feb 2025 14:38:51 -0500
X-MC-Unique: UNB0vosnOp6gkA55uABesA-1
X-Mimecast-MFC-AGG-ID: UNB0vosnOp6gkA55uABesA
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4393786618bso12899785e9.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 11:38:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739216330; x=1739821130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTEWxPe8B8Wum8eXVDX5hUwjNBhNNdMWJNli9ItwISM=;
        b=m2WpeDLU2REYPXrU7IiNKWFJm2JdXP3TnC0iYokobBFuOeEZP5SvS6rp1E7MMuv6qq
         ktGVrQ+SlldVu4JsFjOINrHkfnM81Ey7jt/i/S2K7LV5d7YifCz7xc8zXJsfpkMHWH3T
         gEwpMsMxEg5jYhQxNkJh1IU4TOWQsBVFBr92MV3GDSVXTxB7LgkD2x8gZUr+7ST6iK6s
         Ab8U0lfMdxTsLNVo/hPi3rel4VsfN98eIwikUnfmkXIIfnUNT0VXxKYgRT1/RTg+N7Ac
         a0ysROnih33UBbfyHuW9lnIStVdJ6Boge87iDJVrHsA65WVmlO1rw2Ta2Gt7A8YO7yBH
         yasg==
X-Gm-Message-State: AOJu0YzzYVVQ+M9Vfn66cS/CBKObYYR/axsAIRHniA6jWf5i9eRsywx5
	j4u5aDZKyDe590tU5Ah+66aVeLDB00D+z/EGjmSW/DkBJZ81EybLhb1l/ukNlxGrA4pnIDGRryc
	VfhD2DFq69bHo+hKkrVXQHvKP1g2l2BBza0rlHK6EZXtGdCUDgPqVF9k4KQ==
X-Gm-Gg: ASbGncsTfMRUXAbufPd2kwMezx/BYsu8YByT/FXnXbuqkuF9LL2HWOxCoElGWVzmNZh
	EOyY8PKAloyygo+Q/ANWbcrtQ+G/Qu5xeD3+B2UfWZjEgguVwWotZs+0pv7F22yOe5EvD1VYKL6
	FXiNBFdOlgmlxlg7riaq6l6ABJf6RB8dqWMzAzAXc3dkzQQ3k3rdnj8T/Yhh7SqUfR/V0eDYA0t
	lfMdBgPbJ9Gomqwn2g93UqwZ6Vw3A/u2VU+6ELup0aRz5tobXIEBr3W98AkYRQNnKQGtov+cJxe
	gfaVPrZkiqhNFq6RwWL/PiBqwlRcSqwR3no6ekGm04WHoHA7AInvDZjBUGImkRq40A==
X-Received: by 2002:a05:600c:4f89:b0:439:4bb0:aba0 with SMTP id 5b1f17b1804b1-4394bb0adb6mr17902805e9.8.1739216329963;
        Mon, 10 Feb 2025 11:38:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0Un4mhmMUf8CyrAHOSxNb3M+hrifrlRxr2GMjHtCC/u6kqhVG2aMU260gZj/4uoW1cKICNg==
X-Received: by 2002:a05:600c:4f89:b0:439:4bb0:aba0 with SMTP id 5b1f17b1804b1-4394bb0adb6mr17902495e9.8.1739216329619;
        Mon, 10 Feb 2025 11:38:49 -0800 (PST)
Received: from localhost (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43947bdc5c4sm26951255e9.23.2025.02.10.11.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:38:48 -0800 (PST)
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
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 12/17] mm/rmap: handle device-exclusive entries correctly in page_vma_mkclean_one()
Date: Mon, 10 Feb 2025 20:37:54 +0100
Message-ID: <20250210193801.781278-13-david@redhat.com>
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

Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
we can return with a device-exclusive entry from page_vma_mapped_walk().

page_vma_mkclean_one() is not prepared for that, so teach it about these
PFN swap PTEs. Note that device-private entries are so far not applicable
on that path, as we expect ZONE_DEVICE pages so far only in migration code
when it comes to the RMAP.

Note that we could currently only run into this case with
device-exclusive entries on THPs. We still adjust the mapcount on
conversion to device-exclusive; this makes the rmap walk
abort early for small folios, because we'll always have
!folio_mapped() with a single device-exclusive entry. We'll adjust the
mapcount logic once all page_vma_mapped_walk() users can properly
handle device-exclusive entries.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/rmap.c b/mm/rmap.c
index 7c471c3ea64c4..7b737f0f68fb5 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1044,6 +1044,14 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
 			pte_t *pte = pvmw->pte;
 			pte_t entry = ptep_get(pte);
 
+			/*
+			 * PFN swap PTEs, such as device-exclusive ones, that
+			 * actually map pages are clean and not writable from a
+			 * CPU perspective. The MMU notifier takes care of any
+			 * device aspects.
+			 */
+			if (!pte_present(entry))
+				continue;
 			if (!pte_dirty(entry) && !pte_write(entry))
 				continue;
 
-- 
2.48.1


