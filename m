Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46BB06633A3
	for <lists+linux-doc@lfdr.de>; Mon,  9 Jan 2023 23:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237040AbjAIWDE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 9 Jan 2023 17:03:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237060AbjAIWDD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Jan 2023 17:03:03 -0500
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753B5192A5
        for <linux-doc@vger.kernel.org>; Mon,  9 Jan 2023 14:03:02 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-4d0f843c417so17868527b3.7
        for <linux-doc@vger.kernel.org>; Mon, 09 Jan 2023 14:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k0nIhdmoq2YN+8CYmcGGz5g09uBL17k5HRqIgJjfUJU=;
        b=F4QSW1fmPta1SdZoMgqppkBUl/S595vxphelnA2n0Z8L7+V9JICv9+FhFq2SezihUL
         AZzzhDrgCA39Hc/bNA+TttzJcb5t9eNeDk24AJ2XPx+BNVsLNoozshq0sopE0CVIK+mb
         mldZC1Aw99FFSuOlyX98h9PUcGiDBvSvEDfSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0nIhdmoq2YN+8CYmcGGz5g09uBL17k5HRqIgJjfUJU=;
        b=gnYrsqLo+ksu8v896HdQLs1BhZVU4zFY99ewpai2EXTqRuIvH5tfXIpzTv1cbwCxbP
         lyEnX36yESmx9hF0YnjY84vEzc0ElFxY01XU9Xen+KcilIhTN6Cv/q6rPtEQpIOT9xkD
         zpGtubfCOGrEs8UbiArDdrN+ItoBZfI381f7s0cNTtAOPNfFdqOVQ/+Ltbj7OnxStaPm
         QazLoD0pDuiDLV8B8IM0QS3+0uckVhquC4+rQ+Rui0jjTa8FEMIj+b0UCm+ri4zrVFKe
         ipl7gDlRuUgtHQhcdnUZsIhoKjPN9F1eYbsyyCNkdFfUc7vhVX7o9GGZ7TCQs1qctdop
         pGMw==
X-Gm-Message-State: AFqh2koP0E1tJp7xHYyXZ6QHQkGNnH77N6xWgvZYGbChBo8mg6zzr34S
        FxatII4CQ8KlHQret7yQnO7+lCneEuGEsGl3WUI=
X-Google-Smtp-Source: AMrXdXvaSgHlRPupbUdGDG+GvpkzJw3whDCcwUTfH10ZacWA6lgplF5L2a34VBJBLxBIHm9CPDHWjA==
X-Received: by 2002:a05:7508:314b:b0:49:c156:1be9 with SMTP id f11-20020a057508314b00b00049c1561be9mr407822gbf.8.1673301781082;
        Mon, 09 Jan 2023 14:03:01 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id f45-20020ab049f0000000b0040923fbb16esm1251078uad.26.2023.01.09.14.03.00
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 14:03:00 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id i185so10320576vsc.6
        for <linux-doc@vger.kernel.org>; Mon, 09 Jan 2023 14:03:00 -0800 (PST)
X-Received: by 2002:ad4:4150:0:b0:531:7593:f551 with SMTP id
 z16-20020ad44150000000b005317593f551mr1338900qvp.89.1673301769392; Mon, 09
 Jan 2023 14:02:49 -0800 (PST)
MIME-Version: 1.0
References: <20221219153525.632521981@infradead.org> <20221219154119.550996611@infradead.org>
 <Y7Ri+Uij1GFkI/LB@osiris> <CAHk-=wj9nK825MyHXu7zkegc7Va+ZxcperdOtRMZBCLHqGrr=g@mail.gmail.com>
 <Y7xAsELYo4srs/z/@hirez.programming.kicks-ass.net>
In-Reply-To: <Y7xAsELYo4srs/z/@hirez.programming.kicks-ass.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 9 Jan 2023 16:02:33 -0600
X-Gmail-Original-Message-ID: <CAHk-=whm+u8YoUaE9PKugYBxujhDL5twz6HqzqLP8OTXjKuT4g@mail.gmail.com>
Message-ID: <CAHk-=whm+u8YoUaE9PKugYBxujhDL5twz6HqzqLP8OTXjKuT4g@mail.gmail.com>
Subject: Re: [RFC][PATCH 11/12] slub: Replace cmpxchg_double()
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Heiko Carstens <hca@linux.ibm.com>, corbet@lwn.net,
        will@kernel.org, boqun.feng@gmail.com, mark.rutland@arm.com,
        catalin.marinas@arm.com, dennis@kernel.org, tj@kernel.org,
        cl@linux.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
        borntraeger@linux.ibm.com, svens@linux.ibm.com,
        Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        joro@8bytes.org, suravee.suthikulpanit@amd.com,
        robin.murphy@arm.com, dwmw2@infradead.org,
        baolu.lu@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
        penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com,
        Andrew Morton <akpm@linux-foundation.org>, vbabka@suse.cz,
        roman.gushchin@linux.dev, 42.hyeyoo@gmail.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org,
        linux-crypto@vger.kernel.org, iommu@lists.linux.dev,
        linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 9, 2023 at 10:29 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> I ran into a ton of casting trouble when compiling kernel/fork.c which
> uses this_cpu_cmpxchg() on a pointer type and the compiler hates casting
> pointers to an integer that is not the exact same size.

Ahh. Yeah - not because that code needs or wants the 128-bit case, but
because the macro expands to all sizes in a switch statement, so the
compiler sees all the cases even if only one is then statically
picked.

So the silly casts are for all the cases that never matter.

Annoying.

I wonder if the "this_cpu_cmpxchg()" macro could be made to use
_Generic() to pick out the pointer case first, and then only use
'sizeof()' for the integer types, so that we don't have this kind of
"every architecture needs to deal with the nasty situation" code.

Ok, it's not actually the this_cpu_cmpxchg() macro, it's
__pcpu_size_call_return() and friends, but whatever.

Another alternative is to try to avoid casting to "u64" as long as
humanly possible, and use only "typeof((*ptr))" everywhere. Then when
the type actually *is* 128-bit, it all works out fine, because it
won't be a pointer. That's the approach the uaccess macros tend to
take, and then they hit the reverse issue on clang, where using the
"byte register" constraints would cause warnings for non-byte
accesses, and we had to do

                unsigned char x_u8__;
                __get_user_asm(x_u8__, ptr, "b", "=q", label);
                (x) = x_u8__;

because using '(x)' directly would then warn when 'x' wasn't a
char-sized thing - even if that asm case never actually was _used_ for
that case, since it was all inside a "switch (sizeof) case 1:"
statement.

            Linus
