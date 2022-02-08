Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6181C4ACF01
	for <lists+linux-doc@lfdr.de>; Tue,  8 Feb 2022 03:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243778AbiBHCkc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Feb 2022 21:40:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245068AbiBHCeh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Feb 2022 21:34:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C2FBDC06109E
        for <linux-doc@vger.kernel.org>; Mon,  7 Feb 2022 18:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644287673;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CFWGmsRhSBrRkVipArydVrEvw7EEHygWrGz+mu3Vvkg=;
        b=A8Z+CKm5t7WipvxHuKTHwsMmWdNijsbJ6MMqwuUxuLRnDm3awezQPgZ+Qa63cN8zfynfKo
        1nfU2cZwnB68CnoCDHIu9McN8Fnp5eKXo9uflk+NYsRDZw0I03jf+A5d6eUyMxHI79xZzP
        bw730v8xzctk2phoJtFbvbd3lOBJm3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-vLJDyrrGN6CglPQqKZD2vQ-1; Mon, 07 Feb 2022 21:34:30 -0500
X-MC-Unique: vLJDyrrGN6CglPQqKZD2vQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CF511006AA4;
        Tue,  8 Feb 2022 02:34:27 +0000 (UTC)
Received: from localhost (ovpn-12-95.pek2.redhat.com [10.72.12.95])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AD22E2C1;
        Tue,  8 Feb 2022 02:34:16 +0000 (UTC)
Date:   Tue, 8 Feb 2022 10:34:13 +0800
From:   Baoquan He <bhe@redhat.com>
To:     "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        linux-kernel@vger.kernel.org, Dave Young <dyoung@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        Eric Biederman <ebiederm@xmission.com>,
        kexec@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Feng Zhou <zhoufeng.zf@bytedance.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Chen Zhou <dingguo.cz@antgroup.com>,
        John Donnelly <John.p.donnelly@oracle.com>,
        Dave Kleikamp <dave.kleikamp@oracle.com>, prudo@redhat.com,
        piliu@redhat.com
Subject: Re: [PATCH v20 0/5] support reserving crashkernel above 4G on arm64
 kdump
Message-ID: <YgHWpazFQDerr7AC@MiWiFi-R3L-srv>
References: <20220124084708.683-1-thunder.leizhen@huawei.com>
 <d77f9f52-626d-e290-5fcb-578ac6b0c7ce@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d77f9f52-626d-e290-5fcb-578ac6b0c7ce@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/07/22 at 12:04pm, Leizhen (ThunderTown) wrote:
> Hi everybody:
>   Can someone take a moment to review these patches? Maybe I should just try
> making generic. This patch series seems to have gone back to square one,
> discarding some of the valuable comments that were made in the middle. But the
> only benefit of make generic is to avoid code duplication, a lot of adaptation
> is needed. I think Borislav Petkov's suggestion is good, too.

I am checking this version. I have got a arm64 machine, will give it a shot.

About deduplicating the copied code, it's good to have comparing with having an
important feature in a certian ARCH.

Add Philipp to CC since he investigates the deduplicating.

