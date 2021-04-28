Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4256436E053
	for <lists+linux-doc@lfdr.de>; Wed, 28 Apr 2021 22:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241064AbhD1Udy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 28 Apr 2021 16:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240440AbhD1Udx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Apr 2021 16:33:53 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A39C06138B
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 13:33:08 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id e2so29204141plh.8
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 13:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lzyHFl3XvpD8uLoAKMCr+4eH/NJBzwafsnTS+S805fk=;
        b=bdXMxB5VuwcJ7B/NZ1R1f4hO5v01BHFCLeBjI3nekCdeo5Co2s9IkQJne2LWDogsn+
         qQoIeLnMSdxvF8y+JHKLF2YKtCI8cd3GOCFdIcG17iHVAUnzlpncasGaaF6uGVmr4f84
         62Cp3BPVAxKRzOEE9IOTQ6Aq1Jb4lFikH3SB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lzyHFl3XvpD8uLoAKMCr+4eH/NJBzwafsnTS+S805fk=;
        b=NzPxtiQdm8BUSrtfynEA1RwANhHc73z4gZ+lgxbmfNZwiZQK4EIJoSXAER9gYynEYe
         uiXuFE5hfYouln7ZaHb0Gq0n4ml3lGol6sD59RZ85LsHLWzi8vGfxbdrHbk249GeuATy
         3+t3VFV067uDGo7S42p9ZR3YTuJzbO9/776gEdRkYcTR5k+UYfUTHpo0KRbeA8S3NG1H
         xeBSzPUJ/EVOObTp10oH9FxYIq30Lc2YSp+L54YeCTRshQovQHfqDD5BFZLfh5SUCNu3
         vfCwW/juee4Ioasg6XvM+QHhTicp3CzhZZZ2l19aSE7ACE6HceVLCgQz8nRi+LpCXVHT
         Q35Q==
X-Gm-Message-State: AOAM5335xQBmtVW6IcitC3sPCA4JTmlk1S2XWKS3xTabNhLexlAIPxsa
        QDXWyNs6HYfVt4RIYp6iGPqpKg==
X-Google-Smtp-Source: ABdhPJwmg8RwIfSdFdXFJTZcsWyhIJmcqaH1KMnK68PGqEYPACjkExXL12gacQGUfIb9eqhrTasajg==
X-Received: by 2002:a17:902:aa98:b029:ec:a55f:f4bc with SMTP id d24-20020a170902aa98b02900eca55ff4bcmr32332974plr.82.1619641988198;
        Wed, 28 Apr 2021 13:33:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w2sm468892pfi.104.2021.04.28.13.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 13:33:07 -0700 (PDT)
Date:   Wed, 28 Apr 2021 13:33:06 -0700
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
        Dave Martin <Dave.Martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        Pengfei Xu <pengfei.xu@intel.com>,
        Haitao Huang <haitao.huang@intel.com>
Subject: Re: [PATCH v26 6/9] x86/vdso: Insert endbr32/endbr64 to vDSO
Message-ID: <202104281332.94A153C@keescook>
References: <20210427204720.25007-1-yu-cheng.yu@intel.com>
 <20210427204720.25007-7-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427204720.25007-7-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 27, 2021 at 01:47:17PM -0700, Yu-cheng Yu wrote:
> From: "H.J. Lu" <hjl.tools@gmail.com>
> 
> When Indirect Branch Tracking (IBT) is enabled, vDSO functions may be
> called indirectly, and must have ENDBR32 or ENDBR64 as the first
> instruction.  The compiler must support -fcf-protection=branch so that it
> can be used to compile vDSO.

If you respin this, you can maybe rephrase this since CONFIG_X86_IBT
has already tested for the compiler support.

> 
> Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Kees Cook <keescook@chromium.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
> v24:
> - Replace CONFIG_X86_CET with CONFIG_X86_IBT to reflect splitting of shadow
>   stack and ibt.
> 
>  arch/x86/entry/vdso/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
> index 05c4abc2fdfd..a773a5f03b63 100644
> --- a/arch/x86/entry/vdso/Makefile
> +++ b/arch/x86/entry/vdso/Makefile
> @@ -93,6 +93,10 @@ endif
>  
>  $(vobjs): KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_LTO) $(GCC_PLUGINS_CFLAGS) $(RETPOLINE_CFLAGS),$(KBUILD_CFLAGS)) $(CFL)
>  
> +ifdef CONFIG_X86_IBT
> +$(vobjs) $(vobjs32): KBUILD_CFLAGS += -fcf-protection=branch
> +endif
> +
>  #
>  # vDSO code runs in userspace and -pg doesn't help with profiling anyway.
>  #
> -- 
> 2.21.0
> 

-- 
Kees Cook
