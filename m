Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C44F260D030
	for <lists+linux-doc@lfdr.de>; Tue, 25 Oct 2022 17:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232597AbiJYPTJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 25 Oct 2022 11:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbiJYPSt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Oct 2022 11:18:49 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F4D18D45F;
        Tue, 25 Oct 2022 08:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666711116; x=1698247116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PWzabYw82KjsHY+Wdd8kK1yaEP2EV57gElCnFtm53oE=;
  b=VO0HXsijG5sU4kOUhQiCBpSWuNVWatpMAA5pvvaNxLQjpwckQjZtaOWP
   ThD0UTbNNc9RE26n8w5cYKPUDUd7E5yXrsvVpmFjavFZMalth6G7Dm1Yj
   5rElXbVa7MtT9fQJZHY3oPsw0hGUmTBetbiV/1BuLcFk1T2FETWmHgzvk
   pCyJu5tdT8vk1rYU1kAubaSElPanjsp01k4VdqVsgCW5KcmQXLBt1A9hR
   nGqnDY938eo1qfBigz4XPdJ3FvFqDp+wyQtT9bsyyqQlDD5I0oNuHqWrB
   1BhfYDY1wdHNNM1oeXkam+lEMK6IyqbjnMVFA04PEV9c3dI0yR76xuGqx
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="334307198"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; 
   d="scan'208";a="334307198"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2022 08:18:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="736865490"
X-IronPort-AV: E=Sophos;i="5.95,212,1661842800"; 
   d="scan'208";a="736865490"
Received: from chaop.bj.intel.com ([10.240.193.75])
  by fmsmga002.fm.intel.com with ESMTP; 25 Oct 2022 08:18:25 -0700
From:   Chao Peng <chao.p.peng@linux.intel.com>
To:     kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, qemu-devel@nongnu.org
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        Hugh Dickins <hughd@google.com>,
        Jeff Layton <jlayton@kernel.org>,
        "J . Bruce Fields" <bfields@fieldses.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Steven Price <steven.price@arm.com>,
        "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
        Vlastimil Babka <vbabka@suse.cz>,
        Vishal Annapurve <vannapurve@google.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
        ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
        ddutile@redhat.com, dhildenb@redhat.com,
        Quentin Perret <qperret@google.com>, tabba@google.com,
        Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
        Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: [PATCH v9 1/8] mm: Introduce memfd_restricted system call to create restricted user memory
Date:   Tue, 25 Oct 2022 23:13:37 +0800
Message-Id: <20221025151344.3784230-2-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Introduce 'memfd_restricted' system call with the ability to create
memory areas that are restricted from userspace access through ordinary
MMU operations (e.g. read/write/mmap). The memory content is expected to
be used through a new in-kernel interface by a third kernel module.

memfd_restricted() is useful for scenarios where a file descriptor(fd)
can be used as an interface into mm but want to restrict userspace's
ability on the fd. Initially it is designed to provide protections for
KVM encrypted guest memory.

Normally KVM uses memfd memory via mmapping the memfd into KVM userspace
(e.g. QEMU) and then using the mmaped virtual address to setup the
mapping in the KVM secondary page table (e.g. EPT). With confidential
computing technologies like Intel TDX, the memfd memory may be encrypted
with special key for special software domain (e.g. KVM guest) and is not
expected to be directly accessed by userspace. Precisely, userspace
access to such encrypted memory may lead to host crash so should be
prevented.

memfd_restricted() provides semantics required for KVM guest encrypted
memory support that a fd created with memfd_restricted() is going to be
used as the source of guest memory in confidential computing environment
and KVM can directly interact with core-mm without the need to expose
the memoy content into KVM userspace.

KVM userspace is still in charge of the lifecycle of the fd. It should
pass the created fd to KVM. KVM uses the new restrictedmem_get_page() to
obtain the physical memory page and then uses it to populate the KVM
secondary page table entries.

The userspace restricted memfd can be fallocate-ed or hole-punched
from userspace. When these operations happen, KVM can get notified
through restrictedmem_notifier, it then gets chance to remove any
mapped entries of the range in the secondary page tables.

