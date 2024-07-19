Return-Path: <linux-doc+bounces-21035-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFE1937580
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jul 2024 11:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 438071C20BE7
	for <lists+linux-doc@lfdr.de>; Fri, 19 Jul 2024 09:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35BF3236;
	Fri, 19 Jul 2024 09:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="W4kigf+1"
X-Original-To: linux-doc@vger.kernel.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3798657CBC
	for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 09:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721380025; cv=none; b=SPPBpslRIUqcH+J4VBFKhE+PkC8DXGEwVsz8eDqJ5/g3MP9rZq+rJ+9SlX9rD91Pw4SxHS5l3eaNLG6fNV0poGqv1TkMgIwar8ax78wI86ZQYTM4Fb/tVI5XRKGvFVYbs13Yzb0LIVAlLRk/Bg6I/YPYVcKKRuKX4LySyxxRNAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721380025; c=relaxed/simple;
	bh=ToRWqfs0O5QgOCyCuB9Y1MQzfjwUaAmBcZ9LF3vdgXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IzkeiDug5ziULN51bL5u3oVwCAjz5T580H0MRsbKBGqUcmz6Usw6RJwfnJo6eADVccpaAhGfDZNreMyV/tNRCWFWpDu4uSDE68SAb7erLAQczmE3vQq6Tc4Oauk7Hr4yvZ/nbv5ZDxY6qdVN14eJ7qRfK+rcRlv0tWWJ5oIEggY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=W4kigf+1; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=GhZQKUvweYqZGanauNSoF59A0TnHp5xSiJGnUnKdOZQ=;
	b=W4kigf+1ZI68Kk7Up/RMUWZEwbAbG7bKkxTuAvD5ZRWdLHE39v6widuLeCrM0t
	hc2u8rPn4kb1hlg0yOi+LH3rEDdkqfyuojRIjJ/CmCFVlfsxF+wYkgwKcGCjoZl3
	j38DbjXOimzhs+nN4smtfdoYf+aCG9tsR5LH08oJRmpvg=
Received: from localhost.localdomain (unknown [39.156.73.13])
	by gzga-smtp-mta-g1-2 (Coremail) with SMTP id _____wD3__v2IZpm4Ih5AQ--.25148S2;
	Fri, 19 Jul 2024 16:21:13 +0800 (CST)
From: cuiyudong123@126.com
To: siyanteng@loongson.cn,
	corbet@lwn.net
Cc: alexs@kernel.org,
	dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	Yudong Cui <cuiyudong@kylinos.cn>
Subject: [PATCH v4]   docs/zh_CN: Add userspace-api/mseal Chinese translation
Date: Fri, 19 Jul 2024 16:20:41 +0800
Message-ID: <20240719082048.1619-1-cuiyudong123@126.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3__v2IZpm4Ih5AQ--.25148S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3AF47Kr17Jr17uF4rur4xXrb_yoW3CFy3pa
	4qkryfWF4rJry7Ar1I9r10gF4UGF18Xay3Aryxt3WYvry5AFy0vr4YkFWfW3s7Wr48Ca15
	Xa1FkF45C34xKrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UGzuAUUUUU=
X-CM-SenderInfo: 5fxl535grqwiist6ij2wof0z/1tbi2wkXtmVLawpH6gABsQ

From: Yudong Cui <cuiyudong@kylinos.cn>

  Translate the following documents into Chinese:

  - userspace-api/mseal.rst

  commit c010d0990082("mseal: add documentation")

---
V1 -> V2: Resolved compilation warnings and optimized the translation of documentation
V2 -> V3: Fix code formatting errors
V3 -> V4: Revise the code according to the suggestion
---

Signed-off-by: Yudong Cui <cuiyudong@kylinos.cn>
---
 .../zh_CN/userspace-api/index.rst             |   1 +
 .../zh_CN/userspace-api/mseal.rst             | 185 ++++++++++++++++++
 2 files changed, 186 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/userspace-api/mseal.rst

diff --git a/Documentation/translations/zh_CN/userspace-api/index.rst b/Documentation/translations/zh_CN/userspace-api/index.rst
index 5b14721c8264..b7da307ec6bb 100644
--- a/Documentation/translations/zh_CN/userspace-api/index.rst
+++ b/Documentation/translations/zh_CN/userspace-api/index.rst
@@ -27,6 +27,7 @@ Linux 内核用户空间API指南
    ebpf/index
    sysfs-platform_profile
    futex2
+   mseal
 
 TODOList:
 
