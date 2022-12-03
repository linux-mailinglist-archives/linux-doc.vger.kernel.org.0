Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62EAD6413C9
	for <lists+linux-doc@lfdr.de>; Sat,  3 Dec 2022 03:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235033AbiLCCxF (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 2 Dec 2022 21:53:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235135AbiLCCxE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Dec 2022 21:53:04 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5E42A266
        for <linux-doc@vger.kernel.org>; Fri,  2 Dec 2022 18:53:01 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id f3so5870434pgc.2
        for <linux-doc@vger.kernel.org>; Fri, 02 Dec 2022 18:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IdsbvopHdpWN4t4Xyy6LXgHJs384GWwdgMIM91slJ/E=;
        b=XT2jmzsk2Vfm9w+DkN1Lz1Tjy71qjWPoao8qtRj3bZrZPfwXB1hyqIpn57pvB90/rq
         63d7fOq2Mmf1kO+vR788ukxfPlAiT1KSgQZg9/z58zWQ7i9nFvKwjhfZPugl3zobOmso
         EN1WafQcrekEIywXwOWjLrHS2LNPk4WBZLGxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdsbvopHdpWN4t4Xyy6LXgHJs384GWwdgMIM91slJ/E=;
        b=V1OlkgCVheySFsWC70139zEARYnSgH2TgszonzLJBKLwOVHlfe806ztVdBrCBy8JyX
         8FYDCpJbxZGrjvwu+9H23Irul32YxMeLAgUu0KLu/T9pepwfVjOQzbhQ+wO2DeeGZe+s
         QRjnPiP1SqUp0faMHBmNUHj2CY5nGQ2708sjEwVusQdcjaUPRVjodwXke8jhT+HwHFHU
         RDeUn0dBQ194u7cLexlKm3mCbN35L1aY8K7CA6Z46JkskAvx0Fg2R5pr3sPanUoY4lOr
         Mz6gVFRJIR/Pq1wTPlaCUKTV/GVMFHNhaN9MxEag2iw3BB2D1nCr8/q9/KXdLRwRQM0e
         fYmQ==
X-Gm-Message-State: ANoB5pmHWlCfxh5+G1wgZzK4MVV5wPud6/GRuHT8XbVGQpSuZjldfYnj
        eJbCKYkUXoYL+5f76GISBemKPQ==
X-Google-Smtp-Source: AA0mqf6LVB3GIyJWeUGBPXDf0PbRYROGSN6hS1j62oC6woS8D14mopgLVA3lzwvQcDRjfAOqKPjecA==
X-Received: by 2002:a05:6a00:1f10:b0:573:578b:e773 with SMTP id be16-20020a056a001f1000b00573578be773mr58396836pfb.11.1670035980821;
        Fri, 02 Dec 2022 18:53:00 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i20-20020a170902e49400b00168dadc7354sm6231569ple.78.2022.12.02.18.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 18:53:00 -0800 (PST)
Date:   Fri, 2 Dec 2022 18:52:59 -0800
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
Subject: Re: [PATCH v4 32/39] x86: Expose thread features in /proc/$PID/status
Message-ID: <202212021852.0EC80A46@keescook>
References: <20221203003606.6838-1-rick.p.edgecombe@intel.com>
 <20221203003606.6838-33-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221203003606.6838-33-rick.p.edgecombe@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 02, 2022 at 04:35:59PM -0800, Rick Edgecombe wrote:
> Applications and loaders can have logic to decide whether to enable
> shadow stack. They usually don't report whether shadow stack has been
> enabled or not, so there is no way to verify whether an application
> actually is protected by shadow stack.
> 
> Add two lines in /proc/$PID/status to report enabled and locked features.
> 
> Since, this involves referring to arch specific defines in asm/prctl.h,
> implement an arch breakout to emit the feature lines.
> 
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Tested-by: John Allen <john.allen@amd.com>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
