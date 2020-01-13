Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 885691390E5
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jan 2020 13:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgAMMOj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 13 Jan 2020 07:14:39 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:55987 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726193AbgAMMOj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jan 2020 07:14:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578917677;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=quQDksyPyFcIuCqVPGqUPwx5B1xPgTdkurY5s4DtTQ8=;
        b=QI1q10T8ZPvkGjSYuoeZg0U2DRDkJWSZKfO7H3qMpe4dF9mkw6RYyBLleRxgVg9TZgGiea
        nSQPwyiVSZ6vSxhHOJsBPZ5O3GMKiHPgZc1Fy9CgPewUXBDQOh1IwQBu2FEIX6mvU1qjUi
        GbJ0ZeCaXxbYMyhdtMQsXnIxad7AboM=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-5iRxRp4ENX20xiEeK8PL4A-1; Mon, 13 Jan 2020 07:14:36 -0500
X-MC-Unique: 5iRxRp4ENX20xiEeK8PL4A-1
Received: by mail-pj1-f71.google.com with SMTP id m61so6651905pjb.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2020 04:14:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=quQDksyPyFcIuCqVPGqUPwx5B1xPgTdkurY5s4DtTQ8=;
        b=oeBxo7keJ0WJkt7ext6seKdsAM5nZJ0lZXshgpOUdFKxgLGCb3FgTiH1TpSZmHkTwu
         csdSB9zlx7P2/V0aVlRrHT/F0eN6+nHp8MyoWE8u/2LLwWOcxCQors+8uiZgw38cEg9u
         nb+1jT4liO9vuWlh4fngxc6AT/sxtxGaiZrEMXfW7LMkIRFjYpiL5OldvA7IakOktIWu
         kutY6CBDCUbNgJDDGtr9d386MgwAXDLuwTpI1rYTPAywDmUboql3ATouVHX24z84PdQ0
         ic/r/T/ZK6y5G39TtmQF6URfd88gJCZ3OvHt+hH6A5Xz+I9tykU6loC0shFPSL/Anqnu
         iYug==
X-Gm-Message-State: APjAAAU14/bNB/4tFb8cYUG7vbko+r22xUP+OCPFr50YIESfZDHLprTn
        3FTNFmoMIE7c9Y46INZgk8AswLIlqqKSlQNfTx72r5OECrqj7HeUe10gTnFtotnvaXb4gOds0RS
        y+SoTP9Tmb21lkAzZt8gb
X-Received: by 2002:a17:90a:fa88:: with SMTP id cu8mr20913872pjb.141.1578917675074;
        Mon, 13 Jan 2020 04:14:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqxALQgnDcQJ9NkcfjZ+inUPcVHYoZsvLYAu6/sEEIOSdSjVJI/LaGA1hgTl2PAA71Zt8AwepA==
X-Received: by 2002:a17:90a:fa88:: with SMTP id cu8mr20913845pjb.141.1578917674799;
        Mon, 13 Jan 2020 04:14:34 -0800 (PST)
Received: from localhost.localdomain ([122.177.255.46])
        by smtp.gmail.com with ESMTPSA id j20sm13806331pfe.168.2020.01.13.04.14.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 04:14:34 -0800 (PST)
Subject: Re: [RESEND PATCH v5 2/5] arm64/crash_core: Export TCR_EL1.T1SZ in
 vmcoreinfo
To:     Dave Anderson <anderson@redhat.com>,
        James Morse <james.morse@arm.com>
Cc:     linux-kernel@vger.kernel.org,
        bhupesh linux <bhupesh.linux@gmail.com>, x86@kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        kexec@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>,
        Steve Capper <steve.capper@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Kazuhito Hagio <k-hagio@ab.jp.nec.com>
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
 <1575057559-25496-3-git-send-email-bhsharma@redhat.com>
 <63d6e63c-7218-d2dd-8767-4464be83603f@arm.com>
 <af0fd2b0-99db-9d58-bc8d-0dd9d640b1eb@redhat.com>
 <f791e777-781c-86ce-7619-1de3fe3e7b90@arm.com>
 <351975548.1986001.1578682810951.JavaMail.zimbra@redhat.com>
From:   Bhupesh Sharma <bhsharma@redhat.com>
Message-ID: <04287d60-e99e-631b-c134-d6dc39e6a193@redhat.com>
Date:   Mon, 13 Jan 2020 17:44:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <351975548.1986001.1578682810951.JavaMail.zimbra@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi James,

