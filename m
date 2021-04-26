Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1863436AC3E
	for <lists+linux-doc@lfdr.de>; Mon, 26 Apr 2021 08:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbhDZGcP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 26 Apr 2021 02:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbhDZGcO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Apr 2021 02:32:14 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C51C061574
        for <linux-doc@vger.kernel.org>; Sun, 25 Apr 2021 23:31:33 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id x20so56274480lfu.6
        for <linux-doc@vger.kernel.org>; Sun, 25 Apr 2021 23:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Kc8jqGhH/i/p+4zlWWcYzH0ChU/St4I0f5Kj38coM28=;
        b=ea1DMqRjyF1ClzXaKHMM0Z9eX6h5DFcL3hRzk2eCDRy/Ifo94Vugt7WwKUVt/pgzB6
         Ts2xfzV3ITD4iy+zLFdec/huDftVxl3DH/3ceQHbAuweThMwKQs6kPkCG8huUR7R2sMP
         HFyNCBke+lD8sNWbn2FOY2iO590B51S0xxShGn77Od+PgvC9j6ABRgsFYWSqQlyKua5y
         SfTnh16O9CZZZjpXQCTHqkHLrOfIm1dFaBG0ho7el8283nr+VITUQnmTviMiHTQ6zjR9
         R58quTJq2r6It/sq8BwbD0qcH7Oq++rc+ML6P87vxKIYvXieXTOcsOmZkuyOyEHeqEqn
         XpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Kc8jqGhH/i/p+4zlWWcYzH0ChU/St4I0f5Kj38coM28=;
        b=FydEFVv7Daxr5Zlcnd9HIoDNu1Tm2zxkw3/ZVCo6tvrS5lQ5d5Q2Dv2XqPGZm/PUtX
         7WXePnZOxsu41cdMlVN2Dr1g/TYbzB9c/wUN5FPqBiD2b0bVcKGRZaCXZ54e3XyEq9IW
         bNlsjMN90m0/vQMsWQz7vVxk/0wgnz/2IJ358t3LiDhoUZLFENpz7YJ7Jf4JXfK0gjX1
         aUSNJhz16H3NA8v6wXOC5VJtZrSwa9cuUBuT3PueJLus1eJlL4Z0jkvRW8fgg9eH785Z
         UKDSbLlhlmtuORbEf1zu8rYPZiDYZHtwa0Kz68nF9XT0hM5Ik5d678VLo57SOGeNxccM
         lZTg==
X-Gm-Message-State: AOAM531ajHqJllVmEHC243i+vMau62izQtK1Dp0T0RD+E2rO+q/vvM5k
        LPHRnCl25/7y2hShSzPjvD5YLQ==
X-Google-Smtp-Source: ABdhPJwuKmHWKe78Ra3S1nRhqGYoyQaGIDPMrykQP/oSt9wVx1sOW2E55k0v8y5JqHL0ArYKyqfy9A==
X-Received: by 2002:ac2:5e6b:: with SMTP id a11mr11636367lfr.513.1619418691736;
        Sun, 25 Apr 2021 23:31:31 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id x19sm1409635ljh.50.2021.04.25.23.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 23:31:31 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id A84621026AB; Mon, 26 Apr 2021 09:31:34 +0300 (+03)
Date:   Mon, 26 Apr 2021 09:31:34 +0300
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
Subject: Re: [PATCH v25 28/30] mm: Move arch_calc_vm_prot_bits() to
 arch/x86/include/asm/mman.h
Message-ID: <20210426063134.jvanqz7b3nfpwayg@box.shutemov.name>
References: <20210415221419.31835-1-yu-cheng.yu@intel.com>
 <20210415221419.31835-29-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415221419.31835-29-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 15, 2021 at 03:14:17PM -0700, Yu-cheng Yu wrote:
