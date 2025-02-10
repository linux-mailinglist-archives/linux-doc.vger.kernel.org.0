Return-Path: <linux-doc+bounces-37625-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ED0A2F8DC
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 20:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35E653A580A
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2025 19:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08E32580D7;
	Mon, 10 Feb 2025 19:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZV2c84XJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1CA257AE9
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 19:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216297; cv=none; b=PznYNe5hcVUJsP0n867wLC+KozsoZa1C1K7xxMzzsjs7avLfnTc6vAw5HgzAvOKfaOLgvI3INq9wAKpDJNcFiFjgbemEPmuFVXoftggIFYsNbB5zk3L3yJOAlUrvfszoxGM9reP2OQ6V1zVfSZZs4ajkfVjEKdvhSAopbGZ0Ivk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216297; c=relaxed/simple;
	bh=Xaxds3jkrAWo/nPRt6XArpsBiXLgWRUTYm/DhS1e3Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bi3DepM4YOuA4gLdJk13ibL4fSXnDZ4vhydgTxfNGIcCkR+aI1xK9uJaZfvtwpuPQHSgd7AeBW1nqgKnvPFPfV4VgQUm5NGxNiFOIL3PZIl3U8CytzxVI3zSwfp695Tc7hOLpJkhj9A6N0CllJMUBB2uOs+7XFocuGARGqkFwWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZV2c84XJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739216295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sqeXk3kyzFMqBsxEiyyOZegmX6HzmCNZGUJC3XQma+8=;
	b=ZV2c84XJJndG+Sf1PG8iSrc28YSOduXCWnVk1TZ3O4l/hmk95tjtQMpqZIFBI1NTcqMszz
	sxuMATmviL61+TItFf5uJOWPJJ0CG+6T7+ylebvrY/omNZ0LRP6V63jtk5/gMdfSRmO2HP
	8I88fbi65WIJ4HGs+mxlqPh45TFjJ48=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-Ya2NcNeTMHmSsTHu4xgk0g-1; Mon, 10 Feb 2025 14:38:14 -0500
X-MC-Unique: Ya2NcNeTMHmSsTHu4xgk0g-1
X-Mimecast-MFC-AGG-ID: Ya2NcNeTMHmSsTHu4xgk0g
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43935bcec79so9251495e9.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 11:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739216293; x=1739821093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqeXk3kyzFMqBsxEiyyOZegmX6HzmCNZGUJC3XQma+8=;
        b=V+Fc1GEJreTLSRtt4ggmP+3GkebG90BJ1+KTb49VZw6cfsw/yKk/v4ZM2wj19l2ngL
         r0VPjSDCq2unpRg69Et6KuQCl4jGPS1fQ8DvH8H/YuiyfpTtb5YMvxNK2ZCmuCFUhyJ1
         Vn07LHzqb/WHDZrsOxIe+pdq605Y1TNtOLX39cS7xfxp8dMVjgh5g/4fZl9xvT0Mc1j9
         LbMWSDXFON8sqKKrTUGKxAqPKDsuYceg7RWCghD440Z7nIfQUXWlqP7kv30TrbTwPcOu
         o4dCar6KHyPWMD58jfy/AwLYyYE153IaSGMTBG9Mlmcx93v+fR7fdSi03joZzuzFua8N
         xDqA==
X-Gm-Message-State: AOJu0YwBSS62MfP4pgDzlmI8dxgt/yje/XqMqLo6OH1qr/ycGvuftdZz
	JP2c/dstiDEoEUeBiJuzSdTPM14jB6eKV30F/23ndtgp0KvT5/VvCOUMy9FXuoJMKATCpMpZQMd
	G/TmjCqLMcQotpaaOZKJfECi1J2rZ48O+oWAs6edd0aKOVnkITVQwk6tc4O/iv8liuSTl
X-Gm-Gg: ASbGncuhTCnvR1csFsKaI1xVHtPHPe9R+502R2tMs7egD1FMruR/ePl5L5n9HwMlkXt
	WpTLeLqxmQ8I8cXZynIyE4jq/RqeYyhATSiKUdC7nt3Bg1uZ+NC7PtyIn1y83DIKWQEVqpy1rm8
	oYKeA/RG2azM29/QwZV+kl7HYQLIqyXbQv59jOM9MQCNXfftVuGE+AxOU87nchVUFBaSGjdOGqt
	ls/7upxBP2qwFUWGtIFXLrw24dHD3sd+K0mlHkzI+DbejdPQc+KSi0I3J8N48Mv+ydqHXo9lwg1
	A7cdl3IS3XYLfUqeJaQkKhWdrD5ABcuXxy2LOCPyvZSmI9/6BhCA1NceQnGUtnxUHg==
X-Received: by 2002:a05:600c:34c4:b0:439:4b9e:461b with SMTP id 5b1f17b1804b1-4394b9e47dfmr21358115e9.14.1739216292947;
        Mon, 10 Feb 2025 11:38:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFz4p8WiTgagZxwnDzZ7MmocZCF9a1hUwQMJIvxH3cH5x6X+HJSMDirq9gM71FmkI7KhAXcpA==
X-Received: by 2002:a05:600c:34c4:b0:439:4b9e:461b with SMTP id 5b1f17b1804b1-4394b9e47dfmr21357855e9.14.1739216292555;
        Mon, 10 Feb 2025 11:38:12 -0800 (PST)
Received: from localhost (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43947bdc5c4sm26937995e9.23.2025.02.10.11.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:38:11 -0800 (PST)
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
	stable@vger.kernel.org
Subject: [PATCH v2 02/17] mm/rmap: reject hugetlb folios in folio_make_device_exclusive()
Date: Mon, 10 Feb 2025 20:37:44 +0100
Message-ID: <20250210193801.781278-3-david@redhat.com>
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

Even though FOLL_SPLIT_PMD on hugetlb now always fails with -EOPNOTSUPP,
let's add a safety net in case FOLL_SPLIT_PMD usage would ever be reworked.

In particular, before commit 9cb28da54643 ("mm/gup: handle hugetlb in the
generic follow_page_mask code"), GUP(FOLL_SPLIT_PMD) would just have
returned a page. In particular, hugetlb folios that are not PMD-sized
would never have been prone to FOLL_SPLIT_PMD.

hugetlb folios can be anonymous, and page_make_device_exclusive_one() is
not really prepared for handling them at all. So let's spell that out.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index c6c4d4ea29a7e..17fbfa61f7efb 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2499,7 +2499,7 @@ static bool folio_make_device_exclusive(struct folio *folio,
 	 * Restrict to anonymous folios for now to avoid potential writeback
 	 * issues.
 	 */
-	if (!folio_test_anon(folio))
+	if (!folio_test_anon(folio) || folio_test_hugetlb(folio))
 		return false;
 
 	rmap_walk(folio, &rwc);
-- 
2.48.1