> 
>   These patches are taking too long. Maybe no one wants to look through history
> anymore. So I'm putting together some of the most central observations of
> "make generic" as follows:
>    Mike Rapoport:
>      This very reminds what x86 does. Any chance some of the code can be reused
>      rather than duplicated?
>      https://lkml.org/lkml/2019/4/4/1225
> 
>      I think it would be better to have CONFIG_ARCH_WANT_RESERVE_CRASH_KERNEL
>      in arch/Kconfig and select this by X86 and ARM64.
>      https://lkml.org/lkml/2020/11/12/224
> 
>    Ingo Molnar:
>      No objections for this to be merged via the ARM tree, as long as x86
>      functionality is kept intact.
>      https://lkml.org/lkml/2019/4/10/109
> 
>      I.e. Ack, but only if it doesn't break anything. :-)
>      https://lkml.org/lkml/2019/4/12/66
> 
>    Dave Young:
>      Other than the comments from James, can you move the function into
>      kernel/crash_core.c, we already have some functions moved there for
>      sharing.
>      https://lkml.org/lkml/2019/6/12/248
> 
>    Catalin Marinas:
>      Except for the threshold to keep zone ZONE_DMA memory,
>      reserve_crashkernel() looks very close to the x86 version. Shall we try
>      to make this generic as well?
>      https://lkml.org/lkml/2020/9/2/917
> 
>    Borislav Petkov:
>      Why insert_resource() is relevant only to x86?
>      --> I think this means "Why does arm64 not use insert_resource()?"
>      https://lkml.org/lkml/2021/12/23/480
> 
>      This is exactly why I say that making those functions generic and shared
>      might not be such a good idea, after all, because then you'd have to
>      sprinkle around arch-specific stuff.
>      https://lkml.org/lkml/2021/12/23/480
> 
>      What I suggested and what would be real clean is if the arches would
>      simply call a *single*
> 	parse_crashkernel()
>      function and when that one returns, *all* crashkernel= options would
>      have been parsed properly, low, high, middle crashkernel, whatever...
>      and the caller would know what crash kernel needs to be allocated.
>      https://lkml.org/lkml/2021/12/28/305
> 
>    ------
>    James Morse:
>      We can then describe it via a different string in /proc/iomem, something
>      like "Crash kernel (low)".
>      https://lkml.org/lkml/2019/6/5/670
>      --> The suggestion looks out of date. See Borislav Petkov's comments:
>      --> 157752d84f5d ("kexec: use Crash kernel for Crash kernel low")
>      --> https://lkml.org/lkml/2021/12/23/480
> 
> 
> On 2022/1/24 16:47, Zhen Lei wrote:
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
> > 
> > Changes since [v19]:
> > 1. Temporarily stop making reserve_crashkernel[_low]() generic. There are a
> >    lot of details need to be considered, which can take a long time. Because
> >    "make generic" does not add new functions and does not improve performance,
> >    maybe I should say it's just a cleanup. So by stripping it out and leaving
> >    it for other patches later, we can aggregate the changes to the main functions.
> > 2. Use insert_resource() to replace request_resource(), this not only simplifies
> >    the code, but also reduces the differences between arm64 and x86 implementations.
> > 3. As commit 157752d84f5d ("kexec: use Crash kernel for Crash kernel low") do for
> >    x86, we can also extend kexec-tools for arm64, and it's currently applied. See:
> >    https://www.spinics.net/lists/kexec/msg28284.html
> > 
> > Thank you very much, Borislav Petkov, for so many valuable comments.
> > 
> > 
> > 
> > Changes since [v17]: v17 --> v19
> > 1. Patch 0001-0004
> >    Introduce generic parse_crashkernel_high_low() to bring the parsing of
> >    "crashkernel=X,high" and the parsing of "crashkernel=X,low" together,
> >    then use it instead of the call to parse_crashkernel_{high|low}(). Two
> >    confusing parameters of parse_crashkernel_{high|low}() are deleted.
> > 
> >    I previously sent these four patches separately:
> >    [1] https://lkml.org/lkml/2021/12/25/40
> > 2. Patch 0005-0009
> >    Introduce generic reserve_crashkernel_mem[_low](), the implementation of
> >    these two functions is based on function reserve_crashkernel[_low]() in
> >    arch/x86/kernel/setup.c. There is no functional change for x86.
> >    1) The check position of xen_pv_domain() does not change.
> >    2) Still 1M alignment for crash kernel fixed region, when 'base' is specified.
> > 
> >    To avoid compilation problems on other architectures: patch 0004 moves
> >    the definition of global variable crashk[_low]_res from kexec_core.c to
> >    crash_core.c, and provide default definitions for all macros involved, a
> >    particular platform can redefine these macros to override the default
> >    values.
> > 3. 0010, only one line of comment was changed.
> > 4. 0011
> >    1) crashk_low_res may also a valid reserved memory, should be checked
> >       in crash_is_nosave(), see arch/arm64/kernel/machine_kexec.
> >    2) Drop memblock_mark_nomap() for crashk_low_res, because of:
> >       2687275a5843 arm64: Force NO_BLOCK_MAPPINGS if crashkernel reservation is required
> >    3) Also call kmemleak_ignore_phys() for crashk_low_res, because of:
> >       85f58eb18898 arm64: kdump: Skip kmemleak scan reserved memory for kdump
> > 5. 0012, slightly rebased, because the following patch is applied in advance. 
> >    https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=dt/linus&id=8347b41748c3019157312fbe7f8a6792ae396eb7
> > 6. 0013, no change.
> > 
> > Others:
> > 1. Discard add ARCH_WANT_RESERVE_CRASH_KERNEL
> > 2. When allocating crash low memory, the start address still starts from 0.
> >    low_base = memblock_phys_alloc_range(low_size, CRASH_ALIGN, 0, CRASH_ADDR_LOW_MAX);
> > 3. Discard change (1ULL << 32) to CRASH_ADDR_LOW_MAX.
> > 4. Ensure the check position of xen_pv_domain() have no change.
> > 5. Except patch 0010 and 0012, all "Tested-by", "Reviewed-by", "Acked-by" are removed.
> > 6. Update description.
> > 
> > 
> > 
> > Changes since [v16]
> > - Because no functional changes in this version, so add
> >   "Tested-by: Dave Kleikamp <dave.kleikamp@oracle.com>" for patch 1-9
> > - Add "Reviewed-by: Rob Herring <robh@kernel.org>" for patch 8
> > - Update patch 9 based on the review comments of Rob Herring
> > - As Catalin Marinas's suggestion, merge the implementation of
> >   ARCH_WANT_RESERVE_CRASH_KERNEL into patch 5. Ensure that the
> >   contents of X86 and ARM64 do not overlap, and reduce unnecessary
> >   temporary differences.
> > 
> > Changes since [v15]
> > -  Aggregate the processing of "linux,usable-memory-range" into one function.
> >    Only patch 9-10 have been updated.
> > 
> > Changes since [v14]
> > - Recovering the requirement that the CrashKernel memory regions on X86
> >   only requires 1 MiB alignment.
> > - Combine patches 5 and 6 in v14 into one. The compilation warning fixed
> >   by patch 6 was introduced by patch 5 in v14.
> > - As with crashk_res, crashk_low_res is also processed by
> >   crash_exclude_mem_range() in patch 7.
> > - Due to commit b261dba2fdb2 ("arm64: kdump: Remove custom linux,usable-memory-range handling")
> >   has removed the architecture-specific code, extend the property "linux,usable-memory-range"
> >   in the platform-agnostic FDT core code. See patch 9.
> > - Discard the x86 description update in the document, because the description
> >   has been updated by commit b1f4c363666c ("Documentation: kdump: update kdump guide").
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
> > [1]: https://www.spinics.net/lists/kexec/msg28226.html
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
> > [v17]: https://lkml.org/lkml/2021/12/10/38
> > [v18]: https://lkml.org/lkml/2021/12/22/424
> > [v19]: https://lkml.org/lkml/2021/12/28/203
> > 
> > 
> > Chen Zhou (4):
> >   arm64: kdump: introduce some macros for crash kernel reservation
> >   arm64: kdump: reimplement crashkernel=X
> >   of: fdt: Add memory for devices by DT property
> >     "linux,usable-memory-range"
> >   kdump: update Documentation about crashkernel
> > 
> > Zhen Lei (1):
> >   arm64: Use insert_resource() to simplify code
> > 
> >  Documentation/admin-guide/kdump/kdump.rst     | 11 ++-
> >  .../admin-guide/kernel-parameters.txt         | 11 ++-
> >  arch/arm64/kernel/machine_kexec.c             |  9 ++-
> >  arch/arm64/kernel/machine_kexec_file.c        | 12 ++-
> >  arch/arm64/kernel/setup.c                     | 17 +---
> >  arch/arm64/mm/init.c                          | 80 +++++++++++++++++--
> >  drivers/of/fdt.c                              | 33 +++++---
> >  7 files changed, 134 insertions(+), 39 deletions(-)
> > 
> 
> -- 
> Regards,
>   Zhen Lei
> 

