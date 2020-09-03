Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7467D25C97E
	for <lists+linux-doc@lfdr.de>; Thu,  3 Sep 2020 21:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729059AbgICT1a (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 3 Sep 2020 15:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728903AbgICT11 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Sep 2020 15:27:27 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064E8C061246
        for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2020 12:27:26 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id e23so5454033eja.3
        for <linux-doc@vger.kernel.org>; Thu, 03 Sep 2020 12:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NtWumpD+gVz83viVaftbzeK1fRKTl6N3ZA9uIi3xpRI=;
        b=qeWO7m0tg65gHfjksmor08Atfeytv7cfsX8NXjQ2kjWr4o/Jrl8qCPCTjRxlozDT4v
         ZrxI6hhbwJvFjhvdqXkT9JUSpkS4BptfWt2jSR3DghbSt2fIEAOr7f43h0szfgRBUepc
         j4H6o1fwekk0X1DIfEXuA4hhL/9x4Yfjbmj73PK0UTRCnVuZnTUIZMISgN3Utt4zhGkx
         S/kDrowwwNWXTizwm+7TxQ9oT7OJ/r4tXyl2Y6/t8YEnaHn9Kql74p+X7t8B05BLZZqb
         S48pazJ95IzTwveRNMxz6UJdCDT2PtMo8uC1JKDVd666IEeWzYgSpF4g9fsfPgsLFoFn
         +3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NtWumpD+gVz83viVaftbzeK1fRKTl6N3ZA9uIi3xpRI=;
        b=dlon2uPJgw+OMr53N+xtuRcTBvA8Bpp2hSdO97KGL2VEdqbP2P8wLBytiWRPaB7qgl
         OOMaThGQbT0o0l4RseiDvRCOPLb6o3mzoO2wXsLEQiB5POdxh5zImQln6GxpunMTOmuL
         kNZgI2XW5e0D7eEZGMRiVAS16m5IFoTE+thGWO2WRMcILNtKpB0vyVUozLj2ZjqlwErI
         IqQqt4S2Fwpz1vYzVti1yY+oIaAlz/CQrD9qubjKeuT0voVzqIWLoutZxKvToR9tafaM
         yLAs4GGOd/vydSXtwXt+SLIL6ovK7DYHXIHAgro7iRQA5WGd5LdwrMmkLgQtphhEApnq
         ZMJA==
X-Gm-Message-State: AOAM530PLJ48PeAyo3MLxMxV2k7UwIDRXBn0obfpGtChwQaMBQBRgBHm
        VnOdX9Feykt2J9lzcm1tm0rv9geY2XAQ4wFGwevtnQ==
X-Google-Smtp-Source: ABdhPJzhIB9qKD4ppM9WZU8Q9bRLTyU6MP0yt/Jwlb8vtmn1XNVzGPwO0DOBXej9sxQU6hClJDHdsmRsAhAlX2ErchM=
X-Received: by 2002:a17:906:5856:: with SMTP id h22mr3705386ejs.480.1599161245100;
 Thu, 03 Sep 2020 12:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200902125935.20646-1-graf@amazon.com> <20200902125935.20646-2-graf@amazon.com>
In-Reply-To: <20200902125935.20646-2-graf@amazon.com>
From:   Aaron Lewis <aaronlewis@google.com>
Date:   Thu, 3 Sep 2020 12:27:13 -0700
Message-ID: <CAAAPnDFGD8+5KBCLKERrH0hajHEwU9UdEEGqp3RZu3Lws+5rmw@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] KVM: x86: Deflect unknown MSR accesses to user space
To:     Alexander Graf <graf@amazon.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        KarimAllah Raslan <karahmed@amazon.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        kvm list <kvm@vger.kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> +::
> +
> +               /* KVM_EXIT_X86_RDMSR / KVM_EXIT_X86_WRMSR */
> +               struct {
> +                       __u8 error; /* user -> kernel */
> +                       __u8 pad[3];
> +                       __u32 reason; /* kernel -> user */
> +                       __u32 index; /* kernel -> user */
> +                       __u64 data; /* kernel <-> user */
> +               } msr;
> +
> +Used on x86 systems. When the VM capability KVM_CAP_X86_USER_SPACE_MSR i=
s
> +enabled, MSR accesses to registers that would invoke a #GP by KVM kernel=
 code
