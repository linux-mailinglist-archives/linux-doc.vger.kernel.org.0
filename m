Return-Path: <linux-doc+bounces-49610-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A1CADF482
	for <lists+linux-doc@lfdr.de>; Wed, 18 Jun 2025 19:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB4A216837C
	for <lists+linux-doc@lfdr.de>; Wed, 18 Jun 2025 17:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5AA52FE399;
	Wed, 18 Jun 2025 17:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gFnIXG88"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC002FD898
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 17:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268457; cv=none; b=ZXkgYq4WjsK3xtYhpHRhZzgaApSiI+IwhkjwVBJhX1sSzLgrtlj1jgUEuMygktWy4s80l8DOqiBN8gFaI6Nw5O46wWd8afQbZGc32D8N/hpVKghhZlwAkub0g+Ls8fKCjFTDcuNqFnOnacPw+QHf2UZUqtWeul/LLyAC+LOgUzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268457; c=relaxed/simple;
	bh=B4KdnntE/37K79ZPh7jyK3I0hRR/1p6A2DVmbrYflX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdgnhWOvmoWJBZ5Q1GlDrD3VyIjicbx6fwP8JvcguaH5REPBDxn43UfgccX2ocfPnVB6QgpiLY6lLW45Ibph0zgovQvzwj12P0EPfb1z1hz6EQsH10kyIU1vb7I5n1bAfADnkWMJ3OdefpjM7VJEAj3CsLgQlRaiwNPf7sSvT48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gFnIXG88; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HE4ZFr/3yO/kcvQGBFxRWJWFhigh7sWDavgkH8Q96v8=;
	b=gFnIXG88LC01Jo6lPbJ1TaKGfsw/qSVYvpFDxSw4ZKev2lxQty9BMknSdtiUEom0ppsCKO
	vNZ2aEVHgUWzAnvdG/5xFqBYJXWOtkvF5cQzy8EaJ2jYy8wKSGTxvrbxMUDQPEHldUitdW
	/i38MkVo1TKnmZU9Fi9azoruFqhPFmE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-E2kegLyaOY67m0DCNB5dSQ-1; Wed, 18 Jun 2025 13:40:50 -0400
X-MC-Unique: E2kegLyaOY67m0DCNB5dSQ-1
X-Mimecast-MFC-AGG-ID: E2kegLyaOY67m0DCNB5dSQ_1750268450
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d244bfabso59189245e9.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 10:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268450; x=1750873250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HE4ZFr/3yO/kcvQGBFxRWJWFhigh7sWDavgkH8Q96v8=;
        b=vto8oNaPHVlSqLD1yvTN44ygQRs97vH0qcN9OjMMpYgpyZthsRn4OdYmnbL14lU9Tr
         sHiR+MP/vn/lWJsJKSSOL9xAmVVVL0447pHVox9lYPk8U5pUaWzW63mpLXyTixYVBepx
         qf4vYB6JibP9/IpRT4KNMxY2a0sNEiNbwk9LobY6F86YCzss9W5z3fpYbtAWy/FOFhg4
         XLwsv1IAqhrc2xNep8QTOx+V4WcNQJwbRZPKv0MaaqOiSqYth6JKJv9SqdAb6TrVcNsk
         NIBqzcYtIjbbmjQb4GJQkiMFKCOY2XdG9oD/UhlHdZQSalT73I9hbZkh9Ve/bsg9TZG4
         rWTg==
X-Forwarded-Encrypted: i=1; AJvYcCUUHJjBp631XXU3Qv4b/bcgEgiGpEShjHEOm2yjQF6Ua+V2ROwwTYTYc2FvjoKSNemJxVRoN2NLr24=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNcaB54FT2+HCK7b+Ns1KMjS2tlSUPoLtoOmYO2NyU0v0NNljP
	zGW4qiHISl/25om5d4piXGpibOb/O3IYx+J3QSR7w7rmhAa8zv4EzmEqjv7VdURAFBAQOJ8TA0P
	7duY7dq4e/UipYiEesxOUlGrqvWHONN4WaCMU4JmCMN1AcxJqqyUcjas/K7E8wA==
