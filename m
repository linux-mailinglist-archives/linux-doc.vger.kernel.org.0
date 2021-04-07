Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3B4356765
	for <lists+linux-doc@lfdr.de>; Wed,  7 Apr 2021 10:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345728AbhDGI7f (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 7 Apr 2021 04:59:35 -0400
Received: from mail-dm6nam08on2049.outbound.protection.outlook.com ([40.107.102.49]:47968
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244265AbhDGI7c (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Apr 2021 04:59:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1pzSxPYYONhCHTfEp/jQMCkKmxwPOgBvAEc15LJ5xRunhnbEAyxJWXuWYP6mu3YxaUSWiw23wYRpP5TGlPHDQPK8YR76+qlQ6twuACtF5yZQ6MFZquHxeZF68tYEuo4LGnOmAfx8YzS2uwmfZaU7Pkpb+mIfW2BrK7Vb3G7ztip7utFx5pMKE/d0mEqmEw4UrSw/wuR8fFsRVfMvxvpgOR5a8z9oux322elhkyVHRyI2mPUBd/3zZNnHgn1Orp6EFfq12VRJ8ScUxJ7ELqmi627riFJvLwMJcu2AF92VA5+cn8UK72q+YHfdwXIsJreLypQt9VqMeyq6jniO+CH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mp3B6g43f+Fey6EwEsxIHQikhTKAxQ7E1UC4URzdp+g=;
 b=j1UYq+msal+V+q7r2XEe7gLgamr4me80OJzfV/YyhiCNsq3ggnMy2sQ7G3MNkYBjMehnd4CljwGvqcz9yl5rZQGQ3UcspaVgkC4KR7YWJ2cPlweNK04vlH/lFFWvN6VMk1COWX8ja1CudOpIOUhU7R4hzvlH25XECahjmKGDIyDMIPuA4iPlUC79674gRRt6FBbMUwr2STNS7cjzfS7JUX/0WYYYyLuaPEYXjzGMwjeMV6rywFTzXODpHwOP2BMqqyWzueBS9tR7W+ow56Alfa5bLxpjfDIUw140+Q4bzbKKCAlLNkFvuYWeTtff/Ebkcw86o869mWMA3PXySLDovA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mp3B6g43f+Fey6EwEsxIHQikhTKAxQ7E1UC4URzdp+g=;
 b=oj2FFsY1x6BB1pGyESCCd3QT+6V8U++b/uPgRmIpCq7+VuOH/d6olYelLcUwVpPZtzeI6PaTTFghJ1kIcam+/z5J4Xj+rBSdtWXfSlFa2kLy2uXZWay7FviPqgl9UzEsqEkYfvbil6m9BbIM2CfnFdlRo6dR0LwQ1Zc8vaBQ1dTOkYW3QhNQqTw/LujakWGyb2ZiVHvsxKzOZh8xu4Ow5bGlNTYeJuWBU1sLCtNb+QUFA4msadWSjYQwIPMkLNDKBnviLqP8ITqi8q2/eFiDMbbH17ZAQMH16J4OqvTpPhJmjDxhwH1Iygnfx3KcEIOGKHs1Xx40eUpVPE+mev3apQ==
Received: from BN9PR03CA0602.namprd03.prod.outlook.com (2603:10b6:408:106::7)
 by DM4PR12MB5328.namprd12.prod.outlook.com (2603:10b6:5:39f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Wed, 7 Apr
 2021 08:43:00 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::50) by BN9PR03CA0602.outlook.office365.com
 (2603:10b6:408:106::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 7 Apr 2021 08:43:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 08:43:00 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Apr
 2021 08:42:58 +0000
From:   Alistair Popple <apopple@nvidia.com>
To:     <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
        <bskeggs@redhat.com>, <akpm@linux-foundation.org>
CC:     Alistair Popple <apopple@nvidia.com>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <jhubbard@nvidia.com>, <rcampbell@nvidia.com>,
        <jglisse@redhat.com>, <jgg@nvidia.com>, <hch@infradead.org>,
        <daniel@ffwll.ch>, <willy@infradead.org>, <bsingharora@gmail.com>,
        Christoph Hellwig <hch@lst.de>
Subject: [PATCH v8 1/8] mm: Remove special swap entry functions
Date:   Wed, 7 Apr 2021 18:42:31 +1000
Message-ID: <20210407084238.20443-2-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407084238.20443-1-apopple@nvidia.com>
References: <20210407084238.20443-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2128ac77-9f49-4a77-8164-08d8f9a1267f
X-MS-TrafficTypeDiagnostic: DM4PR12MB5328:
X-Microsoft-Antispam-PRVS: <DM4PR12MB53284D2104C2174201BDD079DF759@DM4PR12MB5328.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:56;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7CDTpmIDu83GM7PAJ5T1/0R0seAAakExjuF0/4nHyfgtGbV+i3EgQiA4Zlgge9YE0Dbd1t46eG2bU4HwomuvVncNpqsmvzEMSGIYVs0HfMFVmZZ19fkjaPJoJlQJWlk7b5dh+r5D74YoajsjaQc4tzxC7JaOMNryxT4qrfp/pAXX9XV8H8bhZp0LXhIGVT686AdGiTgbfm7BhhdTVMKLbiNwrVvqeQdYghDLcMOW9Akr5H1vCmdtCXCXzXG5dVYP9EDBEUQRdpQ9Gvmyb02L4pm/hvafLtmjDSIQNkF8R3HwJB7Ca0L8ZantesrXWBaJKYDW9CdNhP69CI7oDKm/XKut+qrcbanAPG73isIDnOxj5TQ5V5wPyTtS45z5HSOFRpEXpAUhR9RTgoL6/fPOidJfD9hXLpK2LJM8WjsOImgQwfBP8HaputLlcKrgLo5XaN4uPCtMI9BdqR1HVngHqe+739qFwZsSXdpBgTJ669x57QsdE2EsXAdm+AMaPhSBF2MqeW3Lou7gVgwUrzkzlzOUrRhsi5hEHVWNXDQCdZB2+TF+FNZh3pn5Iku5lwK4/Q68To1Cnzp/aZriUjOsAzymUr4+BiEJQCO/fNpGS0ehNAiV+IzOCLy9QZQrX+anqfmgadRDyxd2BynCt49rCA==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966006)(36840700001)(86362001)(70206006)(4326008)(2616005)(70586007)(36906005)(1076003)(336012)(82310400003)(426003)(7416002)(8936002)(316002)(47076005)(6666004)(110136005)(5660300002)(83380400001)(478600001)(54906003)(356005)(7636003)(2906002)(36860700001)(82740400003)(30864003)(36756003)(186003)(26005)(16526019)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 08:43:00.1487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2128ac77-9f49-4a77-8164-08d8f9a1267f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5328
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Remove multiple similar inline functions for dealing with different
types of special swap entries.

Both migration and device private swap entries use the swap offset to
store a pfn. Instead of multiple inline functions to obtain a struct
page for each swap entry type use a common function
pfn_swap_entry_to_page(). Also open-code the various entry_to_pfn()
functions as this results is shorter code that is easier to understand.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>

---

v7:
* Reworded commit message to include pfn_swap_entry_to_page()
* Added Christoph's Reviewed-by

v6:
* Removed redundant compound_page() call from inside PageLocked()
* Fixed a minor build issue for s390 reported by kernel test bot

v4:
* Added pfn_swap_entry_to_page()
* Reinstated check that migration entries point to locked pages
* Removed #define swapcache_prepare which isn't needed for CONFIG_SWAP=0
  builds
---
 arch/s390/mm/pgtable.c  |  2 +-
 fs/proc/task_mmu.c      | 23 +++++---------
 include/linux/swap.h    |  4 +--
 include/linux/swapops.h | 69 ++++++++++++++---------------------------
 mm/hmm.c                |  5 ++-
 mm/huge_memory.c        |  4 +--
 mm/memcontrol.c         |  2 +-
 mm/memory.c             | 10 +++---
 mm/migrate.c            |  6 ++--
 mm/page_vma_mapped.c    |  6 ++--
 10 files changed, 50 insertions(+), 81 deletions(-)

diff --git a/arch/s390/mm/pgtable.c b/arch/s390/mm/pgtable.c
index 18205f851c24..eec3a9d7176e 100644
--- a/arch/s390/mm/pgtable.c
+++ b/arch/s390/mm/pgtable.c
@@ -691,7 +691,7 @@ static void ptep_zap_swap_entry(struct mm_struct *mm, swp_entry_t entry)
 	if (!non_swap_entry(entry))
 		dec_mm_counter(mm, MM_SWAPENTS);
 	else if (is_migration_entry(entry)) {
-		struct page *page = migration_entry_to_page(entry);
+		struct page *page = pfn_swap_entry_to_page(entry);
 
 		dec_mm_counter(mm, mm_counter(page));
 	}
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 3cec6fbef725..08ee59d945c0 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -514,10 +514,8 @@ static void smaps_pte_entry(pte_t *pte, unsigned long addr,
 			} else {
 				mss->swap_pss += (u64)PAGE_SIZE << PSS_SHIFT;
 			}
-		} else if (is_migration_entry(swpent))
-			page = migration_entry_to_page(swpent);
-		else if (is_device_private_entry(swpent))
-			page = device_private_entry_to_page(swpent);
+		} else if (is_pfn_swap_entry(swpent))
+			page = pfn_swap_entry_to_page(swpent);
 	} else if (unlikely(IS_ENABLED(CONFIG_SHMEM) && mss->check_shmem_swap
 							&& pte_none(*pte))) {
 		page = xa_load(&vma->vm_file->f_mapping->i_pages,
@@ -549,7 +547,7 @@ static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
 		swp_entry_t entry = pmd_to_swp_entry(*pmd);
 
 		if (is_migration_entry(entry))
-			page = migration_entry_to_page(entry);
+			page = pfn_swap_entry_to_page(entry);
 	}
 	if (IS_ERR_OR_NULL(page))
 		return;
@@ -691,10 +689,8 @@ static int smaps_hugetlb_range(pte_t *pte, unsigned long hmask,
 	} else if (is_swap_pte(*pte)) {
 		swp_entry_t swpent = pte_to_swp_entry(*pte);
 
-		if (is_migration_entry(swpent))
-			page = migration_entry_to_page(swpent);
-		else if (is_device_private_entry(swpent))
-			page = device_private_entry_to_page(swpent);
+		if (is_pfn_swap_entry(swpent))
+			page = pfn_swap_entry_to_page(swpent);
 	}
 	if (page) {
 		int mapcount = page_mapcount(page);
@@ -1383,11 +1379,8 @@ static pagemap_entry_t pte_to_pagemap_entry(struct pagemapread *pm,
 			frame = swp_type(entry) |
 				(swp_offset(entry) << MAX_SWAPFILES_SHIFT);
 		flags |= PM_SWAP;
-		if (is_migration_entry(entry))
-			page = migration_entry_to_page(entry);
-
-		if (is_device_private_entry(entry))
-			page = device_private_entry_to_page(entry);
+		if (is_pfn_swap_entry(entry))
+			page = pfn_swap_entry_to_page(entry);
 	}
 
 	if (page && !PageAnon(page))
@@ -1444,7 +1437,7 @@ static int pagemap_pmd_range(pmd_t *pmdp, unsigned long addr, unsigned long end,
 			if (pmd_swp_soft_dirty(pmd))
 				flags |= PM_SOFT_DIRTY;
 			VM_BUG_ON(!is_pmd_migration_entry(pmd));
-			page = migration_entry_to_page(entry);
+			page = pfn_swap_entry_to_page(entry);
 		}
 #endif
 
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 4cc6ec3bf0ab..516104b9334b 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -523,8 +523,8 @@ static inline void show_swap_cache_info(void)
 {
 }
 
-#define free_swap_and_cache(e) ({(is_migration_entry(e) || is_device_private_entry(e));})
-#define swapcache_prepare(e) ({(is_migration_entry(e) || is_device_private_entry(e));})
+/* used to sanity check ptes in zap_pte_range when CONFIG_SWAP=0 */
+#define free_swap_and_cache(e) is_pfn_swap_entry(e)
 
 static inline int add_swap_count_continuation(swp_entry_t swp, gfp_t gfp_mask)
 {
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index d9b7c9132c2f..139be8235ad2 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -121,16 +121,6 @@ static inline bool is_write_device_private_entry(swp_entry_t entry)
 {
 	return unlikely(swp_type(entry) == SWP_DEVICE_WRITE);
 }
-
-static inline unsigned long device_private_entry_to_pfn(swp_entry_t entry)
-{
-	return swp_offset(entry);
-}
-
-static inline struct page *device_private_entry_to_page(swp_entry_t entry)
-{
-	return pfn_to_page(swp_offset(entry));
-}
 #else /* CONFIG_DEVICE_PRIVATE */
 static inline swp_entry_t make_device_private_entry(struct page *page, bool write)
 {
@@ -150,16 +140,6 @@ static inline bool is_write_device_private_entry(swp_entry_t entry)
 {
 	return false;
 }
-
-static inline unsigned long device_private_entry_to_pfn(swp_entry_t entry)
-{
-	return 0;
-}
-
-static inline struct page *device_private_entry_to_page(swp_entry_t entry)
-{
-	return NULL;
-}
 #endif /* CONFIG_DEVICE_PRIVATE */
 
 #ifdef CONFIG_MIGRATION
@@ -182,22 +162,6 @@ static inline int is_write_migration_entry(swp_entry_t entry)
 	return unlikely(swp_type(entry) == SWP_MIGRATION_WRITE);
 }
 
-static inline unsigned long migration_entry_to_pfn(swp_entry_t entry)
-{
-	return swp_offset(entry);
-}
-
-static inline struct page *migration_entry_to_page(swp_entry_t entry)
-{
-	struct page *p = pfn_to_page(swp_offset(entry));
-	/*
-	 * Any use of migration entries may only occur while the
-	 * corresponding page is locked
-	 */
-	BUG_ON(!PageLocked(compound_head(p)));
-	return p;
-}
-
 static inline void make_migration_entry_read(swp_entry_t *entry)
 {
 	*entry = swp_entry(SWP_MIGRATION_READ, swp_offset(*entry));
@@ -217,16 +181,6 @@ static inline int is_migration_entry(swp_entry_t swp)
 	return 0;
 }
 
-static inline unsigned long migration_entry_to_pfn(swp_entry_t entry)
-{
-	return 0;
-}
-
-static inline struct page *migration_entry_to_page(swp_entry_t entry)
-{
-	return NULL;
-}
-
 static inline void make_migration_entry_read(swp_entry_t *entryp) { }
 static inline void __migration_entry_wait(struct mm_struct *mm, pte_t *ptep,
 					spinlock_t *ptl) { }
@@ -241,6 +195,29 @@ static inline int is_write_migration_entry(swp_entry_t entry)
 
 #endif
 
+static inline struct page *pfn_swap_entry_to_page(swp_entry_t entry)
+{
+	struct page *p = pfn_to_page(swp_offset(entry));
+
+	/*
+	 * Any use of migration entries may only occur while the
+	 * corresponding page is locked
+	 */
+	BUG_ON(is_migration_entry(entry) && !PageLocked(p));
+
+	return p;
+}
+
+/*
+ * A pfn swap entry is a special type of swap entry that always has a pfn stored
+ * in the swap offset. They are used to represent unaddressable device memory
+ * and to restrict access to a page undergoing migration.
+ */
+static inline bool is_pfn_swap_entry(swp_entry_t entry)
+{
+	return is_migration_entry(entry) || is_device_private_entry(entry);
+}
+
 struct page_vma_mapped_walk;
 
 #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
diff --git a/mm/hmm.c b/mm/hmm.c
index 943cb2ba4442..3b2dda71d0ed 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -214,7 +214,7 @@ static inline bool hmm_is_device_private_entry(struct hmm_range *range,
 		swp_entry_t entry)
 {
 	return is_device_private_entry(entry) &&
-		device_private_entry_to_page(entry)->pgmap->owner ==
+		pfn_swap_entry_to_page(entry)->pgmap->owner ==
 		range->dev_private_owner;
 }
 
@@ -257,8 +257,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 			cpu_flags = HMM_PFN_VALID;
 			if (is_write_device_private_entry(entry))
 				cpu_flags |= HMM_PFN_WRITE;
-			*hmm_pfn = device_private_entry_to_pfn(entry) |
-					cpu_flags;
+			*hmm_pfn = swp_offset(entry) | cpu_flags;
 			return 0;
 		}
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 395c75111d33..a4cda8564bcf 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1700,7 +1700,7 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 
 			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
 			entry = pmd_to_swp_entry(orig_pmd);
-			page = pfn_to_page(swp_offset(entry));
+			page = pfn_swap_entry_to_page(entry);
 			flush_needed = 0;
 		} else
 			WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
@@ -2108,7 +2108,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
 		swp_entry_t entry;
 
 		entry = pmd_to_swp_entry(old_pmd);
-		page = pfn_to_page(swp_offset(entry));
+		page = pfn_swap_entry_to_page(entry);
 		write = is_write_migration_entry(entry);
 		young = false;
 		soft_dirty = pmd_swp_soft_dirty(old_pmd);
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 845eec01ef9d..043840dbe48a 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5523,7 +5523,7 @@ static struct page *mc_handle_swap_pte(struct vm_area_struct *vma,
 	 * as special swap entry in the CPU page table.
 	 */
 	if (is_device_private_entry(ent)) {
-		page = device_private_entry_to_page(ent);
+		page = pfn_swap_entry_to_page(ent);
 		/*
 		 * MEMORY_DEVICE_PRIVATE means ZONE_DEVICE page and which have
 		 * a refcount of 1 when free (unlike normal page)
diff --git a/mm/memory.c b/mm/memory.c
index c8e357627318..1c98e3c1c2de 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -730,7 +730,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		}
 		rss[MM_SWAPENTS]++;
 	} else if (is_migration_entry(entry)) {
-		page = migration_entry_to_page(entry);
+		page = pfn_swap_entry_to_page(entry);
 
 		rss[mm_counter(page)]++;
 
@@ -749,7 +749,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 			set_pte_at(src_mm, addr, src_pte, pte);
 		}
 	} else if (is_device_private_entry(entry)) {
-		page = device_private_entry_to_page(entry);
+		page = pfn_swap_entry_to_page(entry);
 
 		/*
 		 * Update rss count even for unaddressable pages, as
@@ -1286,7 +1286,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 
 		entry = pte_to_swp_entry(ptent);
 		if (is_device_private_entry(entry)) {
-			struct page *page = device_private_entry_to_page(entry);
+			struct page *page = pfn_swap_entry_to_page(entry);
 
 			if (unlikely(details && details->check_mapping)) {
 				/*
@@ -1315,7 +1315,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
 		else if (is_migration_entry(entry)) {
 			struct page *page;
 
-			page = migration_entry_to_page(entry);
+			page = pfn_swap_entry_to_page(entry);
 			rss[mm_counter(page)]--;
 		}
 		if (unlikely(!free_swap_and_cache(entry)))
@@ -3282,7 +3282,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 			migration_entry_wait(vma->vm_mm, vmf->pmd,
 					     vmf->address);
 		} else if (is_device_private_entry(entry)) {
-			vmf->page = device_private_entry_to_page(entry);
+			vmf->page = pfn_swap_entry_to_page(entry);
 			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
 		} else if (is_hwpoison_entry(entry)) {
 			ret = VM_FAULT_HWPOISON;
diff --git a/mm/migrate.c b/mm/migrate.c
index 62b81d5257aa..600978d18750 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -321,7 +321,7 @@ void __migration_entry_wait(struct mm_struct *mm, pte_t *ptep,
 	if (!is_migration_entry(entry))
 		goto out;
 
-	page = migration_entry_to_page(entry);
+	page = pfn_swap_entry_to_page(entry);
 
 	/*
 	 * Once page cache replacement of page migration started, page_count
@@ -361,7 +361,7 @@ void pmd_migration_entry_wait(struct mm_struct *mm, pmd_t *pmd)
 	ptl = pmd_lock(mm, pmd);
 	if (!is_pmd_migration_entry(*pmd))
 		goto unlock;
-	page = migration_entry_to_page(pmd_to_swp_entry(*pmd));
+	page = pfn_swap_entry_to_page(pmd_to_swp_entry(*pmd));
 	if (!get_page_unless_zero(page))
 		goto unlock;
 	spin_unlock(ptl);
@@ -2443,7 +2443,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			if (!is_device_private_entry(entry))
 				goto next;
 
-			page = device_private_entry_to_page(entry);
+			page = pfn_swap_entry_to_page(entry);
 			if (!(migrate->flags &
 				MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
 			    page->pgmap->owner != migrate->pgmap_owner)
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index 86e3a3688d59..eed988ab2e81 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -96,7 +96,7 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
 		if (!is_migration_entry(entry))
 			return false;
 
-		pfn = migration_entry_to_pfn(entry);
+		pfn = swp_offset(entry);
 	} else if (is_swap_pte(*pvmw->pte)) {
 		swp_entry_t entry;
 
@@ -105,7 +105,7 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
 		if (!is_device_private_entry(entry))
 			return false;
 
-		pfn = device_private_entry_to_pfn(entry);
+		pfn = swp_offset(entry);
 	} else {
 		if (!pte_present(*pvmw->pte))
 			return false;
@@ -200,7 +200,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 				if (is_migration_entry(pmd_to_swp_entry(*pvmw->pmd))) {
 					swp_entry_t entry = pmd_to_swp_entry(*pvmw->pmd);
 
-					if (migration_entry_to_page(entry) != page)
+					if (pfn_swap_entry_to_page(entry) != page)
 						return not_found(pvmw);
 					return true;
 				}
-- 
2.20.1

