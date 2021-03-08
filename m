Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E21EC330B21
	for <lists+linux-doc@lfdr.de>; Mon,  8 Mar 2021 11:31:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbhCHKaa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 8 Mar 2021 05:30:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbhCHKaV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Mar 2021 05:30:21 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC12C06174A
        for <linux-doc@vger.kernel.org>; Mon,  8 Mar 2021 02:30:21 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id t85so1590404pfc.13
        for <linux-doc@vger.kernel.org>; Mon, 08 Mar 2021 02:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qzpPUxMTeqAAwaKcJGnMlkJC+uR1eUp0dOGRQ8j8ETM=;
        b=V5JHLOK9rpAHRscouuWOjmyDANi4+e0eQVsj8GSr9otUsnqP9gloZSgS5r81lwF9Wi
         jSMqjR7XZoZQB5/R02qj1IErEnlO6nwjAMpsqZvbQnKJmiAc5FLger/hySJREi+G7j8Y
         ai4hT0mYVX62OP44VV+aNQdvSrlLLWUJzSWTv5f+JpD4VKtDZkfRwQ3bICsBsb/ZTjye
         D4DmIzcEGYdHHLItdM6Yo4PW792RB1tq9JDAUDVjFlh0R+Vwp3A9ZcBDwQq/tn6kLThe
         k3ceT14OS7/Jvdl8MaUV9zQUBhwf0NNXS3TqsK5Gb6NE8DBOv1rfBDSIdkFV5Lvhw9D4
         npBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qzpPUxMTeqAAwaKcJGnMlkJC+uR1eUp0dOGRQ8j8ETM=;
        b=T371KLc3/EJ+Cqr9VEHEHHW/9FIrXxJQ0tzMUEqK70T/U4bKnmSvuK+ZB+0SSIgxx+
         rUHq2jFr9kFUdmfDM7mpfxXfK5zX5dwmvwKQYN2dJH3wgohc741zHs7TYMvg7N8XZqF/
         jHlNybzjZpQDsMWojIzZynCAs6RoS/4SISquqsUJ3HZI23WXp4L2SxUWoSfqgnKfzi66
         0czYeeypifxMl2oq49SSXkVplOtm2B9euLrOw//sIodZAf4q9a92bOjgJJBzAvSq8Lxd
         iIGvr9FmN014hgBQRBUvUNHL3dpHTogGoknQHHd1wWgNzogN0EGpvQ3d01lCoj8InEfz
         /BoQ==
X-Gm-Message-State: AOAM530Q4kN++mqrJ8Pu2ypMWJobw8tBMgeAMpjB0FncuNnegjiA0FG7
        mgzxrUAzUbcvMXI/vQCwKg8oTQ==
X-Google-Smtp-Source: ABdhPJzyQJ/IthwVPhqq3UHp8I+T/kmF4JjUueFJmxM0O2ZHtow3M8t5XVvc0XCUxdq93P1R1qlBgQ==
X-Received: by 2002:a63:4621:: with SMTP id t33mr19637292pga.22.1615199420696;
        Mon, 08 Mar 2021 02:30:20 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id ge16sm10744705pjb.43.2021.03.08.02.30.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Mar 2021 02:30:19 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, naoya.horiguchi@nec.com,
        joao.m.martins@oracle.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v18 0/9] Free some vmemmap pages of HugeTLB page
Date:   Mon,  8 Mar 2021 18:27:58 +0800
Message-Id: <20210308102807.59745-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi everyone,

This patch series will free some vmemmap pages(struct page structures)
associated with each HugeTLB page when preallocated to save memory.

In order to reduce the difficulty of the first version of code review.
From this version, we disable PMD/huge page mapping of vmemmap if this
feature was enabled. This acutely eliminates a bunch of the complex code
doing page table manipulation. When this patch series is solid, we cam add
the code of vmemmap page table manipulation in the future.

The struct page structures (page structs) are used to describe a physical
page frame. By default, there is an one-to-one mapping from a page frame to
it's corresponding page struct.

The HugeTLB pages consist of multiple base page size pages and is supported
by many architectures. See hugetlbpage.rst in the Documentation directory
for more details. On the x86 architecture, HugeTLB pages of size 2MB and 1GB
are currently supported. Since the base page size on x86 is 4KB, a 2MB
HugeTLB page consists of 512 base pages and a 1GB HugeTLB page consists of
4096 base pages. For each base page, there is a corresponding page struct.

Within the HugeTLB subsystem, only the first 4 page structs are used to
contain unique information about a HugeTLB page. HUGETLB_CGROUP_MIN_ORDER
provides this upper limit. The only 'useful' information in the remaining
page structs is the compound_head field, and this field is the same for all
tail pages.

By removing redundant page structs for HugeTLB pages, memory can returned to
the buddy allocator for other uses.

