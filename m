Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2C526A5C5
	for <lists+linux-doc@lfdr.de>; Tue, 15 Sep 2020 15:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgIONAz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 15 Sep 2020 09:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbgIONAY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 09:00:24 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7B1C06174A
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:00:08 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id s14so2688334pju.1
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IFig9ACO4bSS32kx/lDqlgTRWm2lqua6M6hUcvyGFR8=;
        b=B9ojoIjDFZ9eF0ICOMpjQvnzYZWgEFslXcMRchF5bHGTN+Gs/cQhddDbUEdXc6MeyB
         R+TMnXJoPPxmQwJ56a9Gnc01PpUNBX1HIANP0gYofuAA3aAmgq+tvGo8U6HiqIm0C/J0
         oEIAe6LSlOXWtpadXOgFatYpd6+V6hATPrGv2gLfOM/1cwTEe0n4atiy3M40UeuoTaXn
         y/NstleAjNRdvriNCxTKAdt3OvF/KC2gGdvH5sjewgWAeb3PKRA02U+bdiLympzTrsPV
         YoNhH97t7Dd7k9wcRYVVMVdkTmZ0WJZGpElS0kZUAzHxwu+yOIekQSpcGXzhznPTCLNt
         Byrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IFig9ACO4bSS32kx/lDqlgTRWm2lqua6M6hUcvyGFR8=;
        b=lQZkpSD4mj6cGjCgs3w348TOht9RjumibfkhLn3LGGgHaksW1wJhrCP+gDnKJWrPxS
         3LQBOk+z7XO9W4dkSZzmUMoFBJWusx27hypwV/eaYEG7aBRMzCI0ddY2hvlPgQ/ODane
         pu4XKdJA7HG6wlN31Ikv+2oYa8eR3mfGzSeIpwb7iobLC5EuhxRQG9IhenKsWcHmZtqN
         wjKcE+0izFXWUPjesMpimAVpI7qhROCu30cpjWQYEfkTr3hNnfbVumE7SQJ++jMRF+7M
         by9K1SsUpmqF7GISOOmQWVteiCYzNq3IU+NaEkbi3xcg91dEQKsdUtSIMlpqvKRdR+iL
         7e9A==
X-Gm-Message-State: AOAM5331Xi4oZ6DZs4Q32+6EuNiTx7jcwi+GLS4s2/CtgljoO/PGCdmt
        3Atz3YaCppmCuGN1Aa5Gbs9Rsw==
X-Google-Smtp-Source: ABdhPJweCFGKb+8Bpk7lpOwwgL1O+W4g/G43QI96b0WrwCjZbzTFpN+tMKrXVGoqnvzds1F5KoKRqA==
X-Received: by 2002:a17:90b:2347:: with SMTP id ms7mr3974046pjb.135.1600174807782;
        Tue, 15 Sep 2020 06:00:07 -0700 (PDT)
Received: from localhost.bytedance.net ([103.136.220.66])
        by smtp.gmail.com with ESMTPSA id w185sm14269855pfc.36.2020.09.15.05.59.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 06:00:07 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [RFC PATCH 00/24] mm/hugetlb: Free some vmemmap pages of hugetlb page
Date:   Tue, 15 Sep 2020 20:59:23 +0800
Message-Id: <20200915125947.26204-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

This patch series will free some vmemmap pages(struct page structures)
associated with each hugetlbpage when preallocated to save memory.

Nowadays we track the status of physical page frames using `struct page`
arranged in one or more arrays. And here exists one-to-one mapping between
the physical page frame and the corresponding `struct page`.

The hugetlbpage support is built on top of multiple page size support
that is provided by most modern architectures. For example, x86 CPUs
normally support 4K and 2M (1G if architecturally supported) page sizes.
Every hugetlbpage has more than one `struct page`. The 2M hugetlbpage
has 512 `struct page` and 1G hugetlbpage has 4096 `struct page`. But
in the core of hugetlbpage only uses the first 4 `struct page` to store
metadata associated with each hugetlbpage. The rest of the `struct page`
are usually read the compound_head field which are all the same value.
If we can free some struct page memory to buddy system so that We can
save a lot of memory.

When the system boot up, every 2M hugetlbpage has 512 `struct page` which
is 8 pages(sizeof(struct page) * 512 / PAGE_SIZE).

   hugetlbpage                   struct page(8 pages)          page frame(8 pages)
  +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
  |           |                     |     0     | -------------> |     0     |
  |           |                     |     1     | -------------> |     1     |
  |           |                     |     2     | -------------> |     2     |
  |           |                     |     3     | -------------> |     3     |
  |           |                     |     4     | -------------> |     4     |
  |     2M    |                     |     5     | -------------> |     5     |
  |           |                     |     6     | -------------> |     6     |
  |           |                     |     7     | -------------> |     7     |
  |           |                     +-----------+                +-----------+
  |           |
  |           |
  +-----------+


