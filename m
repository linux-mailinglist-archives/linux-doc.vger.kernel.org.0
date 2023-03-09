Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD8B6B2F47
	for <lists+linux-doc@lfdr.de>; Thu,  9 Mar 2023 22:08:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbjCIVI0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 9 Mar 2023 16:08:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbjCIVIY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Mar 2023 16:08:24 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97D6C5CC18
        for <linux-doc@vger.kernel.org>; Thu,  9 Mar 2023 13:08:21 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so7561795pjg.4
        for <linux-doc@vger.kernel.org>; Thu, 09 Mar 2023 13:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678396101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nFe2Va1kto8iMTDHzrCFEwZq2bEoPAeV/MZRx7NhfCo=;
        b=XboDOUpa1aTr7k1b025xwPcjVRaQiMLC1Aoo1bkE5r/kRn+UeARaJDLwA240gY709c
         I6cDI6xDrK/HSNk2oPRFgG3KEX19NyKB9V+7bOmrm9mLlHB44PIhUPFsBSePzukpC5mD
         VMAKMiLmIbb74iDvnp4c9xuzhl1twFzy/+FXxWQNT3jh+PIqZcbb9GtCKZkSka0C9KP3
         uBiOGiQ7ZZ5aHkG4kMaeggl6pIgZnV5Gpvm9zWkeWoe6TqmQcOAKX52cGkBOuNpH6+Ja
         U20ySyGawW8W16n4I3IB+X5UtPvHLj2PlhDg9DgzSdz5qGMJNgnObIcGORJZGCjGwpAS
         QiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678396101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFe2Va1kto8iMTDHzrCFEwZq2bEoPAeV/MZRx7NhfCo=;
        b=73z5x2RghA4kEv3TcOUggjNjafM6InSqSzYfmlZFW/uspFTLzDsvf2GE+ZQ65YFZhK
         /YA5pCGrZicAU7pfXJMANeuobgMXG7SRzsmsSCOOaG59n39xl7H3yhSApYU1D4oL5J/H
         aLNNNlEiav+0ooKlBj4yqcMd4dfSXel3y0LSlDAt8zAFD9XdfseIuczsOSvm5xJWTmiD
         wVbyWL7HzPmzn2ba0Zy2nGtaXnS4LNk4POgV2aJ2Z2vrObLJ39XSHSCTiOHAViX6ZzGB
         tVUQWTrwFqw3UWJndoehUBYEZA+mukizVuZVJ7+UMQPrSnNalCXxiL33g/HWFzKUYFdN
         xzvQ==
X-Gm-Message-State: AO0yUKW4z6pmNN67LdeB+pJpJqS/BiNpZUzbisra73+WB0YfE4PsCAyS
        fxCPjeqEq+4AkUZ9OYe9vi5z9A==
X-Google-Smtp-Source: AK7set/REsTS4uUCxJ8i0WFSHkq4LKPiRUgWYxIJGw83tcjExfSl3lxLhgKGfRTlFj0TctbQIbHWmA==
X-Received: by 2002:a05:6a20:3942:b0:cc:9ca2:8b5f with SMTP id r2-20020a056a20394200b000cc9ca28b5fmr28182199pzg.15.1678396100918;
        Thu, 09 Mar 2023 13:08:20 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id d7-20020a631d47000000b004fab4455748sm37975pgm.75.2023.03.09.13.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 13:08:20 -0800 (PST)
