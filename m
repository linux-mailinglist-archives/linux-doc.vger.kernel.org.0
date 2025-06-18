Return-Path: <linux-doc+bounces-49598-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 921C8ADF427
	for <lists+linux-doc@lfdr.de>; Wed, 18 Jun 2025 19:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3AB43B7E13
	for <lists+linux-doc@lfdr.de>; Wed, 18 Jun 2025 17:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2FBA2F49E8;
	Wed, 18 Jun 2025 17:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZoUPmrG+"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2522F3C3D
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 17:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268424; cv=none; b=d7qr6WjAuNlhk8cBsVA2+5EsVONho+3x+dWDL+1KassgZQdIWsaLO2wYCIIaPQxFiEUXv9UzdcfUhvPjIM1pntsNoc8HVYeUU7bRuqBz2XruuK/QASLES2q2xiQn74lCiChYul5kn/LobE8uZSC1PBovDVGx0F+3GVEkZzIQCLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268424; c=relaxed/simple;
	bh=wZPj40i4K0nP1rLk9miNRYxiRA1RvKM5Mt/qKLAFa8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RTcPuRvSHcGE3zdEkxPR6Zrqaa7+yxed5kN8gkR2FRQ4hBFzn75qxrOE/GIMIZDTa9F8CxCmVJBNZ2yOOUbUxia3zstbfECLJJ2h3xGofRkHW+2/NfPm9wivqsmi2HjwFo8IwFYWyIDmy/mpAO/y1husjBu7L5iDFNnCLhy3dHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZoUPmrG+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kAt9cuNNODAnXK/nmmtOZ1rnZLVGre0BG0UABQvpVBg=;
	b=ZoUPmrG+/R0WOLmpIjvXJsAmpaOm3iQrbJPNfkW3qoBewGK2cBdbHILPpK5zZP3gd31+wO
	YFKajkWJXXL+iqEMfWC96l6xB3BgHaTqtUE5ZTe6x97/RiItDhG/Z+ixAGo4jmRip3ob8f
	WwhJHzc/tAaqQd2z3NxiBQNbo7KxZIo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-ZqS3ZV1lPpKgI12L6RRQKQ-1; Wed, 18 Jun 2025 13:40:18 -0400
X-MC-Unique: ZqS3ZV1lPpKgI12L6RRQKQ-1
X-Mimecast-MFC-AGG-ID: ZqS3ZV1lPpKgI12L6RRQKQ_1750268417
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451d30992bcso58186975e9.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 10:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268417; x=1750873217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kAt9cuNNODAnXK/nmmtOZ1rnZLVGre0BG0UABQvpVBg=;
        b=rxbX6NmmJyob2K3ncathfeRlzFU/2EcE8bWGhg/zPPFriyZG6rHrv7e2FKGu5M2tRQ
         TDKQCl2VlEPCjFKWpry5aNlQCfdmit8B1CWaL1h8ekxjJ4yRE/cNDg5J9/JAbrlzAhhL
         1VFBjeQZjv7Nh2ODEzbAm9lNDmAnBqrWuczC0VP3uIrjT9ddCapvShf829B+UpZdbhL3
         uVFpDINGngMRhy3iKLiY4qacFaL9J/GFdbJ1PjD5MZWAuvnrYTRdRKdDmuuNI7W6WOz4
         eSdoSUydqJta2PQt11x2nbMp7nCPEvD+3hYt2EvMdXJDUtRnlQHjDezz1XvpXQg5QSt/
         1OXw==
X-Forwarded-Encrypted: i=1; AJvYcCUboI3sU9/4WesRdLeXd6CrhWmaKgPGPKkej88KGmi/LGie0meTdHeu1hblUbjDxu4qZa7XBXaIcMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTcJF9yk7oT/+3STm/u0ULBtApBXl9WxGFTmvYFj96Q6Y8KEuM
	9Z9E1PErEsjzgFE+xsLj6hiY1H1Gf1S6gTZjdC6USCzWDsQOglwap5bkpfdHeTAkwFquXC7usOf
	ia9YBaJIjM8AWqINjXupwKlRmletjUOzAN3tL7dajIFkK5nD+L3urWmICdFx+kA==
X-Gm-Gg: ASbGncv7DJbo00ajlf5TaLoFx5bvg9q92BylzLPiv85x88QaubNvRQ7MSv2VL9OaelY
	NKBCnke2uFHLHhghw4VCs/eWxxi74A/RyOe70AFOHPG8LxJE9zFnhaGFebTtXEjAZyE3ZHn9Iq8
	kmaPrff4anSLB2jcOseUbKuR6ph+CXnni436pSFRwigOq141dxbjekJEDSdbnHO3BLQ77VR9tIA
	dRHs2CQUAZP0UKmJJk0oHZB/szLLDMZ7Q7nBOvlcAW7AKKVr3O8FlT0uwnESO0XAiCnAA+9n1id
	ReJO/YpJ+SJN2W4TM5KJTHE6aDZEaQkXQKsdgVFXvQ+22HMmbuEni7lcEnSW5qC2bto+oAtuepm
	Lpzh8aw==
X-Received: by 2002:a05:600c:c117:b0:450:d4ad:b7de with SMTP id 5b1f17b1804b1-4533cc69257mr159131825e9.3.1750268417464;
        Wed, 18 Jun 2025 10:40:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK6CJuAqwp4upaUAFmgBr8NRJjk1YOp/gZr+QzQDI0/4bBlZLAGc6Vo1CG+p/mbQiC9c5VzA==
