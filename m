Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88054485BA9
	for <lists+linux-doc@lfdr.de>; Wed,  5 Jan 2022 23:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245006AbiAEWa6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 Jan 2022 17:30:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245047AbiAEWa5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Jan 2022 17:30:57 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A956C061245
        for <linux-doc@vger.kernel.org>; Wed,  5 Jan 2022 14:30:57 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id p8-20020a9d7448000000b005907304d0c5so1015137otk.6
        for <linux-doc@vger.kernel.org>; Wed, 05 Jan 2022 14:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R8KauQjOTjL7fG3lmeOpRMQ51bqKFSDZ2b5LNYI0eks=;
        b=em2Rj/U1B6vmWAAa3M/YItC3qmp3vl4GlkpJ3VM9zHBI3D7kqUBmOPH7gTARuu9dTt
         0yoBofruA0E5OhcqS4nyHHdAQB4iUPQ0mZ080gFhd8mIa4rI4pOdgfAYqfLJKluV0C2c
         +hrgBnUnCo1Txq9rF9eAwGtWeKNSw1mnQ7sV03+0Dd4+kWz1t+uIah+5I6pLKFTnWBnN
         hhCSd10tS2tv834sg9/jAJ6gvpLisukvM8FSwlTnLHAi1cZkE4RoHmcNNjJeBMFt0Jpf
         LYK9bDF4KDsHWq35dDpN7+6k2BkaU1RYr8Lz3O1R5Z4ouBXjQJEBmULJm/zdQ2k02CGt
         wohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R8KauQjOTjL7fG3lmeOpRMQ51bqKFSDZ2b5LNYI0eks=;
        b=U21W0HpkihWR4VDAuJK/WExW6XaQFZm877DcB+sQoxKAiHbJREPOL0oiySRkosximv
         lyWYpgp9M2nhAXsAZCDwd3DdKiPGB27x6kO34BBmJJ8NSHAqGqu9yvmHfgE352PqDHx/
         y/NQwNyywgPtaalc+iP2lqB2Ae9YAPHI5QWHi5dXpyUERD/RUE1OK2XYtOmGQeuxwG6g
         +W1yQyxE2cvE/BbDtA7wGITbc1p8tOJdjelG9mkUdsaGxpCcQlQCH7fEFWngU49yeYIv
         sLfmq9oWiJ5zsRySl0itxjkPjAFOMS0oDb+Pnzkzw1Jj97eH+k7hbajsfYSnV332zkNL
         yMMg==
X-Gm-Message-State: AOAM530juY9DtDfFN07VbfPPH9GDsH+x9jAAZFe1G9aPX6lSRivj8GJs
        ihyUDBzA7rGFmSV01NC5PylUfmnEsRzwStDR54ZGjQ==
X-Google-Smtp-Source: ABdhPJxg/Vy9UcqlwnwKzJ1fgOD7D3jUNM5kolyjpa4Cl5xOqzLVEaNq2AMa4jUWXVgxwwkqhno0EttaUO55zUs+1og=
X-Received: by 2002:a9d:67c1:: with SMTP id c1mr42431489otn.299.1641421856471;
 Wed, 05 Jan 2022 14:30:56 -0800 (PST)
MIME-Version: 1.0
References: <20220105123532.12586-1-yang.zhong@intel.com> <20220105123532.12586-13-yang.zhong@intel.com>
 <YdYaH7buoApEVPOg@google.com>
In-Reply-To: <YdYaH7buoApEVPOg@google.com>
From:   Jim Mattson <jmattson@google.com>
Date:   Wed, 5 Jan 2022 14:30:45 -0800
Message-ID: <CALMp9eQi1xU_YgYBTa=zvAkD8=4WAntSFt6V2zcR6G9eQFg2GQ@mail.gmail.com>
Subject: Re: [PATCH v5 12/21] kvm: x86: Intercept #NM for saving IA32_XFD_ERR
To:     Sean Christopherson <seanjc@google.com>
Cc:     Yang Zhong <yang.zhong@intel.com>, x86@kernel.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, pbonzini@redhat.com, corbet@lwn.net,
        shuah@kernel.org, jun.nakajima@intel.com, kevin.tian@intel.com,
        jing2.liu@linux.intel.com, jing2.liu@intel.com,
        guang.zeng@intel.com, wei.w.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 5, 2022 at 2:22 PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Wed, Jan 05, 2022, Yang Zhong wrote:
> > @@ -6399,6 +6424,26 @@ static void handle_interrupt_nmi_irqoff(struct kvm_vcpu *vcpu,
> >       kvm_after_interrupt(vcpu);
> >  }
> >
> > +static void handle_nm_fault_irqoff(struct kvm_vcpu *vcpu)
> > +{
> > +     /*
> > +      * Save xfd_err to guest_fpu before interrupt is enabled, so the
> > +      * MSR value is not clobbered by the host activity before the guest
> > +      * has chance to consume it.
> > +      *
> > +      * We should not blindly read xfd_err here, since this exception
>
> Nit, avoid "we", and explain what KVM does (or doesn't) do, not what KVM "should"
> do, e.g. just say
>
>          * Do not blindly read ...
>
> > +      * might be caused by L1 interception on a platform which doesn't
> > +      * support xfd at all.
> > +      *
> > +      * Do it conditionally upon guest_fpu::xfd. xfd_err matters
> > +      * only when xfd contains a non-zero value.
> > +      *
> > +      * Queuing exception is done in vmx_handle_exit. See comment there.
>
> Another nit, it's worth explaining why XFD_ERR needs to be read here regardless
> of is_guest_mode().  E.g.
>
>          * Injecting the #NM back into the guest is handled in the standard path
>          * as an #NM in L2 may be reflected into L1 as a VM-Exit.  Read XFD_ERR
>          * even if the #NM is from L2, as L1 may have exposed XFD to L2.

Do we have tests of L1 passing through XFD to L2?
