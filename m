Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6C36473474
	for <lists+linux-doc@lfdr.de>; Mon, 13 Dec 2021 19:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242027AbhLMS5H (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 13 Dec 2021 13:57:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236468AbhLMS5F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Dec 2021 13:57:05 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341E3C0613FE;
        Mon, 13 Dec 2021 10:57:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D410DB81259;
        Mon, 13 Dec 2021 18:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980D3C34605;
        Mon, 13 Dec 2021 18:56:55 +0000 (UTC)
Date:   Mon, 13 Dec 2021 18:56:52 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     john.p.donnelly@oracle.com
Cc:     Zhen Lei <thunder.leizhen@huawei.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        linux-kernel@vger.kernel.org, Dave Young <dyoung@redhat.com>,
        Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Eric Biederman <ebiederm@xmission.com>,
        kexec@lists.infradead.org, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Feng Zhou <zhoufeng.zf@bytedance.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Chen Zhou <dingguo.cz@antgroup.com>
Subject: Re: [PATCH v17 00/10] support reserving crashkernel above 4G on
 arm64 kdump
Message-ID: <YbeXdErCxqPQHR9Y@arm.com>
References: <20211210065533.2023-1-thunder.leizhen@huawei.com>
 <5ef3ef54-33db-3cb2-4908-8bd1254749e3@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ef3ef54-33db-3cb2-4908-8bd1254749e3@oracle.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 13, 2021 at 08:37:48AM -0600, john.p.donnelly@oracle.com wrote:
> On 12/10/21 12:55 AM, Zhen Lei wrote:
> > There are following issues in arm64 kdump:
> > 1. We use crashkernel=X to reserve crashkernel below 4G, which
> > will fail when there is no enough low memory.
> > 2. If reserving crashkernel above 4G, in this case, crash dump
> > kernel will boot failure because there is no low memory available
> > for allocation.
> > 
> > To solve these issues, change the behavior of crashkernel=X.
> > crashkernel=X tries low allocation in DMA zone and fall back to high
> > allocation if it fails.
> > 
> > We can also use "crashkernel=X,high" to select a high region above
> > DMA zone, which also tries to allocate at least 256M low memory in
> > DMA zone automatically and "crashkernel=Y,low" can be used to allocate
> > specified size low memory.
> > 
> > When reserving crashkernel in high memory, some low memory is reserved
> > for crash dump kernel devices. So there may be two regions reserved for
> > crash dump kernel.
> > In order to distinct from the high region and make no effect to the use
> > of existing kexec-tools, rename the low region as "Crash kernel (low)",
> > and pass the low region by reusing DT property
> > "linux,usable-memory-range". We made the low memory region as the last
> > range of "linux,usable-memory-range" to keep compatibility with existing
> > user-space and older kdump kernels.
> > 
> > Besides, we need to modify kexec-tools:
> > arm64: support more than one crash kernel regions(see [1])
> > 
> > Another update is document about DT property 'linux,usable-memory-range':
> > schemas: update 'linux,usable-memory-range' node schema(see [2])
> > 
> > This patchset contains the following 10 patches:
> > 
> > 0001-0004 are some x86 cleanups which prepares for making functionsreserve_crashkernel[_low]() generic.
> > 0005 makes functions reserve_crashkernel[_low]() generic.
> > 0006-0007 reimplements arm64 crashkernel=X.
> > 0008-0009 adds memory for devices by DT property linux,usable-memory-range.
> > 0010 updates the doc.
> > 
> > Changes since [v16]
> > - Because no functional changes in this version, so add
> >    "Tested-by: Dave Kleikamp <dave.kleikamp@oracle.com>" for patch 1-9
> > - Add "Reviewed-by: Rob Herring <robh@kernel.org>" for patch 8
> > - Update patch 9 based on the review comments of Rob Herring
> > - As Catalin Marinas's suggestion, merge the implementation of
> >    ARCH_WANT_RESERVE_CRASH_KERNEL into patch 5. Ensure that the
> >    contents of X86 and ARM64 do not overlap, and reduce unnecessary
> >    temporary differences.
> > 
> > Changes since [v15]
> > -  Aggregate the processing of "linux,usable-memory-range" into one function.
> >     Only patch 9-10 have been updated.
> > 
> > Changes since [v14]
> > - Recovering the requirement that the CrashKernel memory regions on X86
> >    only requires 1 MiB alignment.
> > - Combine patches 5 and 6 in v14 into one. The compilation warning fixed
> >    by patch 6 was introduced by patch 5 in v14.
> > - As with crashk_res, crashk_low_res is also processed by
> >    crash_exclude_mem_range() in patch 7.
> > - Due to commit b261dba2fdb2 ("arm64: kdump: Remove custom linux,usable-memory-range handling")
> >    has removed the architecture-specific code, extend the property "linux,usable-memory-range"
> >    in the platform-agnostic FDT core code. See patch 9.
> > - Discard the x86 description update in the document, because the description
> >    has been updated by commit b1f4c363666c ("Documentation: kdump: update kdump guide").
> > - Change "arm64" to "ARM64" in Doc.
> > 
> > 
> > Changes since [v13]
> > - Rebased on top of 5.11-rc5.
> > - Introduce config CONFIG_ARCH_WANT_RESERVE_CRASH_KERNEL.
> > Since reserve_crashkernel[_low]() implementations are quite similar on
> > other architectures, so have CONFIG_ARCH_WANT_RESERVE_CRASH_KERNEL in
> > arch/Kconfig and select this by X86 and ARM64.
> > - Some minor cleanup.
> > 
> > Changes since [v12]
> > - Rebased on top of 5.10-rc1.
> > - Keep CRASH_ALIGN as 16M suggested by Dave.
> > - Drop patch "kdump: add threshold for the required memory".
> > - Add Tested-by from John.
> > 
> > Changes since [v11]
> > - Rebased on top of 5.9-rc4.
> > - Make the function reserve_crashkernel() of x86 generic.
> > Suggested by Catalin, make the function reserve_crashkernel() of x86 generic
> > and arm64 use the generic version to reimplement crashkernel=X.
> > 
> > Changes since [v10]
> > - Reimplement crashkernel=X suggested by Catalin, Many thanks to Catalin.
> > 
> > Changes since [v9]
> > - Patch 1 add Acked-by from Dave.
> > - Update patch 5 according to Dave's comments.
> > - Update chosen schema.
> > 
> > Changes since [v8]
> > - Reuse DT property "linux,usable-memory-range".
> > Suggested by Rob, reuse DT property "linux,usable-memory-range" to pass the low
> > memory region.
> > - Fix kdump broken with ZONE_DMA reintroduced.
> > - Update chosen schema.
> > 
> > Changes since [v7]
> > - Move x86 CRASH_ALIGN to 2M
> > Suggested by Dave and do some test, move x86 CRASH_ALIGN to 2M.
> > - Update Documentation/devicetree/bindings/chosen.txt.
> > Add corresponding documentation to Documentation/devicetree/bindings/chosen.txt
> > suggested by Arnd.
> > - Add Tested-by from Jhon and pk.
> > 
> > Changes since [v6]
> > - Fix build errors reported by kbuild test robot.
> > 
> > Changes since [v5]
> > - Move reserve_crashkernel_low() into kernel/crash_core.c.
> > - Delete crashkernel=X,high.
> > - Modify crashkernel=X,low.
> > If crashkernel=X,low is specified simultaneously, reserve spcified size low
> > memory for crash kdump kernel devices firstly and then reserve memory above 4G.
> > In addition, rename crashk_low_res as "Crash kernel (low)" for arm64, and then
> > pass to crash dump kernel by DT property "linux,low-memory-range".
> > - Update Documentation/admin-guide/kdump/kdump.rst.
> > 
> > Changes since [v4]
> > - Reimplement memblock_cap_memory_ranges for multiple ranges by Mike.
> > 
> > Changes since [v3]
> > - Add memblock_cap_memory_ranges back for multiple ranges.
> > - Fix some compiling warnings.
> > 
> > Changes since [v2]
> > - Split patch "arm64: kdump: support reserving crashkernel above 4G" as
> > two. Put "move reserve_crashkernel_low() into kexec_core.c" in a separate
> > patch.
> > 
> > Changes since [v1]:
> > - Move common reserve_crashkernel_low() code into kernel/kexec_core.c.
> > - Remove memblock_cap_memory_ranges() i added in v1 and implement that
> > in fdt_enforce_memory_region().
> > There are at most two crash kernel regions, for two crash kernel regions
> > case, we cap the memory range [min(regs[*].start), max(regs[*].end)]
> > and then remove the memory range in the middle.
> > 
> > [1]: http://lists.infradead.org/pipermail/kexec/2020-June/020737.html
> > [2]: https://github.com/robherring/dt-schema/pull/19
> > [v1]: https://lkml.org/lkml/2019/4/2/1174
> > [v2]: https://lkml.org/lkml/2019/4/9/86
> > [v3]: https://lkml.org/lkml/2019/4/9/306
> > [v4]: https://lkml.org/lkml/2019/4/15/273
> > [v5]: https://lkml.org/lkml/2019/5/6/1360
> > [v6]: https://lkml.org/lkml/2019/8/30/142
> > [v7]: https://lkml.org/lkml/2019/12/23/411
> > [v8]: https://lkml.org/lkml/2020/5/21/213
> > [v9]: https://lkml.org/lkml/2020/6/28/73
> > [v10]: https://lkml.org/lkml/2020/7/2/1443
> > [v11]: https://lkml.org/lkml/2020/8/1/150
> > [v12]: https://lkml.org/lkml/2020/9/7/1037
> > [v13]: https://lkml.org/lkml/2020/10/31/34
> > [v14]: https://lkml.org/lkml/2021/1/30/53
> > [v15]: https://lkml.org/lkml/2021/10/19/1405
> > [v16]: https://lkml.org/lkml/2021/11/23/435
> > 
> > 
> > Chen Zhou (9):
> >    x86: kdump: replace the hard-coded alignment with macro CRASH_ALIGN
> >    x86: kdump: make the lower bound of crash kernel reservation
> >      consistent
> >    x86: kdump: use macro CRASH_ADDR_LOW_MAX in functions
> >      reserve_crashkernel()
> >    x86: kdump: move xen_pv_domain() check and insert_resource() to
> >      setup_arch()
> >    x86: kdump: move reserve_crashkernel[_low]() into crash_core.c
> >    arm64: kdump: introduce some macros for crash kernel reservation
> >    arm64: kdump: reimplement crashkernel=X
> >    of: fdt: Add memory for devices by DT property
> >      "linux,usable-memory-range"
> >    kdump: update Documentation about crashkernel
> > 
> > Zhen Lei (1):
> >    of: fdt: Aggregate the processing of "linux,usable-memory-range"
> > 
> >   Documentation/admin-guide/kdump/kdump.rst     |  11 +-
> >   .../admin-guide/kernel-parameters.txt         |  11 +-
> >   arch/Kconfig                                  |   3 +
> >   arch/arm64/Kconfig                            |   1 +
> >   arch/arm64/include/asm/kexec.h                |  10 ++
> >   arch/arm64/kernel/machine_kexec_file.c        |  12 +-
> >   arch/arm64/kernel/setup.c                     |  13 +-
> >   arch/arm64/mm/init.c                          |  59 ++-----
> >   arch/x86/Kconfig                              |   2 +
> >   arch/x86/include/asm/elf.h                    |   3 +
> >   arch/x86/include/asm/kexec.h                  |  31 +++-
> >   arch/x86/kernel/setup.c                       | 163 ++----------------
> >   drivers/of/fdt.c                              |  42 +++--
> >   include/linux/crash_core.h                    |   3 +
> >   include/linux/kexec.h                         |   2 -
> >   kernel/crash_core.c                           | 156 +++++++++++++++++
> >   kernel/kexec_core.c                           |  17 --
> >   17 files changed, 301 insertions(+), 238 deletions(-)
> 
> After 2 years, and 17 versions, can we now get this series promoted into a
> build ?

We don't push patches to linux-next while there are still pending
issues. The v17 looks alright though, I'll push it out for a bit more
coverage and, if there are no objections, it should land in 5.17.

-- 
Catalin
