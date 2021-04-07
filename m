Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB7535677D
	for <lists+linux-doc@lfdr.de>; Wed,  7 Apr 2021 11:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349835AbhDGJAt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 7 Apr 2021 05:00:49 -0400
Received: from mail-bn8nam11on2082.outbound.protection.outlook.com ([40.107.236.82]:59329
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1349821AbhDGJAr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Apr 2021 05:00:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFjH0d6wit/bHa9YpVJlR9ZjE9U10NLl2rIcVVRzveeW3te9KkGUl8j8yn1yhusPeVRQVusK08SGTXZ1rAmm8DIDgMlS+fb6R8sUg/BPAY0usVMf22m1h6qVz+dCc/4yUmwoShqkVKG6uA78Z/niT/8I8F0Bpber/fNBB3Fn52NBY9Oy+oZug7Pr0tKojmCr9aDMerVeskYz5eBttfZ7n6wu+AOEeEjebfeF9bgyLgEXibA0TFD6dUnnAFc/IDnh2/i5Ao5qK+f96lw7ysuHT2V1D9Tprn7zI9ikJKhdf52MA8d92E2RH1NTj7afY5YrtrRmw5omc70joU9Tmv/puA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rReQDo8LlPzDAaWGQu65J4A8GKuN+goSn7OIASOCBw=;
 b=HzkWF/XtddVwovkLLYpF4CYsjwQozpNISLicA1DcVBGTKVQ28ZgCxL2BxNjMrjmEj6WpvI4MTsMZaz3FT3vc2LBhEgQ3sHiNP0IzYRDAw1g5J2jYHONjgTDRbCE36L41WOWZpe5ygC3Nh03nciXeTNOetsJ6nC/90bftN6kWc5ZVceiR3ALa2DO3M6hP9MWoFk5sWawkkmggCzhH7o6ccbui3fKd2J+upH3WwS6IA+8ri7qJSjcOIjv2RAHKO16uxeKa47aO3XKZQtm4bXg+bWqK3nZbPi0llNWGGO0oPNQ+dr1TKY7NEytnyKOCR0ndipYLSSiumjunSvWCHro+qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rReQDo8LlPzDAaWGQu65J4A8GKuN+goSn7OIASOCBw=;
 b=DbCkf9XREDMkUXlpTiAOruevUnrwXWJ707MiUyX6mB0P7mo8yLGg35KlSJL/JdeoUKFehhM119o7JCTS+GyzZw1eZFIjeWczfuLiuT/DycYfo5KR7juA+dK2mRTKYJ9ho4rAelngmNl/9Dy9N26VVizA+S9dJRxgn0nXiNLQfnocQ7w4O2jXA7T4cAypQu3k+wDg5+ch16MvdevpY4hWSQhaSmFkeP+QN/ABxR1FfX40POnDuk20PTzIAyYL6hHvcA2QsVdfyxZsPyQafvJ0vN4pqAj902MyXEu5Ga2szKcF2xKHugG2gR5fEO66U+pGImRdYz0H3TKyWvTwCpUWug==
Received: from BN8PR15CA0040.namprd15.prod.outlook.com (2603:10b6:408:80::17)
 by BL0PR12MB5010.namprd12.prod.outlook.com (2603:10b6:208:17c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Wed, 7 Apr
 2021 08:43:09 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:80:cafe::57) by BN8PR15CA0040.outlook.office365.com
 (2603:10b6:408:80::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Wed, 7 Apr 2021 08:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3999.28 via Frontend Transport; Wed, 7 Apr 2021 08:43:08 +0000
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Apr
 2021 08:43:07 +0000
From:   Alistair Popple <apopple@nvidia.com>
To:     <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
        <bskeggs@redhat.com>, <akpm@linux-foundation.org>
CC:     Alistair Popple <apopple@nvidia.com>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <jhubbard@nvidia.com>, <rcampbell@nvidia.com>,
        <jglisse@redhat.com>, <jgg@nvidia.com>, <hch@infradead.org>,
        <daniel@ffwll.ch>, <willy@infradead.org>, <bsingharora@gmail.com>,
        Christoph Hellwig <hch@lst.de>
Subject: [PATCH v8 4/8] mm/rmap: Split migration into its own function
Date:   Wed, 7 Apr 2021 18:42:34 +1000
Message-ID: <20210407084238.20443-5-apopple@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4d29a0d6-9196-4d05-73a3-08d8f9a12bb1
X-MS-TrafficTypeDiagnostic: BL0PR12MB5010:
X-Microsoft-Antispam-PRVS: <BL0PR12MB50109F587F51D3D6309CA1C0DF759@BL0PR12MB5010.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l8k5JGZhpNktyiVGHbdLj2OfuImZxZZHR6G5As7sr9T/99DlQDaCxmFpFBpwhhkEOlI9SeBOuBFd/7ctwxsXBm3MyH7oYKGJOpl+G1QN7GwJSPyaS00U+sNSDBxzyZBYkKCVKoWKEJ0s8W/zacA18HG3jO9unbY1hepA03uazTVSn4pmN8qOOkOWAKp7UXH8haTeHLDK1UTjsBvtLy4X31EOFM6FEM88BDHf48Chvbb+2Rn8JVQTcPF4ibXFRdTImcdmni5kopEbIo0YaCw2EKPNes27wBUw7I1IycJOBygENGvTQJppKO3Kxc88DrC8A+HZWDegU2J2hNHth6LAcw9vkmSTFevUwKeLVBkBjpmCUjykOfxxzO11ljUMnNIBvDXVqt8cRPV8r4ZVLmC0LvZc7Fv4G8Vm4Q957FsHTad4ZjXX97EBrzQFXOvA41Wp/37vjuQbEcCi5DYZdiHhfcvhtQ3MXbLpnyyaFB8XeVmcbniL7dA4NzKmIq4zomXBe7tjZuyWD+TQt+iEK0seiT7ecJvNtdvEeYHVFrL0BGGGFyp34vcyNS6sQtddvvjuV82EpCc+0KBNxEaCrnVLwviCH3SYvY505nFbFT0G3bizDQItw4FVVApbWDWMhla7kPKsTl/OkTiZxvqAHq73HFIT1tsD9iOSwb5bmPF27Q8=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(46966006)(36840700001)(30864003)(478600001)(86362001)(26005)(4326008)(8676002)(2616005)(70586007)(110136005)(186003)(336012)(36756003)(1076003)(356005)(82740400003)(36906005)(2906002)(6666004)(83380400001)(316002)(7416002)(426003)(70206006)(47076005)(54906003)(36860700001)(7636003)(5660300002)(8936002)(82310400003)(16526019)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 08:43:08.8607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d29a0d6-9196-4d05-73a3-08d8f9a12bb1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5010
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Migration is currently implemented as a mode of operation for
try_to_unmap_one() generally specified by passing the TTU_MIGRATION flag
or in the case of splitting a huge anonymous page TTU_SPLIT_FREEZE.

However it does not have much in common with the rest of the unmap
functionality of try_to_unmap_one() and thus splitting it into a
separate function reduces the complexity of try_to_unmap_one() making it
more readable.

Several simplifications can also be made in try_to_migrate_one() based
on the following observations:

 - All users of TTU_MIGRATION also set TTU_IGNORE_MLOCK.
 - No users of TTU_MIGRATION ever set TTU_IGNORE_HWPOISON.
 - No users of TTU_MIGRATION ever set TTU_BATCH_FLUSH.

TTU_SPLIT_FREEZE is a special case of migration used when splitting an
anonymous page. This is most easily dealt with by calling the correct
function from unmap_page() in mm/huge_memory.c  - either
try_to_migrate() for PageAnon or try_to_unmap().

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

---

v5:
* Added comments about how PMD splitting works for migration vs.
  unmapping
* Tightened up the flag check in try_to_migrate() to be explicit about
  which TTU_XXX flags are supported.
---
 include/linux/rmap.h |   4 +-
 mm/huge_memory.c     |  15 +-
 mm/migrate.c         |   9 +-
 mm/rmap.c            | 358 ++++++++++++++++++++++++++++++++-----------
 4 files changed, 280 insertions(+), 106 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 38a746787c2f..0e25d829f742 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -86,8 +86,6 @@ struct anon_vma_chain {
 };
 
 enum ttu_flags {
-	TTU_MIGRATION		= 0x1,	/* migration mode */
-
 	TTU_SPLIT_HUGE_PMD	= 0x4,	/* split huge PMD if any */
 	TTU_IGNORE_MLOCK	= 0x8,	/* ignore mlock */
 	TTU_IGNORE_HWPOISON	= 0x20,	/* corrupted page is recoverable */
@@ -96,7 +94,6 @@ enum ttu_flags {
 					 * do a final flush if necessary */
 	TTU_RMAP_LOCKED		= 0x80,	/* do not grab rmap lock:
 					 * caller holds it */
-	TTU_SPLIT_FREEZE	= 0x100,		/* freeze pte under splitting thp */
 };
 
 #ifdef CONFIG_MMU
@@ -193,6 +190,7 @@ static inline void page_dup_rmap(struct page *page, bool compound)
 int page_referenced(struct page *, int is_locked,
 			struct mem_cgroup *memcg, unsigned long *vm_flags);
 
+bool try_to_migrate(struct page *page, enum ttu_flags flags);
 bool try_to_unmap(struct page *, enum ttu_flags flags);
 
 /* Avoid racy checks */
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 89af065cea5b..eab004331b97 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2357,16 +2357,21 @@ void vma_adjust_trans_huge(struct vm_area_struct *vma,
 
 static void unmap_page(struct page *page)
 {
-	enum ttu_flags ttu_flags = TTU_IGNORE_MLOCK |
-		TTU_RMAP_LOCKED | TTU_SPLIT_HUGE_PMD;
+	enum ttu_flags ttu_flags = TTU_RMAP_LOCKED | TTU_SPLIT_HUGE_PMD;
 	bool unmap_success;
 
 	VM_BUG_ON_PAGE(!PageHead(page), page);
 
 	if (PageAnon(page))
-		ttu_flags |= TTU_SPLIT_FREEZE;
-
-	unmap_success = try_to_unmap(page, ttu_flags);
+		unmap_success = try_to_migrate(page, ttu_flags);
+	else
+		/*
+		 * Don't install migration entries for file backed pages. This
+		 * helps handle cases when i_size is in the middle of the page
+		 * as there is no need to unmap pages beyond i_size manually.
+		 */
+		unmap_success = try_to_unmap(page, ttu_flags |
+						TTU_IGNORE_MLOCK);
 	VM_BUG_ON_PAGE(!unmap_success, page);
 }
 
diff --git a/mm/migrate.c b/mm/migrate.c
index b752543adb64..cc4612e2a246 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1130,7 +1130,7 @@ static int __unmap_and_move(struct page *page, struct page *newpage,
 		/* Establish migration ptes */
 		VM_BUG_ON_PAGE(PageAnon(page) && !PageKsm(page) && !anon_vma,
 				page);
-		try_to_unmap(page, TTU_MIGRATION|TTU_IGNORE_MLOCK);
+		try_to_migrate(page, 0);
 		page_was_mapped = 1;
 	}
 
@@ -1332,7 +1332,7 @@ static int unmap_and_move_huge_page(new_page_t get_new_page,
 
 	if (page_mapped(hpage)) {
 		bool mapping_locked = false;
-		enum ttu_flags ttu = TTU_MIGRATION|TTU_IGNORE_MLOCK;
+		enum ttu_flags ttu = 0;
 
 		if (!PageAnon(hpage)) {
 			/*
@@ -1349,7 +1349,7 @@ static int unmap_and_move_huge_page(new_page_t get_new_page,
 			ttu |= TTU_RMAP_LOCKED;
 		}
 
-		try_to_unmap(hpage, ttu);
+		try_to_migrate(hpage, ttu);
 		page_was_mapped = 1;
 
 		if (mapping_locked)
@@ -2756,7 +2756,6 @@ static void migrate_vma_prepare(struct migrate_vma *migrate)
  */
 static void migrate_vma_unmap(struct migrate_vma *migrate)
 {
-	int flags = TTU_MIGRATION | TTU_IGNORE_MLOCK;
 	const unsigned long npages = migrate->npages;
 	const unsigned long start = migrate->start;
 	unsigned long addr, i, restore = 0;
@@ -2768,7 +2767,7 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
 			continue;
 
 		if (page_mapped(page)) {
-			try_to_unmap(page, flags);
+			try_to_migrate(page, 0);
 			if (page_mapped(page))
 				goto restore;
 		}
diff --git a/mm/rmap.c b/mm/rmap.c
index f09d522725b9..7f91f058f1f5 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1405,14 +1405,8 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
 
-	if (IS_ENABLED(CONFIG_MIGRATION) && (flags & TTU_MIGRATION) &&
-	    is_zone_device_page(page) && !is_device_private_page(page))
-		return true;
-
-	if (flags & TTU_SPLIT_HUGE_PMD) {
-		split_huge_pmd_address(vma, address,
-				flags & TTU_SPLIT_FREEZE, page);
-	}
+	if (flags & TTU_SPLIT_HUGE_PMD)
+		split_huge_pmd_address(vma, address, false, page);
 
 	/*
 	 * For THP, we have to assume the worse case ie pmd for invalidation.
@@ -1436,16 +1430,6 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
 	mmu_notifier_invalidate_range_start(&range);
 
 	while (page_vma_mapped_walk(&pvmw)) {
-#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
-		/* PMD-mapped THP migration entry */
-		if (!pvmw.pte && (flags & TTU_MIGRATION)) {
-			VM_BUG_ON_PAGE(PageHuge(page) || !PageTransCompound(page), page);
-
-			set_pmd_migration_entry(&pvmw, page);
-			continue;
-		}
-#endif
-
 		/*
 		 * If the page is mlock()d, we cannot swap it out.
 		 * If it's recently referenced (perhaps page_referenced
@@ -1507,46 +1491,6 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
 			}
 		}
 
-		if (IS_ENABLED(CONFIG_MIGRATION) &&
-		    (flags & TTU_MIGRATION) &&
-		    is_zone_device_page(page)) {
-			swp_entry_t entry;
-			pte_t swp_pte;
-
-			pteval = ptep_get_and_clear(mm, pvmw.address, pvmw.pte);
-
-			/*
-			 * Store the pfn of the page in a special migration
-			 * pte. do_swap_page() will wait until the migration
-			 * pte is removed and then restart fault handling.
-			 */
-			entry = make_readable_migration_entry(page_to_pfn(page));
-			swp_pte = swp_entry_to_pte(entry);
-
-			/*
-			 * pteval maps a zone device page and is therefore
-			 * a swap pte.
-			 */
-			if (pte_swp_soft_dirty(pteval))
-				swp_pte = pte_swp_mksoft_dirty(swp_pte);
-			if (pte_swp_uffd_wp(pteval))
-				swp_pte = pte_swp_mkuffd_wp(swp_pte);
-			set_pte_at(mm, pvmw.address, pvmw.pte, swp_pte);
-			/*
-			 * No need to invalidate here it will synchronize on
-			 * against the special swap migration pte.
-			 *
-			 * The assignment to subpage above was computed from a
-			 * swap PTE which results in an invalid pointer.
-			 * Since only PAGE_SIZE pages can currently be
-			 * migrated, just set it to page. This will need to be
-			 * changed when hugepage migrations to device private
-			 * memory are supported.
-			 */
-			subpage = page;
-			goto discard;
-		}
-
 		/* Nuke the page table entry. */
 		flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
 		if (should_defer_flush(mm, flags)) {
@@ -1599,39 +1543,6 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
 			/* We have to invalidate as we cleared the pte */
 			mmu_notifier_invalidate_range(mm, address,
 						      address + PAGE_SIZE);
-		} else if (IS_ENABLED(CONFIG_MIGRATION) &&
-				(flags & (TTU_MIGRATION|TTU_SPLIT_FREEZE))) {
-			swp_entry_t entry;
-			pte_t swp_pte;
-
-			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
-				set_pte_at(mm, address, pvmw.pte, pteval);
-				ret = false;
-				page_vma_mapped_walk_done(&pvmw);
-				break;
-			}
-
-			/*
-			 * Store the pfn of the page in a special migration
-			 * pte. do_swap_page() will wait until the migration
-			 * pte is removed and then restart fault handling.
-			 */
-			if (pte_write(pteval))
-				entry = make_writable_migration_entry(
-							page_to_pfn(subpage));
-			else
-				entry = make_readable_migration_entry(
-							page_to_pfn(subpage));
-			swp_pte = swp_entry_to_pte(entry);
-			if (pte_soft_dirty(pteval))
-				swp_pte = pte_swp_mksoft_dirty(swp_pte);
-			if (pte_uffd_wp(pteval))
-				swp_pte = pte_swp_mkuffd_wp(swp_pte);
-			set_pte_at(mm, address, pvmw.pte, swp_pte);
-			/*
-			 * No need to invalidate here it will synchronize on
-			 * against the special swap migration pte.
-			 */
 		} else if (PageAnon(page)) {
 			swp_entry_t entry = { .val = page_private(subpage) };
 			pte_t swp_pte;
@@ -1758,6 +1669,268 @@ bool try_to_unmap(struct page *page, enum ttu_flags flags)
 		.anon_lock = page_lock_anon_vma_read,
 	};
 
+	if (flags & TTU_RMAP_LOCKED)
+		rmap_walk_locked(page, &rwc);
+	else
+		rmap_walk(page, &rwc);
+
+	return !page_mapcount(page) ? true : false;
+}
+
+/*
+ * @arg: enum ttu_flags will be passed to this argument.
+ *
+ * If TTU_SPLIT_HUGE_PMD is specified any PMD mappings will be split into PTEs
+ * containing migration entries. This and TTU_RMAP_LOCKED are the only supported
+ * flags.
+ */
+static bool try_to_migrate_one(struct page *page, struct vm_area_struct *vma,
+		     unsigned long address, void *arg)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	struct page_vma_mapped_walk pvmw = {
+		.page = page,
+		.vma = vma,
+		.address = address,
+	};
+	pte_t pteval;
+	struct page *subpage;
+	bool ret = true;
+	struct mmu_notifier_range range;
+	enum ttu_flags flags = (enum ttu_flags)(long)arg;
+
+	if (is_zone_device_page(page) && !is_device_private_page(page))
+		return true;
+
+	/*
+	 * unmap_page() in mm/huge_memory.c is the only user of migration with
+	 * TTU_SPLIT_HUGE_PMD and it wants to freeze.
+	 */
+	if (flags & TTU_SPLIT_HUGE_PMD)
+		split_huge_pmd_address(vma, address, true, page);
+
+	/*
+	 * For THP, we have to assume the worse case ie pmd for invalidation.
+	 * For hugetlb, it could be much worse if we need to do pud
+	 * invalidation in the case of pmd sharing.
+	 *
+	 * Note that the page can not be free in this function as call of
+	 * try_to_unmap() must hold a reference on the page.
+	 */
+	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma, vma->vm_mm,
+				address,
+				min(vma->vm_end, address + page_size(page)));
+	if (PageHuge(page)) {
+		/*
+		 * If sharing is possible, start and end will be adjusted
+		 * accordingly.
+		 */
+		adjust_range_if_pmd_sharing_possible(vma, &range.start,
+						     &range.end);
+	}
+	mmu_notifier_invalidate_range_start(&range);
+
+	while (page_vma_mapped_walk(&pvmw)) {
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+		/* PMD-mapped THP migration entry */
+		if (!pvmw.pte) {
+			VM_BUG_ON_PAGE(PageHuge(page) ||
+				       !PageTransCompound(page), page);
+
+			set_pmd_migration_entry(&pvmw, page);
+			continue;
+		}
+#endif
+
+		/* Unexpected PMD-mapped THP? */
+		VM_BUG_ON_PAGE(!pvmw.pte, page);
+
+		subpage = page - page_to_pfn(page) + pte_pfn(*pvmw.pte);
+		address = pvmw.address;
+
+		if (PageHuge(page) && !PageAnon(page)) {
+			/*
+			 * To call huge_pmd_unshare, i_mmap_rwsem must be
+			 * held in write mode.  Caller needs to explicitly
+			 * do this outside rmap routines.
+			 */
+			VM_BUG_ON(!(flags & TTU_RMAP_LOCKED));
+			if (huge_pmd_unshare(mm, vma, &address, pvmw.pte)) {
+				/*
+				 * huge_pmd_unshare unmapped an entire PMD
+				 * page.  There is no way of knowing exactly
+				 * which PMDs may be cached for this mm, so
+				 * we must flush them all.  start/end were
+				 * already adjusted above to cover this range.
+				 */
+				flush_cache_range(vma, range.start, range.end);
+				flush_tlb_range(vma, range.start, range.end);
+				mmu_notifier_invalidate_range(mm, range.start,
+							      range.end);
+
+				/*
+				 * The ref count of the PMD page was dropped
+				 * which is part of the way map counting
+				 * is done for shared PMDs.  Return 'true'
+				 * here.  When there is no other sharing,
+				 * huge_pmd_unshare returns false and we will
+				 * unmap the actual page and drop map count
+				 * to zero.
+				 */
+				page_vma_mapped_walk_done(&pvmw);
+				break;
+			}
+		}
+
+		/* Nuke the page table entry. */
+		flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
+		pteval = ptep_clear_flush(vma, address, pvmw.pte);
+
+		/* Move the dirty bit to the page. Now the pte is gone. */
+		if (pte_dirty(pteval))
+			set_page_dirty(page);
+
+		/* Update high watermark before we lower rss */
+		update_hiwater_rss(mm);
+
+		if (is_zone_device_page(page)) {
+			swp_entry_t entry;
+			pte_t swp_pte;
+
+			/*
+			 * Store the pfn of the page in a special migration
+			 * pte. do_swap_page() will wait until the migration
+			 * pte is removed and then restart fault handling.
+			 */
+			entry = make_readable_migration_entry(
+							page_to_pfn(page));
+			swp_pte = swp_entry_to_pte(entry);
+
+			/*
+			 * pteval maps a zone device page and is therefore
+			 * a swap pte.
+			 */
+			if (pte_swp_soft_dirty(pteval))
+				swp_pte = pte_swp_mksoft_dirty(swp_pte);
+			if (pte_swp_uffd_wp(pteval))
+				swp_pte = pte_swp_mkuffd_wp(swp_pte);
+			set_pte_at(mm, pvmw.address, pvmw.pte, swp_pte);
+			/*
+			 * No need to invalidate here it will synchronize on
+			 * against the special swap migration pte.
+			 *
+			 * The assignment to subpage above was computed from a
+			 * swap PTE which results in an invalid pointer.
+			 * Since only PAGE_SIZE pages can currently be
+			 * migrated, just set it to page. This will need to be
+			 * changed when hugepage migrations to device private
+			 * memory are supported.
+			 */
+			subpage = page;
+		} else if (PageHWPoison(page)) {
+			pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
+			if (PageHuge(page)) {
+				hugetlb_count_sub(compound_nr(page), mm);
+				set_huge_swap_pte_at(mm, address,
+						     pvmw.pte, pteval,
+						     vma_mmu_pagesize(vma));
+			} else {
+				dec_mm_counter(mm, mm_counter(page));
+				set_pte_at(mm, address, pvmw.pte, pteval);
+			}
+
+		} else if (pte_unused(pteval) && !userfaultfd_armed(vma)) {
+			/*
+			 * The guest indicated that the page content is of no
+			 * interest anymore. Simply discard the pte, vmscan
+			 * will take care of the rest.
+			 * A future reference will then fault in a new zero
+			 * page. When userfaultfd is active, we must not drop
+			 * this page though, as its main user (postcopy
+			 * migration) will not expect userfaults on already
+			 * copied pages.
+			 */
+			dec_mm_counter(mm, mm_counter(page));
+			/* We have to invalidate as we cleared the pte */
+			mmu_notifier_invalidate_range(mm, address,
+						      address + PAGE_SIZE);
+		} else {
+			swp_entry_t entry;
+			pte_t swp_pte;
+
+			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
+				set_pte_at(mm, address, pvmw.pte, pteval);
+				ret = false;
+				page_vma_mapped_walk_done(&pvmw);
+				break;
+			}
+
+			/*
+			 * Store the pfn of the page in a special migration
+			 * pte. do_swap_page() will wait until the migration
+			 * pte is removed and then restart fault handling.
+			 */
+			if (pte_write(pteval))
+				entry = make_writable_migration_entry(
+							page_to_pfn(subpage));
+			else
+				entry = make_readable_migration_entry(
+							page_to_pfn(subpage));
+
+			swp_pte = swp_entry_to_pte(entry);
+			if (pte_soft_dirty(pteval))
+				swp_pte = pte_swp_mksoft_dirty(swp_pte);
+			if (pte_uffd_wp(pteval))
+				swp_pte = pte_swp_mkuffd_wp(swp_pte);
+			set_pte_at(mm, address, pvmw.pte, swp_pte);
+			/*
+			 * No need to invalidate here it will synchronize on
+			 * against the special swap migration pte.
+			 */
+		}
+
+		/*
+		 * No need to call mmu_notifier_invalidate_range() it has be
+		 * done above for all cases requiring it to happen under page
+		 * table lock before mmu_notifier_invalidate_range_end()
+		 *
+		 * See Documentation/vm/mmu_notifier.rst
+		 */
+		page_remove_rmap(subpage, PageHuge(page));
+		put_page(page);
+	}
+
+	mmu_notifier_invalidate_range_end(&range);
+
+	return ret;
+}
+
+/**
+ * try_to_migrate - try to replace all page table mappings with swap entries
+ * @page: the page to replace page table entries for
+ * @flags: action and flags
+ *
+ * Tries to remove all the page table entries which are mapping this page and
+ * replace them with special swap entries. Caller must hold the page lock.
+ *
+ * If is successful, return true. Otherwise, false.
+ */
+bool try_to_migrate(struct page *page, enum ttu_flags flags)
+{
+	struct rmap_walk_control rwc = {
+		.rmap_one = try_to_migrate_one,
+		.arg = (void *)flags,
+		.done = page_not_mapped,
+		.anon_lock = page_lock_anon_vma_read,
+	};
+
+	/*
+	 * Migration always ignores mlock and only supports TTU_RMAP_LOCKED and
+	 * TTU_SPLIT_HUGE_PMD flags.
+	 */
+	if (WARN_ON_ONCE(flags & ~(TTU_RMAP_LOCKED | TTU_SPLIT_HUGE_PMD)))
+		return false;
+
 	/*
 	 * During exec, a temporary VMA is setup and later moved.
 	 * The VMA is moved under the anon_vma lock but not the
@@ -1766,8 +1939,7 @@ bool try_to_unmap(struct page *page, enum ttu_flags flags)
 	 * locking requirements of exec(), migration skips
 	 * temporary VMAs until after exec() completes.
 	 */
-	if ((flags & (TTU_MIGRATION|TTU_SPLIT_FREEZE))
-	    && !PageKsm(page) && PageAnon(page))
+	if (!PageKsm(page) && PageAnon(page))
 		rwc.invalid_vma = invalid_migration_vma;
 
 	if (flags & TTU_RMAP_LOCKED)
-- 
2.20.1

