Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1175255B1
	for <lists+linux-doc@lfdr.de>; Thu, 12 May 2022 21:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358009AbiELT1Q (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 12 May 2022 15:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350422AbiELT1P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 May 2022 15:27:15 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B545B49911
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 12:27:12 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id j10-20020a17090a94ca00b001dd2131159aso8785555pjw.0
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 12:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WD9f8NZclyvL/TGsiBp0JtJ2J04vFPjve2IcgvH1Te0=;
        b=TtoJf0EMG2z4xJNlFEjfpfTvKbRWMYnVfsaFF9dey7ZcDXRn6VB9ETgO30AyVeRTsM
         smmFFyzjm9XizVirhKHZln56waUVWQlc04Y1je/FD79vJqBqbneR2v4UIjQiAy+t6ogN
         eWqfa3xtGpC9b19Jq2oG4beo1INx6x7KF4aQpBv1htCSofsxHlzub90F7bpDfIHMMdU9
         hkl5zyMpX801u/PY1y1i2Y1D7b29irNOOQ3/3hsJt8WFOBOcAicBYffiFZKQbsP/fC9G
         cYLbVMQl8mvITMKWfIFWb7i4HhEHgkwVOFLQGgcyrBGhTh0AHHupOHKh+zMEZqPut3TA
         /8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WD9f8NZclyvL/TGsiBp0JtJ2J04vFPjve2IcgvH1Te0=;
        b=gt4Va1uykRbOMBtY7y7/fhV1uA7lU1yy2uJ8WQoOjpvd738YWBG5/V8LuoiKK6N6R2
         9xnm87r0SgMrRtyom3RMqBfuCkmuYmeB/uUwXfs/jQdy2a86Fe4U1dmAWsnYNgT62bdo
         DjSaXnFv0Xyi9KPEuEWdmlRQBs7aYvusRL0N8wQ13+b2twmabEPsF9/suizXmkTIXOW4
         dGgyAiJ0IlxJbUbQX8ViRK2Lh4lmgdIdbV8pNnOZodMxSUQuMxub9htnQhz703MO/ktd
         Y0F4rz3uP9tm8Mm6UeBAyRr+8bGrfM2K4IwDnlh0sKLQshiJe0s/Jsbkb1F3FCZx8z2i
         ssQQ==
X-Gm-Message-State: AOAM531QbWz03fyTnuKjOWaAzkjMVKYoLIbsg8amY7CYqQiZIkwzgvXR
        GDQtwje6zv8OYCUFjyST5BXrcw==
X-Google-Smtp-Source: ABdhPJwQhX+K4SaB/SQwYnYT492MMove7nu1ofptwA+g1lHneg+HJedyoPLLP1mnOx5J9zGXB4w3pQ==
X-Received: by 2002:a17:902:7d93:b0:14d:d401:f59b with SMTP id a19-20020a1709027d9300b0014dd401f59bmr1389200plm.14.1652383632054;
        Thu, 12 May 2022 12:27:12 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id e13-20020a170902ed8d00b0015e8d4eb1fcsm292912plj.70.2022.05.12.12.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 12:27:11 -0700 (PDT)
Date:   Thu, 12 May 2022 19:27:08 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Jon Kohler <jon@nutanix.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Kees Cook <keescook@chromium.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Kim Phillips <kim.phillips@amd.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ashok Raj <ashok.raj@intel.com>,
        KarimAllah Ahmed <karahmed@amazon.de>,
        David Woodhouse <dwmw@amazon.co.uk>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v4] x86/speculation, KVM: remove IBPB on vCPU load
Message-ID: <Yn1fjAqFoszWz500@google.com>
References: <20220512184514.15742-1-jon@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512184514.15742-1-jon@nutanix.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 12, 2022, Jon Kohler wrote:
> Remove IBPB that is done on KVM vCPU load, as the guest-to-guest
> attack surface is already covered by switch_mm_irqs_off() ->
> cond_mitigation().
> 
> The original commit 15d45071523d ("KVM/x86: Add IBPB support") was simply
> wrong in its guest-to-guest design intention. There are three scenarios
> at play here:

Jim pointed offline that there's a case we didn't consider.  When switching between
vCPUs in the same VM, an IBPB may be warranted as the tasks in the VM may be in
different security domains.  E.g. the guest will not get a notification that vCPU0 is
being swapped out for vCPU1 on a single pCPU.

So, sadly, after all that, I think the IBPB needs to stay.  But the documentation
most definitely needs to be updated.

A per-VM capability to skip the IBPB may be warranted, e.g. for container-like
use cases where a single VM is running a single workload.