memfd_restricted() itself is implemented as a shim layer on top of real
memory file systems (currently tmpfs). Pages in restrictedmem are marked
as unmovable and unevictable, this is required for current confidential
usage. But in future this might be changed.

By default memfd_restricted() prevents userspace read, write and mmap.
By defining new bit in the 'flags', it can be extended to support other
restricted semantics in the future.

The system call is currently wired up for x86 arch.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 arch/x86/entry/syscalls/syscall_32.tbl |   1 +
 arch/x86/entry/syscalls/syscall_64.tbl |   1 +
 include/linux/restrictedmem.h          |  62 ++++++
 include/linux/syscalls.h               |   1 +
 include/uapi/asm-generic/unistd.h      |   5 +-
 include/uapi/linux/magic.h             |   1 +
 kernel/sys_ni.c                        |   3 +
 mm/Kconfig                             |   4 +
 mm/Makefile                            |   1 +
 mm/restrictedmem.c                     | 250 +++++++++++++++++++++++++
 10 files changed, 328 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/restrictedmem.h
 create mode 100644 mm/restrictedmem.c

diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/syscalls/syscall_32.tbl
index 320480a8db4f..dc70ba90247e 100644
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@ -455,3 +455,4 @@
 448	i386	process_mrelease	sys_process_mrelease
 449	i386	futex_waitv		sys_futex_waitv
 450	i386	set_mempolicy_home_node		sys_set_mempolicy_home_node
+451	i386	memfd_restricted	sys_memfd_restricted
diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
index c84d12608cd2..06516abc8318 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -372,6 +372,7 @@
 448	common	process_mrelease	sys_process_mrelease
 449	common	futex_waitv		sys_futex_waitv
 450	common	set_mempolicy_home_node	sys_set_mempolicy_home_node
+451	common	memfd_restricted	sys_memfd_restricted
 
 #
 # Due to a historical design error, certain syscalls are numbered differently
diff --git a/include/linux/restrictedmem.h b/include/linux/restrictedmem.h
new file mode 100644
index 000000000000..9c37c3ea3180
--- /dev/null
+++ b/include/linux/restrictedmem.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _LINUX_RESTRICTEDMEM_H
+
+#include <linux/file.h>
+#include <linux/magic.h>
+#include <linux/pfn_t.h>
+
+struct restrictedmem_notifier;
+
+struct restrictedmem_notifier_ops {
+	void (*invalidate_start)(struct restrictedmem_notifier *notifier,
+				 pgoff_t start, pgoff_t end);
+	void (*invalidate_end)(struct restrictedmem_notifier *notifier,
+			       pgoff_t start, pgoff_t end);
+};
+
+struct restrictedmem_notifier {
+	struct list_head list;
+	const struct restrictedmem_notifier_ops *ops;
+};
+
+#ifdef CONFIG_RESTRICTEDMEM
+
+void restrictedmem_register_notifier(struct file *file,
+				     struct restrictedmem_notifier *notifier);
+void restrictedmem_unregister_notifier(struct file *file,
+				       struct restrictedmem_notifier *notifier);
+
+int restrictedmem_get_page(struct file *file, pgoff_t offset,
+			   struct page **pagep, int *order);
+
+static inline bool file_is_restrictedmem(struct file *file)
+{
+	return file->f_inode->i_sb->s_magic == RESTRICTEDMEM_MAGIC;
+}
+
+#else
+
+static inline void restrictedmem_register_notifier(struct file *file,
+				     struct restrictedmem_notifier *notifier)
+{
+}
+
+static inline void restrictedmem_unregister_notifier(struct file *file,
+				       struct restrictedmem_notifier *notifier)
+{
+}
+
+static inline int restrictedmem_get_page(struct file *file, pgoff_t offset,
+					 struct page **pagep, int *order)
+{
+	return -1;
+}
+
+static inline bool file_is_restrictedmem(struct file *file)
+{
+	return false;
+}
+
+#endif /* CONFIG_RESTRICTEDMEM */
+
+#endif /* _LINUX_RESTRICTEDMEM_H */
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index a34b0f9a9972..f9e9e0c820c5 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -1056,6 +1056,7 @@ asmlinkage long sys_memfd_secret(unsigned int flags);
 asmlinkage long sys_set_mempolicy_home_node(unsigned long start, unsigned long len,
 					    unsigned long home_node,
 					    unsigned long flags);