Date:   Thu, 9 Mar 2023 13:08:17 -0800
From:   Deepak Gupta <debug@rivosinc.com>
To:     "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc:     "szabolcs.nagy@arm.com" <szabolcs.nagy@arm.com>,
        "david@redhat.com" <david@redhat.com>,
        "bsingharora@gmail.com" <bsingharora@gmail.com>,
        "hpa@zytor.com" <hpa@zytor.com>,
        "Syromiatnikov, Eugene" <esyr@redhat.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "keescook@chromium.org" <keescook@chromium.org>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
        "Eranian, Stephane" <eranian@google.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "fweimer@redhat.com" <fweimer@redhat.com>,
        "nadav.amit@gmail.com" <nadav.amit@gmail.com>,
        "jannh@google.com" <jannh@google.com>,
        "dethoma@microsoft.com" <dethoma@microsoft.com>,
        "kcc@google.com" <kcc@google.com>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "bp@alien8.de" <bp@alien8.de>, "oleg@redhat.com" <oleg@redhat.com>,
        "hjl.tools@gmail.com" <hjl.tools@gmail.com>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "Lutomirski, Andy" <luto@kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "Schimpe, Christina" <christina.schimpe@intel.com>,
        "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "Yang, Weijiang" <weijiang.yang@intel.com>,
        "al.grant@arm.com" <al.grant@arm.com>,
        "jamorris@linux.microsoft.com" <jamorris@linux.microsoft.com>,
        "john.allen@amd.com" <john.allen@amd.com>,
        "rppt@kernel.org" <rppt@kernel.org>, "nd@arm.com" <nd@arm.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
        "gorcunov@gmail.com" <gorcunov@gmail.com>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [PATCH v7 33/41] x86/shstk: Introduce map_shadow_stack syscall
Message-ID: <20230309210817.GB1964069@debug.ba.rivosinc.com>
References: <20230227222957.24501-1-rick.p.edgecombe@intel.com>
 <20230227222957.24501-34-rick.p.edgecombe@intel.com>
 <ZADbP7HvyPHuwUY9@arm.com>
 <20230309185511.GA1964069@debug.ba.rivosinc.com>
 <aaf918de8585204fb0785ac1fc0f686a8fd88bb0.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aaf918de8585204fb0785ac1fc0f686a8fd88bb0.camel@intel.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 09, 2023 at 07:39:41PM +0000, Edgecombe, Rick P wrote:
>On Thu, 2023-03-09 at 10:55 -0800, Deepak Gupta wrote:
>> On Thu, Mar 02, 2023 at 05:22:07PM +0000, Szabolcs Nagy wrote:
>> > The 02/27/2023 14:29, Rick Edgecombe wrote:
>> > > Previously, a new PROT_SHADOW_STACK was attempted,
>> >
>> > ...
>> > > So rather than repurpose two existing syscalls (mmap, madvise)
>> > > that don't
>> > > quite fit, just implement a new map_shadow_stack syscall to allow
>> > > userspace to map and setup new shadow stacks in one step. While
>> > > ucontext
>> > > is the primary motivator, userspace may have other unforeseen
>> > > reasons to
>> > > setup it's own shadow stacks using the WRSS instruction. Towards
>> > > this
>> > > provide a flag so that stacks can be optionally setup securely
>> > > for the
>> > > common case of ucontext without enabling WRSS. Or potentially
>> > > have the
>> > > kernel set up the shadow stack in some new way.
>> >
>> > ...
>> > > The following example demonstrates how to create a new shadow
>> > > stack with
>> > > map_shadow_stack:
>> > > void *shstk = map_shadow_stack(addr, stack_size,
>> > > SHADOW_STACK_SET_TOKEN);
>> >
>> > i think
>> >
>> > mmap(addr, size, PROT_READ, MAP_ANON|MAP_SHADOW_STACK, -1, 0);
>> >
>> > could do the same with less disruption to users (new syscalls
>> > are harder to deal with than new flags). it would do the
>> > guard page and initial token setup too (there is no flag for
>> > it but could be squeezed in).
>>
>> Discussion on this topic in v6
>>
>https://lore.kernel.org/all/20230223000340.GB945966@debug.ba.rivosinc.com/
>>
>> Again I know earlier CET patches had protection flag and somehow due
>> to pushback
>> on mailing list,
>>  it was adopted to go for special syscall because no one else
>> had shadow stack.
>>
>> Seeing a response from Szabolcs, I am assuming arm4 would also want
>> to follow
>> using mmap to manufacture shadow stack. For reference RFC patches for
>> risc-v shadow stack,
>> use a new protection flag = PROT_SHADOWSTACK.
>>
>https://lore.kernel.org/lkml/20230213045351.3945824-1-debug@rivosinc.com/
>>
>> I know earlier discussion had been that we let this go and do a re-
>> factor later as other
>> arch support trickle in. But as I thought more on this and I think it
>> may just be
>> messy from user mode point of view as well to have cognition of two
>> different ways of
>> creating shadow stack. One would be special syscall (in current libc)
>> and another `mmap`
>> (whenever future re-factor happens)
>>
>> If it's not too late, it would be more wise to take `mmap`
>> approach rather than special `syscall` approach.
>
>There is sort of two things intermixed here when we talk about a
>PROT_SHADOW_STACK.
>
>One is: what is the interface for specifying how the shadow stack
>should be provisioned with data? Right now there are two ways
>supported, all zero or with an X86 shadow stack restore token at the
>end. Then there was already some conversation about a third type. In
>which case the question would be is using mmap MAP_ flags the right
>place for this? How many types of initialization will be needed in the
>end and what is the overlap between the architectures?

