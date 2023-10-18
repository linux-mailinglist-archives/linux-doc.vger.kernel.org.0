Return-Path: <linux-doc+bounces-473-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 309067CD17F
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 02:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA27D280F6E
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 00:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80463A5B;
	Wed, 18 Oct 2023 00:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KgneW3Oe"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F04630
	for <linux-doc@vger.kernel.org>; Wed, 18 Oct 2023 00:55:53 +0000 (UTC)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A4CF9
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 17:55:51 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a839b31a0dso65834097b3.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 17:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697590550; x=1698195350; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RtN1cX7OnFY4c89ZOmsAINIHxJE4cdFfX8n5PNBpJGI=;
        b=KgneW3Oe5RHM8xksCub1w77ZaBsnFs5fWKyELoxmpt+V5UjkrheW3h5b9u/KAVAc3Y
         Go8N4AsXF7YHU84oRKrLsb+WxZVl5H27os50mzHla9C0a0FH3OiAC8g8rW5elmDHox50
         QgFIxZpcVe665cpWJvsN1vSb0sC8Vl7zeq+BxNRGvGdHiwHnAsEj6+2/2MfdUS0GN4TI
         kypfYCKgObKZoSU11IJnGFyR+lOLCYulYfgBGgDlwouTA2twT/sSUIuhuAggBWYUrZLD
         bv89JGD9YhKGVEeNMCK/7ZC2UqFmFxX5IeyqWsYtFR+T+JWWEVe5oL6rZCNqZwNYtB/V
         2NGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697590550; x=1698195350;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RtN1cX7OnFY4c89ZOmsAINIHxJE4cdFfX8n5PNBpJGI=;
        b=QU3AibmawvQICmc2M3WUCUj/CHioEqMnKX0+s9nZuIKahgiEsNGs6SAyDMR2RS+K4E
         jsnrBXT/FNbSoMyCnjiiJN0SXOWc9ApgrVHGSBhoVJIjh2iw9NOp+flMj4rb7MzUQL19
         EbHfxz8Xznd0uxzGTkO31UEj/UhNsedSaYKiOrwAkyglUDOoZ4Aia/08aST7G86FdtRt
         1lLt8aLrTnbgu5zId3Fr1Z9KevgYv+zbIODUk9MHyzFf+dBns9UQJYJH58lcgNMzCoc8
         cYEXHg2OkNieWw2nYBQKWyVHHS+3zbriR/OoBs69kU6ryA+IcvKiCdi/JmLhezqOGcTZ
         F6Tg==
X-Gm-Message-State: AOJu0YzS9HYtHbXtNQ9EYSFLJswJTGb7gAYEcs1DjrBq2ZIuW+yERfJU
	Om6JkNxPBxA+MFI8HHMjsUW0b3RSBI6Xjq7TZg==
X-Google-Smtp-Source: AGHT+IG3xQKinhI0hluOWrkIGk67L4r7161FfPWTDhQsiOFXX1Myf7Znfr216Md1QRT5RSFMskz/ufJkibAIW2xRaw==
X-Received: from souravpanda.svl.corp.google.com ([2620:15c:2a3:200:26ea:df99:e4a5:e557])
 (user=souravpanda job=sendgmr) by 2002:a81:4f94:0:b0:5a7:b9b0:d23f with SMTP
 id d142-20020a814f94000000b005a7b9b0d23fmr80315ywb.6.1697590550545; Tue, 17
 Oct 2023 17:55:50 -0700 (PDT)
Date: Tue, 17 Oct 2023 17:55:47 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231018005548.3505662-1-souravpanda@google.com>
Subject: [PATCH v2 0/1] mm: report per-page metadata information
From: Sourav Panda <souravpanda@google.com>
To: corbet@lwn.net, gregkh@linuxfoundation.org, rafael@kernel.org, 
	akpm@linux-foundation.org, mike.kravetz@oracle.com, muchun.song@linux.dev, 
	rppt@kernel.org, david@redhat.com, rdunlap@infradead.org, 
	chenlinxuan@uniontech.com, yang.yang29@zte.com.cn, souravpanda@google.com, 
	tomas.mudrunka@gmail.com, bhelgaas@google.com, ivan@cloudflare.com, 
	pasha.tatashin@soleen.com, yosryahmed@google.com, hannes@cmpxchg.org, 
	shakeelb@google.com, kirill.shutemov@linux.intel.com, 
	wangkefeng.wang@huawei.com, adobriyan@gmail.com, vbabka@suse.cz, 
	Liam.Howlett@Oracle.com, surenb@google.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	willy@infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Changelog:
