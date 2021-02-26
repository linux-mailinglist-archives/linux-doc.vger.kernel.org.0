Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4D0D325E37
	for <lists+linux-doc@lfdr.de>; Fri, 26 Feb 2021 08:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbhBZHUb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 26 Feb 2021 02:20:31 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:13821 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbhBZHUY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Feb 2021 02:20:24 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6038a0f60000>; Thu, 25 Feb 2021 23:19:18 -0800
Received: from localhost (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Feb
 2021 07:19:17 +0000
From:   Alistair Popple <apopple@nvidia.com>
To:     <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
        <bskeggs@redhat.com>, <akpm@linux-foundation.org>
CC:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <jhubbard@nvidia.com>,
        <rcampbell@nvidia.com>, <jglisse@redhat.com>, <jgg@nvidia.com>,
        <hch@infradead.org>, <daniel@ffwll.ch>,
        Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v3 8/8] nouveau/svm: Implement atomic SVM access
Date:   Fri, 26 Feb 2021 18:18:32 +1100
Message-ID: <20210226071832.31547-9-apopple@nvidia.com>
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
        t=1614323958; bh=ap8KZiG4+pTr6g8hee17vVJL0B2lv0WjvaUCFNUjExQ=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:Content-Type:
         X-Originating-IP:X-ClientProxiedBy;
        b=D4ArNarDS2CGeu6I5qnEg006ruCsBD/hYcE3GVt6BFN4nmq3w6S/fV+gS0rl2u4EO
         ai/m/WxXSPcJjduHNJWKJ2owCiIsJeLJ319mDmJkQVXwEezGI4UPlsYE7/RMefwbEW
         6bUYI7AZ4ZZgPFqm7H7nyKTpjqT4IlvxR6pISJ9uRra76oQTRlEuLbJag53i5P4jU8
         m1UKuZXxkzVHULn0VIhSByIeu8+wVO8Y1jm7pXgbTwcG0fMQ3elXT99BI3aBZetykX
         Mpzc9TIWxW0W92x05keE0tSwLr5nJI0snaAEC/RLMrfg8/wnd1NoE+24xnQrsQX4M3
         XN3g1eNH4qcaw==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some NVIDIA GPUs do not support direct atomic access to system memory
via PCIe. Instead this must be emulated by granting the GPU exclusive
access to the memory. This is achieved by replacing CPU page table
entries with special swap entries that fault on userspace access.

The driver then grants the GPU permission to update the page undergoing
atomic access via the GPU page tables. When CPU access to the page is
required a CPU fault is raised which calls into the device driver via
MMU notifiers to revoke the atomic access. The original page table
entries are then restored allowing CPU access to proceed.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/if000c.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 88 ++++++++++++++++---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |  1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |  6 ++
 4 files changed, 83 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if000c.h b/drivers/gpu/dr=
