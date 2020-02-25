Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80DAC16F0FD
	for <lists+linux-doc@lfdr.de>; Tue, 25 Feb 2020 22:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbgBYVSv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 25 Feb 2020 16:18:51 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:40896 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbgBYVSv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Feb 2020 16:18:51 -0500
Received: by mail-pj1-f67.google.com with SMTP id 12so277581pjb.5
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2020 13:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kyC0S3nLXyzsm81BmepVIhQQuTKauVa1MWg7QJig8D4=;
        b=cj56T07Vxz1sEPwIo3vVc5PooAdcznhQsty9r8ixIE9RubODSoaWcDP2HBH9jPQGlx
         /7rHVj2yFZT9RXQMd3lF5rVMfDwAHKOIMF77nrf0FzlsY88ywGty6oodRzq8mCK7hwcB
         8TWDHsJlmJVw/q9GyDy58o63aR2THnmItLT20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kyC0S3nLXyzsm81BmepVIhQQuTKauVa1MWg7QJig8D4=;
        b=s+cW3l/l2z4i4Xy2uoQZPNu9FpENOrFOT/tV00q/KNIotmvTKvnUNRO34fNbf8DUnv
         FZWFFUbI6FWVFIVEh0Ds745xrz2liAaa84PJRmPGQorHclDlVDB7G1VTn0jeWIJNplBX
         6M2xVP0C/f2lMusBAGkH1NJvACyVfyYNe/536DPxo2kCqCnnVp+96sR3tx1p7oJcpJiX
         LaTfiWUEZFG9yBPIAOy8pu/W0NgV8ASprDvR/tMjss0uCN4ba+QsjzNczoWqQarOcG/P
         zeKBkNcAkKhQVUUVLBkJNGso0nqh3MStqWd4Zq3MAShMyq81PNI1fGctaCggFcSmaS4f
         Bcpg==
X-Gm-Message-State: APjAAAUBQMl8KGjQrYJ8vJC6IxbBuyoZmxG/ZDDOT3ONhBMKQiKEMgy8
        HtCxFKgzZK9hu39jNfOBjTTVcA==
X-Google-Smtp-Source: APXvYqz4GuEOOMi8is/0gSue/XsQsxclLpaHaOpRccPjkZmlxITRd7oCZSiK+0IE0z6s634MjgXOuA==
X-Received: by 2002:a17:902:343:: with SMTP id 61mr493496pld.332.1582665529931;
        Tue, 25 Feb 2020 13:18:49 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m101sm28988pje.13.2020.02.25.13.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 13:18:48 -0800 (PST)
Date:   Tue, 25 Feb 2020 13:18:47 -0800
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
Subject: Re: [RFC PATCH v9 21/27] binfmt_elf: Define
 GNU_PROPERTY_X86_FEATURE_1_AND
Message-ID: <202002251318.EF0E98EA0@keescook>
References: <20200205181935.3712-1-yu-cheng.yu@intel.com>
 <20200205181935.3712-22-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205181935.3712-22-yu-cheng.yu@intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 05, 2020 at 10:19:29AM -0800, Yu-cheng Yu wrote:
> An ELF file's .note.gnu.property indicates architecture features of
> the file.  Introduce feature definitions for Control-flow Enforcement
> Technology (CET): Shadow Stack and Indirect Branch Tracking.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Why not merge with patch 20?

-Kees

> ---
>  include/uapi/linux/elf.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index c37731407074..61251ecabdd7 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -444,4 +444,11 @@ typedef struct elf64_note {
>    Elf64_Word n_type;	/* Content type */
>  } Elf64_Nhdr;
>  
> +/* .note.gnu.property types */
> +#define GNU_PROPERTY_X86_FEATURE_1_AND		0xc0000002
> +
> +/* Bits of GNU_PROPERTY_X86_FEATURE_1_AND */
> +#define GNU_PROPERTY_X86_FEATURE_1_IBT		0x00000001
> +#define GNU_PROPERTY_X86_FEATURE_1_SHSTK	0x00000002
> +
>  #endif /* _UAPI_LINUX_ELF_H */
> -- 
> 2.21.0
> 

-- 
Kees Cook
