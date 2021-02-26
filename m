Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B04D325E2B
	for <lists+linux-doc@lfdr.de>; Fri, 26 Feb 2021 08:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbhBZHTi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 26 Feb 2021 02:19:38 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9304 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhBZHTg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Feb 2021 02:19:36 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6038a0dd0000>; Thu, 25 Feb 2021 23:18:53 -0800
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Feb
 2021 07:18:52 +0000
From:   Alistair Popple <apopple@nvidia.com>
To:     <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
        <bskeggs@redhat.com>, <akpm@linux-foundation.org>
CC:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <jhubbard@nvidia.com>,
        <rcampbell@nvidia.com>, <jglisse@redhat.com>, <jgg@nvidia.com>,
        <hch@infradead.org>, <daniel@ffwll.ch>,
        Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v3 0/8] Add support for SVM atomics in Nouveau
Date:   Fri, 26 Feb 2021 18:18:24 +1100
Message-ID: <20210226071832.31547-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1614323933; bh=+SElXPoBRT6MQYk8xVjvN+0BmmOqz6C1IcIa6Pa9h3M=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         Content-Transfer-Encoding:Content-Type:X-Originating-IP:
         X-ClientProxiedBy;
        b=eAxyU4ZfO7SmRuRFSOC14uQbFIUSNrN2h+S1lrnjNmgSxHW/DTHuo3VfEQC8LO+rV
         gY5ydT8SjXxoG4a/Q40h2wXqsjqyIpEnc1qciLsm9ufEEr+2YqUeOW9/qZ/GIHNvYx
         TDG7dnGUrJxOrHvkzwK3j1Dp1AnWDdUtikKRIvTzK7AL4J3FH1VKdiCj9qyjnWHcR3
         ArGqlXOTc3UgrPsuBEjlFWqs4rIydtXZatYl3UrIB11JR2Sq81OYyJiaFVIRuRCuJf
         xI2mYRrR3T5I+5SIb/AQi5C1DVqhyZYb6EUrsFoGGJLO0mDjN4ynLEl8l+SUuKShHK
         +NDxtSF3Urijw==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is the third version of a series to add support to Nouveau for atomic
memory operations on OpenCL shared virtual memory (SVM) regions. This is
achieved using the atomic PTE bits on the GPU to only permit atomic
operations to system memory when a page is not mapped in userspace on the
CPU. The previous version of this series used an unmap and pin page
migration, however this resulted in problems with ZONE_MOVABLE and other
issues so this series uses a different approach.

Instead exclusive device access is implemented by adding a new swap entry
type (SWAP_DEVICE_EXCLUSIVE) which is similar to a migration entry. The
main difference is that on fault the original entry is immediately restored
by the fault handler instead of waiting.

Restoring the entry triggers calls to MMU notifers which allows a device
driver to revoke the atomic access permission from the GPU prior to the CPU
finalising the entry.

Patches 1 & 2 are new for v3 and refactor the existing migration and device
private entry functions.

Patches 3 & 4 rework try_to_unmap_one() by splitting out unrelated
functionality into separate functions - try_to_migrate_one() and
try_to_munlock_one(). These should not change any functionality, but any
help testing would be much appreciated as I have not been able to test
every single usage of try_to_unmap_one().

Patch 5 contains the bulk of the implementation for device exclusive
memory.

Patch 6 contains some additions to the HMM selftests to ensure everything
works as expected and has not changed significantly since v2.

Patch 7 was posted previously and has not changed.

Patch 8 was posted for v2 and has not changed significantly.

This has been tested using the latest upstream Mesa userspace with a simple
OpenCL test program which checks the results of atomic GPU operations on a
SVM buffer whilst also writing to the same buffer from the CPU.

v3:
* Refactored some existing functionality.
* Switched to using get_user_pages_remote() instead of open-coding it.
* Moved code out of hmm.

v2:
* Changed implementation to use special swap entries instead of device
  private pages.

Alistair Popple (8):
  mm: Remove special swap entry functions
  mm/swapops: Rework swap entry manipulation code
  mm/rmap: Split try_to_munlock from try_to_unmap
  mm/rmap: Split migration into its own function
  mm: Device exclusive memory access
  mm: Selftests for exclusive device memory
  nouveau/svm: Refactor nouveau_range_fault
  nouveau/svm: Implement atomic SVM access

 Documentation/vm/hmm.rst                      |  15 +
 arch/s390/mm/pgtable.c                        |   2 +-
 drivers/gpu/drm/nouveau/include/nvif/if000c.h |   1 +
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 120 +++-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   6 +
 fs/proc/task_mmu.c                            |  23 +-
 include/linux/rmap.h                          |   8 +-
 include/linux/swap.h                          |   8 +-
 include/linux/swapops.h                       | 105 ++--
 lib/test_hmm.c                                | 124 ++++
 lib/test_hmm_uapi.h                           |   2 +
 mm/debug_vm_pgtable.c                         |  12 +-
 mm/hmm.c                                      |  12 +-
 mm/huge_memory.c                              |  36 +-
 mm/hugetlb.c                                  |  10 +-
 mm/memcontrol.c                               |   2 +-
 mm/memory.c                                   | 128 +++-
 mm/migrate.c                                  |  41 +-
 mm/mprotect.c                                 |  18 +-
 mm/page_vma_mapped.c                          |  15 +-
 mm/rmap.c                                     | 558 +++++++++++++++---
 tools/testing/selftests/vm/hmm-tests.c        | 219 +++++++
 23 files changed, 1207 insertions(+), 259 deletions(-)

--=20
2.20.1

