Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7741C3625B5
	for <lists+linux-doc@lfdr.de>; Fri, 16 Apr 2021 18:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235985AbhDPQe0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 16 Apr 2021 12:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235890AbhDPQeZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Apr 2021 12:34:25 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4708C061756
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 09:33:59 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id h15so1001479pfv.2
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 09:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=z2OC1cEMuhrClU6NrKEbwSpdwK0Wyx5ycssXYh5zYaY=;
        b=maRGpOFYp6s48tNdoBVkOiMrziCDdLhM4rOR4KgB9GJvXiT8JjXZsphgurWw2bPWv7
         T5PmtSkO23D/cTi94/mAgEq4NUhHpgQtZl19zHHCiq5UAZ0xovLHauhJ8RBh5WBs/Bcn
         3Oe01YPXH7SHcAyhK4SJQicy/x5bRnFEmUsJGjT5Suly3fBl+LJ6ZF1wLUy5qI/r0bPK
         N63cln/k0URTbRZY6VJSuHOl6icLs8DZYwyIyqXF9BwDODSg5nSZq9fHAu4+SGL/jyO/
         JwceGbPavk6Y5mwG5AwJRUe3/DV0/1d402Q0hzRBACqRXaMGQgsQARzbY8IkYSIuaNZp
         bZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=z2OC1cEMuhrClU6NrKEbwSpdwK0Wyx5ycssXYh5zYaY=;
        b=eSk94yKVKDlHSGUqWRggHSO9j85+BB8JJfEu5AX1BYX8O2EI4hPO4i5Qt8A9ogTLwG
         TfAZCEb4MMX9QE5NbWH8ieDEKpy+GOSJ67313qzdmRxqQ1BaYvKfi7gskhVZJmFhff9C
         ts96PwVHZLjwg/JpsK6fCAPvT5h3k/lpd23f/RPlEOZCBFLqUbdHWfOL5p3Iw0dzFPrM
         mDLk3QLvP3eXWU9Yl8dACK2nNGEx0gYmAcejUWH/BxDGRuQs3ll+D57H33w0F6z+oond
         aSnWtZUCRUnMEJyVMS45xZ58G4See/RYwzXMOMJLIfZ+8lo7AslEB8o4eA0I5PlDBHOs
         CoAQ==
X-Gm-Message-State: AOAM530Qbk4V8xRdp0aVDnxn45FborZa0GGdugqWePwfddT62HyFTALv
        IYh6Py4NROi4MSnZ1b6pzaPt/A==
X-Google-Smtp-Source: ABdhPJzdY9tt29/kSdPIjvZ8m8hDMZjPk11Or4POyQbLXVYX/vFpzeXAjr2YcYHuaICJvA4Pcb3ljw==
X-Received: by 2002:a63:570e:: with SMTP id l14mr8746668pgb.159.1618590839027;
        Fri, 16 Apr 2021 09:33:59 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id b7sm5760468pgs.62.2021.04.16.09.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 09:33:58 -0700 (PDT)
Date:   Fri, 16 Apr 2021 09:33:58 -0700 (PDT)
X-Google-Original-Date: Fri, 16 Apr 2021 09:33:56 PDT (-0700)
Subject:     Re: [PATCH] riscv: Protect kernel linear mapping only if CONFIG_STRICT_KERNEL_RWX is set
In-Reply-To: <f659c498-a273-f249-a81b-cab1ed1ba2bb@ghiti.fr>
CC:     anup@brainfault.org, corbet@lwn.net,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
        aryabinin@virtuozzo.com, glider@google.com, dvyukov@google.com,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-mm@kvack.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     alex@ghiti.fr
Message-ID: <mhng-9ab3280b-4523-4892-9f9a-338f55df8108@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 16 Apr 2021 03:47:19 PDT (-0700), alex@ghiti.fr wrote:
> Hi Anup,
>
> Le 4/16/21 à 6:41 AM, Anup Patel a écrit :
>> On Thu, Apr 15, 2021 at 4:34 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>>>
>>> If CONFIG_STRICT_KERNEL_RWX is not set, we cannot set different permissions
>>> to the kernel data and text sections, so make sure it is defined before
>>> trying to protect the kernel linear mapping.
>>>
>>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>>
>> Maybe you should add "Fixes:" tag in commit tag ?
>
> Yes you're right I should have done that. Maybe Palmer will squash it as
> it just entered for-next?

Ya, I'll do it.  My testing box was just tied up last night for the rc8 
PR, so I threw this on for-next to get the buildbots to take a look.  
It's a bit too late to take something for this week, as I try to be 
pretty conservative this late in the cycle.  There's another kprobes fix 
on the list so if we end up with an rc8 I might send this along with 
that, otherwise this'll just go onto for-next before the linear map 
changes that exercise the bug.

You're more than welcome to just dig up the fixes tag and reply, my 
scripts pull all tags from replies (just like Revieweb-by).  Otherwise 
I'll do it myself, most people don't really post Fixes tags that 
accurately so I go through it for pretty much everything anyway.

Thanks for sorting this out so quickly!

>
>>
>> Otherwise it looks good.
>>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Thank you!
>
> Alex
>
>>
>> Regards,
>> Anup
>>
>>> ---
>>>   arch/riscv/kernel/setup.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>>> index 626003bb5fca..ab394d173cd4 100644
>>> --- a/arch/riscv/kernel/setup.c
>>> +++ b/arch/riscv/kernel/setup.c
>>> @@ -264,12 +264,12 @@ void __init setup_arch(char **cmdline_p)
>>>
>>>          sbi_init();
>>>
>>> -       if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
>>> +       if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
>>>                  protect_kernel_text_data();
>>> -
>>> -#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
>>> -       protect_kernel_linear_mapping_text_rodata();
>>> +#ifdef CONFIG_64BIT
>>> +               protect_kernel_linear_mapping_text_rodata();
>>>   #endif
>>> +       }
>>>
>>>   #ifdef CONFIG_SWIOTLB
>>>          swiotlb_init(1);
>>> --
>>> 2.20.1
>>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
