Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA09B3ACDAD
	for <lists+linux-doc@lfdr.de>; Fri, 18 Jun 2021 16:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234586AbhFROlG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 18 Jun 2021 10:41:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234232AbhFROlF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Jun 2021 10:41:05 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA17C06175F
        for <linux-doc@vger.kernel.org>; Fri, 18 Jun 2021 07:38:56 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so9908739otl.3
        for <linux-doc@vger.kernel.org>; Fri, 18 Jun 2021 07:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=T9YZ9nd9UJQBiMGTA8SwSx9fF/IkYT4ggh3TTtYGORU=;
        b=ELMedzfqm5gGYiZMpebilxyhIz30HP+7MOrFhLWMfRM7CNAGCIQMGLIobxyzi2vTvr
         aj3eqq2G0rINF61dtcVNMqxlKrb2V4BxLPEmPZiRqvpDoudbV/EgJiamQGWpXpxflQmO
         ND3tV4XYaw4ZeFHRCzpd+EOeGFKQC2rJD985zQdcFF3mqvI4ET4kgMto7ucO5bfXIzvY
         /cBGMYPqdnkSCTr4+YLVPB0A5rpI9N5gZtGLbFQa1CNCzSRtYfXQmZ4FMBc/itdFoj/X
         Z09tQjkcsSNNkxC1pLW0oyfttF9xqvdh30nPpapcASD+YC/vcdSisam+uu+KYMjXS1oZ
         jueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T9YZ9nd9UJQBiMGTA8SwSx9fF/IkYT4ggh3TTtYGORU=;
        b=RKETwSUtNmNGcuHuuOyQNImWobyBZ0CD5COGxlh1x0NFKQNxWPfjKWS8BGlG6p4CD9
         EicLV8Q2GD9Hj9nk4cMwHG4D4XNtB3aPl485D6N+eHgFCFwcaWds6mRvsLOqZcwMh2ol
         OEZLP8RKP+aWv/JOQ9DlKaQ2g0nejsdqvOpHuRWN5qqWCjB/EG3tpBq6i3cu/hq0xn5U
         eUqRCle1+VNp1UOvXJB6qAV7tQf7q+10WHOUdTnKZfpFOjFkjFCZc30j6IjL8X91qsDx
         a84qrY3hUT3gTMR9eRz1Bg1XQdf+yzPqmCE8HsiBixxrhVFQ1XhKxfgjR0OZkHqyfesN
         vfMw==
X-Gm-Message-State: AOAM531xQ7reHZwqEMO7rA4serJF96NJheEC66AcQYCRVfvZVZKuA+yq
        byCqS3YmIqzgrWE48f0TTnlJ8g==
X-Google-Smtp-Source: ABdhPJzHAmLUNJckmU3abFOD9WQomHPPF2qlw1+78hJMYelf0T+g8MkjAjpQ3BD9i4JwVNNbP4pUfw==
X-Received: by 2002:a9d:426:: with SMTP id 35mr9427857otc.162.1624027135675;
        Fri, 18 Jun 2021 07:38:55 -0700 (PDT)
Received: from [192.168.1.134] ([198.8.77.61])
        by smtp.gmail.com with ESMTPSA id l2sm2126772otl.27.2021.06.18.07.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jun 2021 07:38:55 -0700 (PDT)
Subject: Re: remove the legacy ide driver v2
From:   Jens Axboe <axboe@kernel.dk>
To:     Christoph Hellwig <hch@lst.de>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-ide@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org
References: <20210616134658.1471835-1-hch@lst.de>
 <4b003372-41d0-507a-b74b-b73aa33189f4@kernel.dk>
Message-ID: <57488a7b-02fa-3b3a-6719-81ab8dd64b53@kernel.dk>
Date:   Fri, 18 Jun 2021 08:38:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4b003372-41d0-507a-b74b-b73aa33189f4@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/16/21 8:52 AM, Jens Axboe wrote:
> On 6/16/21 7:46 AM, Christoph Hellwig wrote:
>> Hi all,
>>
>> we've been trying to get rid of the legacy ide driver for a while now,
>> and finally scheduled a removal for 2021, which is three month old now.
>>
>> In general distros and most defconfigs have switched to libata long ago,
>> but there are a few exceptions.  This series first switches over all
>> remaining defconfigs to use libata and then removes the legacy ide
>> driver.
>>
>> libata mostly covers all hardware supported by the legacy ide driver.
>> There are three mips drivers that are not supported, but the linux-mips
>> list could not identify any users of those.  There also are two m68k
>> drivers that do not have libata equivalents, which might or might not
>> have users, so we'll need some input and possibly help from the m68k
>> community here.
>>
>> This series is against Jens' for-5.14/libata branch.
> 
> Unless someone complains loudly, I plan on queueing this up end this
> week.

This has now been applied for 5.14, thanks.

-- 
Jens Axboe

