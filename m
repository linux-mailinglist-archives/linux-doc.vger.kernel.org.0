Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 692E052FA2C
	for <lists+linux-doc@lfdr.de>; Sat, 21 May 2022 11:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240364AbiEUJGh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 21 May 2022 05:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241473AbiEUJGb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 21 May 2022 05:06:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3106436E1B
        for <linux-doc@vger.kernel.org>; Sat, 21 May 2022 02:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653123989;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e9LHz14wFa2/WI+cnfgVklfc1muOyIoWusP/XZeOz08=;
        b=G61ppPe9bCIcgByqMTHb3Z/ukq5fPNoBlsV02XYnK7GaolbrHjJaJAFEM8GN/QKZ90rvZh
        B2E6aROlHvG6au2JRo7ZaAU0B/ltoGfWTlIem3QLATkVnBjG7EHBhXfhonBC1v0NRH8ddz
        9ClXGZoPt8kaKq8PZKud62hrKOtGOHI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-9ApT3jU1OyC5aFi3mRQirg-1; Sat, 21 May 2022 05:06:24 -0400
X-MC-Unique: 9ApT3jU1OyC5aFi3mRQirg-1
Received: by mail-wr1-f70.google.com with SMTP id l14-20020a05600012ce00b0020d06e7152cso3092001wrx.11
        for <linux-doc@vger.kernel.org>; Sat, 21 May 2022 02:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=e9LHz14wFa2/WI+cnfgVklfc1muOyIoWusP/XZeOz08=;
        b=cURNGSm5UHfI5gW5F9i32pvf4BR045P+U0zlBURkVeFjFMn8TZBUKkxef0FEPbKwyB
         xV4w5pJqJOCAdTvk0Xn2vbvOC+Vw99IIupb9C25dnUPP8yvXvPBRk2u4JHo1sRTw15cZ
         yvt8xHItLOAVvjgZbsMeEh28KaPDYyFCvR7LDw5xPRler0PT0sS6t0hTpJaHJZU5oNb6
         VByWOefQ8T++rH5dyGefwdOznNJcd1eG9sxx/k7O1U4I60AXzp2RLYo+1aQkxwzyzbg2
         XyjUMzNTl6QHk30zCYv7DMvpa4WHlvP0ARwGJpqFafUtmjmsSIzcT8F/4NcRBIJGxWcM
         PuuA==
X-Gm-Message-State: AOAM533I9F7CYzGTL4AK9iQp7uI0bhmW158BXOyQSggkVvZzEKyX6jSG
        xz5DYEOV1FbGL+KKsGiFSGMKGU+6OxR/QDt6aDYo5kYexQvAeg4kt3QTg/IiM0xJlr7spT8J+o7
        2l8RPJ1v5nYaG7jEvSaRx
X-Received: by 2002:a05:600c:1986:b0:394:867f:984c with SMTP id t6-20020a05600c198600b00394867f984cmr12146593wmq.20.1653123983682;
        Sat, 21 May 2022 02:06:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTeDbWSfdAJKkl4YczGM0UAl7TEZvciQfkOJv5cOIeHM43M+qHKKLXGP9/j3dj+RKra7iq3w==
X-Received: by 2002:a05:600c:1986:b0:394:867f:984c with SMTP id t6-20020a05600c198600b00394867f984cmr12146563wmq.20.1653123983458;
        Sat, 21 May 2022 02:06:23 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id z13-20020a7bc7cd000000b0039456fb80b3sm3750711wmk.43.2022.05.21.02.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 May 2022 02:06:23 -0700 (PDT)
Message-ID: <7caec251-20e7-4a8c-93ee-b28558ec580f@redhat.com>
Date:   Sat, 21 May 2022 11:06:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH V11 09/22] LoongArch: Add boot and setup routines
Content-Language: en-US
To:     Huacai Chen <chenhuacai@gmail.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>,
        Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-efi <linux-efi@vger.kernel.org>
References: <20220518092619.1269111-1-chenhuacai@loongson.cn>
 <20220518092619.1269111-10-chenhuacai@loongson.cn>
 <CAMj1kXEBVWi2ZdR5Le5-G0DA43u-AMxmSO=pVt39qwN=PkzQfw@mail.gmail.com>
 <0bae0df1-48ae-d02f-bce4-d1f69acf269e@redhat.com>
 <CAAhV-H5dqNiecER3fChkBjQUGGszj6gwcpOFM1b4Kaax5vz27g@mail.gmail.com>
 <cdbb002a-9f0a-caa9-445e-4ba20328171a@redhat.com>
 <CAAhV-H7yKVWaiU_VKnc2YnCSeZPOwedRWMY8ZTS-VWwk+vE0AA@mail.gmail.com>
 <256e0b82-5d0f-cf40-87c6-c2505d2a6d3b@redhat.com>
 <CAAhV-H7bJv5V5UKJCWgEbOdOWZhnma3_3eAXbbY1MX_uKodjgg@mail.gmail.com>
 <859d5489-9361-3db0-1da4-1417ed2fad6c@redhat.com>
 <CAAhV-H4UxkyHr=NQGFAAjCXwXHXDLsN_CV-tSCn6oonOSSjb0A@mail.gmail.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAAhV-H4UxkyHr=NQGFAAjCXwXHXDLsN_CV-tSCn6oonOSSjb0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Huacai,

On 5/21/22 09:37, Huacai Chen wrote:

[snip]

>>
>> A problem with moving to subsys_initcall_sync() is that this will delay
>> more when a display is available in the system, and just to cope up with
>> a corner case (as mentioned the common case is native drivers as module).
> OK, your method seems better, but I think moving to
> subsys_initcall_sync() can make the screen display as early as
> possible.
>

But it doesn't cover all cases. For example, you will get the same error
if for example your native driver is built-in and efifb built as module.
 
So my opinion is that instead of playing with the init call levels, is
just better for you to build your native driver as a module instead of
making it built-in.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

