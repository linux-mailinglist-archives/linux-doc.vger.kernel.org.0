Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D247469C272
	for <lists+linux-doc@lfdr.de>; Sun, 19 Feb 2023 21:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbjBSUmA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 19 Feb 2023 15:42:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231251AbjBSUl6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 19 Feb 2023 15:41:58 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3F318B15
        for <linux-doc@vger.kernel.org>; Sun, 19 Feb 2023 12:41:57 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id ot9so1294089pjb.3
        for <linux-doc@vger.kernel.org>; Sun, 19 Feb 2023 12:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+n51xriYqbsbmvYxxt4ftJ/ywsWPB5yxY3XzOVKdQok=;
        b=HRzIL01EiKj/B1V4WeH7nE3SXQQTw+bANhZZ8/P4v4m9JiU3rQDUDjq7P6TKtP1rny
         vCDVBdBy2yNcsh7+DwfKoYd/3bLIxn7mf2cOxU2YAI1Df8480mfwgGzhWANf1AJ1vmBE
         iifkkTIsXn3XmVPq4cxEpzRJEyv/l4CEuJZOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+n51xriYqbsbmvYxxt4ftJ/ywsWPB5yxY3XzOVKdQok=;
        b=jwhTP4y2LLxS/633UENHQbzk70CZPvhhJRRK7ViyzYzvDfq9lzSFJnmMH4yQgn9VBA
         r9b9UwzUZRypZS9odgFVNjmy4N6UBUz08NvjgsJpKD5XvI/+RHXaB9HALraAJBNuVGwA
         kxnmkLpRwd4i7NtrLblH6RfNL9k27X6AYPjHpArsc47OvPj6hUWW7OKKguMLThktRRRN
         k85cw5rO0RUu/0dvy1lptC4u+ED1u6QrG/CwxiRHX4qu4u9qwDkZSqKHfO/dMyodjatx
         9PFpwMzXEPPGe53Nlevh14nDA3pMcSASS7UzBDeaoSocBn0CJ+1G2f2ttQI6eD+/l9jn
         svpg==
X-Gm-Message-State: AO0yUKUxhvN1+/5+tf73nH5KiZjvgwLL2h1HOgd1SFBL5l+PjZl4ashj
        cUgkJT8gkU+wxOKuY0myuPr5Jg==
X-Google-Smtp-Source: AK7set/hmfWCZDm8xxBH1RGSdTrSPtAkyiRqs8cvWgzZE55+0av+de2ucJ0TWqIBTxeOu8W9SRaPTg==
X-Received: by 2002:a17:902:d502:b0:196:8292:e879 with SMTP id b2-20020a170902d50200b001968292e879mr3763331plg.1.1676839316745;
        Sun, 19 Feb 2023 12:41:56 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a8-20020a1709027e4800b0019a8597788csm829072pln.0.2023.02.19.12.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 12:41:56 -0800 (PST)
Message-ID: <63f28994.170a0220.e86dc.1134@mx.google.com>
X-Google-Original-Message-ID: <202302191241.@keescook>
Date:   Sun, 19 Feb 2023 12:41:55 -0800
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
        david@redhat.com, debug@rivosinc.com
Subject: Re: [PATCH v6 20/41] x86/mm: Teach pte_mkwrite() about stack memory
References: <20230218211433.26859-1-rick.p.edgecombe@intel.com>
 <20230218211433.26859-21-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230218211433.26859-21-rick.p.edgecombe@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 18, 2023 at 01:14:12PM -0800, Rick Edgecombe wrote:
> If a VMA has the VM_SHADOW_STACK flag, it is shadow stack memory. So
> when it is made writable with pte_mkwrite(), it should create shadow
> stack memory, not conventionally writable memory. Now that pte_mkwrite()
> takes a VMA, and places where shadow stack memory might be created pass
> one, pte_mkwrite() can know when it should do this.
> 
> So make pte_mkwrite() create shadow stack memory when the VMA has the
> VM_SHADOW_STACK flag. Do the same thing for pmd_mkwrite().
> 
> This requires referencing VM_SHADOW_STACK in these functions, which are
> currently defined in pgtable.h, however mm.h (where VM_SHADOW_STACK is
> located) can't be pulled in without causing problems for files that
> reference pgtable.h. So also move pte/pmd_mkwrite() into pgtable.c, where
> they can safely reference VM_SHADOW_STACK.
> 
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Is there any realistic performance impact from making these not inline
now?

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
