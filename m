Return-Path: <linux-doc+bounces-31262-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEE69D41EA
	for <lists+linux-doc@lfdr.de>; Wed, 20 Nov 2024 19:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2F4C1F23145
	for <lists+linux-doc@lfdr.de>; Wed, 20 Nov 2024 18:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B707D1BC9FC;
	Wed, 20 Nov 2024 18:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SQYwid7C"
X-Original-To: linux-doc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34AF1F931;
	Wed, 20 Nov 2024 18:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732126365; cv=none; b=nlf0YqgrGJ4W+Afw/9A5b+d3Lz8g2MsI9BViIij8jM6QC3FuA6TdVU3pYuT3j59rQAGAvO0ajEK8kYv1134pjyNIZZ5I7EK8yOTJAXgQd/Z3ttBL4c+bykLx3K+G86/0hEL3gvrf3tixTkyokEtQ/r8AhTZDjBnVGXQFDbBIviY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732126365; c=relaxed/simple;
	bh=/hHL4/tjxxdgVeiYCI75gMYDYxG7n2nsKwYKOuSnHlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fPVf512xMRZaHu6Pa6HWz/GpuH4d0pKo19uawQ5N93YfDsxv9wKToUfj7+HYv16oAMPExs+UvrJAmNyZFIBrqU9BrhZb3dye7Ft4dYT8a+TgNBbQKXCQWLa2jRfv6V7ibExCQ9h/eXVdWyzQ2lN7TWe0kHmOFjdRtDn7MlZ3XAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SQYwid7C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK9FV4r005827;
	Wed, 20 Nov 2024 18:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MtvIHRMqRlU4csVxVxWvL25EMsNBDz08abqpKN6Snmw=; b=SQYwid7C/skEkvxZ
	YtSACdd2/pGI/dkIC0iLKlUQc48k/oaQF39UikGVMgifaYdslx4VjqWP9MTYsJ6k
	1gEPZ+ctuQdVSnKVbVyTtku5Y/7+yHOMY2smogXFtulHMSbSpYzzH2Mk7jMk3inN
	9kwgf3tUJmdfJPOD3Bcu1N2Nf7KonF69jppBi6FJTRzBC2PhzyN1qL93afKL8nb8
	jvtPxF/JX3mZG0KarcuJ1U5tbpTABxnQxo0kAbnmyozE4cQogOWU8Zf5671ujzhn
	+HcP7ORJJEm3cHrvRJFWPdbmIyAXg2kIh9yQsXf6c9PvLJj8DTZ1BcrIUFDqVHMc
	08HlzQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y7xt21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 18:12:16 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AKICFqW020037
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 18:12:15 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 10:12:14 -0800
From: Elliot Berman <quic_eberman@quicinc.com>
Date: Wed, 20 Nov 2024 10:12:08 -0800
Subject: [PATCH v4 2/2] mm: guestmem: Convert address_space operations to
 guestmem library
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241120-guestmem-library-v4-2-0c597f733909@quicinc.com>
References: <20241120-guestmem-library-v4-0-0c597f733909@quicinc.com>
In-Reply-To: <20241120-guestmem-library-v4-0-0c597f733909@quicinc.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
        Andrew Morton
	<akpm@linux-foundation.org>,
        Sean Christopherson <seanjc@google.com>,
        "Fuad
 Tabba" <tabba@google.com>,
        Ackerley Tng <ackerleytng@google.com>,
        "Mike
 Rapoport" <rppt@kernel.org>,
        David Hildenbrand <david@redhat.com>,
        "H. Peter
 Anvin" <hpa@zytor.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, Trond Myklebust <trondmy@kernel.org>,
        "Anna
 Schumaker" <anna@kernel.org>,
        Mike Marshall <hubcap@omnibond.com>,
        "Martin
 Brandenburg" <martin@omnibond.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
CC: James Gowans <jgowans@amazon.com>, Mike Day <michael.day@amd.com>,
        <linux-fsdevel@vger.kernel.org>, <kvm@vger.kernel.org>,
        <linux-coco@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
        <linux-doc@vger.kernel.org>, <linux-nfs@vger.kernel.org>,
        <devel@lists.orangefs.org>, <linux-arm-kernel@lists.infradead.org>,
        "Elliot
 Berman" <quic_eberman@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qsgK9y7XP2ghMX9s0JVz96fQQxe7YamK
X-Proofpoint-GUID: qsgK9y7XP2ghMX9s0JVz96fQQxe7YamK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411200125

