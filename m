Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 823CF558124
	for <lists+linux-doc@lfdr.de>; Thu, 23 Jun 2022 18:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbiFWQ4h (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 23 Jun 2022 12:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232845AbiFWQsh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jun 2022 12:48:37 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1830D4D256
        for <linux-doc@vger.kernel.org>; Thu, 23 Jun 2022 09:47:36 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id m14so18650318plg.5
        for <linux-doc@vger.kernel.org>; Thu, 23 Jun 2022 09:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3p8qkhhjZhB0PmtULtzk5+YvtFjhA5CPcKFCG5vG65E=;
        b=Y27BijteckmP4YbkgXlxhLDVpaMo1TcD7Wf3jMh77zBbeUqzgcl36shROKvYPKizD3
         5jV3q0VKzONJLuyaiZjBu9depsn8jAMFosX9xAhqhpAidZW7G/m3se9SH3d6mAoLE252
         OzQ2NUNXM1m69JDzfgvPjmHWN1PDFHRcERTCq3K/I4W5m1W3UjxDSNsnRONwyulrRBsv
         EfIDeAhXgy+CzqEQQbJd5K8ZyqoyWQw2CeQaGi2ocn6okkwkUS2ZLVDii/WjfKoX0x+H
         dnleGF1Kp323ACyCrdtuNwwRVid6zeWGfblKCTJryNXLKB8f052GPrTMt0yI5L79zCb/
         rsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3p8qkhhjZhB0PmtULtzk5+YvtFjhA5CPcKFCG5vG65E=;
        b=ZTQ9jBRG7XGzIaVFWkt3i91ZA+yjYHztH0caVM7PsM5lpfiA+53XbW8jQPGEQ9iVdr
         lZf3f/BWHazyj1/8V8Ws9MAC+NeppF1PxrE3k609Nk/7zXjAgc3BbD0WymiXlmBmSqeM
         wsZ/wVth/xM7sC8o9ZthHofB5x6zBf8gIWIgr8RE8BB8g+7m0w0CeOk8noxqn/gmX5AN
         PJiryG5ipwcqlOm6vx5FLgmI96hLpocqHpEpb8w2qsDk+LWIX5gRiKb0Gh3ajfJfT/Oy
         7GNrHuh4tlRiGA6qm0eT2qu1RWAOpV2yfAc9ffwvxsAVrSBpzPMEqXuK5ogKSbI/FKUp
         nrlA==
X-Gm-Message-State: AJIora9kLraT0VBxvht9c+C7/4if9g2HJTWTPbGlnvfbF9zGdJdf/+FM
        VUtLAnDYux1zfrsxyzmxjCDzoA==
X-Google-Smtp-Source: AGRyM1snamOVcPng7Bv62NxMa7Q+d7JiT2gnpWxydw8csrKZ0vY2muyBHwqn9PGw8O5i4TYDqJn41g==
X-Received: by 2002:a17:90b:4b8f:b0:1ec:e852:22c7 with SMTP id lr15-20020a17090b4b8f00b001ece85222c7mr4903909pjb.38.1656002856050;
        Thu, 23 Jun 2022 09:47:36 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id v5-20020a17090a0c8500b001e2da6766ecsm2175967pja.31.2022.06.23.09.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 09:47:35 -0700 (PDT)
Date:   Thu, 23 Jun 2022 16:47:31 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     Grzegorz Jaszczyk <jaz@semihalf.com>, linux-kernel@vger.kernel.org,
        Dmytro Maluka <dmy@semihalf.com>,
        Zide Chen <zide.chen@intel.corp-partner.google.com>,
        Peter Fang <peter.fang@intel.corp-partner.google.com>,
        Tomasz Nowicki <tn@semihalf.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Ashish Kalra <ashish.kalra@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sachi King <nakato@nakato.io>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        David Dunn <daviddunn@google.com>,
        Wei Wang <wei.w.wang@intel.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        "open list:KERNEL VIRTUAL MACHINE (KVM)" <kvm@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:ACPI" <linux-acpi@vger.kernel.org>,
        "open list:HIBERNATION (aka Software Suspend, aka swsusp)" 
        <linux-pm@vger.kernel.org>, Dominik Behr <dbehr@google.com>,
        Dmitry Torokhov <dtor@google.com>
Subject: Re: [PATCH 1/2] x86: notify hypervisor about guest entering s2idle
 state
Message-ID: <YrSZIxfWUJoQqEt/@google.com>
References: <YqIJ8HtdqnoVzfQD@google.com>
 <CAH76GKNRDXAyGYvs2ji5Phu=5YPW8+SV8-6TLjizBRzTCnEROg@mail.gmail.com>
 <YqNVYz4+yVbWnmNv@google.com>
 <CAH76GKNSfaHwpy46r1WWTVgnsuijqcHe=H5nvUTUUs1UbdZvkQ@mail.gmail.com>
 <Yqtez/J540yD7VdD@google.com>
 <2201fe5f-5bd8-baaf-aad5-eaaea2f1e20e@amd.com>
 <CAH76GKP=2wu4+eqLCFu1F5a4rHhReUT_7N89K8xbO-gSqEQ-3w@mail.gmail.com>
 <88344644-44e1-0089-657a-2e34316ea4b4@amd.com>
 <CAH76GKMKjogX9kE5jch+LqkGswGAmyOdu5sOdY_G23Dqpf0puA@mail.gmail.com>
 <7c428b03-261f-78cb-4ce3-5949ac93f028@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c428b03-261f-78cb-4ce3-5949ac93f028@amd.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 22, 2022, Limonciello, Mario wrote:
> On 6/22/2022 04:53, Grzegorz Jaszczyk wrote:
> > It will be problematic since the abort/restore notification could
> > arrive too late and therefore the whole system will go to suspend
> > thinking that the guest is in desired s2ilde state. Also in this case
> > it would be impossible to prevent races and actually making sure that
> > the guest is suspended or not. We already had similar discussion with
> > Sean earlier in this thread why the notification have to be send just
> > before swait_event_exclusive(s2idle_wait_head, s2idle_state ==
> > S2IDLE_STATE_WAKE) and that the VMM have to have control over guest
> > resumption.
> > 
> > Nevertheless if extending acpi_s2idle_dev_ops is possible, why not
> > extend it about the hypervisor_notify() and use it in the same place
> > where the hypercall is used in this patch? Do you see any issue with
> > that?
> 
> If this needs to be a hypercall and the hypercall needs to go at that
> specific time, I wouldn't bother with extending acpi_s2idle_dev_ops. The
> whole idea there was that this would be less custom and could follow a spec.

It doesn't need to be a hypercall though.  PIO and MMIO provide the same "exit to
host userspace" behavior, and there is zero reason to get KVM involved since KVM
(on x86) doesn't deal with platform scoped power management.

I get that squeezing this into the ACPI device model is awkward, but forcing KVM
into the picture isn't any better.

> TBH - given the strong dependency on being the very last command and this
> being all Linux specific (you won't need to do something similar with
> Windows) - I think the way you already did it makes the most sense.
> It seems to me the ACPI device model doesn't really work well for this
> scenario.