diff --git a/Documentation/translations/zh_CN/userspace-api/mseal.rst b/Documentation/translations/zh_CN/userspace-api/mseal.rst
new file mode 100644
index 000000000000..d4eece7bfc6a
--- /dev/null
+++ b/Documentation/translations/zh_CN/userspace-api/mseal.rst
@@ -0,0 +1,185 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/userspace-api/mseal.rst
+
+:翻译:
+
+ 崔玉栋 cuiyudong <cuiyudong@kylinos.cn>
+
+==========
+mseal 简介
+==========
+
+:作者: Jeff Xu <jeffxu@chromium.org>
+
+现代处理器支持诸如RW和NX位的内存权限。这个内存权限特性提高了内存破坏漏洞
+(memory corruption bug) 的安全性。为了防止攻击者写入任意内存并进行执行，
+内存必须用X位标记，否则会发生异常。
+
+内存封装还额外保护了映射本身不被修改。这对于缓解内存损坏问题很有用，就像
+是一个损坏的指针被传递给内存管理系统这种问题。例如，这样的原始攻击者可以
+破坏控制流完整性保证，因为应该被信任的只读内存可能变得可写，或者 .text
+页面可能会被重新映射。运行时加载程序可以自动应用内存密封来密封.text和
+.rodata页面，并且应用程序可以在运行时额外密封安全关键数据。
+
+XNU内核中已经存在类似的特性
+VM_FLAGS_PERMANENT 标志 [1] 和 OpenBSD 上的可变系统调用 [2]。
+
+用户 API
+========
+mseal()
+-------
+The mseal() 系统调用具有以下签名:
+
+``int mseal(void addr, size_t len, unsigned long flags)``
+
+**addr/len**: 虚拟内存地址范围。
+
+由 ``addr``/``len`` 设置的地址范围必须满足:
+   - 起始地址必须在已分配的VMA中。
+   - 起始地址必须与页面对齐。
+   - 结束地址 (``addr`` + ``len``) 必须在已分配的VMA中。
+   - 起始地址和结束地址之间没有间隙 (未分配的内存) 。
+
+这个 ``len`` 将由内核隐式地进行分页对齐。
+
+**flags**: 保留供将来使用。
+
+**返回值**:
+
+- ``0``: 成功。
+
+- ``-EINVAL``:
+    - 无效的输入 ``flags``。
+    - 起始地址 (``addr``) 未对齐页。
+    - 地址范围 (``addr`` + ``len``) 溢出。
+
+- ``-ENOMEM``:
+    - 起始地址 (``addr``) 未分配。
+    - 结束地址 (``addr`` + ``len``) 未分配。
+    - 一个间隙 (unallocated memory) 起始地址和结束地址之间。
+
+- ``-EPERM``:
+    - 内存密封仅在64位CPU上支持，32位不受支持。
+
+- 对于上述错误情况，用户可以假设给定的内存范围为未修改，即没有部分更新。
+
+- 可能还有其他未在此处列出的内部错误/情况，例如，在合并/拆分VMA
+  （虚拟内存区域）时发生错误，或者进程达到了支持的最大VMA数量。
+  在这些情况下，给定内存范围可能会发生部分更新。然而，这些情况应该很罕见。
+
+**内存密封后的阻塞操作**:
+    通过 munmap() 和 mremap() 取消映射、移动到另一个位置以及缩小大小可以
+    留下一个空白的空间，因此可以用具有一组新属性的VMA替换它。
+
+    通过mremap()，将不同的VMA移动或扩展到当前位置。
+
+    通过mmap(MAP_FIXED)修改VMA。
+
+    通过 mremap() 进行的大小扩展似乎不会对已密封的 VMA（虚拟内存区域）
+    造成任何特定的风险。尽管如此，由于使用场景不明确，这一点还是被包括了进来。
+    无论如何，用户都可以依赖合并操作来扩展已密封的 VMA。
+
+    mprotect() 和 pkey_mprotect()。
+
+    当用户没有内存的写入权限时，匿名内存会出现一些破坏性的 madvice()
+    行为（例如 MADV_DONTNEED）。这些行为可以通过丢弃页面来更改区域内
+    容，这实际上是匿名内存的 memset(0)。
+
+    对于阻塞的操作，内核将返回 -EPERM 。
+
+    对于阻塞操作，可以期望给定的地址不会被修改，
+    即不会发生部分更新。请注意，这与现有的内存管理系统调用行为不同，
+    后者在发现错误并返回给用户空间之前会进行部分更新。举个例子来说：
+
+    假设代码顺序如下:
+
+    - ptr = mmap(null, 8192, PROT_NONE);
+    - munmap(ptr + 4096, 4096);
+    - ret1 = mprotect(ptr, 8192, PROT_READ);
+    - mseal(ptr, 4096);
+    - ret2 = mprotect(ptr, 8192, PROT_NONE);
+
+    ret1 将变成 -ENOMEM, ptr指向的页更新为PROT_READ。
+
+    ret2 将变成 -EPERM, 这个页面仍然是 PROT_READ。
+
+**注意**:
+
+- mseal() 仅适用于64位CPU，不支持32位CPU。
+
+- 用户可以多次调用 mseal() , 对已经密封的内存执行 mseal() 是一个无操作（不报错）。
+
+- 不支持munseal() 。
+
+用例:
+=====
+- glibc:
+  在加载 ELF 可执行文件时，动态链接器可以对非可写内存段应用密封操作。
+
+- Chrome 浏览器: 保护部分对安全敏感的数据结构。
+
+关于哪些内存应该被密封的注意事项:
+=================================
+
+重要的是要注意，密封会改变映射的生命周期，即已密封的映射在进程终止
+或执行 exec 系统调用之前不会被取消映射。应用程序可以从用户空间对任何虚拟
+内存区域应用密封，但在应用密封之前，至关重要的是彻底分析映射的生命周期。
+
+例如:
+
+- aio/shm
+
+  aio/shm 可以代表用户空间调用 mmap()/munmap() , 例如 ksys_shmdt() 在 shm.c 中。
+  这些映射的生命周期并不与进程的生命周期绑定。如果这些内存区域从用户空间被密封，
+  那么 munmap() 将失败，导致在进程的生命周期内 VMA（虚拟内存区域）地址空间中
+  出现泄漏。
+
+- Brk (heap)
+
+  目前，用户空间的应用程序可以通过调用 malloc() 和 mseal() 来密封堆（heap）的
+  部分内存。让我们假设以下来自用户空间的调用:
+
+  - ptr = malloc(size);
+  - mprotect(ptr, size, RO);
+  - mseal(ptr, size);
+  - free(ptr);
+
+  技术上，在 mseal() 被添加之前，用户可以通过调用 mprotect(RO)
+  来改变堆的保护属性。只要用户在调用 free() 之前将保护属性改回 RW（读写），
+  这块内存范围就可以被重用。
+
+  然而，引入 mseal() 之后，堆的部分内存将被密封，用户仍然可以释放这部分内存，
+  但内存将保持为 RO（只读）。如果堆管理器重新使用这个地址来分配另一块内存，
+  进程可能在不久后崩溃。因此，不要对任何可能会被回收的内存应用密封，
+  这是非常重要的。
+
+  此外，即使应用程序从未对指针 ptr 调用 free()，堆管理器也可能会
+  调用 brk 系统调用来缩小堆的大小。在内核中，brk 缩小操作会调用 munmap()。
+  因此，根据 ptr 的位置，brk 缩小操作的结果是不确定的。
+
+其他说明:
+=========
+正如 Jann Horn 在 [3] 中指出的那样,仍然有几种方法可以写入 RO（只读）内存，
+这在某种程度上是设计上的考虑。这些情况不会被 mseal() 涵盖。如果应用程序想
+要阻止这类情况，可以考虑使用沙箱工具（如 seccomp、LSM 等）。
+
+这些情况是：
+
+- 通过/proc/self/mem接口写入只读内存。
+- 通过ptrace(如PTRACE_POKETEXT)写入只读内存。
+- userfaultfd。
+
+这个补丁的灵感来自于 Stephen Röttger’s 在 V8 CFI（控制流完整性）中的工作 [4]。
+ChromeOS中的Chrome浏览器将是此API的第一个用户。
+
+参考:
+=====
+[1] https://github.com/apple-oss-distributions/xnu/blob/1031c584a5e37aff177559b9f69dbd3c8c3fd30a/osfmk/mach/vm_statistics.h#L274
+
+[2] https://man.openbsd.org/mimmutable.2
+
+[3] https://lore.kernel.org/lkml/CAG48ez3ShUYey+ZAFsU2i1RpQn0a5eOs2hzQ426FkcgnfUGLvA@mail.gmail.com
+
+[4] https://docs.google.com/document/d/1O2jwK4dxI3nRcOJuPYkonhTkNQfbmwdvxQMyXgeaRHo/edit#heading=h.bvaojj9fu6hc
-- 
2.33.0