When the system boot up, every 2M HugeTLB has 512 struct page structs which
size is 8 pages(sizeof(struct page) * 512 / PAGE_SIZE).

    HugeTLB                  struct pages(8 pages)         page frame(8 pages)
 +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
 |           |                     |     0     | -------------> |     0     |
 |           |                     +-----------+                +-----------+
 |           |                     |     1     | -------------> |     1     |
 |           |                     +-----------+                +-----------+
 |           |                     |     2     | -------------> |     2     |
 |           |                     +-----------+                +-----------+
 |           |                     |     3     | -------------> |     3     |
 |           |                     +-----------+                +-----------+
 |           |                     |     4     | -------------> |     4     |
 |    2MB    |                     +-----------+                +-----------+
 |           |                     |     5     | -------------> |     5     |
 |           |                     +-----------+                +-----------+
 |           |                     |     6     | -------------> |     6     |
 |           |                     +-----------+                +-----------+
 |           |                     |     7     | -------------> |     7     |
 |           |                     +-----------+                +-----------+
 |           |
 |           |
 |           |
 +-----------+

The value of page->compound_head is the same for all tail pages. The first
page of page structs (page 0) associated with the HugeTLB page contains the 4
page structs necessary to describe the HugeTLB. The only use of the remaining
pages of page structs (page 1 to page 7) is to point to page->compound_head.
Therefore, we can remap pages 2 to 7 to page 1. Only 2 pages of page structs
will be used for each HugeTLB page. This will allow us to free the remaining
6 pages to the buddy allocator.

Here is how things look after remapping.

    HugeTLB                  struct pages(8 pages)         page frame(8 pages)
 +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
 |           |                     |     0     | -------------> |     0     |
 |           |                     +-----------+                +-----------+
 |           |                     |     1     | -------------> |     1     |
 |           |                     +-----------+                +-----------+
 |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
 |           |                     +-----------+                   | | | | |
 |           |                     |     3     | ------------------+ | | | |
 |           |                     +-----------+                     | | | |
 |           |                     |     4     | --------------------+ | | |
 |    2MB    |                     +-----------+                       | | |
 |           |                     |     5     | ----------------------+ | |
 |           |                     +-----------+                         | |
 |           |                     |     6     | ------------------------+ |
 |           |                     +-----------+                           |
 |           |                     |     7     | --------------------------+
 |           |                     +-----------+
 |           |
 |           |
 |           |
 +-----------+

When a HugeTLB is freed to the buddy system, we should allocate 6 pages for
vmemmap pages and restore the previous mapping relationship.

Apart from 2MB HugeTLB page, we also have 1GB HugeTLB page. It is similar
to the 2MB HugeTLB page. We also can use this approach to free the vmemmap
pages.

In this case, for the 1GB HugeTLB page, we can save 4094 pages. This is a
very substantial gain. On our server, run some SPDK/QEMU applications which
will use 1024GB HugeTLB page. With this feature enabled, we can save ~16GB
(1G hugepage)/~12GB (2MB hugepage) memory.

Because there are vmemmap page tables reconstruction on the freeing/allocating
path, it increases some overhead. Here are some overhead analysis.

1) Allocating 10240 2MB HugeTLB pages.

   a) With this patch series applied:
   # time echo 10240 > /proc/sys/vm/nr_hugepages

   real     0m0.166s
   user     0m0.000s
   sys      0m0.166s

   # bpftrace -e 'kprobe:alloc_fresh_huge_page { @start[tid] = nsecs; }
     kretprobe:alloc_fresh_huge_page /@start[tid]/ { @latency = hist(nsecs -
     @start[tid]); delete(@start[tid]); }'
   Attaching 2 probes...

   @latency:
   [8K, 16K)           5476 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
   [16K, 32K)          4760 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@       |
   [32K, 64K)             4 |                                                    |

   b) Without this patch series:
   # time echo 10240 > /proc/sys/vm/nr_hugepages

   real     0m0.067s
   user     0m0.000s
   sys      0m0.067s

   # bpftrace -e 'kprobe:alloc_fresh_huge_page { @start[tid] = nsecs; }
     kretprobe:alloc_fresh_huge_page /@start[tid]/ { @latency = hist(nsecs -
     @start[tid]); delete(@start[tid]); }'
   Attaching 2 probes...

   @latency:
   [4K, 8K)           10147 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
   [8K, 16K)             93 |                                                    |

   Summarize: this feature is about ~2x slower than before.

