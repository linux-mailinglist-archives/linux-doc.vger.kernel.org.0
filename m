Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 733516413A5
	for <lists+linux-doc@lfdr.de>; Sat,  3 Dec 2022 03:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235152AbiLCCn1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 2 Dec 2022 21:43:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234309AbiLCCn0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Dec 2022 21:43:26 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EB22CE36
        for <linux-doc@vger.kernel.org>; Fri,  2 Dec 2022 18:43:25 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id n3so2285645pfq.10
        for <linux-doc@vger.kernel.org>; Fri, 02 Dec 2022 18:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X/PM/ivVkW0jUG/czVpW7oWD1ho2PznSORqfUymBhy0=;
        b=BHC6VeRwJG5T8EtepfIwQCAz4f9/KMXxVhufdafNbwx34sQ2cfpog8dPrmfZytxgHw
         NwiHwbtRX1tNbYxQIDHSiKl/7Lb7dxQ25uXaOLiSD58djV8k9k9R7+J6HxJOnapfIbj+
         ZhXmuaM7yhrvC8Agryx8O++LaWvytYXU7+iAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/PM/ivVkW0jUG/czVpW7oWD1ho2PznSORqfUymBhy0=;
        b=QqJib+ImSG47rwje5kigjWpp5U1lgwdf8Bss3pu0ANq7XR9Da6nUiISr1yxuvY4crV
         iiGAgCoQr3OREH/WK7/iD2WSw66Z3d/M94C0RUrmDvVxGYmWw8EHOCYPKMmd6e3Mb4hT
         0uQtAj/Wy3aOloA98OBWfGl5jphOuhtO1AiA/5E+2NPSjT/7jOMrPaCZh1LFJkSsPEjk
         A4XLRcf0iC0OhLarexu3K7ZYXachJ2Oc5oHnxA4c8EqGsX4nKcEmXRPfftQ4rUmwGSAk
         c7GO8Ur9itmfh4JBNq6omgAnV6qfdEbZvBus7MIo/ARe8vk2Na4uQWI6k8iG+LANRZnD
         gT+w==
X-Gm-Message-State: ANoB5pmArTrXBz2sCo1FIBiloTEzZj4YMDBRc/T2Cn5qsKuupOSRS86W
        lE/u5IC/4U/qwUuyrWHjIU8C/Q==
X-Google-Smtp-Source: AA0mqf67lnVWRQXMh/AnnxK9m37yXIew2nPrJP0zGiZF9Jg3GWVCVk2zapCjUdbyQSdpkIJPLM0Djg==
X-Received: by 2002:a65:560a:0:b0:477:382d:dd38 with SMTP id l10-20020a65560a000000b00477382ddd38mr47494099pgs.264.1670035405043;
        Fri, 02 Dec 2022 18:43:25 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q24-20020aa78438000000b00576984617b1sm269014pfn.60.2022.12.02.18.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 18:43:24 -0800 (PST)
Date:   Fri, 2 Dec 2022 18:43:23 -0800
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
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        John Allen <john.allen@amd.com>, kcc@google.com,
        eranian@google.com, rppt@kernel.org, jamorris@linux.microsoft.com,
        dethoma@microsoft.com, akpm@linux-foundation.org,
        Andrew.Cooper3@citrix.com, christina.schimpe@intel.com,
        Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [PATCH v4 26/39] x86/shstk: Add user-mode shadow stack support
Message-ID: <202212021843.89B0A2DBE1@keescook>
References: <20221203003606.6838-1-rick.p.edgecombe@intel.com>
 <20221203003606.6838-27-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221203003606.6838-27-rick.p.edgecombe@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 02, 2022 at 04:35:53PM -0800, Rick Edgecombe wrote:
> From: Yu-cheng Yu <yu-cheng.yu@intel.com>
> 
> Introduce basic shadow stack enabling/disabling/allocation routines.
> A task's shadow stack is allocated from memory with VM_SHADOW_STACK flag
> and has a fixed size of min(RLIMIT_STACK, 4GB).
> 
> Keep the task's shadow stack address and size in thread_struct. This will
> be copied when cloning new threads, but needs to be cleared during exec,
> so add a function to do this.
> 
> Do not support IA32 emulation or x32.
> 
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Tested-by: John Allen <john.allen@amd.com>
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
