Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7940752F97E
	for <lists+linux-doc@lfdr.de>; Sat, 21 May 2022 09:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347014AbiEUHHE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 21 May 2022 03:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345654AbiEUHHE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 21 May 2022 03:07:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F3FFF6A009
        for <linux-doc@vger.kernel.org>; Sat, 21 May 2022 00:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653116820;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rj0IBToDEEzws01ZsJ5TxaznVfv/rUulQJs9O//SMwo=;
        b=GGJwQdV7rIWJ/LNd5K9SlBHu4zNZbTHnAkDeiUyOSAmNL1p3xucLKbZIPk6penr66fIEk8
        QdE9vdh5TKP0x/25slAAajibePuLSPZwHThrrqzv/iqLsLegPlpDVHfIjYhrtKOJJrVuR/
        W0dnMYGgL+BC/j5NRY26CIqqRxD+9wE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-2A3_mOe1ORyMupKffHwgMQ-1; Sat, 21 May 2022 03:06:58 -0400
X-MC-Unique: 2A3_mOe1ORyMupKffHwgMQ-1
Received: by mail-wr1-f70.google.com with SMTP id e17-20020adfe391000000b0020e64e7dd15so2509351wrm.4
        for <linux-doc@vger.kernel.org>; Sat, 21 May 2022 00:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rj0IBToDEEzws01ZsJ5TxaznVfv/rUulQJs9O//SMwo=;
        b=Pe0y7LHeu4UCPqKvbPsUf7Ccis//idv3X5Zs1X4ryHx0MSamIoAkCcAbWcuAg+xaJJ
         bBcBoW2jRzNn3DS15bmace0NFRHLcYdY9iEMwDD5vq5i5YUqG0NA1ITVYOOt43bgDFam
         2/iGMhIzZXie0L2QC3xsD0q30prHL55zUwdtrIV+Q8SYI8gtgtd/Av4aPdZKCpPvaVkr
         GryXkDyeiemDHW/1YmAB2IF+gyH7E5UyxjgB+iYOLiDb4wcBj9Lr8Z+7voVlmUQrf6fy
         S1gItWs/YNijmd37u+PH9cxNdV2zWKPkHCko7rR573ZBbj+bKUNt4gE/JGFgTrHaUebY
         OzYg==
X-Gm-Message-State: AOAM5336EP2g20c7mCphacivoRQJxYT5CaGkYyO0Wgw+FgBwFY0QpZb+
        JCWwbXI2SD0bAKPtZQO7i0uB/JDIGilzXZRMnkZBeu/UUV6pSPSmW0m7i2dNOYDb586F5oHuMsd
        w387ik37Y8omwmubrAJn1
X-Received: by 2002:a5d:6d48:0:b0:20e:5f80:bd29 with SMTP id k8-20020a5d6d48000000b0020e5f80bd29mr10961821wri.428.1653116816894;
        Sat, 21 May 2022 00:06:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXpt2pKfnjTmWvEr6j3KFLKUHf1Ptl4A/ZxFxx5bUmYfVNLnhv5FvUFHaPu23JY72oswJHZQ==
X-Received: by 2002:a5d:6d48:0:b0:20e:5f80:bd29 with SMTP id k8-20020a5d6d48000000b0020e5f80bd29mr10961789wri.428.1653116816614;
        Sat, 21 May 2022 00:06:56 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p14-20020adfaa0e000000b0020d02ddf4d0sm4179454wrd.69.2022.05.21.00.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 May 2022 00:06:56 -0700 (PDT)
Message-ID: <859d5489-9361-3db0-1da4-1417ed2fad6c@redhat.com>
Date:   Sat, 21 May 2022 09:06:54 +0200
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
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAAhV-H7bJv5V5UKJCWgEbOdOWZhnma3_3eAXbbY1MX_uKodjgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Huacai,

On 5/21/22 03:40, Huacai Chen wrote:
> Hi, Javier,

[snip]

>>>> Conversely, if the sysfb_init() is executed first then the platform device
>>>> will be registered and latter when the driver's init register the driver
>>>> this will match the already registered device.
>>> Yes, you are right, my consideration is too complex. The only real
>>> problem is a harmless error "efifb: a framebuffer is already
>>> registered" when both efifb and the native display driver are
>>> built-in.
>>>
>>
>> But this shouldn't be a problem if you drop your register_gop_device() that
>> registers an "efi-framebuffer", since sysfb would either register a platform
>> device "simple-framebufer" or "efi-framebuffer", but never both. Those are
>> mutually exclusive.
>>
>> I think what's happening now is that sysfb is registering a "simple-framebuffer"
>> but your register_gop_device() function is also registering an "efi-framebuffer".
> No, I have already removed register_gop_device(). Now my problem is like this:
> 1, efifb (or simpledrm) is built-in;
> 2, a native display driver (such as radeon) is also built-in.
>

Ah, I see. The common configuration is for the firmware-provide framebuffer
drivers ({efi,simple}fb,simpledrm,etc) to be built-in and native drivers to
be built as a module.
 
> Because efifb, radeon and sysfb are all in device_initcall() level,
> the order in practise is like this:
> 
> efifb registered at first, but no "efi-framebuffer" device yet.
> radeon registered later, and /dev/fb0 created.
> sysfb_init() comes at last, it registers "efi-framebuffer" and then
> causes the error "efifb: a framebuffer is already registered".

Yes, this is problem because only conflicting framebuffers and associated
devices are unregistered when a real driver is registered, but no devices
that have not matched with drivers and registered framebuffers or disable
devices to be registered later.

I proposed the following patch series but the conclusion was that this has
to be fixed in a more general way:

https://lore.kernel.org/lkml/20220511112438.1251024-1-javierm@redhat.com/

> make sysfb_init() to be subsys_initcall_sync() can avoid this.
>

Right, now I understand your problem and you are correct that this will
avoid it. But I believe is just papering over the issue, the problem is
that if a native fbdev or DRM driver probed, then sysfb (or any other
platform code) should not register a device to match a driver that will
attempt to use a firmware-provided framebuffer.

A problem with moving to subsys_initcall_sync() is that this will delay
more when a display is available in the system, and just to cope up with
a corner case (as mentioned the common case is native drivers as module).
 -- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