2) Freeing 10240 2MB HugeTLB pages.

   a) With this patch series applied:
   # time echo 0 > /proc/sys/vm/nr_hugepages

   real     0m0.213s
   user     0m0.000s
   sys      0m0.213s

   # bpftrace -e 'kprobe:free_pool_huge_page { @start[tid] = nsecs; }
     kretprobe:free_pool_huge_page /@start[tid]/ { @latency = hist(nsecs -
     @start[tid]); delete(@start[tid]); }'
   Attaching 2 probes...

   @latency:
   [8K, 16K)              6 |                                                    |
   [16K, 32K)         10227 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
   [32K, 64K)             7 |                                                    |

   b) Without this patch series:
   # time echo 0 > /proc/sys/vm/nr_hugepages

   real     0m0.081s
   user     0m0.000s
   sys      0m0.081s

   # bpftrace -e 'kprobe:free_pool_huge_page { @start[tid] = nsecs; }
     kretprobe:free_pool_huge_page /@start[tid]/ { @latency = hist(nsecs -
     @start[tid]); delete(@start[tid]); }'
   Attaching 2 probes...

   @latency:
   [4K, 8K)            6805 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@|
   [8K, 16K)           3427 |@@@@@@@@@@@@@@@@@@@@@@@@@@                          |
   [16K, 32K)             8 |                                                    |

   Summarize: The overhead of __free_hugepage is about ~2-3x slower than before.

Although the overhead has increased, the overhead is not significant. Like Mike
said, "However, remember that the majority of use cases create HugeTLB pages at
or shortly after boot time and add them to the pool. So, additional overhead is
at pool creation time. There is no change to 'normal run time' operations of
getting a page from or returning a page to the pool (think page fault/unmap)".

Despite the overhead and in addition to the memory gains from this series. The
following data is obtained by Joao Martins. Very thanks to his effort.

There's an additional benefit which is page (un)pinners will see an improvement
and Joao presumes because there are fewer memmap pages and thus the tail/head
pages are staying in cache more often.

Out of the box Joao saw (when comparing linux-next against linux-next + this series)
with gup_test and pinning a 16G HugeTLB file (with 1G pages):

	get_user_pages(): ~32k -> ~9k
	unpin_user_pages(): ~75k -> ~70k

Usually any tight loop fetching compound_head(), or reading tail pages data (e.g.
compound_head) benefit a lot. There's some unpinning inefficiencies Joao was
fixing[0], but with that in added it shows even more:

	unpin_user_pages(): ~27k -> ~3.8k

[0] https://lore.kernel.org/linux-mm/20210204202500.26474-1-joao.m.martins@oracle.com/

Todo:
  - Free all of the tail vmemmap pages
    Now for the 2MB HugrTLB page, we only free 6 vmemmap pages. we really can
    free 7 vmemmap pages. In this case, we can see 8 of the 512 struct page
    structures has beed set PG_head flag. If we can adjust compound_head()
    slightly and make compound_head() return the real head struct page when
    the parameter is the tail struct page but with PG_head flag set.

    In order to make the code evolution route clearer. This feature can can be
    a separate patch after this patchset is solid.

  - Support for other architectures (e.g. aarch64).
  - Enable PMD/huge page mapping of vmemmap even if this feature was enabled.