> +will instead trigger a KVM_EXIT_X86_RDMSR exit for reads and KVM_EXIT_X8=
6_WRMSR
> +exit for writes.
> +
> +The "reason" field specifies why the MSR trap occurred. User space will =
only
> +receive MSR exit traps when a particular reason was requested during thr=
ough
> +ENABLE_CAP. Currently valid exit reasons are:
> +
> +       KVM_MSR_EXIT_REASON_INVAL - access to invalid MSRs or reserved bi=
ts


Can we also have ENOENT?
        KVM_MSR_EXIT_REASON_ENOENT - Unknown MSR

>
> +
> +For KVM_EXIT_X86_RDMSR, the "index" field tells user space which MSR the=
 guest
> +wants to read. To respond to this request with a successful read, user s=
pace
> +writes the respective data into the "data" field and must continue guest
> +execution to ensure the read data is transferred into guest register sta=
te.
>
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 88c593f83b28..4d285bf054fb 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -1549,12 +1549,88 @@ int kvm_set_msr(struct kvm_vcpu *vcpu, u32 index,=
 u64 data)
>  }
>  EXPORT_SYMBOL_GPL(kvm_set_msr);
>
> +static int complete_emulated_msr(struct kvm_vcpu *vcpu, bool is_read)
> +{
> +       if (vcpu->run->msr.error) {
> +               kvm_inject_gp(vcpu, 0);

Add return 1. The RIP doesn=E2=80=99t advance when the instruction raises a=
 fault.

>
> +       } else if (is_read) {
> +               kvm_rax_write(vcpu, (u32)vcpu->run->msr.data);
> +               kvm_rdx_write(vcpu, vcpu->run->msr.data >> 32);
> +       }
> +
> +       return kvm_skip_emulated_instruction(vcpu);
> +}
> +
> +static int complete_emulated_rdmsr(struct kvm_vcpu *vcpu)
> +{
> +       return complete_emulated_msr(vcpu, true);
> +}
> +
>
>  /* For KVM_EXIT_INTERNAL_ERROR */
>  /* Emulate instruction failed. */
> @@ -412,6 +414,15 @@ struct kvm_run {
>                         __u64 esr_iss;
>                         __u64 fault_ipa;
>                 } arm_nisv;
> +               /* KVM_EXIT_X86_RDMSR / KVM_EXIT_X86_WRMSR */
> +               struct {
> +                       __u8 error; /* user -> kernel */
> +                       __u8 pad[3];

__u8 pad[7] to maintain 8 byte alignment?  unless we can get away with
fewer bits for 'reason' and
get them from 'pad'.

> +#define KVM_MSR_EXIT_REASON_INVAL      (1 << 0)
> +                       __u32 reason; /* kernel -> user */
> +                       __u32 index; /* kernel -> user */
> +                       __u64 data; /* kernel <-> user */
> +               } msr;
>                 /* Fix the size of the union. */
>                 char padding[256];
>         };
> @@ -1031,6 +1042,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_PPC_SECURE_GUEST 181
>  #define KVM_CAP_HALT_POLL 182
>  #define KVM_CAP_ASYNC_PF_INT 183
> +#define KVM_CAP_X86_USER_SPACE_MSR 184
>
>  #ifdef KVM_CAP_IRQ_ROUTING
>
> --
> 2.17.1
>
>
>
>
> Amazon Development Center Germany GmbH
> Krausenstr. 38
> 10117 Berlin
> Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
> Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
> Sitz: Berlin
> Ust-ID: DE 289 237 879
>
>
>