m/nouveau/include/nvif/if000c.h
index d6dd40f21eed..9c7ff56831c5 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if000c.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
@@ -77,6 +77,7 @@ struct nvif_vmm_pfnmap_v0 {
 #define NVIF_VMM_PFNMAP_V0_APER                           0x00000000000000=
f0ULL
 #define NVIF_VMM_PFNMAP_V0_HOST                           0x00000000000000=
00ULL
 #define NVIF_VMM_PFNMAP_V0_VRAM                           0x00000000000000=
10ULL
+#define NVIF_VMM_PFNMAP_V0_A				  0x0000000000000004ULL
 #define NVIF_VMM_PFNMAP_V0_W                              0x00000000000000=
02ULL
 #define NVIF_VMM_PFNMAP_V0_V                              0x00000000000000=
01ULL
 #define NVIF_VMM_PFNMAP_V0_NONE                           0x00000000000000=
00ULL
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouvea=
u/nouveau_svm.c
index cd7b47c946cf..630c4a7bcb55 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -35,6 +35,7 @@
 #include <linux/sched/mm.h>
 #include <linux/sort.h>
 #include <linux/hmm.h>
+#include <linux/rmap.h>
=20
 struct nouveau_svm {
 	struct nouveau_drm *drm;
@@ -421,9 +422,9 @@ nouveau_svm_fault_cmp(const void *a, const void *b)
 		return ret;
 	if ((ret =3D (s64)fa->addr - fb->addr))
 		return ret;
-	/*XXX: atomic? */
-	return (fa->access =3D=3D 0 || fa->access =3D=3D 3) -
-	       (fb->access =3D=3D 0 || fb->access =3D=3D 3);
+	/* Atomic access (2) has highest priority */
+	return (-1*(fa->access =3D=3D 2) + (fa->access =3D=3D 0 || fa->access =3D=
=3D 3)) -
+	       (-1*(fb->access =3D=3D 2) + (fb->access =3D=3D 0 || fb->access =3D=
=3D 3));
 }
=20
 static void
@@ -555,10 +556,58 @@ static void nouveau_hmm_convert_pfn(struct nouveau_dr=
m *drm,
 		args->p.phys[0] |=3D NVIF_VMM_PFNMAP_V0_W;
 }
=20
+static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
+			       struct nouveau_drm *drm,
+			       struct nouveau_pfnmap_args *args, u32 size,
+			       unsigned long hmm_flags, struct mm_struct *mm)
+{
+	struct page *page;
+	unsigned long start =3D args->p.addr;
+	struct vm_area_struct *vma;
+	int ret =3D 0;
+
+	mmap_read_lock(mm);
+	vma =3D find_vma_intersection(mm, start, start + size);
+	if (!vma || !(vma->vm_flags & VM_WRITE)) {
+		ret =3D -EPERM;
+		goto out;
+	}
+
+	make_device_exclusive_range(mm, start, start + PAGE_SIZE, &page);
+	if (!page) {
+		ret =3D -EINVAL;
+		goto out;
+	}
+
+	/* Map the page on the GPU. */
+	args->p.page =3D 12;
+	args->p.size =3D PAGE_SIZE;
+	args->p.addr =3D start;
+	args->p.phys[0] =3D page_to_phys(page) |
+		NVIF_VMM_PFNMAP_V0_V |
+		NVIF_VMM_PFNMAP_V0_W |
+		NVIF_VMM_PFNMAP_V0_A |
+		NVIF_VMM_PFNMAP_V0_HOST;
+
+	mutex_lock(&svmm->mutex);
+	svmm->vmm->vmm.object.client->super =3D true;
+	ret =3D nvif_object_ioctl(&svmm->vmm->vmm.object, args, size, NULL);
+	svmm->vmm->vmm.object.client->super =3D false;
+	mutex_unlock(&svmm->mutex);
+
+	set_page_dirty(page);
+	unlock_page(page);
+	put_page(page);
+
+out:
+	mmap_read_unlock(mm);
+	return ret;
+}
+
 static int nouveau_range_fault(struct nouveau_svmm *svmm,
 			       struct nouveau_drm *drm,
 			       struct nouveau_pfnmap_args *args, u32 size,
-			       unsigned long hmm_flags,
+			       unsigned long hmm_flags, int atomic,
 			       struct svm_notifier *notifier)
 {
 	unsigned long timeout =3D
@@ -608,12 +657,18 @@ static int nouveau_range_fault(struct nouveau_svmm *s=
vmm,
 		break;
 	}
=20
-	nouveau_hmm_convert_pfn(drm, &range, args);
+	if (atomic) {
+		mutex_unlock(&svmm->mutex);
+		ret =3D nouveau_atomic_range_fault(svmm, drm, args,
+						size, hmm_flags, mm);
+	} else {
+		nouveau_hmm_convert_pfn(drm, &range, args);
=20
-	svmm->vmm->vmm.object.client->super =3D true;
-	ret =3D nvif_object_ioctl(&svmm->vmm->vmm.object, args, size, NULL);
-	svmm->vmm->vmm.object.client->super =3D false;
-	mutex_unlock(&svmm->mutex);
+		svmm->vmm->vmm.object.client->super =3D true;
+		ret =3D nvif_object_ioctl(&svmm->vmm->vmm.object, args, size, NULL);
+		svmm->vmm->vmm.object.client->super =3D false;
+		mutex_unlock(&svmm->mutex);
+	}
=20
 out:
 	mmu_interval_notifier_remove(&notifier->notifier);
@@ -637,7 +692,7 @@ nouveau_svm_fault(struct nvif_notify *notify)
 	unsigned long hmm_flags;
 	u64 inst, start, limit;
 	int fi, fn;
-	int replay =3D 0, ret;
+	int replay =3D 0, atomic =3D 0, ret;
=20
 	/* Parse available fault buffer entries into a cache, and update
 	 * the GET pointer so HW can reuse the entries.
@@ -718,12 +773,15 @@ nouveau_svm_fault(struct nvif_notify *notify)
 		/*
 		 * Determine required permissions based on GPU fault
 		 * access flags.
-		 * XXX: atomic?
 		 */
 		switch (buffer->fault[fi]->access) {
 		case 0: /* READ. */
 			hmm_flags =3D HMM_PFN_REQ_FAULT;
 			break;
+		case 2: /* ATOMIC. */
+			hmm_flags =3D HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE;
+			atomic =3D true;
+			break;
 		case 3: /* PREFETCH. */
 			hmm_flags =3D 0;
 			break;
@@ -740,7 +798,7 @@ nouveau_svm_fault(struct nvif_notify *notify)
=20
 		notifier.svmm =3D svmm;
 		ret =3D nouveau_range_fault(svmm, svm->drm, &args.i,
-					sizeof(args), hmm_flags, &notifier);
+			sizeof(args), hmm_flags, atomic, &notifier);
 		mmput(mm);
=20
 		limit =3D args.i.p.addr + args.i.p.size;
@@ -760,7 +818,11 @@ nouveau_svm_fault(struct nvif_notify *notify)
 			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_V)) ||
 			    (buffer->fault[fi]->access !=3D 0 /* READ. */ &&
 			     buffer->fault[fi]->access !=3D 3 /* PREFETCH. */ &&
-			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_W)))
+			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_W)) ||
+			    (buffer->fault[fi]->access !=3D 0 /* READ. */ &&
+			     buffer->fault[fi]->access !=3D 1 /* WRITE. */ &&
+			     buffer->fault[fi]->access !=3D 3 /* PREFETCH. */ &&
+			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_A)))
 				break;
 		}
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.h
index a2b179568970..f6188aa9171c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -178,6 +178,7 @@ void nvkm_vmm_unmap_region(struct nvkm_vmm *, struct nv=
km_vma *);
 #define NVKM_VMM_PFN_APER                                 0x00000000000000=