A few near-term features are coming to guest_memfd which make sense to
create a built-in library.
 - pKVM will introduce MMU-based protection for guests and allow guest
   memory to be switched between "guest-private" and "accessible to
   host". Additional tracking is needed to manage the state of pages as
   accessing "guest-private" pages crashes the host.
 - Introduction of large folios requires tracking since guests will not
   have awareness whether the memory backing a page is huge or not.
   Guests may wish to share only a partial page.
 - Gunyah hypervisor support will be added and also make use of guestmem
   for its MMU-based protection.

The address_space is targeted for the guestmem library.  KVM still
"owns" the inode and file.

MAINTAINERS is updated with explicit references to guestmem files
else the stm maintainers are automatically added.

Tested with:
run_kselftest.sh -t kvm:guest_memfd_test -t kvm:set_memory_region_test

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 MAINTAINERS              |   2 +
 include/linux/guestmem.h |  33 ++++++++
 mm/Kconfig               |   3 +
 mm/Makefile              |   1 +
 mm/guestmem.c            | 196 +++++++++++++++++++++++++++++++++++++++++++++++
 virt/kvm/Kconfig         |   1 +
 virt/kvm/guest_memfd.c   |  98 +++++++-----------------
 7 files changed, 264 insertions(+), 70 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 391fe4b106f8cb7e1cc0b4184dc121ac74d8e00a..c684248ce65d99d62dc616c8bc6c1a7419bd6f4d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14888,6 +14888,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 T:	quilt git://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new
 F:	include/linux/gfp.h
 F:	include/linux/gfp_types.h
+F:	include/linux/guestmem.h
 F:	include/linux/memfd.h
 F:	include/linux/memory.h
 F:	include/linux/memory_hotplug.h
@@ -14903,6 +14904,7 @@ F:	include/linux/pagewalk.h
 F:	include/linux/rmap.h
 F:	include/trace/events/ksm.h
 F:	mm/
+F:	mm/guestmem.c
 F:	tools/mm/
 F:	tools/testing/selftests/mm/
 N:	include/linux/page[-_]*
diff --git a/include/linux/guestmem.h b/include/linux/guestmem.h
new file mode 100644
index 0000000000000000000000000000000000000000..4beb37adb5e541015fcc12a45930613c686c5580
--- /dev/null
+++ b/include/linux/guestmem.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_GUESTMEM_H
+#define _LINUX_GUESTMEM_H
+
+struct address_space;
+struct list_head;
+
+/**
+ * struct guestmem_ops - Hypervisor-specific maintenance operations to perform on folios
+ * @release_folio - Try to bring the folio back to fully owned by Linux
+ *		    for instance: about to free the folio [optional]
+ * @invalidate_begin - start invalidating mappings between start and end offsets
+ * @invalidate_end - paired with ->invalidate_begin() [optional]
+ */
+struct guestmem_ops {
+	bool (*release_folio)(struct list_head *entry, struct folio *folio);
+	int (*invalidate_begin)(struct list_head *entry, pgoff_t start,
+				pgoff_t end);
+	void (*invalidate_end)(struct list_head *entry, pgoff_t start,
+			       pgoff_t end);
+};
+
+int guestmem_attach_mapping(struct address_space *mapping,
+			    const struct guestmem_ops *const ops,
+			    struct list_head *data);
+void guestmem_detach_mapping(struct address_space *mapping,
+			     struct list_head *data);
+
+struct folio *guestmem_grab_folio(struct address_space *mapping, pgoff_t index);
+int guestmem_punch_hole(struct address_space *mapping, loff_t offset,
+			loff_t len);
+
+#endif
diff --git a/mm/Kconfig b/mm/Kconfig
index 4c9f5ea13271d1f90163e75a35adf619ada3a5cd..48c911d3dbc1645b478d0626a5d86f5fec154b15 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1190,6 +1190,9 @@ config SECRETMEM
 	  memory areas visible only in the context of the owning process and
 	  not mapped to other processes and other kernel page tables.
 
+config GUESTMEM
+	bool
+
 config ANON_VMA_NAME
 	bool "Anonymous VMA name support"
 	depends on PROC_FS && ADVISE_SYSCALLS && MMU
diff --git a/mm/Makefile b/mm/Makefile
index d5639b03616636e4d49913f76865e24edb270f73..4d5f003d69c8969aaae0615106b90600ef638719 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -136,6 +136,7 @@ obj-$(CONFIG_PERCPU_STATS) += percpu-stats.o
 obj-$(CONFIG_ZONE_DEVICE) += memremap.o
 obj-$(CONFIG_HMM_MIRROR) += hmm.o
 obj-$(CONFIG_MEMFD_CREATE) += memfd.o
