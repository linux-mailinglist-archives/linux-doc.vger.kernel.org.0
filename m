Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0BC04815C8
	for <lists+linux-doc@lfdr.de>; Wed, 29 Dec 2021 18:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241101AbhL2R0U (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 Dec 2021 12:26:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241098AbhL2R0U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Dec 2021 12:26:20 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62DC3C061401
        for <linux-doc@vger.kernel.org>; Wed, 29 Dec 2021 09:26:20 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id m15so19039663pgu.11
        for <linux-doc@vger.kernel.org>; Wed, 29 Dec 2021 09:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=60TyvX0zFQi6hqi8h/S/iZE8S9P3fjxrfT4ZN4fNmxU=;
        b=DTg1moWe83+9+gQVZu431fIFhbqxKcy7UnLNH94wll+BM5aYgKUhfztbVhg5GqLKA3
         qpMpnrHOrUTEN6+/i+4bASip+FVlynebgDkbm4Xa8sO4PWICQEKeW0tFgFpMuJm7MryJ
         HhHb1oU2/P55kCKV6/Bt2EasK/U5Qt9alUsmWES/9Ky6ztMqQPH8kQJOk1VnRfv2kZC1
         qgTJ1Z9/OEeIAGPsvAzAKC4+v4SHpVMLjf9z9mc+KQy+sUtLqaQC5e8u4rMlrw1guB9N
         zUH954YHADl21w/A+bZ5IOlkfk0CMbU9Hiq52Eo/31vlNkLqnqisCdiiv4x1o57iAYF9
         kt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=60TyvX0zFQi6hqi8h/S/iZE8S9P3fjxrfT4ZN4fNmxU=;
        b=JjyuElh7A9AK/2V0gKlEVeaPbfyBeB9JtJBRYRLixC1szSlh9gCWkiScEPKQfwpcIb
         VsZn/JrAVCAOgYjYljGI9E9zoCbQYuBS/kNZNmf9hpmKUIA/kfGjvbCp1VIetIgfMIno
         xcBi2J9dqPbGAgE4rusrQSWVgqlpUnxQ5/ajSHXieTp3ay6kJwxd5FbOpRi3gqFeMAOw
         l+m2ksVr7w6UWnlFcVjU9MI7dj2fG4g0+fZ40R0QaXVbuljFv4Ik85miMFH/2j+M7Rg6
         H9jph0drsfDLvg/1cNVDuh3GyJeY5a6zUOn4SSncJI1Osly+a8jNVWBPGO7EDix+Scqr
         QGlQ==
X-Gm-Message-State: AOAM532rZVy5vavowQ9Gn3YHHNJzTmetsqE2KSTnururc5EjEXlO7sGE
        3vsrXTenP4fSSgc0Mh+woEK1CQ==
X-Google-Smtp-Source: ABdhPJydgCyOJqC5EQayTuUUt7hYoDt65iGiIYwxMRxqQWK5hkAe4Q42+oM7dGMfJAFhbTSkK32OEg==
X-Received: by 2002:a63:416:: with SMTP id 22mr24486207pge.133.1640798779544;
        Wed, 29 Dec 2021 09:26:19 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id v16sm25142786pfu.131.2021.12.29.09.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 09:26:18 -0800 (PST)
Date:   Wed, 29 Dec 2021 17:26:15 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     "Tian, Kevin" <kevin.tian@intel.com>
Cc:     "Liu, Jing2" <jing2.liu@intel.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "bp@alien8.de" <bp@alien8.de>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "pbonzini@redhat.com" <pbonzini@redhat.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "shuah@kernel.org" <shuah@kernel.org>,
        "Nakajima, Jun" <jun.nakajima@intel.com>,
        "jing2.liu@linux.intel.com" <jing2.liu@linux.intel.com>,
        "Zeng, Guang" <guang.zeng@intel.com>,
        "Wang, Wei W" <wei.w.wang@intel.com>,
        "Zhong, Yang" <yang.zhong@intel.com>
Subject: Re: [PATCH v3 22/22] kvm: x86: Disable interception for IA32_XFD on
 demand
Message-ID: <YcyaN7V4wwGI7wDV@google.com>
References: <20211222124052.644626-1-jing2.liu@intel.com>
 <20211222124052.644626-23-jing2.liu@intel.com>
 <Ycu0KVq9PfuygKKx@google.com>
 <BN9PR11MB5276CE5635898CE13BFC57FC8C449@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BN9PR11MB5276CE5635898CE13BFC57FC8C449@BN9PR11MB5276.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 29, 2021, Tian, Kevin wrote:
> > From: Tian, Kevin
> > Sent: Wednesday, December 29, 2021 11:35 AM
> > >
> > > Speaking of nested, interception of #NM in
> > vmx_update_exception_bitmap()
> > > is wrong
> > > with respect to nested guests.  Until XFD is supported for L2, which I didn't
> > > see
> > > in this series, #NM should not be intercepted while L2 is running.
> > 
> > Can you remind what additional thing is required to support XFD for L2?
> 
> ok, at least we require additional work on when to disable write interception.
> It can be done only when both L0 and L1 make the same decision, just like 
> what we did for many other VMCS settings...

I'm not terribly concerned with exposing XFD to L2 right now, I'm much more
concerned with not breaking nVMX when XFD is exposed to L1.

> > If only about performance I prefer to the current conservative approach
> > as the first step. As explained earlier, #NM should be rare if the guest
> > doesn't run AMX applications at all. Adding nested into this picture doesn't
> > make things a lot worser.
> 
> All your comments incorporated except this one. As said always trapping
> #NM for L2 is not a big problem, as long as it's rare and don't break function.
> Usually a relatively static scheme is safer than a dynamic one in case of
> anything overlooked for the initial implementation. 😊

I strongly disagree, it's not automagically safer.  Either way, we need to validate
that KVM does the correct thing with respect to vmcs12.  E.g. does KVM correctly
reflect the #NM back to L2 when it's not intercepted by L1?  Does it synthesize a
nested VM-Exit when it is intercepted by L1?  The testing required doesn't magically
go away.

As posted, there is zero chance that the patches correctly handling #NM in L2
because nested_vmx_l0_wants_exit() doesn't prevent an #NM from being forwarded
to L1.  E.g. if L0 (KVM) and L1 both intercept #NM, handle_exception_nm() will
queue a #NM for injection and then syntehsizea nested VM-Exit, i.e. the #NM from
L2 will get injected into L1 after the nested exit.

That also means handle_exception_nmi_irqoff() => handle_exception_nm() is fatally
broken on non-XFD hardware, as it will attempt RDMSR(MSR_IA32_XFD_ERR) if L1
intercepts #NM since handle_exception_nmi_irqoff() will run before
__vmx_handle_exit() => nested_vmx_reflect_vmexit() checks whether L0 or L1 should
handle the exit.
