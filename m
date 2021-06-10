Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0B7E3A2F05
	for <lists+linux-doc@lfdr.de>; Thu, 10 Jun 2021 17:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231601AbhFJPIT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 10 Jun 2021 11:08:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37353 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231602AbhFJPIQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Jun 2021 11:08:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623337578;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Cf6hot6ZLRcduczNi4lA10wsSd7+V1kWMUGJekCYcy4=;
        b=M0sLMnTlc4Ie7wZppxKZ+LaJ4snj/S3diBVUDJiMDd0YFa/zMOWJoHxHJp8A3PgW64zz2K
        ZoldcxuQFYhQkURshjrFJ1J/hLMGy70ouXd9YsH1m2+SpvXWLuN4Cm4wAOEDZWcRA0ipvj
        Fg18dL7KYIRwX8N2HqNO1AhBkPTP+YM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-fXvCMEukP2aK1YijPjbLLg-1; Thu, 10 Jun 2021 11:06:16 -0400
X-MC-Unique: fXvCMEukP2aK1YijPjbLLg-1
Received: by mail-wr1-f69.google.com with SMTP id r17-20020a5d52d10000b0290119976473fcso1015677wrv.15
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 08:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Cf6hot6ZLRcduczNi4lA10wsSd7+V1kWMUGJekCYcy4=;
        b=IF0QMkm7HPZm7bp0erKHTcn7BaKI+p/2/7sUScnSHUFY1FucAH2IW7pSe/70P6fMpo
         S03ByBIRzJrGNUYKelAJG4QPdTwJs0DNbFUOU5tmEjQgzLcDOGD+CXXmdv9aDfdDpOBR
         hlGpvJyjruK3jFxYn6TbI7Yb0WIxt6waCWKIeUSDhQ+XhvPKk07uhDnHf3JVnVl7SKGM
         iIUl3R85L9LpCnDqjajZAIld41T0lkFRmD23DcUTPz2Zwo/TvTp9qomlvNvqRQC6jNfO
         wgNN1iTlOPkS3HXqtBixro9UOPSLdHSVh3uGMD1nX32/wOjak/6tO0tqbzxqb18+Zius
         Csyg==
X-Gm-Message-State: AOAM530Ozbj5lP9Xi3c8XPzak+VRwPNyXXDxY9ONzpsrYx1hnPk6MA2m
        SRQNuqCkjVlle7mlGooTo0k9u8XcC6ycCRUbD4of1TOG5mN/JT7HtJd+WtaZz/Eb7fys/mifJN3
        CECLdbrw+w2qXYVdM0EnM
X-Received: by 2002:a1c:2507:: with SMTP id l7mr5529085wml.188.1623337575751;
        Thu, 10 Jun 2021 08:06:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3c6aC4X4il2k5fq/qtSdT+15bADFk4BGyt6elhfFXTSPG/U5yVnl1Y004HOWePu0JJfDfUA==
X-Received: by 2002:a1c:2507:: with SMTP id l7mr5529068wml.188.1623337575587;
        Thu, 10 Jun 2021 08:06:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a? ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
        by smtp.gmail.com with ESMTPSA id m23sm3214631wmc.29.2021.06.10.08.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 08:06:13 -0700 (PDT)
Subject: Re: [PATCH v3 0/8] Introduce KVM_{GET|SET}_SREGS2 and fix PDPTR
 migration
To:     Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Cc:     open list <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Wanpeng Li <wanpengli@tencent.com>,
        Ingo Molnar <mingo@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sean Christopherson <seanjc@google.com>,
        Borislav Petkov <bp@alien8.de>, Joerg Roedel <joro@8bytes.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Jim Mattson <jmattson@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "H. Peter Anvin" <hpa@zytor.com>
References: <20210607090203.133058-1-mlevitsk@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <90393d4d-2057-b8d1-6867-275ba99efe3f@redhat.com>
Date:   Thu, 10 Jun 2021 17:06:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607090203.133058-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07/06/21 11:01, Maxim Levitsky wrote:
> This patch set aims to fix few flaws that were discovered
> in KVM_{GET|SET}_SREGS on x86:
> 
> * There is no support for reading/writing PDPTRs although
>    these are considered to be part of the guest state.
> 
> * There is useless interrupt bitmap which isn't needed
> 
> * No support for future extensions (via flags and such)
> 
> Also if the user doesn't use the new SREG2 api, the PDPTR
> load after migration is now done on KVM_REQ_GET_NESTED_STATE_PAGES
> to at least read them correctly in cases when guest memory
> map is not up to date when nested state is loaded.
> 
> This patch series was tested by doing nested migration test
> of 32 bit PAE L1 + 32 bit PAE L2 on AMD and Intel and by
> nested migration test of 64 bit L1 + 32 bit PAE L2 on AMD.
> The later test currently fails on Intel (regardless of my patches).
> 
> Changes from V2:
>    - I took in the patch series from Sean Christopherson that
>      removes the pdptrs_changed function and rebased my code
>      on top of it.
>    - I updated the SET_SREGS2 ioctl to load PDPTRS from memory
>      when user haven't given PDPTRS.
>    - Minor refactoring all over the place.
> 
> Changes from V1:
>    - move only PDPTRS load to KVM_REQ_GET_NESTED_STATE_PAGES on VMX
>    - rebase on top of kvm/queue
>    - improve the KVM_GET_SREGS2 to have flag for PDPTRS
>      and remove padding
> 
> Patches to qemu to enable this feature were sent as well.
> 
> Maxim Levitsky (5):
>    KVM: nSVM: refactor the CR3 reload on migration
>    KVM: nVMX: delay loading of PDPTRs to KVM_REQ_GET_NESTED_STATE_PAGES
>    KVM: x86: introduce kvm_register_clear_available
>    KVM: x86: Introduce KVM_GET_SREGS2 / KVM_SET_SREGS2
>    KVM: x86: avoid loading PDPTRs after migration when possible
> 
> Sean Christopherson (3):
>    KVM: nVMX: Drop obsolete (and pointless) pdptrs_changed() check
>    KVM: nSVM: Drop pointless pdptrs_changed() check on nested transition
>    KVM: x86: Always load PDPTRs on CR3 load for SVM w/o NPT and a PAE
>      guest
> 
>   Documentation/virt/kvm/api.rst  |  48 +++++++++
>   arch/x86/include/asm/kvm_host.h |   7 +-
>   arch/x86/include/uapi/asm/kvm.h |  13 +++
>   arch/x86/kvm/kvm_cache_regs.h   |  12 +++
>   arch/x86/kvm/svm/nested.c       |  39 +++++--
>   arch/x86/kvm/svm/svm.c          |   6 +-
>   arch/x86/kvm/vmx/nested.c       |  32 ++++--
>   arch/x86/kvm/x86.c              | 176 +++++++++++++++++++++-----------
>   include/uapi/linux/kvm.h        |   4 +
>   9 files changed, 253 insertions(+), 84 deletions(-)
> 

Queued, thanks.

Paolo

