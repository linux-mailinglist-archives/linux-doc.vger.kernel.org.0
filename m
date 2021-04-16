Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D99F36271D
	for <lists+linux-doc@lfdr.de>; Fri, 16 Apr 2021 19:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243585AbhDPRrB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 16 Apr 2021 13:47:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54451 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243610AbhDPRrB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Apr 2021 13:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618595195;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UwAq3mjTqcl8JnB7zCamgcUlnZYnBtvHAiM1ilKgZu8=;
        b=i3hSQiqS28Ss6H9hclpqTEkWWtwYENpKdx5aYrbWVTlBzltAI7AgLJdgz13R9e1m7r3eXY
        vXM2fsAdGuAoEFA7WBuKJlQ44tTNFfUZ3hVtok+Lsfme/xPXFLpmcvIS3I26CT2hV0j7ZP
        x3FBh9/rtI0yLcUY5CYMVT94GTwYVH0=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-OL3RH2TdPoqwtrc8o7Tt_A-1; Fri, 16 Apr 2021 13:46:34 -0400
X-MC-Unique: OL3RH2TdPoqwtrc8o7Tt_A-1
Received: by mail-oi1-f199.google.com with SMTP id v26-20020a056808005ab0290185a43e4c29so1916135oic.15
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 10:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UwAq3mjTqcl8JnB7zCamgcUlnZYnBtvHAiM1ilKgZu8=;
        b=GjwQWOosovcRB3d/MjcURVdv2OW5SVUfF4M/lFNeL1vf1odBiwK1/qQnFgjVLnevx/
         bAdeGHd9TtqslK3nmP3zoG7p8qUqbgHhCIPPFlhhLQ88CN+8GoBEXsP0fS1EIlOMUx6V
         2DNQyeVfQ+fOlMSjOHyrr28Aa6T9AqzkUh16bJ0sZMbpGOu9pUhB1yKlb1EicleT5bSc
         ypIkW2k+QlXDWeb2r8/iDGiv0HTBjQVe2VKxcTkT70q+IjPvoNWChCTFolawlrwTo9x3
         VQzf9Oc0u+oMpcgDjaWLAcf38h8J+qFi5RlGu5Yp7TPwdwN+ROccwxljivKk4Jcsj22T
         iSlg==
X-Gm-Message-State: AOAM533fFROLKDc1kqXvFS5JCC3qI0UzCcWP5rbCy7K+7gwtqVfAzU8U
        yXpTrul58KwQS6AZKwqFLCkwkW1uBuz6bPbVxuZ6ZVmBRfTaXK2cJb6i3gOD9mz5iLARMxVOlgR
        B8TBuzvz7xB5fRk2DD5O2
X-Received: by 2002:a9d:1d26:: with SMTP id m35mr4655996otm.266.1618595193399;
        Fri, 16 Apr 2021 10:46:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqmjn4JZgbtPJEhjtjFp39QSapQwN3qRjLDpF9oiDAS4DSPTNYxB/uSTzFnddcPY6N0Oc0UQ==
X-Received: by 2002:a9d:1d26:: with SMTP id m35mr4655978otm.266.1618595193194;
        Fri, 16 Apr 2021 10:46:33 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
        by smtp.gmail.com with ESMTPSA id y2sm1365951ooa.10.2021.04.16.10.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 10:46:32 -0700 (PDT)
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Willy Tarreau <w@1wt.eu>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <YHmuX1NA5RF7C7XS@google.com> <20210416161444.GA10484@1wt.eu>
 <CANiq72nbkJFPmiJXX=L8PmkouKgKG1k-CxhZYpL1hcncYwa8JA@mail.gmail.com>
 <20210416173717.GA10846@1wt.eu>
From:   Connor Kuehl <ckuehl@redhat.com>
Message-ID: <d33dbe20-698a-7dba-2e46-ece325a1c849@redhat.com>
Date:   Fri, 16 Apr 2021 12:46:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416173717.GA10846@1wt.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/16/21 12:37 PM, Willy Tarreau wrote:
> Hi Miguel,
> 
> On Fri, Apr 16, 2021 at 07:10:17PM +0200, Miguel Ojeda wrote:
>> And by having the compiler enforce this safe-unsafe split, you can
>> review safe code without having to constantly worry about UB; and be
>> extra alert when dealing with `unsafe` blocks.
> 
> I do appreciate this safe/unsafe split and a few other things I've seen
> in the language. The equivalent I'm using in C is stronger typing and
> "const" modifiers wherever possible. Of course it's much more limited,
> it's just to explain that I do value this. I just feel like "unsafe"
> is the universal response to any question "how would I do this" while
> at the same time "safe" is the best selling argument for the language.
> As such, I strongly doubt about the real benefits once facing reality
> with everything marked unsafe. Except that it will be easier to blame
> the person having written the unsafe one-liner instead of writing 60
> cryptic lines doing the functional equivalent using some lesser known
> extensions :-/
> 

It's possible that many of the questions you've been specifically asking
about, by sheer coincidence, are targeted towards the problems that would
indeed require a lower-level abstraction built within an unsafe block; meaning
you've managed to evade the tons of other upper layers that could be written
in safe Rust.

Indeed, at a certain layer, unsafe is unavoidable for the kind of work that
is done in the kernel. The goal is to shrink the unsafe blocks as much as
possible and confirm the correctness of those pieces, then build safe
abstractions on top of it.

For what it's worth, if there was some post-human apocalyptic world where
literally everything had to go inside an unsafe block, the silver lining
in a hypothetical situation like this is that unsafe does not disable all
of Rust's static analysis like the borrow checker, etc. It allows you to
do things like directly dereference a pointer, etc. Unsafe also doesn't
automatically mean that the code is wrong or that it has memory issues;
it just means that the compiler can't guarantee that it doesn't based on
what you do in the unsafe block.

Connor