+asmlinkage long sys_memfd_restricted(unsigned int flags);
 
 /*
  * Architecture-specific system calls
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index 45fa180cc56a..e93cd35e46d0 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -886,8 +886,11 @@ __SYSCALL(__NR_futex_waitv, sys_futex_waitv)
 #define __NR_set_mempolicy_home_node 450
 __SYSCALL(__NR_set_mempolicy_home_node, sys_set_mempolicy_home_node)
 
+#define __NR_memfd_restricted 451
+__SYSCALL(__NR_memfd_restricted, sys_memfd_restricted)
+
 #undef __NR_syscalls
-#define __NR_syscalls 451
+#define __NR_syscalls 452
 
 /*
  * 32 bit systems traditionally used different
diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
index 6325d1d0e90f..8aa38324b90a 100644
--- a/include/uapi/linux/magic.h
+++ b/include/uapi/linux/magic.h
@@ -101,5 +101,6 @@
 #define DMA_BUF_MAGIC		0x444d4142	/* "DMAB" */
 #define DEVMEM_MAGIC		0x454d444d	/* "DMEM" */
 #define SECRETMEM_MAGIC		0x5345434d	/* "SECM" */
+#define RESTRICTEDMEM_MAGIC	0x5245534d	/* "RESM" */
 
 #endif /* __LINUX_MAGIC_H__ */
diff --git a/kernel/sys_ni.c b/kernel/sys_ni.c
index 860b2dcf3ac4..7c4a32cbd2e7 100644
--- a/kernel/sys_ni.c
+++ b/kernel/sys_ni.c
@@ -360,6 +360,9 @@ COND_SYSCALL(pkey_free);
 /* memfd_secret */
 COND_SYSCALL(memfd_secret);
 
+/* memfd_restricted */
+COND_SYSCALL(memfd_restricted);
+
 /*
  * Architecture specific weak syscall entries.
  */
diff --git a/mm/Kconfig b/mm/Kconfig
index 0331f1461f81..0177d53676c7 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1076,6 +1076,10 @@ config IO_MAPPING
 config SECRETMEM
 	def_bool ARCH_HAS_SET_DIRECT_MAP && !EMBEDDED
 
+config RESTRICTEDMEM
+	bool
+	depends on TMPFS
+
 config ANON_VMA_NAME
 	bool "Anonymous VMA name support"
 	depends on PROC_FS && ADVISE_SYSCALLS && MMU
diff --git a/mm/Makefile b/mm/Makefile
index 9a564f836403..6cb6403ffd40 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -117,6 +117,7 @@ obj-$(CONFIG_PAGE_EXTENSION) += page_ext.o
 obj-$(CONFIG_PAGE_TABLE_CHECK) += page_table_check.o
 obj-$(CONFIG_CMA_DEBUGFS) += cma_debug.o
 obj-$(CONFIG_SECRETMEM) += secretmem.o
+obj-$(CONFIG_RESTRICTEDMEM) += restrictedmem.o
 obj-$(CONFIG_CMA_SYSFS) += cma_sysfs.o
 obj-$(CONFIG_USERFAULTFD) += userfaultfd.o
 obj-$(CONFIG_IDLE_PAGE_TRACKING) += page_idle.o