v2:
	- Fixed the three bugs reported by kernel test robot.
	- Enhanced the commit message as recommended by David Hildenbrand.
	- Addressed comments from Matthew Wilcox:
	  	- Simplified alloc_vmemmap_page_list() and
		  free_page_ext() as recommended.
		- Used the appropriate comment style in mm/vmstat.c.
		- Replaced writeout_early_perpage_metadata() with
		  store_early_perpage_metadata() to reduce ambiguity
		  with what swap does.
	- Addressed comments from Mike Rapoport:
	  	- Simplified the loop in alloc_vmemmap_page_list().
		- Could NOT address a comment to move
		  store_early_perpage_metadata() near where nodes
		  and page allocator are initialized.
		- Included the vmalloc()ed page_ext in accounting
		  within free_page_ext().
		- Made early_perpage_metadata[MAX_NUMNODES] static.


Previous approaches and discussions
-----------------------------------
v1:
https://lore.kernel.org/r/20230913173000.4016218-2-souravpanda@google.com

Hi!

This patch adds a new per-node PageMetadata field to
/sys/devices/system/node/nodeN/meminfo and a global PageMetadata field
to /proc/meminfo. This information can be used by users to see how much
memory is being used by per-page metadata, which can vary depending on
build configuration, machine architecture, and system use.

Per-page metadata is the amount of memory that Linux needs in order to
manage memory at the page granularity. The majority of such memory is
used by "struct page" and "page_ext" data structures.


Background
----------

Kernel overhead observability is missing some of the largest
allocations during runtime, including vmemmap (struct pages) and
page_ext. This patch aims to address this problem by exporting a
new metric PageMetadata.

On the contrary, the kernel does provide observibility for boot memory
allocations. For example, the metric reserved_pages depicts the pages
allocated by the bootmem allocator. This can be simply calculated as
present_pages - managed_pages, which are both exported in /proc/zoneinfo.
The metric reserved_pages is primarily composed of struct pages and
page_ext.

What about the struct pages (allocated by bootmem allocator) that are
free'd during hugetlbfs allocations and then allocated by buddy-allocator
once hugtlbfs pages are free'd?

/proc/meminfo MemTotal changes: MemTotal does not include memblock
allocations but includes buddy allocations. However, during runtime
memblock allocations can be shifted into buddy allocations, and therefore
become part of MemTotal.

Once the struct pages get allocated by buddy allocator, we lose track of
these struct page allocations overhead accounting. Therefore, we must
export a new metric that we shall refer to as PageMetadata (exported by
node). This shall also comprise the struct page and page_ext allocations
made during runtime.

Results and analysis
--------------------

Memory model: Sparsemem-vmemmap
$ echo 1 > /proc/sys/vm/hugetlb_optimize_vmemmap

$ cat /proc/meminfo | grep MemTotal
	MemTotal:       32918196 kB
$ cat /proc/meminfo | grep Meta
	PageMetadata:     589824 kB
$ cat /sys/devices/system/node/node0/meminfo | grep Meta
	Node 0 PageMetadata:     294912 kB
$ cat /sys/devices/system/node/node1/meminfo | grep Meta
	Node 1 PageMetadata:     294912 kB


AFTER HUGTLBFS RESERVATION
$ echo 512 > /proc/sys/vm/nr_hugepages

$ cat /proc/meminfo | grep MemTotal

MemTotal:       32934580 kB
$ cat /proc/meminfo | grep Meta
PageMetadata:     575488 kB
$ cat /sys/devices/system/node/node0/meminfo | grep Meta
Node 0 PageMetadata:     287744 kB
$ cat /sys/devices/system/node/node1/meminfo | grep Meta
Node 1 PageMetadata:     287744 kB

AFTER FREEING HUGTLBFS RESERVATION
$ echo 0 > /proc/sys/vm/nr_hugepages
$ cat /proc/meminfo | grep MemTotal
MemTotal:       32934580 kB
$ cat /proc/meminfo | grep Meta
PageMetadata:    589824 kB
$ cat /sys/devices/system/node/node0/meminfo | grep Meta
Node 0 PageMetadata:       294912 kB
$ cat /sys/devices/system/node/node1/meminfo | grep Meta
Node 1 PageMetadata:       294912 kB

Sourav Panda (1):
  mm: report per-page metadata information

 Documentation/filesystems/proc.rst |  3 +++
 drivers/base/node.c                |  2 ++
 fs/proc/meminfo.c                  |  7 +++++++
 include/linux/mmzone.h             |  3 +++
 include/linux/vmstat.h             |  4 ++++
 mm/hugetlb.c                       |  8 +++++++-
 mm/hugetlb_vmemmap.c               |  8 +++++++-
 mm/mm_init.c                       |  3 +++
 mm/page_alloc.c                    |  1 +
 mm/page_ext.c                      | 18 ++++++++++++++----
 mm/sparse-vmemmap.c                |  3 +++
 mm/sparse.c                        |  7 ++++++-
 mm/vmstat.c                        | 24 ++++++++++++++++++++++++
 13 files changed, 84 insertions(+), 7 deletions(-)

-- 
2.42.0.655.g421f12c284-goog


