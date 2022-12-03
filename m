Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B85F641398
	for <lists+linux-doc@lfdr.de>; Sat,  3 Dec 2022 03:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235150AbiLCCj4 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 2 Dec 2022 21:39:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235044AbiLCCjk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Dec 2022 21:39:40 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F204DFB8AE
        for <linux-doc@vger.kernel.org>; Fri,  2 Dec 2022 18:39:37 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id y4so6265795plb.2
        for <linux-doc@vger.kernel.org>; Fri, 02 Dec 2022 18:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=puHWTnl4FttUivJr2fjCJ+XKoeeB18dHeiV6LUEyyFM=;
        b=Zlq5Fnhl2chjzNVLRCXkgHfNkIE0tfHyjGOMS2CEMjgttw/3wjFdU35d78bA06NTwJ
         r7yHGRy4iqmGmpEYp8tuRXboZ24+1jtm6m8MjiTOPK080wDEO7W6f5LU1UJx6Q81rxqi
         DbM3puGe2/WxwE1s5DHvG5IQfc/FlVtfPm5PE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puHWTnl4FttUivJr2fjCJ+XKoeeB18dHeiV6LUEyyFM=;
        b=XZrO3asY0gvm5XZfLWLDULeE+UNub8+jz7g8KswRXsTmNGiwAb6dh2V3KFaiRUpALX
         48bXPfqAbVtJf1veM5rWgBb5j2n+vc2ViHEhkyiXqKMvDGtY03/XVAVuNy33BOlbOAzG
         sE4AxN7KRGjPYz9Vw7ajyrpTxo5hd1lbKsDfGe8+h/769raSySW5ednDX5Sn7wacriE6
         bsx6Qps0sshwX2F6mjeWDNFopP4cqYnej37OK86J2nsgBODgTw6HMQUtunivbd9Wz+Id
         2d1AKhTbROnWjt+ubwap1m61px6qgkFcFmvWAghRFDMfnVV08qcZFY4IivNm81Z7Kxxv
         tSbQ==
X-Gm-Message-State: ANoB5pnCGTYFNQfhUjR6iqdfA3HC0gzJaiKr04RdsGtBS1t5uWYUG4PX
        JHHIc6pEE6VS8boxOVInVdJ9dQ==
X-Google-Smtp-Source: AA0mqf4dQit9R82se8kWgKsx1FCknHa8rD7qiYgXLaoKAKcCKykz/uB+mYLnym6TuHUG0Vpre+iDAg==
X-Received: by 2002:a17:90b:374f:b0:219:7bc8:f300 with SMTP id ne15-20020a17090b374f00b002197bc8f300mr10681194pjb.145.1670035177500;
        Fri, 02 Dec 2022 18:39:37 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p2-20020a622902000000b00575acb243besm5707003pfp.1.2022.12.02.18.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 18:39:36 -0800 (PST)
Date:   Fri, 2 Dec 2022 18:39:36 -0800
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
        Andrew.Cooper3@citrix.com, christina.schimpe@intel.com
Subject: Re: [PATCH v4 23/39] mm: Don't allow write GUPs to shadow stack
 memory
Message-ID: <202212021839.32C9B178@keescook>
References: <20221203003606.6838-1-rick.p.edgecombe@intel.com>
 <20221203003606.6838-24-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221203003606.6838-24-rick.p.edgecombe@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 02, 2022 at 04:35:50PM -0800, Rick Edgecombe wrote:
> The x86 Control-flow Enforcement Technology (CET) feature includes a new
> type of memory called shadow stack. This shadow stack memory has some
> unusual properties, which requires some core mm changes to function
> properly.
> 
> Shadow stack memory is writable only in very specific, controlled ways.
> However, since it is writable, the kernel treats it as such. As a result
> there remain many ways for userspace to trigger the kernel to write to
> shadow stack's via get_user_pages(, FOLL_WRITE) operations. To make this a
> little less exposed, block writable GUPs for shadow stack VMAs.
> 
> Still allow FOLL_FORCE to write through shadow stack protections, as it
> does for read-only protections.
> 
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Tested-by: John Allen <john.allen@amd.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