First of all, arches can choose to have token at the bottom or not.

Token serve following purposes
  - It allows one to put desired value in shadow stack pointer in safe/secure manner.
    Note: x86 doesn't provide any opcode encoding to value in SSP register. So having
    a token is kind of a necessity because x86 doesn't easily allow writing shadow stack.

  - A token at the bottom acts marker / barrier and can be useful in debugging

  - If (and a big *if*) we ever reach a point in future where return address is only pushed
    on shadow stack (x86 should have motivation to do this because less uops on call/ret),
    a token at the bottom (bottom means lower address) is ensuring sure shot way of getting
    a fault when exhausted.

Current RISCV zisslpcfi proposal doesn't define CPU based tokens because it's RISC.
It allows mechanisms using which software can define formatting of token for itself.
Not sure of what ARM is doing.

Now coming to the point of all zero v/s shadow stack token.
Why not always have token at the bottom?

In case of x86, Why need for two ways and why not always have a token at the bottom.
The way x86 is going, user mode is responsible for establishing shadow stack and thus
whenever shadow stack is created then if x86 kernel implementation always place a token
at the base/bottom.

Now user mode can do following:--
  - If it has access to WRSS, it can sure go ahead and create a token of its choosing and
    overwrite kernel created token. and then do RSTORSSP on it's own created token.

  - If it doesn't have access to WRSS (and dont need to create its own token), it can do
    RSTORSSP on this. As soon as it does, no other thread in process can restore to it.
    On `fork`, you get the same un-restorable token.

So why not always have a token at the bottom.
This is my plan for riscv implementation as well (to have a token at the bottom)

>
>The other thing is: should shadow stack memory creation be tightly
>controlled? For example in x86 we limit this to anonymous memory, etc.
>Some reasons for this are x86 specific, but some are not. So if we
>disallow most of the options why allow the interface to take them? And
>then you are in the position of carefully maintaining a list of not-
>allowed options instead letting a list of allowed options sit there.

I am new to linux kernel and thus may be not able to follow the argument of
limiting to anonymous memory.

Why is limiting it to anonymous memory a problem. IIRC, ARM's PROT_MTE is applicable
only to anonymous memory. I can probably find few more examples. 

Eventually syscall will also go ahead and use memory management code to
perform mapping. So I didn't understand the reasoning here. The way syscall
can limit it to anonymous memory, why mmap can't do the same if it sees
PROT_SHADOWSTACK.

>
>The only benefit I've heard is that it saves creating a new syscall,
>but it also saves several MAP_ flags. That, and that the RFC for riscv
>did a PROT_SHADOW_STACK to start. So, yes, two people asked the same
>question, but I'm still not seeing any benefits. Can you give the pros
>and cons please?

Again the way syscall will limit it to anonymous memory, Why mmap can't do same?
There is precedence for it (like PROT_MTE is applicable only to anonymous memory)

So if it can be done, then why introduce a new syscall?

>
>BTW, in glibc map_shadow_stack is called from arch code. So I think
>userspace wise, for this to affect other architectures there would need
>to be some code that could do things generically, with somehow the
>shadow stack pivot abstracted but the shadow stack allocation not.

Agreed, yes it can be done in a way where it won't put tax on other architectures.

But what about fragmentation within x86. Will x86 always choose to use system call
method map shadow stack. If future re-factor results in x86 also use `mmap` method.
Isn't it a mess for x86 glibc to figure out what to do; whether to use system call
or `mmap`?