X-Received: by 2002:a05:600c:c117:b0:450:d4ad:b7de with SMTP id 5b1f17b1804b1-4533cc69257mr159131415e9.3.1750268417023;
        Wed, 18 Jun 2025 10:40:17 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535ead2a84sm3430235e9.32.2025.06.18.10.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:16 -0700 (PDT)
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
Subject: [PATCH RFC 00/29] mm/migration: rework movable_ops page migration (part 1)
Date: Wed, 18 Jun 2025 19:39:43 +0200
Message-ID: <20250618174014.1168640-1-david@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Based on mm/mm-new.

In the future, as we decouple "struct page" from "struct folio", pages
that support "non-lru page migration" -- movable_ops page migration
such as memory balloons and zsmalloc -- will no longer be folios. They
will not have ->mapping, ->lru, and likely no refcount and no
page lock. But they will have flags :)

This is the first part (other parts not written yet) of decoupling
movable_ops page migration from folio migration.

In this series, we get rid of the ->mapping usage, and start cleaning up
the code + separating it from folio migration.

Migration core will have to be further reworked to not treat movable_ops
pages like folios. This is the first step into that direction.

RFC because I only did some light testing with virtio-balloon + zsmalloc
page migration, and have to polish some patch descriptions.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jerrin Shaji George <jerrin.shaji-george@broadcom.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: "Eugenio Pérez" <eperezma@redhat.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Minchan Kim <minchan@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Brendan Jackman <jackmanb@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Xu Xin <xu.xin16@zte.com.cn>
Cc: Chengming Zhou <chengming.zhou@linux.dev>
Cc: Miaohe Lin <linmiaohe@huawei.com>
Cc: Naoya Horiguchi <nao.horiguchi@gmail.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Rik van Riel <riel@surriel.com>
Cc: Harry Yoo <harry.yoo@oracle.com>
Cc: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>


David Hildenbrand (29):
  mm/balloon_compaction: we cannot have isolated pages in the balloon
    list
  mm/balloon_compaction: convert balloon_page_delete() to
    balloon_page_finalize()
  mm/zsmalloc: drop PageIsolated() related VM_BUG_ONs
  mm/page_alloc: allow for making page types sticky until freed
  mm/balloon_compaction: make PageOffline sticky
  mm/zsmalloc: make PageZsmalloc() sticky
  mm/migrate: rename isolate_movable_page() to
    isolate_movable_ops_page()
  mm/migrate: rename putback_movable_folio() to
    putback_movable_ops_page()
  mm/migrate: factor out movable_ops page handling into
    migrate_movable_ops_page()
  mm/migrate: remove folio_test_movable() and folio_movable_ops()
  mm/migrate: move movable_ops page handling out of move_to_new_folio()
  mm/zsmalloc: stop using __ClearPageMovable()
  mm/balloon_compaction: stop using __ClearPageMovable()
  mm/migrate: remove __ClearPageMovable()
  mm/migration: remove PageMovable()
  mm: rename __PageMovable() to page_has_movable_ops()
  mm/page_isolation: drop __folio_test_movable() check for large folios
  mm: remove __folio_test_movable()
  mm: stop storing migration_ops in page->mapping
  mm: convert "movable" flag in page->mapping to a page flag
  mm: rename PG_isolated to PG_movable_ops_isolated
  mm/page-flags: rename PAGE_MAPPING_MOVABLE to PAGE_MAPPING_ANON_KSM
  mm/page-alloc: remove PageMappingFlags()
  mm/page-flags: remove folio_mapping_flags()
  mm: simplify folio_expected_ref_count()
  mm: rename PAGE_MAPPING_* to FOLIO_MAPPING_*
  docs/mm: convert from "Non-LRU page migration" to "movable_ops page
    migration"
  mm/balloon_compaction: "movable_ops" doc updates
  mm/balloon_compaction: provide single balloon_page_insert() and
    balloon_mapping_gfp_mask()

 Documentation/mm/page_migration.rst  |  39 ++--
 arch/powerpc/platforms/pseries/cmm.c |   2 +-
 drivers/misc/vmw_balloon.c           |   3 +-
 drivers/virtio/virtio_balloon.c      |   4 +-
 fs/proc/page.c                       |   4 +-
 include/linux/balloon_compaction.h   |  90 ++++-----
 include/linux/fs.h                   |   2 +-
 include/linux/migrate.h              |  42 +----
 include/linux/mm.h                   |   4 +-
 include/linux/mm_types.h             |   1 -
 include/linux/page-flags.h           | 104 +++++++----
 include/linux/pagemap.h              |   2 +-
 include/linux/zsmalloc.h             |   2 +
 mm/balloon_compaction.c              |  21 ++-
 mm/compaction.c                      |  44 +----
 mm/gup.c                             |   4 +-
 mm/internal.h                        |   2 +-
 mm/ksm.c                             |   4 +-
 mm/memory-failure.c                  |   4 +-
 mm/memory_hotplug.c                  |   8 +-
 mm/migrate.c                         | 269 +++++++++++++++------------
 mm/page_alloc.c                      |  12 +-
 mm/page_isolation.c                  |  12 +-
 mm/rmap.c                            |  16 +-
 mm/util.c                            |   6 +-
 mm/vmscan.c                          |   6 +-
 mm/zpdesc.h                          |  15 +-
 mm/zsmalloc.c                        |  29 ++-
 28 files changed, 361 insertions(+), 390 deletions(-)


base-commit: 21f39cc0346ea2081a83f0469995144d75d23075
-- 
2.49.0


