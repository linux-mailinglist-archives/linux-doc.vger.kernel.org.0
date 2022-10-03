Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F80D5F35B6
	for <lists+linux-doc@lfdr.de>; Mon,  3 Oct 2022 20:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiJCSjP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Oct 2022 14:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbiJCSjO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Oct 2022 14:39:14 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88AC0399DE
        for <linux-doc@vger.kernel.org>; Mon,  3 Oct 2022 11:39:12 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id j71so4233035pge.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Oct 2022 11:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=G7bUMV+FEZy7kwIPvofvWVHEzM2JjGpJ/T9cn7FANKI=;
        b=DbL7LAsMn1ZPP3tNqgEAs3OQijAthjiTsME8iEq9bYxYCoSv0lX69AAmGW/K9A6j/q
         TMxBNDTbCnI8kpn+gp3mX8N+xIP0/vXpRvy2NYb976KpDaLB/bkmYwScsJ09vfjp9jgi
         P5XvS/Lge/4CLPDX9IZNvy8a9fJitWxxwmk0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=G7bUMV+FEZy7kwIPvofvWVHEzM2JjGpJ/T9cn7FANKI=;
        b=5GTTWeInTB7a9igbRRvlT6xUW9KzB9DH6tWE/vc9OJ7IWZP7MJqNzQKD2U+GFKKJw9
         qmRYao43Z4Fl5Uszrs9yvcoFRu6rRXXPm5giFeY64sJ/a8UOph+XHGMCsMPac0t0b1FA
         xXECuzOaxigN9tmxI+524674yZ07Viidk1n24nHuDYJpaAcXQO4Zf2xkaIsxfp11mock
         Pu8jAZlCpPH1N2i10hcc8WaHQDkbz5ND2DMGft7vlSxkkOFPDrQiA01RJOBJGv5gVdYJ
         NVLa5Wq0rB66bRnKYBN7mIc9alDtBJl8tenZtvp18s36Fkh0cgMVDSMprPggczbn5VYo
         2AeQ==
X-Gm-Message-State: ACrzQf35gKbBhHYcoUTlmOZwQpNvED1YJMgQG/e4vJEYFtII7MNkyIba
        /XPW+RN0tFVR9V8WXNYuxXCChg==
X-Google-Smtp-Source: AMsMyM7dhnU1K9hukcn95YVuWGVu5LA5Bt+XPOoY3OKL7aWIGI8OTGW3VT2EJsGjF80hrfyoCag0wQ==
X-Received: by 2002:a62:1482:0:b0:55f:eb9a:38b2 with SMTP id 124-20020a621482000000b0055feb9a38b2mr11535532pfu.29.1664822351896;
        Mon, 03 Oct 2022 11:39:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v62-20020a626141000000b0054097cb2da6sm7726006pfb.38.2022.10.03.11.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 11:39:11 -0700 (PDT)
Date:   Mon, 3 Oct 2022 11:39:10 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc:     x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
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
        "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V . Shankar" <ravi.v.shankar@intel.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        joao.moreira@intel.com, John Allen <john.allen@amd.com>,
        kcc@google.com, eranian@google.com, rppt@kernel.org,
        jamorris@linux.microsoft.com, dethoma@microsoft.com
Subject: Re: [PATCH v2 22/39] mm: Don't allow write GUPs to shadow stack
 memory
Message-ID: <202210031134.B0B6B37@keescook>
References: <20220929222936.14584-1-rick.p.edgecombe@intel.com>
 <20220929222936.14584-23-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929222936.14584-23-rick.p.edgecombe@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 29, 2022 at 03:29:19PM -0700, Rick Edgecombe wrote:
> [...]
> Still allow FOLL_FORCE to write through shadow stack protections, as it
> does for read-only protections.

As I asked in the cover letter: why do we need to add this for shstk? It
was a mistake for general memory. :P

> [...]
> diff --git a/mm/gup.c b/mm/gup.c
> index 5abdaf487460..56da98f3335c 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1043,7 +1043,7 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
>  		return -EFAULT;
>  
>  	if (write) {
> -		if (!(vm_flags & VM_WRITE)) {
> +		if (!(vm_flags & VM_WRITE) || (vm_flags & VM_SHADOW_STACK)) {
>  			if (!(gup_flags & FOLL_FORCE))
>  				return -EFAULT;
>  			/*

How about this instead:

  		return -EFAULT;
  
 	if (write) {
+		if (vm_flags & VM_SHADOW_STACK)
+			return -EFAULT;
 		if (!(vm_flags & VM_WRITE)) {
 			if (!(gup_flags & FOLL_FORCE))
 				return -EFAULT;


-- 
Kees Cook