Changelog in v17 -> v18:
  - Add complete copyright to bootmem_info.c (Suggested by Balbir).
  - Fix some issues (in patch #4) suggested by Mike.

  Thanks to Balbir and Mike's review. Also thanks to Chen Huang and
  Bodeddula Balasubramaniam's test.

Changelog in v16 -> v17:
  - Fix issues suggested by Mike and Oscar.
  - Update commit log suggested by Michal.

  Thanks to Mike, David H and Michal's suggestions and review.

Changelog in v15 -> v16:
  - Use GFP_KERNEL to allocate vmemmap pages.

  Thanks to Mike, David H and Michal's suggestions.

Changelog in v14 -> v15:
  - Fix some issues suggested by Oscar. Thanks to Oscar.
  - Add numbers which Joao Martins tested to cover letter. Thanks to his effort.

Changelog in v13 -> v14:
  - Refuse to free the HugeTLB page when the system is under memory pressure.
  - Use GFP_ATOMIC to allocate vmemmap pages instead of GFP_KERNEL.
  - Rebase to linux-next 20210202.
  - Fix and add some comments for vmemmap_remap_free().

  Thanks to Oscar, Mike, David H and David R's suggestions and review.

Changelog in v12 -> v13:
  - Remove VM_WARN_ON_PAGE macro.
  - Add more comments in vmemmap_pte_range() and vmemmap_remap_free().

  Thanks to Oscar and Mike's suggestions and review.

Changelog in v11 -> v12:
  - Move VM_WARN_ON_PAGE to a separate patch.
  - Call __free_hugepage() with hugetlb_lock (See patch #5.) to serialize
    with dissolve_free_huge_page(). It is to prepare for patch #9.
  - Introduce PageHugeInflight. See patch #9.

Changelog in v10 -> v11:
  - Fix compiler error when !CONFIG_HUGETLB_PAGE_FREE_VMEMMAP.
  - Rework some comments and commit changes.
  - Rework vmemmap_remap_free() to 3 parameters.

  Thanks to Oscar and Mike's suggestions and review.

Changelog in v9 -> v10:
  - Fix a bug in patch #11. Thanks to Oscar for pointing that out.
  - Rework some commit log or comments. Thanks Mike and Oscar for the suggestions.
  - Drop VMEMMAP_TAIL_PAGE_REUSE in the patch #3.

  Thank you very much Mike and Oscar for reviewing the code.

Changelog in v8 -> v9:
  - Rework some code. Very thanks to Oscar.
  - Put all the non-hugetlb vmemmap functions under sparsemem-vmemmap.c.

Changelog in v7 -> v8:
  - Adjust the order of patches.

  Very thanks to David and Oscar. Your suggestions are very valuable.

Changelog in v6 -> v7:
  - Rebase to linux-next 20201130
  - Do not use basepage mapping for vmemmap when this feature is disabled.
  - Rework some patchs.
    [PATCH v6 08/16] mm/hugetlb: Free the vmemmap pages associated with each hugetlb page
    [PATCH v6 10/16] mm/hugetlb: Allocate the vmemmap pages associated with each hugetlb page

  Thanks to Oscar and Barry.

Changelog in v5 -> v6:
  - Disable PMD/huge page mapping of vmemmap if this feature was enabled.
  - Simplify the first version code.

Changelog in v4 -> v5:
  - Rework somme comments and code in the [PATCH v4 04/21] and [PATCH v4 05/21].

  Thanks to Mike and Oscar's suggestions.

Changelog in v3 -> v4:
  - Move all the vmemmap functions to hugetlb_vmemmap.c.
  - Make the CONFIG_HUGETLB_PAGE_FREE_VMEMMAP default to y, if we want to
    disable this feature, we should disable it by a boot/kernel command line.
  - Remove vmemmap_pgtable_{init, deposit, withdraw}() helper functions.
  - Initialize page table lock for vmemmap through core_initcall mechanism.

  Thanks for Mike and Oscar's suggestions.

Changelog in v2 -> v3:
  - Rename some helps function name. Thanks Mike.
  - Rework some code. Thanks Mike and Oscar.
  - Remap the tail vmemmap page with PAGE_KERNEL_RO instead of PAGE_KERNEL.
    Thanks Matthew.
  - Add some overhead analysis in the cover letter.
  - Use vmemap pmd table lock instead of a hugetlb specific global lock.

Changelog in v1 -> v2:
  - Fix do not call dissolve_compound_page in alloc_huge_page_vmemmap().
  - Fix some typo and code style problems.
  - Remove unused handle_vmemmap_fault().
  - Merge some commits to one commit suggested by Mike.

Muchun Song (9):
  mm: memory_hotplug: factor out bootmem core functions to
    bootmem_info.c
  mm: hugetlb: introduce a new config HUGETLB_PAGE_FREE_VMEMMAP
  mm: hugetlb: free the vmemmap pages associated with each HugeTLB page
  mm: hugetlb: alloc the vmemmap pages associated with each HugeTLB page
  mm: hugetlb: set the PageHWPoison to the raw error page
  mm: hugetlb: add a kernel parameter hugetlb_free_vmemmap
  mm: hugetlb: introduce nr_free_vmemmap_pages in the struct hstate
  mm: hugetlb: gather discrete indexes of tail page
  mm: hugetlb: optimize the code with the help of the compiler

 Documentation/admin-guide/kernel-parameters.txt |  14 ++
 Documentation/admin-guide/mm/hugetlbpage.rst    |  11 +
 arch/x86/mm/init_64.c                           |  13 +-
 fs/Kconfig                                      |   6 +
 include/linux/bootmem_info.h                    |  65 ++++++
 include/linux/hugetlb.h                         |  47 +++-
 include/linux/hugetlb_cgroup.h                  |  19 +-
 include/linux/memory_hotplug.h                  |  27 ---
 include/linux/mm.h                              |   5 +
 mm/Makefile                                     |   2 +
 mm/bootmem_info.c                               | 127 ++++++++++
 mm/hugetlb.c                                    | 176 +++++++++++---
 mm/hugetlb_vmemmap.c                            | 293 ++++++++++++++++++++++++
 mm/hugetlb_vmemmap.h                            |  51 +++++
 mm/memory_hotplug.c                             | 116 ----------
 mm/sparse-vmemmap.c                             | 280 ++++++++++++++++++++++
 mm/sparse.c                                     |   1 +
 17 files changed, 1065 insertions(+), 188 deletions(-)
 create mode 100644 include/linux/bootmem_info.h
 create mode 100644 mm/bootmem_info.c
 create mode 100644 mm/hugetlb_vmemmap.c
 create mode 100644 mm/hugetlb_vmemmap.h

-- 
2.11.0