On 01/11/2020 12:30 AM, Dave Anderson wrote:
> 
> ----- Original Message -----
>> Hi Bhupesh,
>>
>> On 25/12/2019 19:01, Bhupesh Sharma wrote:
>>> On 12/12/2019 04:02 PM, James Morse wrote:
>>>> On 29/11/2019 19:59, Bhupesh Sharma wrote:
>>>>> vabits_actual variable on arm64 indicates the actual VA space size,
>>>>> and allows a single binary to support both 48-bit and 52-bit VA
>>>>> spaces.
>>>>>
>>>>> If the ARMv8.2-LVA optional feature is present, and we are running
>>>>> with a 64KB page size; then it is possible to use 52-bits of address
>>>>> space for both userspace and kernel addresses. However, any kernel
>>>>> binary that supports 52-bit must also be able to fall back to 48-bit
>>>>> at early boot time if the hardware feature is not present.
>>>>>
>>>>> Since TCR_EL1.T1SZ indicates the size offset of the memory region
>>>>> addressed by TTBR1_EL1 (and hence can be used for determining the
>>>>> vabits_actual value) it makes more sense to export the same in
>>>>> vmcoreinfo rather than vabits_actual variable, as the name of the
>>>>> variable can change in future kernel versions, but the architectural
>>>>> constructs like TCR_EL1.T1SZ can be used better to indicate intended
>>>>> specific fields to user-space.
>>>>>
>>>>> User-space utilities like makedumpfile and crash-utility, need to
>>>>> read/write this value from/to vmcoreinfo
>>>>
>>>> (write?)
>>>
>>> Yes, also write so that the vmcoreinfo from an (crashing) arm64 system can
>>> be used for
>>> analysis of the root-cause of panic/crash on say an x86_64 host using
>>> utilities like
>>> crash-utility/gdb.
>>
>> I read this as as "User-space [...] needs to write to vmcoreinfo".

That's correct. But for writing to vmcore dump in the kdump kernel, we 
need to read the symbols from the vmcoreinfo in the primary kernel.

>>>>> for determining if a virtual address lies in the linear map range.
>>>>
>>>> I think this is a fragile example. The debugger shouldn't need to know
>>>> this.
>>>
>>> Well that the current user-space utility design, so I am not sure we can
>>> tweak that too much.
>>>
>>>>> The user-space computation for determining whether an address lies in
>>>>> the linear map range is the same as we have in kernel-space:
>>>>>
>>>>>     #define __is_lm_address(addr)    (!(((u64)addr) & BIT(vabits_actual -
>>>>>     1)))
>>>>
>>>> This was changed with 14c127c957c1 ("arm64: mm: Flip kernel VA space"). If
>>>> user-space
>>>> tools rely on 'knowing' the kernel memory layout, they must have to
>>>> constantly be fixed
>>>> and updated. This is a poor argument for adding this to something that
>>>> ends up as ABI.
>>>
>>> See above. The user-space has to rely on some ABI/guaranteed
>>> hardware-symbols which can be
>>> used for 'determining' the kernel memory layout.
>>
>> I disagree. Everything and anything in the kernel will change. The ABI rules apply to
>> stuff exposed via syscalls and kernel filesystems. It does not apply to kernel internals,
>> like the memory layout we used yesterday. 14c127c957c1 is a case in point.
>>
>> A debugger trying to rely on this sort of thing would have to play catchup whenever it
>> changes.
> 
> Exactly.  That's the whole point.
> 
> The crash utility and makedumpfile are not in the same league as other user-space tools.
> They have always had to "play catchup" precisely because they depend upon kernel internals,
> which constantly change.

I agree with you and DaveA here. Software user-space debuggers are 
dependent on kernel internals (which can change from time-to-time) and 
will have to play catch-up (which has been the case since the very start).

Unfortunately we don't have any clear ABI for software debugging tools - 
may be something to look for in future.

A case in point is gdb/kgdb, which still needs to run with KASLR 
turned-off (nokaslr) for debugging, as it confuses gdb which resolve 
kernel symbol address from symbol table of vmlinux. But we can 
work-around the same in makedumpfile/crash by reading the 'kaslr_offset' 
value. And I have several users telling me now they cannot use gdb on 
KASLR enabled kernel to debug panics, but can makedumpfile + crash 
combination to achieve the same.

So, we should be looking to fix these utilities which are broken since 
the 52-bit changes for arm64. Accordingly, I will try to send the v6
soon while incorporating the comments posted on the v5.

Thanks,
Bhupesh




