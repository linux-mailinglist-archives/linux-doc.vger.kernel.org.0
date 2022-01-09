Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4352B488AC3
	for <lists+linux-doc@lfdr.de>; Sun,  9 Jan 2022 18:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236082AbiAIRBO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 9 Jan 2022 12:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbiAIRBN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 Jan 2022 12:01:13 -0500
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 770AEC06173F
        for <linux-doc@vger.kernel.org>; Sun,  9 Jan 2022 09:01:13 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id x15so9349267ilc.5
        for <linux-doc@vger.kernel.org>; Sun, 09 Jan 2022 09:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ni82BwKqRcHMRYYGeGumU3lsjRuqW6j77qLlKQHA+pc=;
        b=MXyPvYLFZ/en29Stoz7dMpLTz4cvTBMzsOLaMfuvvTG1qltausylZbdrmzMaB6C8Mk
         wbl6XuQpKKqajnYOOcDKALYTzVgwWlXjwuo3wegODw20FM5zk4GsS8Wy2k2eup4XkGea
         nT7fcEqYToLJVtYaJGyCcr4gweZIz8SpUvAQ6Uh8kOHP+v6pELClavH8SEDVk3CDXzk8
         aGSWjaSI5mw5bBkdPeRj+Cecdts60m5RemLjq88XyY94DZhj6hGl+EHDsUJT9PB3aqsL
         59BW55/OkWNYt1Lwby0tpVQ68E9OH68+Q58YJyF+SbNGbp01LVDH4qF7AKDGWKfa7efG
         KFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ni82BwKqRcHMRYYGeGumU3lsjRuqW6j77qLlKQHA+pc=;
        b=U4ki4NPuedGm7ymOslMDDqqklUhdPDeKErSb4QBQ7RxQklIRCzgR3IDzWDAZ6FggJy
         Ev2JvCm6Z9Trdhie4ooENMHbIHSZjfj1aUPQiGAP2xMuAi5A4rqev7hN1VY6kAye6kGg
         DRmswSFihDq7+zZlUwjtlvIIP5G/PtKykLKIckEbN7slSMdBdOK4k9aBRAtcwbQkW3Ee
         G3cPgv9P1Yy5+jyrOH2k+iQbUcWMs1pWW89kEjcQQwxinkly1KRtcrfeUImwMv+lR0SV
         4w80DfID05IykagWQoZtbbB9ZEZbV9Xu/y/fnjPdOjyXpvaBhIcQVEZxm0YaASrcXdyO
         ptVw==
X-Gm-Message-State: AOAM530MWstEkF+04Gawnl0Tw3/2Fo5wMOgNjTfBIFtkDULuEzLiw6b7
        qzyBaSq0vqYoF8kFsEnXuOwqkg==
X-Google-Smtp-Source: ABdhPJw7rD3CONTyMPcaCpu/mhJPmwDl7wTQq5F40xWYaf7w7pgoXjrZYXZDl+9gYlH/ipIZo110gQ==
X-Received: by 2002:a05:6e02:1be2:: with SMTP id y2mr32550649ilv.262.1641747672871;
        Sun, 09 Jan 2022 09:01:12 -0800 (PST)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id g5sm2810228ioo.21.2022.01.09.09.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jan 2022 09:01:12 -0800 (PST)
Subject: Re: [PATCH v3 0/8] docs: consolidate sysfs-block into
 Documentation/ABI/
To:     Bart Van Assche <bvanassche@acm.org>,
        Eric Biggers <ebiggers@kernel.org>
Cc:     linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
References: <20211209003833.6396-1-ebiggers@kernel.org>
 <YcH1uxfdTRHIwl7Y@quark> <YdMQ6rfSZWSOLptA@quark>
 <YddiJFr+ba7Veh82@sol.localdomain>
 <65376e36-579b-76c4-0642-4582d6679914@acm.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <ef487b83-a1cc-d8a5-8a45-d0fec5eed94b@kernel.dk>
Date:   Sun, 9 Jan 2022 10:01:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <65376e36-579b-76c4-0642-4582d6679914@acm.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/7/22 1:58 PM, Bart Van Assche wrote:
> On 1/6/22 13:41, Eric Biggers wrote:
>> Jens, any reason you haven't applied this series yet?  It looks like you've been
>> applying other patches.  To be clear, I've been expecting that this would go in
>> through the block tree, rather than the docs tree.
> 
> We are close to the v5.17 merge window so this is not a good time for a maintainer to
> apply a large patch series. If Jens does not reply I propose to repost this patch
> series after the v5.17 merge window has closed (three weeks from now?).

I'm fine with it, but it should probably just go through the doc tree.

-- 
Jens Axboe

