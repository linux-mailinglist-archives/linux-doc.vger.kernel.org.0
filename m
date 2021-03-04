Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1B8A32CCA5
	for <lists+linux-doc@lfdr.de>; Thu,  4 Mar 2021 07:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbhCDGSC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 4 Mar 2021 01:18:02 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2107 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbhCDGRm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Mar 2021 01:17:42 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B60407b5e0000>; Wed, 03 Mar 2021 22:17:02 -0800
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 4 Mar
 2021 06:17:01 +0000
Received: from localhost (172.20.145.6) by DRHQMAIL107.nvidia.com (10.27.9.16)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 06:17:00
 +0000
From:   Alistair Popple <apopple@nvidia.com>
To:     <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
        <bskeggs@redhat.com>, <akpm@linux-foundation.org>
CC:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kvm-ppc@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <jhubbard@nvidia.com>, <rcampbell@nvidia.com>,
        <jglisse@redhat.com>, "Alistair Popple" <apopple@nvidia.com>
Subject: [PATCH v4 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Date:   Thu, 4 Mar 2021 17:16:40 +1100
Message-ID: <20210304061645.29747-4-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210304061645.29747-1-apopple@nvidia.com>
References: <20210304061645.29747-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1614838622; bh=KhCqKR0s83WdeI+iaFfhkOL/c6bb31bkOEArZ0mdKmM=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:Content-Type:
         X-Originating-IP:X-ClientProxiedBy;
        b=MOGHUVtTdTRRnVM9gq94Dmwzipq4DKEWU/oA5LYFxDM6ZX7YA7eQkrYk885jNhfmF
         QSnXbyP2K2L9gjAjZ1ZRl+n1UeWMB3mfjslAiwyZfOEW9Moef7fhJprzMz2l8c9uv2
         48AEU0/URU0e+PsBkP7Nsh6GCWY31yOCGPt8WJdFSeYFmweKhfS4MidD0tnjz5d485
         XjgxMRleBYOPNPkul1FcBHZjn9hSJhTwQIiE3Lhn4aGWjgqamRpWU7BwR7KGEnfHkS
         xWBEdw+c9HUoPWfjMQ5IevGfoVotudK8WtNfH+uSUTyfKCqYP8Xt4lccSnBa26xAZR
         dPdBgvENXe0oA==
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

Christoph - I didn't add your Reviewed-by because removal of the extra
VM_LOCKED check changed things slightly. Let me know if you're still ok
for me to add it. Thanks.

v4:
* Removed redundant check for VM_LOCKED
---
 include/linux/rmap.h |  1 -
 mm/rmap.c            | 40 ++++++++++++++++++++++++++++++++--------
 2 files changed, 32 insertions(+), 9 deletions(-)

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
index ef9ef2694c58..c8a637abffb3 100644
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
@@ -1775,6 +1769,37 @@ static int page_not_mapped(struct page *page)
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
+
+	/* munlock has nothing to gain from examining un-locked vmas */
+	if (!(vma->vm_flags & VM_LOCKED))
+		return true;
+
+	while (page_vma_mapped_walk(&pvmw)) {
+		/* PTE-mapped THP are never mlocked */
+		if (!PageTransCompound(page)) {
+			/*
+			 * Holding pte lock, we do *not* need
+			 * mmap_lock here
+			 */
+			mlock_vma_page(page);
+		}
+		page_vma_mapped_walk_done(&pvmw);
+
+		/* found a mlocked page, no point continuing munlock check */
+		return false;
+	}
+
+	return true;
+}
+
 /**
  * try_to_munlock - try to munlock a page
  * @page: the page to be munlocked
@@ -1787,8 +1812,7 @@ static int page_not_mapped(struct page *page)
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