diff --git a/mm/restrictedmem.c b/mm/restrictedmem.c
new file mode 100644
index 000000000000..e5bf8907e0f8
--- /dev/null
+++ b/mm/restrictedmem.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "linux/sbitmap.h"
+#include <linux/pagemap.h>
+#include <linux/pseudo_fs.h>
+#include <linux/shmem_fs.h>
+#include <linux/syscalls.h>
+#include <uapi/linux/falloc.h>
+#include <uapi/linux/magic.h>
+#include <linux/restrictedmem.h>
+
+struct restrictedmem_data {
+	struct mutex lock;
+	struct file *memfd;
+	struct list_head notifiers;
+};
+
+static void restrictedmem_notifier_invalidate(struct restrictedmem_data *data,
+				 pgoff_t start, pgoff_t end, bool notify_start)
+{
+	struct restrictedmem_notifier *notifier;
+
+	mutex_lock(&data->lock);
+	list_for_each_entry(notifier, &data->notifiers, list) {
+		if (notify_start)
+			notifier->ops->invalidate_start(notifier, start, end);
+		else
+			notifier->ops->invalidate_end(notifier, start, end);
+	}
+	mutex_unlock(&data->lock);
+}
+
+static int restrictedmem_release(struct inode *inode, struct file *file)
+{
+	struct restrictedmem_data *data = inode->i_mapping->private_data;
+
+	fput(data->memfd);
+	kfree(data);
+	return 0;
+}
+
+static long restrictedmem_fallocate(struct file *file, int mode,
+				    loff_t offset, loff_t len)
+{
+	struct restrictedmem_data *data = file->f_mapping->private_data;
+	struct file *memfd = data->memfd;
+	int ret;
+
+	if (mode & FALLOC_FL_PUNCH_HOLE) {
+		if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
+			return -EINVAL;
+	}
+
+	restrictedmem_notifier_invalidate(data, offset, offset + len, true);
+	ret = memfd->f_op->fallocate(memfd, mode, offset, len);
+	restrictedmem_notifier_invalidate(data, offset, offset + len, false);
+	return ret;
+}
+
+static const struct file_operations restrictedmem_fops = {
+	.release = restrictedmem_release,
+	.fallocate = restrictedmem_fallocate,
+};
+
+static int restrictedmem_getattr(struct user_namespace *mnt_userns,
+				 const struct path *path, struct kstat *stat,
+				 u32 request_mask, unsigned int query_flags)
+{
+	struct inode *inode = d_inode(path->dentry);
+	struct restrictedmem_data *data = inode->i_mapping->private_data;
+	struct file *memfd = data->memfd;
+
+	return memfd->f_inode->i_op->getattr(mnt_userns, path, stat,
+					     request_mask, query_flags);
+}
+
+static int restrictedmem_setattr(struct user_namespace *mnt_userns,
+				 struct dentry *dentry, struct iattr *attr)
+{
+	struct inode *inode = d_inode(dentry);
+	struct restrictedmem_data *data = inode->i_mapping->private_data;
+	struct file *memfd = data->memfd;
+	int ret;
+
+	if (attr->ia_valid & ATTR_SIZE) {
+		if (memfd->f_inode->i_size)
+			return -EPERM;
+
+		if (!PAGE_ALIGNED(attr->ia_size))
+			return -EINVAL;
+	}
+
+	ret = memfd->f_inode->i_op->setattr(mnt_userns,
+					    file_dentry(memfd), attr);
+	return ret;
+}
+
+static const struct inode_operations restrictedmem_iops = {
+	.getattr = restrictedmem_getattr,
+	.setattr = restrictedmem_setattr,
+};
+
+static int restrictedmem_init_fs_context(struct fs_context *fc)
+{
+	if (!init_pseudo(fc, RESTRICTEDMEM_MAGIC))
+		return -ENOMEM;
+
+	fc->s_iflags |= SB_I_NOEXEC;
+	return 0;
+}
+
+static struct file_system_type restrictedmem_fs = {
+	.owner		= THIS_MODULE,
+	.name		= "memfd:restrictedmem",
+	.init_fs_context = restrictedmem_init_fs_context,
+	.kill_sb	= kill_anon_super,
+};
+
+static struct vfsmount *restrictedmem_mnt;
+
+static __init int restrictedmem_init(void)
+{
+	restrictedmem_mnt = kern_mount(&restrictedmem_fs);
+	if (IS_ERR(restrictedmem_mnt))
+		return PTR_ERR(restrictedmem_mnt);
+	return 0;
+}
+fs_initcall(restrictedmem_init);
+
+static struct file *restrictedmem_file_create(struct file *memfd)
+{
+	struct restrictedmem_data *data;
+	struct address_space *mapping;
+	struct inode *inode;
+	struct file *file;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return ERR_PTR(-ENOMEM);
+
+	data->memfd = memfd;
+	mutex_init(&data->lock);
+	INIT_LIST_HEAD(&data->notifiers);
+
+	inode = alloc_anon_inode(restrictedmem_mnt->mnt_sb);
+	if (IS_ERR(inode)) {
+		kfree(data);
+		return ERR_CAST(inode);
+	}
+
+	inode->i_mode |= S_IFREG;
+	inode->i_op = &restrictedmem_iops;
+	inode->i_mapping->private_data = data;
+
+	file = alloc_file_pseudo(inode, restrictedmem_mnt,
+				 "restrictedmem", O_RDWR,
+				 &restrictedmem_fops);
+	if (IS_ERR(file)) {
+		iput(inode);
+		kfree(data);
+		return ERR_CAST(file);
+	}
+
+	file->f_flags |= O_LARGEFILE;
+
+	mapping = memfd->f_mapping;
+	mapping_set_unevictable(mapping);
+	mapping_set_gfp_mask(mapping,
+			     mapping_gfp_mask(mapping) & ~__GFP_MOVABLE);
+
+	return file;
+}
+
+SYSCALL_DEFINE1(memfd_restricted, unsigned int, flags)
+{
+	struct file *file, *restricted_file;
+	int fd, err;
+
+	if (flags)
+		return -EINVAL;
+
+	fd = get_unused_fd_flags(0);
+	if (fd < 0)
+		return fd;
+
+	file = shmem_file_setup("memfd:restrictedmem", 0, VM_NORESERVE);
+	if (IS_ERR(file)) {
+		err = PTR_ERR(file);
+		goto err_fd;
+	}
+	file->f_mode |= FMODE_LSEEK | FMODE_PREAD | FMODE_PWRITE;
+	file->f_flags |= O_LARGEFILE;
+
+	restricted_file = restrictedmem_file_create(file);
+	if (IS_ERR(restricted_file)) {
+		err = PTR_ERR(restricted_file);
+		fput(file);
+		goto err_fd;
+	}
+
+	fd_install(fd, restricted_file);
+	return fd;
+err_fd:
+	put_unused_fd(fd);
+	return err;
+}
+
+void restrictedmem_register_notifier(struct file *file,
+				     struct restrictedmem_notifier *notifier)
+{
+	struct restrictedmem_data *data = file->f_mapping->private_data;
+
+	mutex_lock(&data->lock);
+	list_add(&notifier->list, &data->notifiers);
+	mutex_unlock(&data->lock);
+}
+EXPORT_SYMBOL_GPL(restrictedmem_register_notifier);
+
+void restrictedmem_unregister_notifier(struct file *file,
+				       struct restrictedmem_notifier *notifier)
+{
+	struct restrictedmem_data *data = file->f_mapping->private_data;
+
+	mutex_lock(&data->lock);
+	list_del(&notifier->list);
+	mutex_unlock(&data->lock);
+}
+EXPORT_SYMBOL_GPL(restrictedmem_unregister_notifier);
+
+int restrictedmem_get_page(struct file *file, pgoff_t offset,
+			   struct page **pagep, int *order)
+{
+	struct restrictedmem_data *data = file->f_mapping->private_data;
+	struct file *memfd = data->memfd;
+	struct page *page;
+	int ret;
+
+	ret = shmem_getpage(file_inode(memfd), offset, &page, SGP_WRITE);
+	if (ret)
+		return ret;
+
+	*pagep = page;
+	if (order)
+		*order = thp_order(compound_head(page));
+
+	SetPageUptodate(page);
+	unlock_page(page);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(restrictedmem_get_page);
-- 
2.25.1