When a hugetlbpage is preallocated, we can change the mapping from above to
bellow.

   hugetlbpage                   struct page(8 pages)          page frame(8 pages)
  +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
  |           |                     |     0     | -------------> |     0     |
  |           |                     |     1     | -------------> |     1     |
  |           |                     |     2     | -------------> +-----------+
  |           |                     |     3     | -----------------^ ^ ^ ^ ^
  |           |                     |     4     | -------------------+ | | |
  |     2M    |                     |     5     | ---------------------+ | |
  |           |                     |     6     | -----------------------+ |
  |           |                     |     7     | -------------------------+
  |           |                     +-----------+
  |           |
  |           |
  +-----------+

The mapping of the first page(index 0) and the second page(index 1) is
unchanged. The remaining 6 pages are all mapped to the same page(index
1). So we only need 2 pages for vmemmap area and free 6 pages to the
buddy system to save memory. Why we can do this? Because the content
of the remaining 7 pages are usually same except the first page.

When a hugetlbpage is freed to the buddy system, we should allocate 6
pages for vmemmap pages and restore the previous mapping relationship.

If we uses the 1G hugetlbpage, we can save 4095 pages. This is a very
substantial gain. On our server, run some SPDK applications which will
use 300GB hugetlbpage. With this feature enabled, we can save 4797MB
memory.

Muchun Song (24):
  mm/memory_hotplug: Move bootmem info registration API to
    bootmem_info.c
  mm/memory_hotplug: Move {get,put}_page_bootmem() to bootmem_info.c
  mm/hugetlb: Introduce a new config HUGETLB_PAGE_FREE_VMEMMAP
  mm/hugetlb: Register bootmem info when
    CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
  mm/hugetlb: Introduce nr_free_vmemmap_pages in the struct hstate
  mm/hugetlb: Introduce pgtable allocation/freeing helpers
  mm/hugetlb: Add freeing unused vmemmap pages support for x86
  mm/bootmem_info: Introduce {free,prepare}_vmemmap_page()
  x86/mm: Introduce VMEMMAP_SIZE/VMEMMAP_END macro
  mm/hugetlb: Free the vmemmap pages associated with each hugetlb page
  mm/hugetlb: Add vmemmap_pmd_huge macro for x86
  mm/hugetlb: Defer freeing of hugetlb pages
  mm/hugetlb: Allocate the vmemmap pages associated with each hugetlb
    page
  mm/hugetlb: Introduce remap_huge_page_pmd_vmemmap helper
  mm/hugetlb: Use PG_slab to indicate split pmd
  mm/hugetlb: Support freeing vmemmap pages of gigantic page
  mm/hugetlb: Add a BUILD_BUG_ON to check if struct page size is a power
    of two
  mm/hugetlb: Clear PageHWPoison on the non-error memory page
  mm/hugetlb: Flush work when dissolving hugetlb page
  mm/hugetlb: Add a kernel parameter hugetlb_free_vmemmap
  mm/hugetlb: Merge pte to huge pmd only for gigantic page
  mm/hugetlb: Implement vmemmap_pmd_mkhuge macro
  mm/hugetlb: Gather discrete indexes of tail page
  mm/hugetlb: Add BUILD_BUG_ON to catch invalid usage of tail struct
    page

 .../admin-guide/kernel-parameters.txt         |   9 +
 Documentation/admin-guide/mm/hugetlbpage.rst  |   3 +
 arch/x86/include/asm/hugetlb.h                |  20 +
 arch/x86/include/asm/pgtable_64_types.h       |   8 +
 arch/x86/mm/init_64.c                         |   5 +-
 fs/Kconfig                                    |  15 +
 include/linux/bootmem_info.h                  |  65 ++
 include/linux/hugetlb.h                       |  64 ++
 include/linux/hugetlb_cgroup.h                |  15 +-
 include/linux/memory_hotplug.h                |  27 -
 mm/Makefile                                   |   1 +
 mm/bootmem_info.c                             | 125 +++
 mm/hugetlb.c                                  | 834 +++++++++++++++++-
 mm/memory_hotplug.c                           | 116 ---
 mm/sparse.c                                   |   1 +
 15 files changed, 1143 insertions(+), 165 deletions(-)
 create mode 100644 include/linux/bootmem_info.h
 create mode 100644 mm/bootmem_info.c

-- 
2.20.1