X-Gm-Gg: ASbGnctsDXmGI2/k5yF0bdhTBJ2krLSlOCj5H0k6oeWqsCOSFhaZmTvdbZ/rTuhesk6
	GmVFlHkRPEvB20AKnnqpGduHvN0bonzf+jE9cTsLJZsxUlawTyY2/f6Odgu8DiBTfw19Tpc1ICI
	nsAtLxbcY9iJ5ImW+FLuU9OWfZcQ28zoQ9muPyBXlZ7xECO/gh4lxrculUK6yxJq6XAwzrJwEga
	C0XrC70bo+Zplm6joZTBf+bf690QD+zkOq0bqz2SZ4v5osltXykHEwRHl0l209doqTKodAhfjFz
	PCUHntWqP0XLaNG8IJgVrmuPrCwUBOoXaN08LVL+Ei2OxohpUMJSfof1EtaUou7APEW4QFMScDL
	KoVCkgg==
X-Received: by 2002:a05:600c:1d8c:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-4533caad0aemr171064595e9.19.1750268449532;
        Wed, 18 Jun 2025 10:40:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGznKIGl3nAorQ6sfOY/mgzfowzauuqoYlpxs90ugUrSAZIVXpSWN8Es+fpzvWy+uQJD/IOZw==
X-Received: by 2002:a05:600c:1d8c:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-4533caad0aemr171064285e9.19.1750268449019;
        Wed, 18 Jun 2025 10:40:49 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535e983c76sm3664265e9.10.2025.06.18.10.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:48 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH RFC 12/29] mm/zsmalloc: stop using __ClearPageMovable()
Date: Wed, 18 Jun 2025 19:39:55 +0200
Message-ID: <20250618174014.1168640-13-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618174014.1168640-1-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead, let's check in the callbacks if the page was already destroyed,
which can be checked by looking at zpdesc->zspage (see reset_zpdesc()).

If we detect that the page was destroyed:

(1) Fail isolation, just like the migration core would

(2) Fake migration success just like the migration core would

In the putback case there is nothing to do, as we don't do anything just
like the migration core would do.

In the future, we should look into not letting these pages get destroyed
while they are isolated -- and instead delaying that to the
putback/migration call. Add a TODO for that.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/zsmalloc.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index f98747aed4330..72c2b7562c511 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -876,7 +876,6 @@ static void reset_zpdesc(struct zpdesc *zpdesc)
 {
 	struct page *page = zpdesc_page(zpdesc);
 
-	__ClearPageMovable(page);
 	ClearPagePrivate(page);
 	zpdesc->zspage = NULL;
 	zpdesc->next = NULL;
@@ -1715,10 +1714,11 @@ static void replace_sub_page(struct size_class *class, struct zspage *zspage,
 static bool zs_page_isolate(struct page *page, isolate_mode_t mode)
 {
 	/*
-	 * Page is locked so zspage couldn't be destroyed. For detail, look at
-	 * lock_zspage in free_zspage.
+	 * Page is locked so zspage can't be destroyed concurrently
+	 * (see free_zspage()). But if the page was already destroyed
+	 * (see reset_zpdesc()), refuse isolation here.
 	 */
-	return true;
+	return page_zpdesc(page)->zspage;
 }
 
 static int zs_page_migrate(struct page *newpage, struct page *page,
@@ -1736,6 +1736,13 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	unsigned long old_obj, new_obj;
 	unsigned int obj_idx;
 
+	/*
+	 * TODO: nothing prevents a zspage from getting destroyed while
+	 * isolated: we should disallow that and defer it.
+	 */
+	if (!zpdesc->zspage)
+		return MIGRATEPAGE_SUCCESS;
+
 	/* The page is locked, so this pointer must remain valid */
 	zspage = get_zspage(zpdesc);
 	pool = zspage->pool;
-- 
2.49.0


