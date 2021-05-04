Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2175137284B
	for <lists+linux-doc@lfdr.de>; Tue,  4 May 2021 11:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbhEDJvU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 May 2021 05:51:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35313 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230112AbhEDJvU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 May 2021 05:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620121825;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TLLNqsS9L3JlqB+77pJZObONKY2VG8iKD+gJcR3gPl0=;
        b=YCEOMXFZxZuPzLtV/h32fzuJLZfIDW5LGTkS7ez4eXNN6AHbostg9WBOjx0qSFNY3A8ytk
        n1OM0O77/MY0pw2m1zW/4YzjPDA44s3T9cA58QTJbt0CBNhYKyqEw/5o1Lachn8VDQg6PG
        n2jU/414Pu40PsNn9fgCia0CB35dJEY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-S-kJiEyQOrOJaWctLq0PDg-1; Tue, 04 May 2021 05:50:23 -0400
X-MC-Unique: S-kJiEyQOrOJaWctLq0PDg-1
Received: by mail-ed1-f72.google.com with SMTP id d6-20020a0564020786b0290387927a37e2so6093092edy.10
        for <linux-doc@vger.kernel.org>; Tue, 04 May 2021 02:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TLLNqsS9L3JlqB+77pJZObONKY2VG8iKD+gJcR3gPl0=;
        b=iKU/elH+3ffib4nTK0CSyfNb95eKnK/8hXb79riAD1uo4Tbt72rRVNwHl/9ZOEA444
         Chvr6l6uqMmLE3tA8cCxDoRl9kKlZ/fRkA7gJnSV6xgQNghbrNU3FOBMpvqXxFmAvjNH
         GkLJ7AQcDxsVS3RsGe3A6jz213ogX8tJGGodk3bQ08255EeJD8xdIiVqdzBAf7LqdpPf
         KYVP3UBXFXcE51YMAHIWpC8rcJX8QK/QqqMCHtxm9UGlTQ+rRI8YmyTstoJnkb8XCjps
         uELgG/U2vGhJhy3fOiG/uXUW/q7wiMvXObTCsusuc5whoZzrmsK3IxmZOOHRTBzcqgw5
         MJvA==
X-Gm-Message-State: AOAM531bYlb0InLgZAypjCmmNexi+F/Vc5R4igNoixrAxnMInRfgA4XL
        sllP4H9cpmmoXY5DGTdclrdMGcccy4K3owrIRQNJM7VrQ/N9D6gV+xqYaW5OaFQG1og/t+NTlXp
        HRBgz9g11XOlCQ/qiC6os
X-Received: by 2002:a17:906:c9d0:: with SMTP id hk16mr21511729ejb.512.1620121822622;
        Tue, 04 May 2021 02:50:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCJyldKGwnVeDHhwh86DCOqVryoCavSu5rceiCbCiFV+ZSms3HzvvVKa6Wa6wLmzON+hplHw==
X-Received: by 2002:a17:906:c9d0:: with SMTP id hk16mr21511719ejb.512.1620121822436;
        Tue, 04 May 2021 02:50:22 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id v26sm1149040ejk.66.2021.05.04.02.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 May 2021 02:50:21 -0700 (PDT)
Subject: Re: [PATCH v4] KVM: x86: Fix KVM_GET_CPUID2 ioctl to return cpuid
 entries count
To:     Alexander Graf <graf@amazon.com>,
        "Denis V. Lunev" <den@openvz.org>,
        Sean Christopherson <seanjc@google.com>,
        Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Shuah Khan <shuah@kernel.org>,
        Aaron Lewis <aaronlewis@google.com>,
        Andrew Jones <drjones@redhat.com>,
        Oliver Upton <oupton@google.com>,
        Like Xu <like.xu@linux.intel.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20210428172729.3551-1-valeriy.vdovin@virtuozzo.com>
 <YIoFFl72VSeuhCRt@google.com>
 <0d68dbc3-8462-7763-fbad-f3b895fcf6e6@redhat.com>
 <be7eedf7-03a2-f998-079d-b18101b8b187@openvz.org>
 <63e54361-0018-ad3b-fb2b-e5dba6a0f221@redhat.com>
 <048b3f3a-379d-cff3-20b6-fc74dd12a98f@openvz.org>
 <514b5373-c07b-ad34-5fba-f8850faf6d68@redhat.com>
 <b4434730-9cd1-1d41-d012-f7beff7e351b@amazon.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2c097165-bb13-4b9f-64f9-3c6d88a648b4@redhat.com>
Date:   Tue, 4 May 2021 11:50:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b4434730-9cd1-1d41-d012-f7beff7e351b@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/05/21 11:26, Alexander Graf wrote:
> 
> 
> On 04.05.21 10:21, Paolo Bonzini wrote:
>>
>> On 04/05/21 10:15, Denis V. Lunev wrote:
>>> As far as I understand only some testing within kernel now.
>>> Though we have plans to expose it for QAPI as the series
>>> in QEMU
>>>    [PATCH 1/2] qapi: fix error handling for x-vz-query-cpu-model-cpuid
>>>    [PATCH 2/2] qapi: blacklisted x-vz-query-cpu-model-cpuid in tests
>>> is not coming in a good way.
>>> The idea was to avoid manual code rework in QEMU and
>>> expose collected model at least for debug.
>>
>> KVM_GET_CPUID2 as a VM ioctl cannot expose the whole truth about CPUID
>> either, since it doesn't handle the TSX_CTRL_CPUID_CLEAR bit.  Given
>> that QEMU doesn't need KVM_GET_CPUID2; it only needs to save whatever it
>> passed to KVM_SET_CPUID2.
> 
> What if we instead deflect CPUID into user space so it can emulate it in 
> whatever way it likes? Is the performance difference going to be 
> relevant? Are people still using cpuid as barrier these days?

There's enough weirdness in CPUID (e.g. the magic redirection of unknown 
leaves to the highest Intel leaf) to make it relatively hard to 
implement correctly.  So I think it should remain in the kernel.

Paolo

