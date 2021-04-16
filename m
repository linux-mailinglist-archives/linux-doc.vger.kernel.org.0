Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDB2362962
	for <lists+linux-doc@lfdr.de>; Fri, 16 Apr 2021 22:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343525AbhDPUfU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 16 Apr 2021 16:35:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49102 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343509AbhDPUfU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Apr 2021 16:35:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618605294;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cnQ1WYK1Q/fzVZJP5dTDD7O6rnfjXe0Zb86HEbMOmAg=;
        b=Jyq6MvGwxcHCCJA8Yfaaf8pmGaF3SA6yRG+HtrQDhvLFG/SnS5QX3ZB3RULdZYs3MwIIQL
        N8feh2kU7ISxyzgLc79k+4e0cxnGx+jA1j4OlxqHCx2YyfN2EmZZejidsVdrn+PIdagKug
        kgVMBEhLyiyitZLxL6uP+MOrFXl6roI=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-1d4ixkwJN5-QOQN_zqmaRw-1; Fri, 16 Apr 2021 16:34:53 -0400
X-MC-Unique: 1d4ixkwJN5-QOQN_zqmaRw-1
Received: by mail-ot1-f69.google.com with SMTP id k24-20020a0568301bf8b02902844cbdb5feso5286952otb.5
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 13:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cnQ1WYK1Q/fzVZJP5dTDD7O6rnfjXe0Zb86HEbMOmAg=;
        b=mIliaXjGVpYVPWsDIS2PoXCw+tOLJSpx1IkLXqOQVA1vAS3QSn+BYgzdo2GqP6qbjV
         heGmKSq7yc9wI2OSZxaSlHnPEQZu843f6WYGNuUpaz4MmzOHy+cUX/XRFAcUvMJWM4/4
         izkJ6GrIH+qgmcMJej5AytP/HtfUO4rdBKB1x6khvMoFAiG05/QaSS4tweqyoi/PIJWs
         ol095gwtXaXZV244yekJeDqmm6JStVCtKGyH/OOyMbedA1sgqrXbX9nHrD/AsjjEnzKP
         /ULU1YdlGa/v91FiYH/ZeZijQ9Wa3bzCd7WeQOiQNMTHWZRXkRrw2ocZV226jl3tv/nC
         gs+w==
X-Gm-Message-State: AOAM532E84V821BrcxoKKQr3lHK6IiuIgC5hWNtU0zdzRkByrS7CegB9
        qqL54ELQ+K1eYU7TWYpA40I1XIT+NhbluIwYM/TFZECYuZrstXUHGxxgOfX8rYfymjl87LAXSR9
        y7bOaxH3VCaCuH1guwBRa
X-Received: by 2002:a05:6808:c7:: with SMTP id t7mr1055087oic.43.1618605292401;
        Fri, 16 Apr 2021 13:34:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDMeiBTSr4JPC5fMGzlWAn3gckHs2z8NaKVn5KrdX3KcjblRSMUGrgWzBCK6PA2rqcIxQZiA==
X-Received: by 2002:a05:6808:c7:: with SMTP id t7mr1055071oic.43.1618605292143;
        Fri, 16 Apr 2021 13:34:52 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
        by smtp.gmail.com with ESMTPSA id c21sm1431581ooa.48.2021.04.16.13.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 13:34:51 -0700 (PDT)
Subject: Re: [PATCH 04/13] Kbuild: Rust support
To:     Willy Tarreau <w@1wt.eu>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <20210414184604.23473-5-ojeda@kernel.org>
 <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net>
 <CAHk-=wh_zb=K1B-N8mgHmSZDqTLgOm711NRXbTX_OwFAzDYg0Q@mail.gmail.com>
 <CANiq72nx7ngazsH7sZgc=HeU0cNj45F9+-rwQb7AkdYsRCmRbQ@mail.gmail.com>
 <YHnS92ZKZ4tRWTiA@zeniv-ca.linux.org.uk>
 <CANiq72=RLf0FiuLVL-ZeLFp9P2LxTymbzhXoyQGG=tvUY_J-Sg@mail.gmail.com>
 <20210416202215.GA11236@1wt.eu>
From:   Connor Kuehl <ckuehl@redhat.com>
Message-ID: <efe80452-fac9-247a-1e2b-a73553f605e8@redhat.com>
Date:   Fri, 16 Apr 2021 15:34:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416202215.GA11236@1wt.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/16/21 3:22 PM, Willy Tarreau wrote:
> So it simply does the equivalent of:
> 
>   #define EINVAL -1234
> 
>   struct result {
>      int status;
>      int error;
>   };

Result and Option types are more like a union with a tag that
describes which variant it is.

struct foo_result {
    /* if ok, then access foo_or_err.successful_foo
     *        else, access foo_or_err.error
     */
    bool ok;
    union {
        struct foo successful_foo;
        int error;
    } foo_or_err;
};

> [..]
> 
> So it simply returns a pair of values instead of a single one, which

It will only return 1 value.

