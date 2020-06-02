Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F188F1EB53B
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2020 07:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgFBFZM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 2 Jun 2020 01:25:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20868 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726867AbgFBFZH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Jun 2020 01:25:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591075505;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VehAfr1QcK1Dwcz7+ds+E0e6uhlAX/0K+5UtuSIJbmY=;
        b=VkTO5SdexX+m00Nw+m1iOm6O9KPh7nDZNT39hjLHb8AFxK/A5PqliMxVsVBvWbeWOlmXHU
        vKdj3J9J/UDTzeLsJdrUrEYGdLIf7re6IgCqyAK5VnpyC4eG3iVY+rMhb2kgd/660Y1OGw
        MK5vo/dtJtf3qTDFHzsvBuq5ROgmFPE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-wFdSLFP0NxqGHZ0Sk1EC7g-1; Tue, 02 Jun 2020 01:24:59 -0400
X-MC-Unique: wFdSLFP0NxqGHZ0Sk1EC7g-1
Received: by mail-qv1-f72.google.com with SMTP id a7so2482572qvl.2
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2020 22:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VehAfr1QcK1Dwcz7+ds+E0e6uhlAX/0K+5UtuSIJbmY=;
        b=bYNa73PibX+VDk2Hwms6vTgPLkHFE2x3uJ059FaVT/6lFtOryoFrcrKvLP9Q/WcFcQ
         ERQ5fs97ihY4NH7wSLiOHqfV36hdYPLiKE4M+6hv6hqY80lLzOXWuYhj2VcU/YQKjOJC
         Dij4pSrrqEiFyMmrZSd+nqXRyq1/N1TixbnX9Y63VOjqXkLEWW7nt6gU/7tURM8GvqRl
         Cdt++yIyqqpe3JScHQvesnM5nTq+/DptwaUXuyJATaVcBP5ldsD9xlUpgpa5+33NY+C4
         eEVlAtEwOjmor+A41jPtIwUNCThl0i7fJb8PTkv0PtHUacQ4Awhds8hU1oW6A154Py7p
         wYpw==
X-Gm-Message-State: AOAM531eRNU6V1U0bl0tes8WtLs+J0qFPpryYZBWVkMmd5OTX/PbPm8E
        GSTNf+Rx0ayIdx5F729Iqmhtr6enTaaPxIlpK8MSuw9EjJG9ucMTAXNYHGFSwoF3nBbYCHGECUe
        QjlzrrQxdWmh/vR7k4Eijby9dtfuUPsYjTDF+
X-Received: by 2002:a37:b9c7:: with SMTP id j190mr18446739qkf.210.1591075498896;
        Mon, 01 Jun 2020 22:24:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqSml3yIRLnTsy9Th/UnRcgf1YOKMax0M+KxC4ZQtHYQlBJISkBakBOY31tAwc7YBCMcTTQOYw3l/yGOmFjpg=
X-Received: by 2002:a37:b9c7:: with SMTP id j190mr18446721qkf.210.1591075498589;
 Mon, 01 Jun 2020 22:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <1589395957-24628-1-git-send-email-bhsharma@redhat.com>
In-Reply-To: <1589395957-24628-1-git-send-email-bhsharma@redhat.com>
From:   Bhupesh Sharma <bhsharma@redhat.com>
Date:   Tue, 2 Jun 2020 10:54:46 +0530
Message-ID: <CACi5LpMKSNz=_OQWmEQ2kaswbjAONjn2pXQiu=jCA=wMt3wGCQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Append new variables to vmcoreinfo (TCR_EL1.T1SZ
 for arm64 and MAX_PHYSMEM_BITS for all archs)
To:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        x86@kernel.org
Cc:     Bhupesh SHARMA <bhupesh.linux@gmail.com>,
        Boris Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morse <james.morse@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>,
        Steve Capper <steve.capper@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Dave Anderson <anderson@redhat.com>,
        Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
        John Donnelly <john.p.donnelly@oracle.com>,
        scott.branden@broadcom.com, Amit Kachhap <amit.kachhap@arm.com>,
        linuxppc-dev@lists.ozlabs.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        kexec mailing list <kexec@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

