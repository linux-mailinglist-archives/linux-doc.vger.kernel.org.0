Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E5A35A1F5
	for <lists+linux-doc@lfdr.de>; Fri,  9 Apr 2021 17:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233288AbhDIP0D (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 9 Apr 2021 11:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232796AbhDIP0D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Apr 2021 11:26:03 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A47C061763
        for <linux-doc@vger.kernel.org>; Fri,  9 Apr 2021 08:25:50 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id b4so10302969lfi.6
        for <linux-doc@vger.kernel.org>; Fri, 09 Apr 2021 08:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ce6m/UIYgJRrvW7RSWTVG0DWr0xVOqVU43L3DVJ9fRM=;
        b=yjbbIWyxQB6ZNUWgWfXJj3TAnOTe4JM6fJUMA5SEQGFwbrcyHgQFh7RRX3fMjsJ/xx
         oyp07+etBQnRQM/45znSt5gvJUkKaV/U8P16uBLY5/5q2Ox/X1QE8iHhmrogr857yYND
         y6+yyooKI4LUiqOlnFAqI6Y/g0e4hrZtP2vIpCvyeXtba+XlKfyQ/cQN1+u56KPvAJsh
         WZT11/5zIkeJ5jAiwNriUs9WFOSvs/96XRhwFVKfF2IYmUea2Ht83hRyv99gYlnAspzl
         +rPgQdI4fCf0Lj1rH0HVobtyCnaLofrLFNi3F2KG6RO8RetuxutaZEP9TAP9K7EpTjwx
         fLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ce6m/UIYgJRrvW7RSWTVG0DWr0xVOqVU43L3DVJ9fRM=;
        b=In7LATpB7d24jihisCv/go3QTszCwHUNWhSkHD4D+clPjQ+eZEfIOPDeIUyqn3+wB8
         0qYdxjx4dMcNbtskiQ7KjGG6FuZ5mlo0AocbbWO4dyZM5RHr2O+OB1x8sNzyNwwqWLcr
         6twUvPqg73b7H5njpYgBgndyW67OK0rnyH/3eTyROmr/jGj2bOBZ/cnX+4xl/TYvp/NR
         +1uhLpGbNbXHLx3C4opi+OuMpCrsH/0v3uEBzNM8ydcwrJ3+yyxTRrrATX0KxgYwt0Px
         XoBetrchin8PgjVHTOss2KjRx92VXcaHZSAB4EHBxSW8fk3Or6pxyt+wwX6mshKZutgb
         iV2w==
X-Gm-Message-State: AOAM5323F3DUpw9VQpTUJTwMH8hhjMqPoUKvx3ARg+7sr6/fy/zBEQX3
        GxeBnIOUjCLkEe0r9gXapnlYQA==
X-Google-Smtp-Source: ABdhPJxFBsu79jPxCQidLtLR6o7KuhwUDppH8nwIit73lLNAUMKcEtfajg/yu084AD0cUS8KP90s1A==
X-Received: by 2002:ac2:51de:: with SMTP id u30mr10804713lfm.550.1617981948362;
        Fri, 09 Apr 2021 08:25:48 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id m19sm307113lfl.170.2021.04.09.08.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 08:25:47 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 58AB3102498; Fri,  9 Apr 2021 18:25:47 +0300 (+03)
Date:   Fri, 9 Apr 2021 18:25:47 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        Pengfei Xu <pengfei.xu@intel.com>,
        Haitao Huang <haitao.huang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH v24 18/30] mm/mmap: Add shadow stack pages to memory
 accounting
Message-ID: <20210409152547.ljbcoqrqyej7ojxs@box.shutemov.name>
References: <20210401221104.31584-1-yu-cheng.yu@intel.com>
 <20210401221104.31584-19-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401221104.31584-19-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 01, 2021 at 03:10:52PM -0700, Yu-cheng Yu wrote:
> Account shadow stack pages to stack memory.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---
> v24:
> - Change arch_shadow_stack_mapping() to is_shadow_stack_mapping().
> - Change VM_SHSTK to VM_SHADOW_STACK.
> 
>  arch/x86/mm/pgtable.c   |  7 +++++++
>  include/linux/pgtable.h | 11 +++++++++++
>  mm/mmap.c               |  5 +++++
>  3 files changed, 23 insertions(+)
> 
> diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
> index e778dbbef3d8..212a8c1fe5ba 100644
> --- a/arch/x86/mm/pgtable.c
> +++ b/arch/x86/mm/pgtable.c
> @@ -897,3 +897,10 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
>  
>  #endif /* CONFIG_X86_64 */
>  #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
> +
> +#ifdef CONFIG_ARCH_HAS_SHADOW_STACK
> +bool is_shadow_stack_mapping(vm_flags_t vm_flags)
> +{
> +	return (vm_flags & VM_SHADOW_STACK);
> +}

No, just define it as you have here in linux/mm.h. It will always be false
for !CONFIG_ARCH_HAS_SHADOW_STACK as VM_SHADOW_STACK is 0 there.

This maze of #ifdefs are unneeded.

-- 
 Kirill A. Shutemov
