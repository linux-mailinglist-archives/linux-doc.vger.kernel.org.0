Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC3932B09B4
	for <lists+linux-doc@lfdr.de>; Thu, 12 Nov 2020 17:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728599AbgKLQRa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 12 Nov 2020 11:17:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728233AbgKLQR3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Nov 2020 11:17:29 -0500
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB07C0613D1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2020 08:17:29 -0800 (PST)
Received: by mail-io1-xd43.google.com with SMTP id j12so6637582iow.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2020 08:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wql1vihawUfdAi3RlY4nIdk+T+uHWLK8xWelQf83+v0=;
        b=XGK9rSZ4Jlw8Ny7jjfM45f/d/TXlV384MoHJ2uvw3Y6gw48JwOkWivUOI8e5Q5lvbF
         PQiapsdlvJOJr1HVrg7CwjKFhXMZQ5aPtIjVAFS5Iu38tKzVCJUtoHC5qP1ivjNNYoWj
         0Oaobz7abvCZPJsIyn8DnmnJHL6o+KY7IrJM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wql1vihawUfdAi3RlY4nIdk+T+uHWLK8xWelQf83+v0=;
        b=MIwRPPLDGW7xhI7mQ2KykjHkrgYubsFXOQY9XaaOghQHt6LL55mYugulXjJ0dN+u/b
         Wo1eI2gf+7w0ivvsbOf6mgFNEYMrkZG9XaVpZ9aFCpAaQSUE53aOFdYgssDTrZOQyIIf
         FXOvarUgpigZMCCHpEji869w7LEm4ikJwxHl1O5xx0ZqA9wvMn68YLblfT88qDNOEr0/
         sjHCS3ILQ+bFiy/MFtMhPcZlZZDnDZAqOHkn+oq0ORgltYc4XwGGP92dYHl4UG8AWol7
         WI00yZfDsN7h9f99RHrdiH4W1bolYkqJn3KyJPPme3T6yCty8MDBVPNvjyuCEHJAl7wc
         +61A==
X-Gm-Message-State: AOAM5338508XqCsYFB+B/YU54R7HDBpsGrzuCylZIMfw9rSSwTwUizpW
        W/kWUvW4fSg9jYUYlGMi2+RTcw==
X-Google-Smtp-Source: ABdhPJyqzypqNPPq9OK4FbXBbf/5CC1EZ1loHBSIoVtM9ytn1dFMwbuWGV1X3KSy08ytcv5sb9O63A==
X-Received: by 2002:a6b:5b0e:: with SMTP id v14mr23225825ioh.155.1605197849077;
        Thu, 12 Nov 2020 08:17:29 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id l65sm3630702ill.18.2020.11.12.08.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2020 08:17:28 -0800 (PST)
Subject: Re: [PATCH 01/13] seqnum_ops: Introduce Sequence Number Ops
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Greg KH <gregkh@linuxfoundation.org>, corbet@lwn.net,
        peterz@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
References: <cover.1605027593.git.skhan@linuxfoundation.org>
 <d265685c901ea81c83c18e218a29710317ab7670.1605027593.git.skhan@linuxfoundation.org>
 <X6r7BIG8JTUOLcY0@kroah.com> <X6r7Vl45bgGQiAD2@kroah.com>
 <202011101614.E7D880689@keescook>
 <3075a4fd-8615-1459-2b20-b7d9d2be34ff@linuxfoundation.org>
 <20201112123621.GY17076@casper.infradead.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <acad8c18-a0a6-f52c-429a-02e614bee05c@linuxfoundation.org>
Date:   Thu, 12 Nov 2020 09:17:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201112123621.GY17076@casper.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/12/20 5:36 AM, Matthew Wilcox wrote:
> On Wed, Nov 11, 2020 at 12:23:03PM -0700, Shuah Khan wrote:
>>> Agreed: this is a clear wrapping sequence counter. It's only abuse would
>>> be using it in a place where wrapping actually is _not_ safe. (bikeshed:
>>> can we call it wrap_u32 and wrap_u64?)
>>
>> Still like seqnum_ops.
>>
>> There is seqcount_t in seqlock.h which is a totally different feature.
> 
> Yes, and that's why this new thing, whatever it is called should not
> have the word "sequence" in it.  People will get it confused. 

Any suggestions for name. I am bad with coming up with names. How does
Statcnt API and struct statcnt along the lines of your name suggestions
in your previous email?

> "ops" in Linux means "vector of methods", like a_ops, f_op, i_op, fl_ops.
> 

We also have "this_cpu_ops, atomic_ops, local_ops" etc. core-api.

The ops in the name is to keep with that nomenclature since these
are atomic ops.

thanks,
-- Shuah



