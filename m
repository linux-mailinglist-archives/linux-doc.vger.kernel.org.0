Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E54B4325E2F
	for <lists+linux-doc@lfdr.de>; Fri, 26 Feb 2021 08:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbhBZHTp (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 26 Feb 2021 02:19:45 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14606 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhBZHTp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Feb 2021 02:19:45 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6038a0e60003>; Thu, 25 Feb 2021 23:19:02 -0800
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Feb
 2021 07:19:01 +0000
From:   Alistair Popple <apopple@nvidia.com>
To:     <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
        <bskeggs@redhat.com>, <akpm@linux-foundation.org>
CC:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <jhubbard@nvidia.com>,
        <rcampbell@nvidia.com>, <jglisse@redhat.com>, <jgg@nvidia.com>,
        <hch@infradead.org>, <daniel@ffwll.ch>,
        Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v3 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Date:   Fri, 26 Feb 2021 18:18:27 +1100
Message-ID: <20210226071832.31547-4-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210226071832.31547-1-apopple@nvidia.com>
References: <20210226071832.31547-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1614323942; bh=Er37msp1oYW9KFumvZeN3jL53UDEutwOeLFH26SFTLc=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:Content-Type:
         X-Originating-IP:X-ClientProxiedBy;
        b=hKjZzO4ykfe69uf2fhPuJL9Y1nm4cXKyYKKhZRX6MGkI0QuuPVp2JmEcu/nKK26zv
         zEzrSJummNBZcvDyCDSWGWwXaG36wmn9gql4nfINeuxFrn1bQuCoFvwHi4OMkeSmuU
         +/+nIKorxiP8K9YD9y4uwPiSGEMxlJFwInFa3iQ2FClj81AgXmXOkt4Za/q6CrsNP8
         2cqNYyge6QBAAnmBIVau7kQOXqQ51Ai/OJHa8xpFvweS5Frk9fUX7row4+dYpp+/0A
         H643VxvLvK8qDHL/ZDxDEdloi7fM59PtLcfp9Wunw5Zqc3Hm0zCjKGw5uz5L1PGRm2
         +fbiMs23poupA==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The behaviour of try_to_unmap_one() is difficult to follow because it
performs different operations based on a fairly large set of flags used
in different combinations.

TTU_MUNLOCK is one such flag. However it is exclusively used by
try_to_munlock() which specifies no other flags. Therefore rather than
overload try_to_unmap_one() with unrelated behaviour split this out into
it's own function and remove the flag.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Given the comments on not needing to hold mmap_lock it was not 100% clear
to me if it is safe to check vma->vma_flags & VM_LOCKED and if re-checking
under the ptl was significant. I left the extra check in case it was, but
it seems one of the checks is redunant as either the first check is racey
or the second check is unneccsary.
---
 include/linux/rmap.h |  1 -
 mm/rmap.c            | 47 ++++++++++++++++++++++++++++++++++++--------
 2 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 70085ca1a3fc..7f1ee411bd7b 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -87,7 +87,6 @@ struct anon_vma_chain {
=20
 enum ttu_flags {
 	TTU_MIGRATION		=3D 0x1,	/* migration mode */
-	TTU_MUNLOCK		=3D 0x2,	/* munlock mode */
=20
 	TTU_SPLIT_HUGE_PMD	=3D 0x4,	/* split huge PMD if any */
 	TTU_IGNORE_MLOCK	=3D 0x8,	/* ignore mlock */
diff --git a/mm/rmap.c b/mm/rmap.c
index ef9ef2694c58..850eecdd866a 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1391,10 +1391,6 @@ static bool try_to_unmap_one(struct page *page, stru=
ct vm_area_struct *vma,
 	struct mmu_notifier_range range;
 	enum ttu_flags flags =3D (enum ttu_flags)(long)arg;
=20
-	/* munlock has nothing to gain from examining un-locked vmas */
-	if ((flags & TTU_MUNLOCK) && !(vma->vm_flags & VM_LOCKED))
-		return true;
-
 	if (IS_ENABLED(CONFIG_MIGRATION) && (flags & TTU_MIGRATION) &&
 	    is_zone_device_page(page) && !is_device_private_page(page))
 		return true;
@@ -1455,8 +1451,6 @@ static bool try_to_unmap_one(struct page *page, struc=
t vm_area_struct *vma,
 				page_vma_mapped_walk_done(&pvmw);
 				break;
 			}
-			if (flags & TTU_MUNLOCK)
-				continue;
 		}
=20
 		/* Unexpected PMD-mapped THP? */
@@ -1775,6 +1769,44 @@ static int page_not_mapped(struct page *page)
 	return !page_mapped(page);
 };
=20
+static bool try_to_munlock_one(struct page *page, struct vm_area_struct *v=
ma,
+		     unsigned long address, void *arg)
+{
+	struct page_vma_mapped_walk pvmw =3D {
+		.page =3D page,
+		.vma =3D vma,
+		.address =3D address,
+	};
+	bool ret =3D true;
+
+	/* munlock has nothing to gain from examining un-locked vmas */
+	if (!(vma->vm_flags & VM_LOCKED))
+		return true;
+
+	while (page_vma_mapped_walk(&pvmw)) {
+		/*
+		 * If the page is mlock()d, we cannot swap it out.
+		 * If it's recently referenced (perhaps page_referenced
+		 * skipped over this mm) then we should reactivate it.
+		 */
+		if (vma->vm_flags & VM_LOCKED) {
+			/* PTE-mapped THP are never mlocked */
+			if (!PageTransCompound(page)) {
+				/*
+				 * Holding pte lock, we do *not* need
+				 * mmap_lock here
+				 */
+				mlock_vma_page(page);
+			}
+			ret =3D false;
+			page_vma_mapped_walk_done(&pvmw);
+			break;
+		}
+	}
+
+	return ret;
+}
+
 /**
  * try_to_munlock - try to munlock a page
  * @page: the page to be munlocked
@@ -1787,8 +1819,7 @@ static int page_not_mapped(struct page *page)
 void try_to_munlock(struct page *page)
 {
 	struct rmap_walk_control rwc =3D {
-		.rmap_one =3D try_to_unmap_one,
-		.arg =3D (void *)TTU_MUNLOCK,
+		.rmap_one =3D try_to_munlock_one,
 		.done =3D page_not_mapped,
 		.anon_lock =3D page_lock_anon_vma_read,
=20
--=20
2.20.1

