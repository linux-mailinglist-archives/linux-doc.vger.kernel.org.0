Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5EBA16F0BC
	for <lists+linux-doc@lfdr.de>; Tue, 25 Feb 2020 21:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729117AbgBYU7E (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 25 Feb 2020 15:59:04 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:32985 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728162AbgBYU7E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Feb 2020 15:59:04 -0500
Received: by mail-pj1-f68.google.com with SMTP id m7so1387501pjs.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2020 12:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8dX5wGDp7/7RsShn+G7Hibf511wFtQ+pPngKimjNxu4=;
        b=Jwk9kPFJM5a5cMiSmyglbYvymQaWI+0Gd2bok0pF2yDJjBVyB4ypgMVYnkhvHZBskU
         awRC2Wrz2BPMSVl/HcdJAxTGcUgu8+Afk5Wd46vG4ulAXoicWcgKpp72XA+FY46HMWdT
         kiPA3E07NGXbdh2+9CYQ4kSt958zqN9ltfGR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8dX5wGDp7/7RsShn+G7Hibf511wFtQ+pPngKimjNxu4=;
        b=TguNMlP6DLVD7w5I1Jg6Nj6AtcrDJmm86r/Anyayyu+6RtNBqLRs2m6gOcs51KIql4
         qTg8u7Sw4OkBR9RKGsJus0Vo30VrlI25ReR/yqXh6eMaJw9muOpVqsC9y0Lia+pqGa1u
         sNygduUk7lpm0vd4D5Cylm1i84LVm6abimRaGdY1z1vdbYcH14hscNdcm94T2nVW19pz
         IlGwtPVyd+8xG08x5gmlQH/SGai9DxrK6RwFfcYBhEXO4cYT4xHNAb1GzJEhE/RcsNPw
         ngXdHydodm0l2IDieqUzZL5Sx7GyvfIzzBPQXryClZ3A4joKsDOcWIVesubFMJRD4kYR
         2k7Q==
X-Gm-Message-State: APjAAAXgc5UhDu6Z3QQTRufMrwXo4DqbB01JMDQPheJDQDdNZFygRx3O
        7YKEGz0vB83R/BdEUJdqHOHXcA==
X-Google-Smtp-Source: APXvYqy7twXol1ZzVJucdwTIs4N2cjv5l0rTxkBOo20OqiQFr1W86iRpQPhEogyZW0rHsPhwBYPDdQ==
X-Received: by 2002:a17:90a:d985:: with SMTP id d5mr1051052pjv.73.1582664342668;
        Tue, 25 Feb 2020 12:59:02 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e6sm17859883pfh.32.2020.02.25.12.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 12:59:01 -0800 (PST)
Date:   Tue, 25 Feb 2020 12:59:00 -0800
From:   Kees Cook <keescook@chromium.org>
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
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>, x86-patch-review@intel.com
Subject: Re: [RFC PATCH v9 15/27] mm: Handle THP/HugeTLB Shadow Stack page
 fault
Message-ID: <202002251258.7D6DA92@keescook>
References: <20200205181935.3712-1-yu-cheng.yu@intel.com>
 <20200205181935.3712-16-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205181935.3712-16-yu-cheng.yu@intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 05, 2020 at 10:19:23AM -0800, Yu-cheng Yu wrote:
> This patch implements THP Shadow Stack (SHSTK) copying in the same way as
> in the previous patch for regular PTE.
> 
> In copy_huge_pmd(), clear the dirty bit from the PMD to cause a page fault
> upon the next SHSTK access to the PMD.  At that time, fix the PMD and
> copy/re-use the page.

Now is as good a time as any to ask: do you have selftests for all this?
It seems like it would be really nice to have a way to verify SHSTK is
working correctly.

-Kees

> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> ---
>  arch/x86/mm/pgtable.c         |  8 ++++++++
>  include/asm-generic/pgtable.h | 11 +++++++++++
>  mm/huge_memory.c              |  4 ++++
>  3 files changed, 23 insertions(+)
> 
> diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
> index 2eb33794c08d..3340b1d4e9da 100644
> --- a/arch/x86/mm/pgtable.c
> +++ b/arch/x86/mm/pgtable.c
> @@ -886,4 +886,12 @@ inline pte_t pte_set_vma_features(pte_t pte, struct vm_area_struct *vma)
>  	else
>  		return pte;
>  }
> +
> +inline pmd_t pmd_set_vma_features(pmd_t pmd, struct vm_area_struct *vma)
> +{
> +	if (vma->vm_flags & VM_SHSTK)
> +		return pmd_mkdirty_shstk(pmd);
> +	else
> +		return pmd;
> +}
>  #endif /* CONFIG_X86_INTEL_SHADOW_STACK_USER */
> diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
> index 9cb2f9ba5895..a9df093fdf45 100644
> --- a/include/asm-generic/pgtable.h
> +++ b/include/asm-generic/pgtable.h
> @@ -1201,9 +1201,20 @@ static inline pte_t pte_set_vma_features(pte_t pte, struct vm_area_struct *vma)
>  {
>  	return pte;
>  }
> +
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +static inline pmd_t pmd_set_vma_features(pmd_t pmd, struct vm_area_struct *vma)
> +{
> +	return pmd;
> +}
> +#endif
>  #else
>  bool arch_copy_pte_mapping(vm_flags_t vm_flags);
>  pte_t pte_set_vma_features(pte_t pte, struct vm_area_struct *vma);
> +
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +pmd_t pmd_set_vma_features(pmd_t pmd, struct vm_area_struct *vma);
> +#endif
>  #endif
>  #endif /* CONFIG_MMU */
>  
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index a88093213674..93ef368df2dd 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -636,6 +636,7 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf,
>  
>  		entry = mk_huge_pmd(page, vma->vm_page_prot);
>  		entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
> +		entry = pmd_set_vma_features(entry, vma);
>  		page_add_new_anon_rmap(page, vma, haddr, true);
>  		mem_cgroup_commit_charge(page, memcg, false, true);
>  		lru_cache_add_active_or_unevictable(page, vma);
> @@ -1278,6 +1279,7 @@ static vm_fault_t do_huge_pmd_wp_page_fallback(struct vm_fault *vmf,
>  		pte_t entry;
>  		entry = mk_pte(pages[i], vma->vm_page_prot);
>  		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
> +		entry = pte_set_vma_features(entry, vma);
>  		memcg = (void *)page_private(pages[i]);
>  		set_page_private(pages[i], 0);
>  		page_add_new_anon_rmap(pages[i], vmf->vma, haddr, false);
> @@ -1360,6 +1362,7 @@ vm_fault_t do_huge_pmd_wp_page(struct vm_fault *vmf, pmd_t orig_pmd)
>  		pmd_t entry;
>  		entry = pmd_mkyoung(orig_pmd);
>  		entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
> +		entry = pmd_set_vma_features(entry, vma);
>  		if (pmdp_set_access_flags(vma, haddr, vmf->pmd, entry,  1))
>  			update_mmu_cache_pmd(vma, vmf->address, vmf->pmd);
>  		ret |= VM_FAULT_WRITE;
> @@ -1432,6 +1435,7 @@ vm_fault_t do_huge_pmd_wp_page(struct vm_fault *vmf, pmd_t orig_pmd)
>  		pmd_t entry;
>  		entry = mk_huge_pmd(new_page, vma->vm_page_prot);
>  		entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
> +		entry = pmd_set_vma_features(entry, vma);
>  		pmdp_huge_clear_flush_notify(vma, haddr, vmf->pmd);
>  		page_add_new_anon_rmap(new_page, vma, haddr, true);
>  		mem_cgroup_commit_charge(new_page, memcg, false, true);
> -- 
> 2.21.0
> 

-- 
Kees Cook
