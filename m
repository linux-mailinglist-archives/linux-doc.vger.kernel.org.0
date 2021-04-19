Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69E3E3649EC
	for <lists+linux-doc@lfdr.de>; Mon, 19 Apr 2021 20:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238008AbhDSSjL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 19 Apr 2021 14:39:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38648 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234421AbhDSSjL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Apr 2021 14:39:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618857520;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PmMpoqajN3kYFits3mKGuMX/Gpaj/8aNNG+P1JlM6wc=;
        b=eyCBe+4OeOGBIAbrcA34EBvprX+XnJgQ2E909+gcehr/XoLoji2gT4iPQg/hW2rBRXAS1a
        Vv9mZgeqMRNhMe5avczMMsQrPz7pRyQOr53BNOKhvP8swLl7oeo2+BRHYUJ6Zf7PLmPsb6
        DMIZ421/zb+zkm7dQp9/XNKLBKEzQ0g=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-EqceK3pQPXGks7IzEb74yQ-1; Mon, 19 Apr 2021 14:38:38 -0400
X-MC-Unique: EqceK3pQPXGks7IzEb74yQ-1
Received: by mail-ej1-f72.google.com with SMTP id 16-20020a1709063010b029037417ca2d43so3978535ejz.5
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 11:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PmMpoqajN3kYFits3mKGuMX/Gpaj/8aNNG+P1JlM6wc=;
        b=F5WICrh0w9HTwBSN6zgm1twLt4YlQUv4rg2CYTXpvm6a4UjIDlHLHtiSwNGO2/tGT7
         216PF3Phty8V2OGlzZ6MsKJdRHp8s8WnkNn6sjpIAmLIC5OZ+QIEwSKyR2RTcXXhpArb
         i0PzVcLhCctg4sI6R8EH/Eg+N2+/ATxKhzpN4O9aV/n7acCO8SnTrndgf73khI3wTF3v
         D2AlSQlZKsIqsmqjrz2TurpXX7k2F84eUqwy8QZVv1gDV1H+LyuQTNeSykf9HAcY0AjM
         8GOuCHkcTX6gNgMvYFV5w4fF3PeDKXkpzl1tDxsjYysysc/l/Hsz9MkeQlyCQaUjigbO
         fHBQ==
X-Gm-Message-State: AOAM533cLxxzh3ePNr3hG/IeJeRVLil0nhzmXiSgyIDzPyh01tOt9hBx
        OzSTXnmdUJa1rG6TP9TfVVwp1Uwo5mUT3c5FlRZMb3twozhot/mIErmvG/1UWGmFHUwnm1O2Lrm
        z+gbRR9ME9Dw6g+7xVVT0
X-Received: by 2002:aa7:db87:: with SMTP id u7mr26555991edt.16.1618857517782;
        Mon, 19 Apr 2021 11:38:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSoLXrPSs39zJEB+7+9uQJX6oXOARN/G69LiGquMuawAqQDZEfWVnHA83Lq8KX68XzCPInWg==
X-Received: by 2002:aa7:db87:: with SMTP id u7mr26555985edt.16.1618857517581;
        Mon, 19 Apr 2021 11:38:37 -0700 (PDT)
Received: from [192.168.10.118] ([93.56.169.140])
        by smtp.gmail.com with ESMTPSA id kx3sm10981044ejc.44.2021.04.19.11.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 11:38:36 -0700 (PDT)
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>, ojeda@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
 <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
 <aa6e44ab-e223-73aa-279e-8103732460ac@redhat.com>
 <YH0yCTgL0raKrmYg@hirez.programming.kicks-ass.net>
 <7287eac3-f492-bab1-9ea8-b89ceceed560@redhat.com>
 <YH0+0VQ1XC8+rv20@hirez.programming.kicks-ass.net>
 <3a874b15-5c21-9ed9-e5c3-995f915cba79@redhat.com>
 <YH1PGfC1qSjKB6Ho@hirez.programming.kicks-ass.net>
 <CAHk-=wjSrOcA0567rpn1PbYkGEgnw_sOmZ13JX87isrMq1dL-Q@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <ae079b78-1c26-ddb9-fb8f-83d27ba0c5a9@redhat.com>
Date:   Mon, 19 Apr 2021 20:38:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjSrOcA0567rpn1PbYkGEgnw_sOmZ13JX87isrMq1dL-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19/04/21 19:14, Linus Torvalds wrote:
> On Mon, Apr 19, 2021 at 2:36 AM Peter Zijlstra <peterz@infradead.org> wrote:
>>
>> I also don't see how this is better than seq_cst.
>>
>> But yes, not broken, but also very much not optimal.
> 
> I continue to feel like kernel people should just entirely ignore the
> C++ memory ordering standard.
> 
> It's inferior to what we already have, and simply not helpful. It
> doesn't actually solve any problems as far as the kernel is concerned,
> and it generates its own set of issues (ie assuming that the compiler
> supports it, and assuming the compiler gets it right).
> 
> The really subtle cases that it could have been helpful for (eg RCU,
> or the load-store control dependencies) were _too_ subtle for the
> standard.
> 
> And I do not believe Rust changes _any_ of that.

It changes it for the worse, in that access to fields that are shared 
across threads *must* either use atomic types (which boil down to the 
same compiler intrinsics as the C/C++ memory model) or synchronization 
primitives.  LKMM operates in the grey area between the C standard and 
what gcc/clang actually implement, but there's no such grey area in Rust 
unless somebody wants to rewrite arch/*/asm atomic access primitives and 
memory barriers in Rust.

Of course it's possible to say Rust code just uses the C/C++/Rust model 
and C code follows the LKMM, but that really only delays the inevitable 
until a driver is written part in C part in Rust, and needs to perform 
accesses outside synchronization primitives.

Paolo

> Any kernel Rust code will simply have to follow the LKMM rules, and
> use the kernel model for the interfaces. Things like the C++ memory
> model is simply not _relevant_ to the kernel.

