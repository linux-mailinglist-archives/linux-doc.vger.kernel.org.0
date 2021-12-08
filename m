Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55BAC46DB57
	for <lists+linux-doc@lfdr.de>; Wed,  8 Dec 2021 19:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239158AbhLHSoS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 8 Dec 2021 13:44:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbhLHSoR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Dec 2021 13:44:17 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A81C0617A2
        for <linux-doc@vger.kernel.org>; Wed,  8 Dec 2021 10:40:45 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id n8so2122430plf.4
        for <linux-doc@vger.kernel.org>; Wed, 08 Dec 2021 10:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2esW1PgwMW/uPgw9HwrxttsSErnSmH0L2IFPbegvGZ0=;
        b=JMOFGrTmIpVxHPJ19wMiBSNYvcNn4mkwdiP01+P4qAv6w5oI848W7a5nKo+HHiDamf
         CgyZySrRXpQx35cciVcOAxORaZROKTbyhnq+6dGXPeuaQ9G8lTZTcs/HqoYeQzXCeexR
         aC9M7oj8N1uyoTJ22SaBHVyL5KYIF8eEEza3rwrcm0tUVNfMiPP2T3MGPsbj1wRgZt7U
         yInbZBE080qCbZs6+hPqLbNUFvRWtbFpScL2EaazzzSdx7i0fnJJduDEOJ63fYHIBkTj
         9yUVsVEvoODMCxiJ70Aa8yw9QZ5ML8PdSzvcy2YO1vi25xxf+y5wlWSsG9EhFMRNTiWO
         oeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2esW1PgwMW/uPgw9HwrxttsSErnSmH0L2IFPbegvGZ0=;
        b=2us1Y8QsHvhNfZIcejz0XMqw8JuEcyqqFg9cYc9/j14gv5BLw/HljgT9PrcV6P3jzx
         3g6I7v7b9ULkiWZ742smoveFfr3Z7O0NTlrfRU2L/ibYn4RXh0Y1bWhgTITErLU9m7Tt
         PZDuUN7WTNzMf6hainTH7PYhXb0MMHgSoqGrxGfepHhpM6aQlBrFizlfRyL8xIXNCltN
         5WwHiKymAaj2wPm2aI0qOSGbYPtxi2OqLSv8vuUTM1R6TIxKonbeG6c6e0bTpNRYEzIP
         VL9hULRHcnh1H0iHgwKENLYcbtwYGNR65OShEl5y1GJM3VIfZaYJgT7I+Mc7SXzCqn0H
         qDVg==
X-Gm-Message-State: AOAM530lL2iPGaF5uRZrHC3t3LU6aypaJaD5mfwCQ1umzkgMYoqPuleD
        rPf+ED4bYGpIxLNznnNiXKtzGg==
X-Google-Smtp-Source: ABdhPJzClCXWnuOKDKj88Rz4E8jDDb4uaV82hAB72j9+tDfCTT3P2Gq1tWJQXULxbEHjlyKhl7uk0Q==
X-Received: by 2002:a17:902:e302:b0:141:af98:b5ea with SMTP id q2-20020a170902e30200b00141af98b5eamr60821172plc.53.1638988845033;
        Wed, 08 Dec 2021 10:40:45 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id r16sm3294860pgk.45.2021.12.08.10.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 10:40:44 -0800 (PST)
Date:   Wed, 8 Dec 2021 18:40:40 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Li Yu <liyu.yukiteru@bytedance.com>
Cc:     pbonzini@redhat.com, Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org
Subject: Re: [PATCH v3] KVM: x86/mmu: Warn on iTLB multi-hit for possible
 problems
Message-ID: <YbD8KFaY+emLQR+d@google.com>
References: <YW7w8g+65PjGs2wc@google.com>
 <20211020043131.1222542-1-liyu.yukiteru@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020043131.1222542-1-liyu.yukiteru@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 20, 2021, Li Yu wrote:
> Warn for guest huge pages split if iTLB multi-hit bug is present
> and CPU mitigations is enabled.
> 
> Warn for possible CPU lockup if iTLB multi-hit bug is present but
> CPU mitigations is disabled.
> 
> Signed-off-by: Li Yu <liyu.yukiteru@bytedance.com>
> ---

Gah, my last reply in the previous version was offlist.  I would like an answer
to the below question before we complicate KVM just to log a message.

On Wed, Oct 20, 2021 at 12:51 PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Wed, Oct 20, 2021, Li Yu wrote:
> > On 2021/10/20 00:23, Sean Christopherson wrote:
> > I think it is necessary to log something when `nx_huge_pages` is `auto` or
> > `off`, and the bug is present.
>
> Why is it necessary?  Specifically, what action can be taken based on KVM logging
> that can't reasonably be taken based on all the other information provided by the
> kernel?  We should teach userspace to go look at the vulnerabilites info, not to
> scrape the kernel log.