f0ULL
 #define NVKM_VMM_PFN_HOST                                 0x00000000000000=
00ULL
 #define NVKM_VMM_PFN_VRAM                                 0x00000000000000=
10ULL
+#define NVKM_VMM_PFN_A					  0x0000000000000004ULL
 #define NVKM_VMM_PFN_W                                    0x00000000000000=
02ULL
 #define NVKM_VMM_PFN_V                                    0x00000000000000=
01ULL
 #define NVKM_VMM_PFN_NONE                                 0x00000000000000=
00ULL
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/g=
pu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index 236db5570771..f02abd9cb4dd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -88,6 +88,9 @@ gp100_vmm_pgt_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu_p=
t *pt,
 		if (!(*map->pfn & NVKM_VMM_PFN_W))
 			data |=3D BIT_ULL(6); /* RO. */
=20
+		if (!(*map->pfn & NVKM_VMM_PFN_A))
+			data |=3D BIT_ULL(7); /* Atomic disable. */
+
 		if (!(*map->pfn & NVKM_VMM_PFN_VRAM)) {
 			addr =3D *map->pfn >> NVKM_VMM_PFN_ADDR_SHIFT;
 			addr =3D dma_map_page(dev, pfn_to_page(addr), 0,
@@ -322,6 +325,9 @@ gp100_vmm_pd0_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu=
_pt *pt,
 		if (!(*map->pfn & NVKM_VMM_PFN_W))
 			data |=3D BIT_ULL(6); /* RO. */
=20
+		if (!(*map->pfn & NVKM_VMM_PFN_A))
+			data |=3D BIT_ULL(7); /* Atomic disable. */
+
 		if (!(*map->pfn & NVKM_VMM_PFN_VRAM)) {
 			addr =3D *map->pfn >> NVKM_VMM_PFN_ADDR_SHIFT;
 			addr =3D dma_map_page(dev, pfn_to_page(addr), 0,
--=20
2.20.1