On Thu, May 14, 2020 at 12:22 AM Bhupesh Sharma <bhsharma@redhat.com> wrote:
>
> Apologies for the delayed update. Its been quite some time since I
> posted the last version (v5), but I have been really caught up in some
> other critical issues.
>
> Changes since v5:
> ----------------
> - v5 can be viewed here:
>   http://lists.infradead.org/pipermail/kexec/2019-November/024055.html
> - Addressed review comments from James Morse and Boris.
> - Added Tested-by received from John on v5 patchset.
> - Rebased against arm64 (for-next/ptr-auth) branch which has Amit's
>   patchset for ARMv8.3-A Pointer Authentication feature vmcoreinfo
>   applied.
>
> Changes since v4:
> ----------------
> - v4 can be seen here:
>   http://lists.infradead.org/pipermail/kexec/2019-November/023961.html
> - Addressed comments from Dave and added patches for documenting
>   new variables appended to vmcoreinfo documentation.
> - Added testing report shared by Akashi for PATCH 2/5.
>
> Changes since v3:
> ----------------
> - v3 can be seen here:
>   http://lists.infradead.org/pipermail/kexec/2019-March/022590.html
> - Addressed comments from James and exported TCR_EL1.T1SZ in vmcoreinfo
>   instead of PTRS_PER_PGD.
> - Added a new patch (via [PATCH 3/3]), which fixes a simple typo in
>   'Documentation/arm64/memory.rst'
>
> Changes since v2:
> ----------------
> - v2 can be seen here:
>   http://lists.infradead.org/pipermail/kexec/2019-March/022531.html
> - Protected 'MAX_PHYSMEM_BITS' vmcoreinfo variable under CONFIG_SPARSEMEM
>   ifdef sections, as suggested by Kazu.
> - Updated vmcoreinfo documentation to add description about
>   'MAX_PHYSMEM_BITS' variable (via [PATCH 3/3]).
>
> Changes since v1:
> ----------------
> - v1 was sent out as a single patch which can be seen here:
>   http://lists.infradead.org/pipermail/kexec/2019-February/022411.html
>
> - v2 breaks the single patch into two independent patches:
>   [PATCH 1/2] appends 'PTRS_PER_PGD' to vmcoreinfo for arm64 arch, whereas
>   [PATCH 2/2] appends 'MAX_PHYSMEM_BITS' to vmcoreinfo in core kernel code (all archs)
>
> This patchset primarily fixes the regression reported in user-space
> utilities like 'makedumpfile' and 'crash-utility' on arm64 architecture
> with the availability of 52-bit address space feature in underlying
> kernel. These regressions have been reported both on CPUs which don't
> support ARMv8.2 extensions (i.e. LVA, LPA) and are running newer kernels
> and also on prototype platforms (like ARMv8 FVP simulator model) which
> support ARMv8.2 extensions and are running newer kernels.
>
> The reason for these regressions is that right now user-space tools
> have no direct access to these values (since these are not exported
> from the kernel) and hence need to rely on a best-guess method of
> determining value of 'vabits_actual' and 'MAX_PHYSMEM_BITS' supported
> by underlying kernel.
>
> Exporting these values via vmcoreinfo will help user-land in such cases.
> In addition, as per suggestion from makedumpfile maintainer (Kazu),
> it makes more sense to append 'MAX_PHYSMEM_BITS' to
> vmcoreinfo in the core code itself rather than in arm64 arch-specific
> code, so that the user-space code for other archs can also benefit from
> this addition to the vmcoreinfo and use it as a standard way of
> determining 'SECTIONS_SHIFT' value in user-land.
>
> Cc: Boris Petkov <bp@alien8.de>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: James Morse <james.morse@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Steve Capper <steve.capper@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Dave Anderson <anderson@redhat.com>
> Cc: Kazuhito Hagio <k-hagio@ab.jp.nec.com>
> Cc: John Donnelly <john.p.donnelly@oracle.com>
> Cc: scott.branden@broadcom.com
> Cc: Amit Kachhap <amit.kachhap@arm.com>
> Cc: x86@kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> Cc: kexec@lists.infradead.org
>
> Bhupesh Sharma (2):
>   crash_core, vmcoreinfo: Append 'MAX_PHYSMEM_BITS' to vmcoreinfo
>   arm64/crash_core: Export TCR_EL1.T1SZ in vmcoreinfo
>
>  Documentation/admin-guide/kdump/vmcoreinfo.rst | 16 ++++++++++++++++
>  arch/arm64/include/asm/pgtable-hwdef.h         |  1 +
>  arch/arm64/kernel/crash_core.c                 | 10 ++++++++++
>  kernel/crash_core.c                            |  1 +
>  4 files changed, 28 insertions(+)

Ping. @James Morse , Others

Please share if you have some comments regarding this patchset.

Thanks,
Bhupesh

