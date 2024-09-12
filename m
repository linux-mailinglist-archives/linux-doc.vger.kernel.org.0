Return-Path: <linux-doc+bounces-25072-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED2F976B0D
	for <lists+linux-doc@lfdr.de>; Thu, 12 Sep 2024 15:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88A181F2129D
	for <lists+linux-doc@lfdr.de>; Thu, 12 Sep 2024 13:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532751A4F1F;
	Thu, 12 Sep 2024 13:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Law4f7Eq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E1C19F42E;
	Thu, 12 Sep 2024 13:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726148884; cv=none; b=kA0bkzVleOKDeXej1YZNOR7UHpVu/z90U1IfyReIX/aT4MDwPULfN+xIbOjPoNf43D5giIVdien5wXteP+xj+4//S/MbX/BORzUoPSqbC6xguMLGjzInh6+CDAYXYIVhzJX7l5g9/AQqovx3pkB6lWjhLgWUQPMJQtU9LCF2oyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726148884; c=relaxed/simple;
	bh=PpCoKRxuP1JMyjatbWNtCMiAVbW8Cm45OvbCmpuoMCc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=iE4O8T68fgTk6SF6d/UIWJW9Z8hQ60V7gC7PnmMqETgni2rcygrEbSflLEebqcLkns71IlbQLZH0JZ6iXBvk5mGX1Lo13o7j5WmAEVa0ok0YV2A9kTlqAwgLzHiyWIaXG64+XLmxNaqOXbQLN81GcGL2Y2VhdISYD4/Pxd/DzoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Law4f7Eq; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2d8a9a15a7fso155786a91.0;
        Thu, 12 Sep 2024 06:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726148882; x=1726753682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rx75AI83soQ7F4/nlkSY12sdOTxom+scb4Glrve47wc=;
        b=Law4f7Eqt5jl5BrNsDdRnDEz/h8y4YrhyPiPV0Fk3WV9ZEFGNFnpWenUPbx/4Dx1Zm
         bRycWEKNA1B0fIxBmUFD5t7oXCD25yP50g9ubC5e/K8jTOsBljPszUlx51yjRztjt1+7
         A4b74lkpmvSSAUju5RFpq3UubU7MTeyeP7QaRMazXDuaJnj6uadkQSfk4QBD2rYrPVdD
         yM5GtsBN45DwuhcCyLDKQaiE1kw49FqzSBhs2fZaEzEHBtvAiR5KbwtjrQbasJAOnli3
         EF++ZizzvjdYDpygK0Kbt1E11mxSXqJxVxEa7OJi+SiLL1c3Xh2GXp68JltCvFDauYYX
         Ia5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726148882; x=1726753682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rx75AI83soQ7F4/nlkSY12sdOTxom+scb4Glrve47wc=;
        b=UMZsdlga/YW5TdgiOUElnUnUQ8SfUcEmNLeWwR1qUBlQRFbInd8Ojp+PsVNaMtVtrD
         h6e11x/wtvaep3NAXmeOyL42fdbdgi+gWbNpO9VjZUZxxOmP2yih8DyHXzJWRBrXssh9
         fcqAhoGxzMZj+/3FMCobRRMv5rXZJUUl0vSPcxFdIMlzT3ixIfbAnv99116SRVkY7VWO
         8c3r3kcAf6k3lJBNdd2QhNM/DV/orTNWHnAhKqqrLsVm7doq9Ki399axpDR25+hEU3/w
         FcME5qBkovKCCqxgNJGYFZ1xq41NljR4aLxNUegh4VP0nCmKzOHzI9WqzNxf/RlLmMJx
         zfjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBuXwGBiP6Ne2f/PIxfFV5COXj/ZMZ6Th4TbogO88HOcefgldJDwTJYlUb0pY19CBng3agaosaprqc4HQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5JiZKAmFk+RWx+pvgwh32nPery1Qkujz7Egkj3UYsWUfR2CDc
	zqfM0YF+Gak1/GuNEocn9uIcebb+gzq5zEvKaebis01ZLZthhDfywvbHJqtkuWwtHALh
X-Google-Smtp-Source: AGHT+IGnKcD5aoNl7VCWmmX8ArO21eBuXn21HnszzW7CPX5j8/HK3LaRDkynKipGpqMiq3sX/86VUw==
X-Received: by 2002:a17:90b:1901:b0:2d8:e2eb:31da with SMTP id 98e67ed59e1d1-2db9ffa1cdfmr1319488a91.2.1726148881283;
        Thu, 12 Sep 2024 06:48:01 -0700 (PDT)