+obj-$(CONFIG_GUESTMEM) += guestmem.o
 obj-$(CONFIG_MAPPING_DIRTY_HELPERS) += mapping_dirty_helpers.o
 obj-$(CONFIG_PTDUMP_CORE) += ptdump.o
 obj-$(CONFIG_PAGE_REPORTING) += page_reporting.o
diff --git a/mm/guestmem.c b/mm/guestmem.c
new file mode 100644
index 0000000000000000000000000000000000000000..19dd7e5d498f07577ec5cec5b52055f7435980f4
--- /dev/null
+++ b/mm/guestmem.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * guestmem library
+ *
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/fs.h>
+#include <linux/guestmem.h>
+#include <linux/mm.h>
+#include <linux/pagemap.h>
+
+struct guestmem {
+	const struct guestmem_ops *ops;
+};
+
+static inline struct guestmem *folio_to_guestmem(struct folio *folio)
+{
+	struct address_space *mapping = folio->mapping;
+
+	return mapping->i_private_data;
+}
+
+static inline bool __guestmem_release_folio(struct address_space *mapping,
+					    struct folio *folio)
+{
+	struct guestmem *gmem = mapping->i_private_data;
+	struct list_head *entry;
+
+	if (gmem->ops->release_folio) {
+		list_for_each(entry, &mapping->i_private_list) {
+			if (!gmem->ops->release_folio(entry, folio))
+				return false;
+		}
+	}
+
+	return true;
+}
+
+static inline int
+__guestmem_invalidate_begin(struct address_space *const mapping, pgoff_t start,
+			    pgoff_t end)
+{
+	struct guestmem *gmem = mapping->i_private_data;
+	struct list_head *entry;
+	int ret = 0;
+
+	list_for_each(entry, &mapping->i_private_list) {
+		ret = gmem->ops->invalidate_begin(entry, start, end);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static inline void
+__guestmem_invalidate_end(struct address_space *const mapping, pgoff_t start,
+			  pgoff_t end)
+{
+	struct guestmem *gmem = mapping->i_private_data;
+	struct list_head *entry;
+
+	if (gmem->ops->invalidate_end) {
+		list_for_each(entry, &mapping->i_private_list)
+			gmem->ops->invalidate_end(entry, start, end);
+	}
+}
+
+static void guestmem_free_folio(struct address_space *mapping,
+				struct folio *folio)
+{
+	WARN_ON_ONCE(!__guestmem_release_folio(mapping, folio));
+}
+
+static int guestmem_error_folio(struct address_space *mapping,
+				struct folio *folio)
+{
+	pgoff_t start, end;
+	int ret;
+
+	filemap_invalidate_lock_shared(mapping);
+
+	start = folio->index;
+	end = start + folio_nr_pages(folio);
+
+	ret = __guestmem_invalidate_begin(mapping, start, end);
+	if (ret)
+		goto out;
+
+	/*
+	 * Do not truncate the range, what action is taken in response to the
+	 * error is userspace's decision (assuming the architecture supports
+	 * gracefully handling memory errors).  If/when the guest attempts to
+	 * access a poisoned page, kvm_gmem_get_pfn() will return -EHWPOISON,
+	 * at which point KVM can either terminate the VM or propagate the
+	 * error to userspace.
+	 */
+
+	__guestmem_invalidate_end(mapping, start, end);
+
+out:
+	filemap_invalidate_unlock_shared(mapping);
+	return ret ? MF_DELAYED : MF_FAILED;
+}
+
+static int guestmem_migrate_folio(struct address_space *mapping,
+				  struct folio *dst, struct folio *src,
+				  enum migrate_mode mode)
+{
+	WARN_ON_ONCE(1);
+	return -EINVAL;
+}
+
+static const struct address_space_operations guestmem_aops = {
+	.dirty_folio = noop_dirty_folio,
+	.free_folio = guestmem_free_folio,
+	.error_remove_folio = guestmem_error_folio,
+	.migrate_folio = guestmem_migrate_folio,
+};
+
+int guestmem_attach_mapping(struct address_space *mapping,
+			    const struct guestmem_ops *const ops,
+			    struct list_head *data)
+{
+	struct guestmem *gmem;
+
+	if (mapping->a_ops == &guestmem_aops) {
+		gmem = mapping->i_private_data;
+		if (gmem->ops != ops)
+			return -EINVAL;
+
+		goto add;
+	}
+
+	gmem = kzalloc(sizeof(*gmem), GFP_KERNEL);
+	if (!gmem)
+		return -ENOMEM;
+
+	gmem->ops = ops;
+
+	mapping->a_ops = &guestmem_aops;
+	mapping->i_private_data = gmem;
+
+	mapping_set_gfp_mask(mapping, GFP_HIGHUSER);
+	mapping_set_inaccessible(mapping);
+	/* Unmovable mappings are supposed to be marked unevictable as well. */
+	WARN_ON_ONCE(!mapping_unevictable(mapping));
+
+add:
+	list_add(data, &mapping->i_private_list);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(guestmem_attach_mapping);
+
+void guestmem_detach_mapping(struct address_space *mapping,
+			     struct list_head *data)
+{
+	list_del(data);
+
+	if (list_empty(&mapping->i_private_list)) {
+		kfree(mapping->i_private_data);
+		mapping->i_private_data = NULL;
+		mapping->a_ops = &empty_aops;
+	}
+}
+EXPORT_SYMBOL_GPL(guestmem_detach_mapping);
+
+struct folio *guestmem_grab_folio(struct address_space *mapping, pgoff_t index)
+{
+	/* TODO: Support huge pages. */
+	return filemap_grab_folio(mapping, index);
+}
+EXPORT_SYMBOL_GPL(guestmem_grab_folio);
+
+int guestmem_punch_hole(struct address_space *mapping, loff_t offset,
+			loff_t len)
+{
+	pgoff_t start = offset >> PAGE_SHIFT;
+	pgoff_t end = (offset + len) >> PAGE_SHIFT;
+	int ret;
+
+	filemap_invalidate_lock(mapping);
+	ret = __guestmem_invalidate_begin(mapping, start, end);
+	if (ret)
+		goto out;
+
+	truncate_inode_pages_range(mapping, offset, offset + len - 1);
+
+	__guestmem_invalidate_end(mapping, start, end);
+
+out:
+	filemap_invalidate_unlock(mapping);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(guestmem_punch_hole);
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index fd6a3010afa833e077623065b80bdbb5b1012250..1339098795d2e859b2ee0ef419b29045aedc8487 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -106,6 +106,7 @@ config KVM_GENERIC_MEMORY_ATTRIBUTES
 
 config KVM_PRIVATE_MEM
        select XARRAY_MULTI
+       select GUESTMEM
        bool
 
 config KVM_GENERIC_PRIVATE_MEM
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 24dcbad0cb76e353509cf4718837a1999f093414..edf57d5662cb8634bbd9ca3118b293c4f7ca229a 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/backing-dev.h>
 #include <linux/falloc.h>
+#include <linux/guestmem.h>
 #include <linux/kvm_host.h>
 #include <linux/pagemap.h>
 #include <linux/anon_inodes.h>
@@ -98,8 +99,7 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
  */
 static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
 {
-	/* TODO: Support huge pages. */
-	return filemap_grab_folio(inode->i_mapping, index);
+	return guestmem_grab_folio(inode->i_mapping, index);
 }
 
 static void kvm_gmem_invalidate_begin(struct kvm_gmem *gmem, pgoff_t start,
@@ -151,28 +151,7 @@ static void kvm_gmem_invalidate_end(struct kvm_gmem *gmem, pgoff_t start,
 
 static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
 {
-	struct list_head *gmem_list = &inode->i_mapping->i_private_list;
-	pgoff_t start = offset >> PAGE_SHIFT;
-	pgoff_t end = (offset + len) >> PAGE_SHIFT;
-	struct kvm_gmem *gmem;
-
-	/*
-	 * Bindings must be stable across invalidation to ensure the start+end
-	 * are balanced.
-	 */
-	filemap_invalidate_lock(inode->i_mapping);
-
-	list_for_each_entry(gmem, gmem_list, entry)
-		kvm_gmem_invalidate_begin(gmem, start, end);
-
-	truncate_inode_pages_range(inode->i_mapping, offset, offset + len - 1);
-
-	list_for_each_entry(gmem, gmem_list, entry)
-		kvm_gmem_invalidate_end(gmem, start, end);
-
-	filemap_invalidate_unlock(inode->i_mapping);
-
-	return 0;
+	return guestmem_punch_hole(inode->i_mapping, offset, len);
 }
 
 static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
@@ -277,7 +256,7 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
 	kvm_gmem_invalidate_begin(gmem, 0, -1ul);
 	kvm_gmem_invalidate_end(gmem, 0, -1ul);
 
-	list_del(&gmem->entry);
+	guestmem_detach_mapping(inode->i_mapping, &gmem->entry);
 
 	filemap_invalidate_unlock(inode->i_mapping);
 
@@ -318,63 +297,42 @@ void kvm_gmem_init(struct module *module)
 	kvm_gmem_fops.owner = module;
 }
 
-static int kvm_gmem_migrate_folio(struct address_space *mapping,
-				  struct folio *dst, struct folio *src,
-				  enum migrate_mode mode)
+static int kvm_guestmem_invalidate_begin(struct list_head *entry, pgoff_t start,
+					 pgoff_t end)
 {
-	WARN_ON_ONCE(1);
-	return -EINVAL;
-}
+	struct kvm_gmem *gmem = container_of(entry, struct kvm_gmem, entry);
 
-static int kvm_gmem_error_folio(struct address_space *mapping, struct folio *folio)
-{
-	struct list_head *gmem_list = &mapping->i_private_list;
-	struct kvm_gmem *gmem;
-	pgoff_t start, end;
-
-	filemap_invalidate_lock_shared(mapping);
-
-	start = folio->index;
-	end = start + folio_nr_pages(folio);
-
-	list_for_each_entry(gmem, gmem_list, entry)
-		kvm_gmem_invalidate_begin(gmem, start, end);
-
-	/*
-	 * Do not truncate the range, what action is taken in response to the
-	 * error is userspace's decision (assuming the architecture supports
-	 * gracefully handling memory errors).  If/when the guest attempts to
-	 * access a poisoned page, kvm_gmem_get_pfn() will return -EHWPOISON,
-	 * at which point KVM can either terminate the VM or propagate the
-	 * error to userspace.
-	 */
+	kvm_gmem_invalidate_begin(gmem, start, end);
 
-	list_for_each_entry(gmem, gmem_list, entry)
-		kvm_gmem_invalidate_end(gmem, start, end);
+	return 0;
+}
 
-	filemap_invalidate_unlock_shared(mapping);
+static void kvm_guestmem_invalidate_end(struct list_head *entry, pgoff_t start,
+					pgoff_t end)
+{
+	struct kvm_gmem *gmem = container_of(entry, struct kvm_gmem, entry);
 
-	return MF_DELAYED;
+	kvm_gmem_invalidate_end(gmem, start, end);
 }
 
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
-static void kvm_gmem_free_folio(struct address_space *mapping,
-				struct folio *folio)
+static bool kvm_gmem_release_folio(struct list_head *entry, struct folio *folio)
 {
 	struct page *page = folio_page(folio, 0);
 	kvm_pfn_t pfn = page_to_pfn(page);
 	int order = folio_order(folio);
 
 	kvm_arch_gmem_invalidate(pfn, pfn + (1ul << order));
+
+	return true;
 }
 #endif
 
-static const struct address_space_operations kvm_gmem_aops = {
-	.dirty_folio = noop_dirty_folio,
-	.migrate_folio	= kvm_gmem_migrate_folio,
-	.error_remove_folio = kvm_gmem_error_folio,
+static const struct guestmem_ops kvm_guestmem_ops = {
+	.invalidate_begin = kvm_guestmem_invalidate_begin,
+	.invalidate_end = kvm_guestmem_invalidate_end,
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
-	.free_folio = kvm_gmem_free_folio,
+	.release_folio = kvm_gmem_release_folio,
 #endif
 };
 
@@ -430,22 +388,22 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
 
 	inode->i_private = (void *)(unsigned long)flags;
 	inode->i_op = &kvm_gmem_iops;
-	inode->i_mapping->a_ops = &kvm_gmem_aops;
 	inode->i_mode |= S_IFREG;
 	inode->i_size = size;
-	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
-	mapping_set_inaccessible(inode->i_mapping);
-	/* Unmovable mappings are supposed to be marked unevictable as well. */
-	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
+	err = guestmem_attach_mapping(inode->i_mapping, &kvm_guestmem_ops,
+				      &gmem->entry);
+	if (err)
+		goto err_putfile;
 
 	kvm_get_kvm(kvm);
 	gmem->kvm = kvm;
 	xa_init(&gmem->bindings);
-	list_add(&gmem->entry, &inode->i_mapping->i_private_list);
 
 	fd_install(fd, file);
 	return fd;
 
+err_putfile:
+	fput(file);
 err_gmem:
 	kfree(gmem);
 err_fd:

-- 
2.34.1


