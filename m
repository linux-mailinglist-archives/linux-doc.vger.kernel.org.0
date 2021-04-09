Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D78035A1EA
	for <lists+linux-doc@lfdr.de>; Fri,  9 Apr 2021 17:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234148AbhDIPXM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 9 Apr 2021 11:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234142AbhDIPXL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Apr 2021 11:23:11 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C95D2C061760
        for <linux-doc@vger.kernel.org>; Fri,  9 Apr 2021 08:22:56 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id u10so6901951lju.7
        for <linux-doc@vger.kernel.org>; Fri, 09 Apr 2021 08:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+k4OGaKct24bDTvy6WNpkixMUqc+BwIGOTLeQUlDJc4=;
        b=1Wu1lDrLqKmQYbSQDEj3E9Qxwy8h1i7mhDgpBkPzrLQYTLbGaj5Mp0CsW6mRfMyThA
         M3l5WLK+P1MkxgBmTaYdZIROCBIj12DdPSCwZqNSj3ObZXK0b0fzj8h/89RpWSnV4TV+
         Htot1/fni42/e1gUjMQPMQKljI746lZ6jOJQuaJvg9NIgikAYKMLSHWCbPXd4SmVDfPI
         LyNR2+J8q/LjOawjya2k3HMCCepMroyH1PsEu4EZgi+yt+w7oCQMlIo3YYV6MiG/t9VH
         a3vrnuDmVuOI4h25ik81QKx7//UAYMDnAi+T/eFKiOjOJFKh4hxGGfPdcArgZNYFQcgd
         UFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+k4OGaKct24bDTvy6WNpkixMUqc+BwIGOTLeQUlDJc4=;
        b=kcj9lp++a6XXPlTDFJa+4Ll0y74R+FBfQgeNOGg8QJW2/O6z1V8ErC6EFcAJlM8zTD
         obBZ+f1auWl8/J/nPeZONqDU6rETPBxKwELQQpyrBPJsF07NVtcB2sX90MDK6e8sDCIL
         sN1dlmXAb4nA60d0szAUVNwOmOdC8dyoCAsjyt7p+More2Cdop6W9Fp1SWKTV9JG9qSg
         xfZJfyZZSY109gqjysL/+7Y8XBrCOayXtcULtAh0F3I0lDt4/j0pplny4khLfAyZp2dU
         ZJ1LaL1OeOpGEWd2YY7Pp8HFfVPV9FoUb9cIy96++SVgRvSX50qzpH7sXpJCuCSd1AE5
         6OgA==
X-Gm-Message-State: AOAM5302jfvkzuwy9bJQQq0f2Kpq6ZfvIHJTPbLukxwKdy2thZJc7Ysb
        XG1rh5sOgud90tOdtibNGbQsnA==
X-Google-Smtp-Source: ABdhPJzqAlWa1t3oxJTDCx16afMmbftoO5aawVqh56tv5EJ1nWbjUQVZoeXq47yGs0zD4CmHEoPHCQ==
X-Received: by 2002:a2e:a487:: with SMTP id h7mr9297185lji.447.1617981775309;
        Fri, 09 Apr 2021 08:22:55 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id n11sm298684ljg.7.2021.04.09.08.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 08:22:54 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 2C0B7102498; Fri,  9 Apr 2021 18:22:54 +0300 (+03)
Date:   Fri, 9 Apr 2021 18:22:54 +0300
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
Subject: Re: [PATCH v24 17/30] mm: Add guard pages around a shadow stack.
Message-ID: <20210409152254.tmpfubsksrd2qbeq@box.shutemov.name>
References: <20210401221104.31584-1-yu-cheng.yu@intel.com>
 <20210401221104.31584-18-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401221104.31584-18-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 01, 2021 at 03:10:51PM -0700, Yu-cheng Yu wrote:
> INCSSP(Q/D) increments shadow stack pointer and 'pops and discards' the
> first and the last elements in the range, effectively touches those memory
> areas.
> 
> The maximum moving distance by INCSSPQ is 255 * 8 = 2040 bytes and
> 255 * 4 = 1020 bytes by INCSSPD.  Both ranges are far from PAGE_SIZE.
> Thus, putting a gap page on both ends of a shadow stack prevents INCSSP,
> CALL, and RET from going beyond.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---
> v24:
> - Instead changing vm_*_gap(), create x86-specific versions.
> 
>  arch/x86/include/asm/page_types.h | 17 +++++++++++++++
>  arch/x86/mm/mmap.c                | 36 +++++++++++++++++++++++++++++++
>  include/linux/mm.h                |  4 ++++
>  3 files changed, 57 insertions(+)
> 
> diff --git a/arch/x86/include/asm/page_types.h b/arch/x86/include/asm/page_types.h
> index a506a411474d..3a5529bcfd76 100644
> --- a/arch/x86/include/asm/page_types.h
> +++ b/arch/x86/include/asm/page_types.h
> @@ -73,6 +73,23 @@ bool pfn_range_is_mapped(unsigned long start_pfn, unsigned long end_pfn);
>  
>  extern void initmem_init(void);
>  
> +/*
> + * Shadow stack pointer is moved by CALL, RET, and INCSSP(Q/D).  INCSSPQ
> + * moves shadow stack pointer up to 255 * 8 = ~2 KB (~1KB for INCSSPD) and
> + * touches the first and the last element in the range, which triggers a
> + * page fault if the range is not in a shadow stack.  Because of this,
> + * creating 4-KB guard pages around a shadow stack prevents these
> + * instructions from going beyond.
> + */
> +#define SHADOW_STACK_GUARD_GAP PAGE_SIZE

The define is only used within arch/x86/mm/mmap.c. Maybe move it there?

Otherwise:

Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov
