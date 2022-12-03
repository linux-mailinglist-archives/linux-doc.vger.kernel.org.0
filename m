Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF4D64138B
	for <lists+linux-doc@lfdr.de>; Sat,  3 Dec 2022 03:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235051AbiLCCif (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 2 Dec 2022 21:38:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235068AbiLCCid (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Dec 2022 21:38:33 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B320EC08C
        for <linux-doc@vger.kernel.org>; Fri,  2 Dec 2022 18:38:33 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id h193so5827191pgc.10
        for <linux-doc@vger.kernel.org>; Fri, 02 Dec 2022 18:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gY59Fkmvz/8ABweO9p7GPk5PRE6er0EUBOixMOBIZII=;
        b=augaWf6GXd9U6BdDDe7DQtiyBUROf4u8aSOBMTvbdV9soqeHINlVqORoAlWlcSnFIJ
         A6G/rau+z3mESfnnELYgyGtAiSBOoqnQRoNFR81xieE0Lun+vc/zzKgMALA5H3YgRR+h
         uPPpnIPsKxYgFZlcIItboAh8jK9HLc9g/yUos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gY59Fkmvz/8ABweO9p7GPk5PRE6er0EUBOixMOBIZII=;
        b=4qEboD6xGdhjXAWrMBSCziGhgagM//6auKVJiDu9H+cjQsJTIGODLGCYs+c9FTln3b
         5zg0eriGtjBOOn4yWK8jEiTClDAqHfUlG8vzgF1deQEjQNevl4dOYL5Uu//hAJ+seQbl
         Or4T6Mvi+WI9EXT9mWzm8FOKFAxgTj2byH2tnhdQnQ50DS9DwQhJXv0+vtCcvGh+/DTg
         jreEOcOF3b5VMt0ddRml3rHxQfsvM8PRGbnUUDRu6EpkyIs86T0n9fPL9RCoVaqVmIf4
         0Kne66ZE3NM383dWW80zJBH4Jqt4Duc8wHDvKVqFK7BOoE1L7wqNJp7atHp1D4WfRWkT
         bmaA==
X-Gm-Message-State: ANoB5pntYhMLhXHtJPYxb66FZYyup+tTln//J26xWy7G3MRnQ5Lim0uI
        1u8QmLZFtO06TUG8Ciihu3J51Q==
X-Google-Smtp-Source: AA0mqf6WTehuBNCmz0UyKCIFRRqKtrKxlHeTLSUldJI0j/UdtIvxFRjDpcmmJNpeC3TH41FOco9P2g==
X-Received: by 2002:a63:f506:0:b0:470:14fa:a294 with SMTP id w6-20020a63f506000000b0047014faa294mr47726112pgh.361.1670035112600;
        Fri, 02 Dec 2022 18:38:32 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y25-20020aa79af9000000b0055f209690c0sm5739192pfp.50.2022.12.02.18.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 18:38:32 -0800 (PST)
Date:   Fri, 2 Dec 2022 18:38:31 -0800
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
Subject: Re: [PATCH v4 21/39] mm/mprotect: Exclude shadow stack from
 preserve_write
Message-ID: <202212021838.E8645AD@keescook>
References: <20221203003606.6838-1-rick.p.edgecombe@intel.com>
 <20221203003606.6838-22-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221203003606.6838-22-rick.p.edgecombe@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 02, 2022 at 04:35:48PM -0800, Rick Edgecombe wrote:
> From: Yu-cheng Yu <yu-cheng.yu@intel.com>
> 
> The x86 Control-flow Enforcement Technology (CET) feature includes a new
> type of memory called shadow stack. This shadow stack memory has some
> unusual properties, which requires some core mm changes to function
> properly.
> 
> In change_pte_range(), when a PTE is changed for prot_numa, _PAGE_RW is
> preserved to avoid the additional write fault after the NUMA hinting fault.
> However, pte_write() now includes both normal writable and shadow stack
> (Write=0, Dirty=1) PTEs, but the latter does not have _PAGE_RW and has no
> need to preserve it.
> 
> Exclude shadow stack from preserve_write test, and apply the same change to
> change_huge_pmd().
> 
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Tested-by: John Allen <john.allen@amd.com>
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