Received: from aizome.localdomain ([183.220.83.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadc03d0ecsm12562183a91.23.2024.09.12.06.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 06:48:00 -0700 (PDT)
From: Pengyu Zhang <zpenya1314@gmail.com>
To: alexs@kernel.org,
	siyanteng@loongson.cn,
	corbet@lwn.net,
	seakeel@gmail.com,
	si.yanteng@linux.dev
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zpenya1314@gmail.com,
	yaxin_wang_uestc@163.com
Subject: [PATCH] Documentation/mm: Translate page_tables.rst to Simplified Chinese
Date: Thu, 12 Sep 2024 21:47:43 +0800
Message-Id: <20240912134743.1760-1-zpenya1314@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch provides a Simplified Chinese translation of the
"page_tables.rst" document, aimed at improving accessibility
for Chinese-speaking developers and users.

The translation prioritizes technical accuracy and readability,
ensuring that the content remains clear and informative for
its intended audience.：

Signed-off-by: Pengyu Zhang <zpenya1314@gmail.com>
---
 .../translations/zh_CN/mm/page_tables.rst     | 205 ++++++++++++++++++
 1 file changed, 205 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/mm/page_tables.rst

diff --git a/Documentation/translations/zh_CN/mm/page_tables.rst b/Documentation/translations/zh_CN/mm/page_tables.rst
new file mode 100644
index 000000000000..0a17c3cef4d5
--- /dev/null
+++ b/Documentation/translations/zh_CN/mm/page_tables.rst
@@ -0,0 +1,205 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========
+   页 表
+===========
+
+分页虚拟内存随虚拟内存的概念一起于1962年在Ferranti Atlas计算机上被提出的，
+这是第一台有分页虚拟内存的计算机。随着时间推移，这个特性被迁移到更新的计算机上
+并且成为所有类Unix系统实际的特性。在1985年，这个特性被包含在了英特尔80386中，
+也就是Linux 1.0基于的CPU。
+
+页表将CPU看到的虚拟地址映射到外部内存总线上看到的物理地址。
+
+Linux将页表定义为一个分级结构，目前有五级。对于支持的每种架构，其代码会根据硬件限制
+对这个层级结构进行映射。
+
+虚拟地址对应的物理地址通常由底层物理页帧引用。 **页帧号(page frame number， pfn)**
+是页的物理地址（在外部内存总线看到的地址）除以 `PAGE_SIZE `得到的值。
+
+物理内存地址0对应*pfn 0*，而最大的pfn对应处理器外部地址总线所能寻址物理地址的最后一页。
+
+在页粒度为4KB且地址范围为32位的情况下，pfn 0对应地址0x00000000，pfn 1对应
+地址0x00001000，pfn 2对应地址0x00002000，以此类推，直到pfn 0xfffff对应
+0xfffff000。如果页粒度为16KB，则pfn分别对应地址0x00004000、
+0x00008000...0xffffc000，pfn的范围从0到0x3fffff。
+
+如你所见，对于4KB页面粒度，页基址使用地址的12-31位，这就是为什么在这种情况下
+`PAGE_SHIFT`被定义为12，并且 `PAGE_SIZE`通常由页偏移定义，为 `(1 << PAGE_SHIFT)`。
+
+随着内存容量的增加，久而久之层级结构逐渐加深。Linux最初使用4KB页面和一个被称为
+`swapper_pg_dir` 的页表，该页表拥有1024个条目(entries)，覆盖4MB的内存，事实上Torvald
+的第一台计算机正好就有4MB物理内存。条目在这张表中被称为*PTE*:s -页表项(page table entries)。
+
+软件页表层级结构反映了页表硬件已经变得分层化的事实，而这种分层化的目的是为了
+节省页表内存并加快地址映射速度。
+
+当然，人们可以想象一张拥有大量条目的单一线性的页表将整个内存分为一个个页。而且，这样的
+页表会非常稀疏，因为虚拟内存中大部分位置通常是未使用的。通过页表分层，虚拟内存中的大量空洞
+不会浪费宝贵的页表内存，因为只需要在上层页表中将大块的区域标记为未映射即可。
+
+另外，在现代处理器中，上层页表条目可以直接指向一个物理地址范围，这使得单个上层页表条目
+可以连续映射几兆字节甚至几千兆字节的内存范围，从而快捷地实现虚拟地址到物理地址的映射：
+当你找到一个像这样的大型映射范围时，无需在层级结构中进一步遍历。
+
+页表的层级结构目前发展为如下所示::
+
+  +-----+
+  | PGD |
+  +-----+
+     |
+     |   +-----+
+     +-->| P4D |
+         +-----+
+            |
+            |   +-----+
+            +-->| PUD |
+                +-----+
+                   |
+                   |   +-----+
+                   +-->| PMD |
+                       +-----+
+                          |
+                          |   +-----+
+                          +-->| PTE |
+                              +-----+
+
+
+不同页表层级的符号含义从最底层开始如下：
+
+- **pte**, `pte_t`, `pteval_t` = **页表条目** - 前面提到过.
+  *pte*是一个由 `PTRS_PER_PTE`个 `pteval_t`类型元素组成的数组，每个元素将一个
+  虚拟内存页映射到一个物理内存页。体系结构定义了 `pteval_t`的大小和内容。
+
+  一个典型的例子是 `pteval_t`是一个32或者64位的值，其中高位是**pfn**(页帧号)，
+  而低位则一些特定体系架构相关的位，如内存保护。
+
+  **条目(entry)**这个名字有点令人困惑，因为在Linux 1.0中它确实指的是单层顶级页表中的单个
+  页表项，但在首次引入二级页表时，它被被重新定义为映射元素的数组。因此，*pte*现在指的
+  是最底层的页*表*，而不是一个页表*条目*。
+
+- **pmd**, `pmd_t`, `pmdval_t` = **页中间目录(Page Middle Directory)**,
+  位于*pte*之上的层级结构，包含 `PTRS_PER_PMD` 个指向*pte*的引用。
+
+- **pud**, `pud_t`, `pudval_t` = **页上级目录(Page Upper Directory)**是
+  在其他层级之后引入的，用于处理四级页表。它可能未被使用，或者像我们稍后讨论的那样
+  被“折叠”。
+
+- **p4d**, `p4d_t`, `p4dval_t` = **页四级目录(Page Level 4 Directory)**
+  是在*pud*之后用于处理五级页表引入的。至此，显然需要用数字来替代*pgd*、*pmd*、
+  *pud*等目录层级的名称，不能再继续使用临时的命名方式。这个目录层级只在实际拥有
+  五级页表的系统上使用，否则它会被折叠。
+
+- **pgd**, `pgd_t`, `pgdval_t` = **页全局目录(Page Global Directory)** -
+  Linux内核用于处理内核内存的*PGD*主页表仍然位于 `swapper_pg_dir`。
+  但系统中的每个用户空间进程也有自己的内存上下文，因此也有自己的*pgd*，
+  它位于 `struct mm_struct`中，而 `struct mm_struct`又在每个 `struct task_struct`
+  中有引用。所以，任务（进程）存在一个形式为 `struct mm_struct`的内存上下文，
+  而这个结构体中有一个指向指向相应的页全局目录 `struct pgt_t *pgd`指针。
+
+重申一下：页表层级结构中的每一层都是一个*指针数组*，所以*pgd*包含 `PTRS_PER_PGD` 个
+指向下一层的指针，*p4d* 包含 `PTRS_PER_P4D` 个指向 *pud* 项的指针，依此类推。
+每一层的指针数量由体系结构定义。::
+
+        PMD
+  --> +-----+           PTE
+      | ptr |-------> +-----+
+      | ptr |-        | ptr |-------> PAGE
+      | ptr | \       | ptr |
+      | ptr |  \        ...
+      | ... |   \
+      | ptr |    \         PTE
+      +-----+     +----> +-----+
+                         | ptr |-------> PAGE
+                         | ptr |
+                           ...
+
+页表折叠
+==================
+如果架构不使用所有的页表层级，那么这些层级可以被*折叠*，也就是说被跳过。
+在访问下一层时，所有在页表上执行的操作都会在编译时增强，以跳过这一层。
+
+希望与架构无关的页表处理代码（例如虚拟内存管理器）需要编写得能够遍历当前的
+所有五个层级。对于特定架构的代码，也应优先采用这种风格，以便对未来的变化具有
+更好的适应性。
+
+MMU, TLB, and 缺页异常
+=========================
+
+`内存管理单元(MMU)`是处理虚拟地址到物理地址转换的硬件组件。它可能会使用
+相对较小的硬件缓存，如 `转换后备缓冲区(TLB)`和 `页遍历缓存`，以加快这些地址翻译过程。
+
+当CPU访存时，它会向MMU提供一个虚拟地址。MMU会首先检查TLB或者页遍历缓存(在支持的架构上)
+是否存在对应的转换结果。如果没有，MMU会通过遍历来确定物理地址并且建立映射。
+
+当页面被写入时，该页的脏位会被设置(即打开)。每个内存页面都有相关的权限位和脏位。后者表明这个页
+自从被加载到内存以来是否被修改。
+
+如果没有任何阻碍，物理内存到头来可以被任意访问并且对物理帧进行请求的操作。
+
+MMU无法找到某些转换有多种原因。有可能是CPU试图去访问当前进程没有权限访问的内存，
+或者因为访问的数据还不在物理内存中。
+
+当这些情况发生时，MMU会触发缺页异常，这是一种异常类型，用于通知CPU暂停当前执行
+并运行一个特殊的函数去处理这些异常。
+
+缺页异常有一些常见且预期的原因。这些因素是由称为“懒加载”和“写时复制”的进程管理优化技术
+来触发。缺页异常也可能发生在当页帧被交换到持久存储(交换分区或者文件)并从其物理地址移出时。
+
+这些技术提高了内存效率，减少了延迟，并且最小化了空间占用。本文档不会深入讨论“懒加载”
+和“写时复制的细节，因为这些的主题属于进程地址管理范畴，超出了本文范围。
+
+交换技术和前面提到的其他技术不同，因为它是在压力过大下情况下减少内存消耗的一种迫不得已的手段
+，因此是不受欢迎的。
+
+交换不适用于由内核逻辑地址映射的内存。这些地址是内核虚拟地址空间的子集，直接映射
+一段连续的物理内存。对于提供的任意逻辑地址，它的物理地址可以通过对偏移量进行简单的
+算数运算来确定。对逻辑地址的访问很快，因为这避免了复杂的页表查找，但代价是这些内存
+不能被驱逐或置换。
+
+如果内核无法为必须存在物理帧中的数据腾出空间，那么它会调用内存不足(out-if-memory, OOM)杀手，
+通过杀掉低优先级的进程来腾出空间，直到内存压力下降到安全阈值之下。
+
+另外，代码漏洞或CPU被指示访问的精心制作的恶意地址也可能导致缺页异常。
+一个进程的线程可以利用指令来访问不属于其地址空间的(非共享)内存，或者试图执行
+写入只读位置的指令。
+
+如果上述情况发生在用户态，内核会向当前线程发送 `段错误` (SIGSEGV)信号。这信号
+通常导致线程及其所属的进程终止。
+
+本文将简化并概述Linux内核如何处理这些页面错误、创建表和表项、检查内存是否存在，
+以及当内存不存在时，如何请求从持久存储或其他设备加载数据，并更新MMU及其缓存。
+
+前几步取决于设备依赖。大多是架构跳转到 `do_page_fault()`，而x86中断处理程序由
+`DEFINE_IDTENTRY_RAW_ERRORCODE()`宏定义的，该宏调用 `handle_page_fault()`。
+
+无论调用路径如何，所有架构最终都会调用 `handle_mm_fault()`，该函数通常会调用
+`__handle_mm_fault()`来执行实际分配页表的任务。
+
+如果不幸无法调用 `__handle_mm_fault()`则意味着虚拟地址指向了无权访问的物理内存区域
+(至少对于当前上下文如此)。这种情况会导致内核向该进程发送上述的SIGSEGV信号，
+并引发前面提到的后果。
+
+查询偏移量的函数有像 `*_offset()`格式的名字，其中“*”代表pgd，p4d，pud，pmd，pte；
+而分层分配对应页表的函数命名为 `*_alloc`，使用上述命名约定以层级命名这些函数。
+
+页表遍历可能在中间或者上层结束(PMD，PUD)。
+
+Linux支持比通常4KB更大的页面(即所谓的 `大页`)。当使用这种较大的页面时，没有必要使用更低层
+的页表项(PTE)。大页通常包含2MB到1GB的大块连续物理区域，分别由PMD和PUD页表项映射。
+
+大页带来许多好处，如减少TLB压力，减少页表开销，提高内存分配效率，以及改善特定工作
+负载的性能。然而，这些好处也伴随着权衡，如内存浪费和分配难度增加。
+
+在遍历和分配的最后，如果没有返回错误， `__handle_mm_fault()`最终调用 `handle_pte_fault()`
+通过 `do_fault()`执行 `do_read_fault()`、 `do_cow_fault()`和 `do_shared_fault()`。
+“read”，“cow”和“shared”分别暗示了它处理错误的类型和原因。
+
+实际的工作流程实现是非常复杂的。其设计允许 Linux 根据每种架构的特定特性处理缺页异常，
+同时仍然共享一个通用的整体结构。
+
+为了总结 Linux 如何处理缺页中断的概述，需要补充的是，缺页异常处理程序可以通过
+`pagefault_disable()`和 `pagefault_enable()`分别禁用和启用。
+
+许多代码路径使用了这两个函数，因为它们需要禁止陷入缺页异常处理程序，主要是为了防止死锁。
+
-- 
2.25.1


