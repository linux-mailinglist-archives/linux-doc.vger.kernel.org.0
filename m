Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE7236E05B
	for <lists+linux-doc@lfdr.de>; Wed, 28 Apr 2021 22:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241983AbhD1Uee (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 28 Apr 2021 16:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241970AbhD1Uee (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Apr 2021 16:34:34 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24665C06138B
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 13:33:49 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id h20so33524767plr.4
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 13:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Z3WAVPi6tsHxDYkM4thG7PqVeXUU++9bnDuXCoKXmi4=;
        b=Fo8IE3I0Qnr4mDXrQVTPnM4+jhs2ThENLEcltPKpi9dYXzlO/2OVs+uHajDUhuJhzg
         M1XUOFddD+QZAay+ahN2hW3OM0bPQcxPtNTFU9d8QMiRCFQhVyEb6KA1UWHyE5uF1MNr
         tgnlvKgTH3p+4ll/1YtXyjZnqjY9XwOFyt+u8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z3WAVPi6tsHxDYkM4thG7PqVeXUU++9bnDuXCoKXmi4=;
        b=KYYw4f5WcPUE34hHl8bAmFi1sL065/MVYSfnW1O9uxEeyxqsCNV9NoMogO5HYO+q2x
         DkwRN4O7kpXMMEcbbcKnSsmrTnKusYtGESM2rjhh+mCUqt6/8hWoWKaOxJCncQxhzS7O
         O8+hQWVForziBgcmdukSU5JZFAmQ6RggNSl9EjBv/p+iA+PuZ7/xDYBA85MXcAWQq74w
         u75o3BS3yt6046FO1MPtcYDHbgDiu7fI8gmWCpXlUrnQRvRXGkK+7Wqdrwwyw4KuQ6AM
         ayq2IPznxIJ5mJZWNakrqHy2HXUaE5Rnwp0j6bIDjFYEGynJ1gWdFaW+oeF8fXJxUnIO
         cxxA==
X-Gm-Message-State: AOAM5316nbst7YNvu6oAQnv3LBE+MZB2jesvF5eePRk289A3Gi+Zgzcu
        BEIj1dPoEJAAHpLvFNAA8S8D7g==
X-Google-Smtp-Source: ABdhPJyogndh6ukwI5PEuGAyD74umrCHVx/GiDvlgM9L6dZt4rLJuFS+DjFDHl5H1wKKCnV2d6CeOQ==
X-Received: by 2002:a17:902:748c:b029:ed:6dc5:48f with SMTP id h12-20020a170902748cb02900ed6dc5048fmr6762137pll.30.1619642028733;
        Wed, 28 Apr 2021 13:33:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h20sm488903pfv.6.2021.04.28.13.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 13:33:48 -0700 (PDT)
Date:   Wed, 28 Apr 2021 13:33:47 -0700
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
Subject: Re: [PATCH v26 8/9] x86/vdso/32: Add ENDBR to __kernel_vsyscall
 entry point
Message-ID: <202104281333.C2F5433@keescook>
References: <20210427204720.25007-1-yu-cheng.yu@intel.com>
 <20210427204720.25007-9-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427204720.25007-9-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 27, 2021 at 01:47:19PM -0700, Yu-cheng Yu wrote:
> From: "H.J. Lu" <hjl.tools@gmail.com>
> 
> ENDBR is a special new instruction for the Indirect Branch Tracking (IBT)
> component of CET.  IBT prevents attacks by ensuring that (most) indirect
> branches and function calls may only land at ENDBR instructions.  Branches
> that don't follow the rules will result in control flow (#CF) exceptions.
> 
> ENDBR is a noop when IBT is unsupported or disabled.  Most ENDBR
> instructions are inserted automatically by the compiler, but branch
> targets written in assembly must have ENDBR added manually.
> 
> Add that to __kernel_vsyscall entry point.
> 
> Signed-off-by: H.J. Lu <hjl.tools@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