> To prepare the introduction of PROT_SHSTK and be consistent with other
> architectures, move arch_vm_get_page_prot() and arch_calc_vm_prot_bits() to
> arch/x86/include/asm/mman.h.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---
>  arch/x86/include/asm/mman.h      | 30 ++++++++++++++++++++++++++++++
>  arch/x86/include/uapi/asm/mman.h | 27 +++------------------------
>  2 files changed, 33 insertions(+), 24 deletions(-)
>  create mode 100644 arch/x86/include/asm/mman.h
> 
> diff --git a/arch/x86/include/asm/mman.h b/arch/x86/include/asm/mman.h
> new file mode 100644
> index 000000000000..629f6c81263a
> --- /dev/null
> +++ b/arch/x86/include/asm/mman.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_X86_MMAN_H
> +#define _ASM_X86_MMAN_H
> +
> +#include <linux/mm.h>
> +#include <uapi/asm/mman.h>
> +
> +#ifdef CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS
> +/*
> + * Take the 4 protection key bits out of the vma->vm_flags
> + * value and turn them in to the bits that we can put in
> + * to a pte.
> + *
> + * Only override these if Protection Keys are available
> + * (which is only on 64-bit).
> + */
> +#define arch_vm_get_page_prot(vm_flags)	__pgprot(	\
> +		((vm_flags) & VM_PKEY_BIT0 ? _PAGE_PKEY_BIT0 : 0) |	\
> +		((vm_flags) & VM_PKEY_BIT1 ? _PAGE_PKEY_BIT1 : 0) |	\
> +		((vm_flags) & VM_PKEY_BIT2 ? _PAGE_PKEY_BIT2 : 0) |	\
> +		((vm_flags) & VM_PKEY_BIT3 ? _PAGE_PKEY_BIT3 : 0))
> +
> +#define arch_calc_vm_prot_bits(prot, key) (		\
> +		((key) & 0x1 ? VM_PKEY_BIT0 : 0) |      \
> +		((key) & 0x2 ? VM_PKEY_BIT1 : 0) |      \
> +		((key) & 0x4 ? VM_PKEY_BIT2 : 0) |      \
> +		((key) & 0x8 ? VM_PKEY_BIT3 : 0))
> +#endif
> +
> +#endif /* _ASM_X86_MMAN_H */
> diff --git a/arch/x86/include/uapi/asm/mman.h b/arch/x86/include/uapi/asm/mman.h
> index d4a8d0424bfb..3ce1923e6ed9 100644
> --- a/arch/x86/include/uapi/asm/mman.h
> +++ b/arch/x86/include/uapi/asm/mman.h
> @@ -1,31 +1,10 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> -#ifndef _ASM_X86_MMAN_H
> -#define _ASM_X86_MMAN_H
> +#ifndef _UAPI_ASM_X86_MMAN_H
> +#define _UAPI_ASM_X86_MMAN_H
>  
>  #define MAP_32BIT	0x40		/* only give out 32bit addresses */
>  
> -#ifdef CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS
> -/*
> - * Take the 4 protection key bits out of the vma->vm_flags
> - * value and turn them in to the bits that we can put in
> - * to a pte.
> - *
> - * Only override these if Protection Keys are available
> - * (which is only on 64-bit).
> - */
> -#define arch_vm_get_page_prot(vm_flags)	__pgprot(	\
> -		((vm_flags) & VM_PKEY_BIT0 ? _PAGE_PKEY_BIT0 : 0) |	\
> -		((vm_flags) & VM_PKEY_BIT1 ? _PAGE_PKEY_BIT1 : 0) |	\
> -		((vm_flags) & VM_PKEY_BIT2 ? _PAGE_PKEY_BIT2 : 0) |	\
> -		((vm_flags) & VM_PKEY_BIT3 ? _PAGE_PKEY_BIT3 : 0))
> -
> -#define arch_calc_vm_prot_bits(prot, key) (		\
> -		((key) & 0x1 ? VM_PKEY_BIT0 : 0) |      \
> -		((key) & 0x2 ? VM_PKEY_BIT1 : 0) |      \
> -		((key) & 0x4 ? VM_PKEY_BIT2 : 0) |      \
> -		((key) & 0x8 ? VM_PKEY_BIT3 : 0))
> -#endif
>  

Looks like you leave two empty lines here.

Otherwise:

Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

>  #include <asm-generic/mman.h>
>  
> -#endif /* _ASM_X86_MMAN_H */
> +#endif /* _UAPI_ASM_X86_MMAN_H */
> -- 
> 2.21.0
> 
> 

-- 
 Kirill A. Shutemov
