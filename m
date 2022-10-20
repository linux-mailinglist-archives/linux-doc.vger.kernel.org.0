Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 612C5606BB3
	for <lists+linux-doc@lfdr.de>; Fri, 21 Oct 2022 00:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbiJTWy7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 20 Oct 2022 18:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbiJTWy4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 18:54:56 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F9E468CD3
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 15:54:51 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id h13so890319pfr.7
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 15:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XWJxeWTUeSOc8Yughfud6jj7osnbJGAbeWyZP3k0hEY=;
        b=cGhvA8iP7rFaXRFGd2R3CI8wKqWii9PAuPYhya6Pr4bKI8Jufzi+cTh5OP14yjnmJ7
         ClbX/F9BejWHlmzE560ksS0K69mPV1K4eJCkpRW5nyuATHeI8ai1DFXcbnOPOd+csOMt
         sClbbYCNFvi7t9Pqc0L8/IlFjfcZDUsQiv8ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWJxeWTUeSOc8Yughfud6jj7osnbJGAbeWyZP3k0hEY=;
        b=dPOM022kvOCG2DRKVcm4QTsnX4g7J15KqIlwHKFEf7/FTQ8tOVQkdSytINFOvKZQFJ
         TgHWVJNULGx6B3Uzn6rcih9UViWwnrgWGiZW0e3JSV8eOgIVkQpGIO/ogh+RTlmgTkyN
         33mx2ky8ICg4K0ThCCWi66VfKnZCZBlH3y1Daz7sbSI1GOuM3FhrJk6EkhBIWEy0hYln
         Qri6wE/FiUa1793LuzlxfL8cj/U84bjNLlT6bk2XSugAKgJEUOxlTKyvC/9cVZ3ReowM
         sCopIsq270/L67yeZPj6vAHhT0tp+T4wcuq+9vjXZm5rKbGRdsUUX1eIihqzwTal1Pcb
         tlUg==
X-Gm-Message-State: ACrzQf3gnHM0BnAhu1mvWA9pgbXK6FgE5U86O9dyfQAyrKSO+qMHo7hv
        +xirlNBdpoiPgAC31OAGWV8qHQ==
X-Google-Smtp-Source: AMsMyM5emkUOqmzPNcgzNrTa89ewSotrbfmttSTIhPsGGLHnEWLFyH8YwEsVl1fjDMyZFpPl+BA2zQ==
X-Received: by 2002:a62:ea09:0:b0:562:a86f:63af with SMTP id t9-20020a62ea09000000b00562a86f63afmr16613837pfh.71.1666306491075;
        Thu, 20 Oct 2022 15:54:51 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id ix6-20020a170902f80600b0017691eb7e17sm13273549plb.239.2022.10.20.15.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 15:54:50 -0700 (PDT)
Date:   Thu, 20 Oct 2022 15:54:49 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc:     "bsingharora@gmail.com" <bsingharora@gmail.com>,
        "hpa@zytor.com" <hpa@zytor.com>,
        "Syromiatnikov, Eugene" <esyr@redhat.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "Yu, Yu-cheng" <yu-cheng.yu@intel.com>,
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
Subject: Re: [PATCH v2 24/39] x86/cet/shstk: Add user-mode shadow stack
 support
Message-ID: <202210201553.8CE1524C5@keescook>
References: <20220929222936.14584-1-rick.p.edgecombe@intel.com>
 <20220929222936.14584-25-rick.p.edgecombe@intel.com>
 <202210031203.EB0DC0B7DD@keescook>
 <d555c95554996acaf22c407e11a3daca5db141f7.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d555c95554996acaf22c407e11a3daca5db141f7.camel@intel.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 20, 2022 at 09:29:38PM +0000, Edgecombe, Rick P wrote:
> The code used to use shstk->base and shstk->size to keep track of if
> shadow stack was enabled. I'm not sure why to zero it now. Just
> defensively or did you see a concrete issue?

Just to be defensive. It's not fast path by any means, to better to
have values that make a bit of sense there. *shrug* It just stood out
as feeling "missing" while I was reading the code.

-- 
Kees Cook
