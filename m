Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA991641378
	for <lists+linux-doc@lfdr.de>; Sat,  3 Dec 2022 03:34:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235171AbiLCCea (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 2 Dec 2022 21:34:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235211AbiLCCe0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Dec 2022 21:34:26 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC5D5F9E2E
        for <linux-doc@vger.kernel.org>; Fri,  2 Dec 2022 18:34:22 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id f9so5836582pgf.7
        for <linux-doc@vger.kernel.org>; Fri, 02 Dec 2022 18:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZO9EQfENAwfe5IE7Ju6A4A1JevIMxb0gNE4/cvCkwk=;
        b=bZhPZLzaUJWjoiiQ0jtjANhKr0iyX1e0uNG49etJ1ffWLpKLJWwcXc84+guaypsl2A
         PjNDYu6sq7/NhXTAN1lBIp+zdvO9hB7UzRhMwC5VpDg0Hre5BtWmGUPdPFbZzI3sRhRf
         q4LqAwlrDWT2cQe+jeZ47UPoQQQDyEaLB+62w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZO9EQfENAwfe5IE7Ju6A4A1JevIMxb0gNE4/cvCkwk=;
        b=28idYw3h9IHwgyx7fXXK/SxTgIV19Ta/uSIhtg/qpFcIOugqNJHi59sw3SazkmF/ao
         PO+w7U8Z5G0GupOg5PZP/a+Xg4WMrSnGQsglh1EUCG2DFjYyPz9rns2+urYkfj55u4n9
         jcXwDFqX+0FZiFzFZSuTj5lr8RgO/ipR5zo2WjotqkQwC3LW6IEByNLuIKO+AydDLKK0
         Uv1Yfc7UXkSR292DVz53MO2pp87hifUzvTDF7r+/XqwbzIfCxPUL9Ed3GpBPX34z30sM
         Pn3ZkgMaAO/kwZhZQxbe14rUnGx0ntWZUCK3QFZOCXBTLwQLm1npEkA7AUpdKyCtco8S
         Aexw==
X-Gm-Message-State: ANoB5pm+vb1WDjt4du6biP0E11GPBnOkFptIzZz39Oi6hSgWF7mqTl5I
        GzF5V4lbZydahw3C9zfEu3yVNQ==
X-Google-Smtp-Source: AA0mqf4mKN6Zf9amKvtLE7G+OstIEuXv9ZvjBZH+Lsz+I5pkp/mARSH/gPpqWxQoI1ofPNBJm2wDiQ==
X-Received: by 2002:aa7:9245:0:b0:571:3fb3:9b5f with SMTP id 5-20020aa79245000000b005713fb39b5fmr75199209pfp.86.1670034862394;
        Fri, 02 Dec 2022 18:34:22 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id ij19-20020a170902ab5300b0018685257c0dsm6213889plb.58.2022.12.02.18.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 18:34:22 -0800 (PST)
Date:   Fri, 2 Dec 2022 18:34:21 -0800
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
Subject: Re: [PATCH v4 15/39] mm: Introduce VM_SHADOW_STACK for shadow stack
 memory
Message-ID: <202212021834.DC29FAC1@keescook>
References: <20221203003606.6838-1-rick.p.edgecombe@intel.com>
 <20221203003606.6838-16-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221203003606.6838-16-rick.p.edgecombe@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 02, 2022 at 04:35:42PM -0800, Rick Edgecombe wrote:
> From: Yu-cheng Yu <yu-cheng.yu@intel.com>
> 
> The x86 Control-flow Enforcement Technology (CET) feature includes a new
> type of memory called shadow stack. This shadow stack memory has some
> unusual properties, which requires some core mm changes to function
> properly.
> 
> A shadow stack PTE must be read-only and have _PAGE_DIRTY set. However,
> read-only and Dirty PTEs also exist for copy-on-write (COW) pages. These
> two cases are handled differently for page faults. Introduce
> VM_SHADOW_STACK to track shadow stack VMAs.
> 
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Tested-by: John Allen <john.allen@amd.com>
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
