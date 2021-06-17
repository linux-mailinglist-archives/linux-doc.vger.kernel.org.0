Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F12A3AA946
	for <lists+linux-doc@lfdr.de>; Thu, 17 Jun 2021 04:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbhFQDAv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 16 Jun 2021 23:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbhFQDAu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Jun 2021 23:00:50 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82905C06175F
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 19:58:42 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id n12so3701388pgs.13
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 19:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=pAetusrXJOJzWSJzpj/wpmSbSm54E0/FhIpgunOB9fg=;
        b=ukzHIYxmdKkIQf64rUee88mkx/YVndIKeGyPC7juZMCTOHOZ8juq16b0buUyJHPM1A
         JMaWUp7K63bjpALA1waqiGlhBxCR8a4CHnAM/noOylfw+06z1WpT34aH6757NHmsot31
         4DoLbtGvHOiketrzTVIwOeGCGQ6DkFSlPBuFdofL4i9OREH6Qz719CfpP53p26U8YieQ
         gNVM/M5rIQrk5tpUeZqypINbwENqGSXKtKrEY43EyRky19Q/YUhUB3I3ifozlbN2t+se
         zihwN6OigL/4NHZ1Ue/JDuMOZdDDELwua7YPbob6N/xqagVBi6bXI1GBQGQPuLkyvo1f
         y9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=pAetusrXJOJzWSJzpj/wpmSbSm54E0/FhIpgunOB9fg=;
        b=F7DR79HQxypu5xp5wDpmIbb9Eg2kJixcBzTTq1Ed635YATgEDek+yy5zPqOxwEsNE4
         cNjPBpKPNq/a3sdK21LSNwPy58r6EBiYWzU3R5Q38a7DaLGtWo1otNg21e2KXw7jwK/b
         x0DKNL4vimJUHdZ+TFQPbTfLZq36xPAPmBdHYxG60BHP/ZNxDHZdKXULSyBwWXGAJhGW
         8VoAYqqiUVIqH4kS/xE9CXzTnzIB4zcFDOaBt2cGaAT8ig+iinnF9R6fcAjADu8hSTgh
         tjCvB1b06uBx2piRISJxRW8SMF+LxIGo5FyA/S8PlfFTWS5lEUFvfw08JP4AbpFnmnc+
         /nlg==
X-Gm-Message-State: AOAM531jjKp4IsAqDgg8AqaThHEfBYHKER+eb4QvQ89h1njbmasN7b+i
        r60VU+oCKinZyxZz+GCg6LgzCA==
X-Google-Smtp-Source: ABdhPJxM8YGfhTyvdc1ihezx3Yt6LpJ2Zg7c25L7/ASVxuUM6An10/lYTrBBK2BJS6+69kGdNj0Eyg==
X-Received: by 2002:a05:6a00:c2:b029:2ee:9cfc:af85 with SMTP id e2-20020a056a0000c2b02902ee9cfcaf85mr3098604pfj.78.1623898721881;
        Wed, 16 Jun 2021 19:58:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id u9sm3633698pgp.90.2021.06.16.19.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 19:58:41 -0700 (PDT)
Date:   Wed, 16 Jun 2021 19:58:41 -0700 (PDT)
X-Google-Original-Date: Wed, 16 Jun 2021 19:58:38 PDT (-0700)
Subject:     Re: [PATCH v5 1/3] riscv: Move kernel mapping outside of linear mapping
In-Reply-To: <20210611110019.GA579376@roeck-us.net>
CC:     schwab@linux-m68k.org, alex@ghiti.fr, corbet@lwn.net,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
        aryabinin@virtuozzo.com, glider@google.com, dvyukov@google.com,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-mm@kvack.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     schwab@linux-m68k.org, linux@roeck-us.net
Message-ID: <mhng-569bbfda-00d0-4c1f-9a88-69021f258f7e@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 11 Jun 2021 04:00:19 PDT (-0700), linux@roeck-us.net wrote:
> On Thu, Jun 10, 2021 at 07:29:15PM +0200, Andreas Schwab wrote:
>> On Jun 10 2021, Guenter Roeck wrote:
>>
>> > On Thu, Jun 10, 2021 at 07:11:38PM +0200, Andreas Schwab wrote:
>> >> On Jun 10 2021, Guenter Roeck wrote:
>> >>
>> >> > On Thu, Jun 10, 2021 at 06:39:39PM +0200, Andreas Schwab wrote:
>> >> >> On Apr 18 2021, Alex Ghiti wrote:
>> >> >>
>> >> >> > To sum up, there are 3 patches that fix this series:
>> >> >> >
>> >> >> > https://patchwork.kernel.org/project/linux-riscv/patch/20210415110426.2238-1-alex@ghiti.fr/
>> >> >> >
>> >> >> > https://patchwork.kernel.org/project/linux-riscv/patch/20210417172159.32085-1-alex@ghiti.fr/
>> >> >> >
>> >> >> > https://patchwork.kernel.org/project/linux-riscv/patch/20210418112856.15078-1-alex@ghiti.fr/
>> >> >>
>> >> >> Has this been fixed yet?  Booting is still broken here.
>> >> >>
>> >> >
>> >> > In -next ?
>> >>
>> >> No, -rc5.
>> >>
>> > Booting v5.13-rc5 in qemu works for me for riscv32 and riscv64,
>> > but of course that doesn't mean much. Just wondering, not knowing
>> > the context - did you provide details ?
>>
>> Does that work for you:
>>
>> https://github.com/openSUSE/kernel-source/blob/master/config/riscv64/default
>>
>
> That isn't an upstream kernel configuration; it looks like includes suse
> patches. But, yes, it does crash almost immediately if I build an upstream
> kernel based on it and try to run that kernel in qemu. I did not try to
> track it down further; after all, it might just be that the configuration
> is inappropriate for use with qemu. But the configuration isn't really
> what I had asked.

This seems a long way off from defconfig.  It's entirly possible I'm 
missing something, but at least CONFIG_SOC_VIRT is jumping out as 
something that's disabled in the SUSE config but enabled upstream.  That 
alone shouldn't actually do anything, but it does ensure we have all the 
drivers necessary to boot on QEMU.

It's entierly possible there's a real bug here, though, as I don't 
really see what these relocatable patches would have to do with that.
