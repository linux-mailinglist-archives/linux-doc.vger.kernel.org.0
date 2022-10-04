Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCB35F3BFA
	for <lists+linux-doc@lfdr.de>; Tue,  4 Oct 2022 06:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbiJDEFN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Oct 2022 00:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiJDEFI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Oct 2022 00:05:08 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D4B12A9F
        for <linux-doc@vger.kernel.org>; Mon,  3 Oct 2022 21:05:06 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 2so6095315pgl.7
        for <linux-doc@vger.kernel.org>; Mon, 03 Oct 2022 21:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=rlkPZtF7+K01teV+qG5sp8ViMTTB6RT0WVQ9H3WnvE4=;
        b=as3TWS6vBJAwdPKL7Ajuqj38rPxasTcQIh1irqo0CAA7cvBEF+uAJRGRPyZKmUniFK
         hZH9s6Hq0G3/ziJ96FzcfD7oyvL2sBn0E+cWJKokpn1/rON4zoBi86CQsJLEnWjkHwNR
         Jfgemw+H/hgCiW8ZpRt/KFghtfuPy7nCx3ctg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=rlkPZtF7+K01teV+qG5sp8ViMTTB6RT0WVQ9H3WnvE4=;
        b=GJI3YHXNiV/DfI/AxzpDZUcg8Jciq5zpBYru4fI0HGXMxCRz6O+eSsZw3Bq81qWdJk
         Z+XtEvqUT6EyJ3tHYWlxL9D2t+E64nlW/j9uZNjrUfBSYiTS6KZykVqoOhwNNox2vZbV
         3rDGEbRh6F/DxV/t6V9zoE0yD3AyC+e7/NkbXBKcaZ3BiGGBP3noxnyscFcqA3mTlNii
         KnL2Cqi1BJRwx+0sAq4cASpIxxJcUWIrVXDRkwUPZ8msl3+/XaEN4WuDYZC6sIBsZk09
         pqK8B2ZU76wIxfx1hyTNAzD7sofnHuj9WAe6GprdEz+byS+uqMErxlrcYFItmFLSrZSh
         Me7w==
X-Gm-Message-State: ACrzQf3d/J2n2U+zVUXxF9Y0de6qqyYq8CTeNTARV4d8JDEBoc6dQD51
        a7p0rfr6YFMG2RUawZ5vlNW3rA==
X-Google-Smtp-Source: AMsMyM6Ha442SkRQ6wKXMX6e1qRe1PBeZzv9qyIqdVkVOMiMZugJD0MtKhgFiqaiyI1c30RP7vQhzg==
X-Received: by 2002:a63:1a53:0:b0:44d:e5ba:5acf with SMTP id a19-20020a631a53000000b0044de5ba5acfmr7673606pgm.461.1664856306515;
        Mon, 03 Oct 2022 21:05:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 127-20020a621585000000b0056179d750efsm2665145pfv.103.2022.10.03.21.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 21:05:05 -0700 (PDT)
Date:   Mon, 3 Oct 2022 21:05:04 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc:     "bsingharora@gmail.com" <bsingharora@gmail.com>,
        "hpa@zytor.com" <hpa@zytor.com>,
        "Syromiatnikov, Eugene" <esyr@redhat.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
        "Eranian, Stephane" <eranian@google.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "fweimer@redhat.com" <fweimer@redhat.com>,
        "nadav.amit@gmail.com" <nadav.amit@gmail.com>,
        "jannh@google.com" <jannh@google.com>,
        "dethoma@microsoft.com" <dethoma@microsoft.com>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "kcc@google.com" <kcc@google.com>, "bp@alien8.de" <bp@alien8.de>,
        "oleg@redhat.com" <oleg@redhat.com>,
        "hjl.tools@gmail.com" <hjl.tools@gmail.com>,
        "Yang, Weijiang" <weijiang.yang@intel.com>,
        "Lutomirski, Andy" <luto@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>, "arnd@arndb.de" <arnd@arndb.de>,
        "Moreira, Joao" <joao.moreira@intel.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "jamorris@linux.microsoft.com" <jamorris@linux.microsoft.com>,
        "john.allen@amd.com" <john.allen@amd.com>,
        "rppt@kernel.org" <rppt@kernel.org>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "Shankar, Ravi V" <ravi.v.shankar@intel.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
        "gorcunov@gmail.com" <gorcunov@gmail.com>
Subject: Re: [PATCH v2 06/39] x86/fpu: Add helper for modifying xstate
Message-ID: <202210032104.A1029D23@keescook>
References: <20220929222936.14584-1-rick.p.edgecombe@intel.com>
 <20220929222936.14584-7-rick.p.edgecombe@intel.com>
 <202210031045.419F7DB396@keescook>
 <e0b3662ac478a7d2ae1991e8c674732592c2ea88.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0b3662ac478a7d2ae1991e8c674732592c2ea88.camel@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 03, 2022 at 08:05:13PM +0000, Edgecombe, Rick P wrote:
> On Mon, 2022-10-03 at 10:48 -0700, Kees Cook wrote:
> > > The easiest way to modify supervisor xfeature data is to force
> > > restore
> > > the registers and write directly to the MSRs. Often times this is
> > > just fine
> > > anyway as the registers need to be restored before returning to
> > > userspace.
> > > Do this for now, leaving buffer writing optimizations for the
> > > future.
> > 
> > Just for my own clarity, does this mean lock/load _needs_ to happen
> > before MSR access, or is it just a convenient place to do it? From
> > later
> > patches it seems it's a requirement during MSR access, which might be
> > a
> > good idea to detail here. It answers the question "when is this
> > function
> > needed?"
> 
> The CET state is xsaves managed. It gets lazily restored before
> returning to userspace with the rest of the fpu stuff. This function
> will force restore all the fpu state to the registers early and lock
> them from being automatically saved/restored. Then the tasks CET state
> can be modified in the MSRs, before unlocking the fpregs. Last time I
> tried to modify the state directly in the xsave buffer when it was
> efficient, but it had issues and Thomas suggested this.

Okay, gotcha. Thanks!

-- 
Kees Cook
