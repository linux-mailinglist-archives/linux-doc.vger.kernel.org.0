Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 208BE5FC1D8
	for <lists+linux-doc@lfdr.de>; Wed, 12 Oct 2022 10:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbiJLIUP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 12 Oct 2022 04:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbiJLITx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Oct 2022 04:19:53 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D7EB56EC
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 01:18:47 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id l1so15548150pld.13
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 01:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6wvax6xdleLIogOVxphI+p7KC3o8r8c1dELYoXr9hY=;
        b=dKjX4wI7FmvcEatL5fzicJyLD4MGqRQPcnOWpHvI2TOgeKguwY5oB/N35Gd+XaYzIE
         imxmsv23JJkIP3sJlPBlirvPE10vBB/CmG6q6aZ3FhfwFX8BkiDCcJBLulcYk+48g88v
         le/gpsSXDe9lml8uJXC7pptngxhyDYUybYn3f/6+d4lmVNlDw1NA8+axYTip3h1G+adw
         BuQsHRNbJH+DlKqpUjdw28OtjE6jAoxooHuHGWA53c62q/9ZtRfIeW/oRBleFz8giFGz
         3e0lm3a0oqLtEP/3qzVDWUqzKAXQoIXVJOJtn10uNVGru3Qwnn0H7LbVehXDsoq5UvV1
         FpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k6wvax6xdleLIogOVxphI+p7KC3o8r8c1dELYoXr9hY=;
        b=08kRC1l6ir3ud0z+CmZmbupPK7W3mwlQxl/LCngU+N/rzU2WiKSpob0QG1+br0j9zF
         6KfNqzowvtuNKSDQA1FdKPOOxDUgbLEtsD4W2gou2yrRYfjqh2hgWYqW5VRkUzh/SLJ9
         8FBX0hOhqGOw5rPRZPq7WFSBEmAl9pMA9C1aljKFisHb1vqLf0jV6s62rTAOC7ZYpnMW
         mhjG/T6cik3PdcmbnYPYUcdk3ws7x0XRoNuCFuBLFpdihUw4m9FiC3mY+rP3muvucDBB
         u++tEy1fKohGNjGp+/M9CxtrNQWSZf9rJmVGNLXhLzcYs1Qh3pqQj+vTReGCIth6kZfd
         x0/g==
X-Gm-Message-State: ACrzQf0taSyO+OQqQ84CUWmyG453tg3lqiZfsRwSjxcDWEn+Lufl9Xdj
        amEnn3nLJyfEF1tfvsP/m1CVOw==
X-Google-Smtp-Source: AMsMyM4BrhP5M0dfFBEgnl7LfCox54+lT0TY3RMzEVeouBlVgF/azt/m6BbPLXRlNB/QsQr/qpdJYg==
X-Received: by 2002:a17:90b:33d0:b0:20d:5edf:8b92 with SMTP id lk16-20020a17090b33d000b0020d5edf8b92mr3691313pjb.117.1665562702254;
        Wed, 12 Oct 2022 01:18:22 -0700 (PDT)
Received: from [10.68.76.92] ([139.177.225.229])
        by smtp.gmail.com with ESMTPSA id om15-20020a17090b3a8f00b0020087d7e778sm897552pjb.37.2022.10.12.01.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 01:18:21 -0700 (PDT)
Message-ID: <ff8d0223-a3da-35a4-8bde-f19d93e06f35@bytedance.com>
Date:   Wed, 12 Oct 2022 16:18:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [External] Re: [RFC] mm: add new syscall pidfd_set_mempolicy()
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     corbet@lwn.net, mhocko@suse.com, akpm@linux-foundation.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
        wuyun.abel@bytedance.com
References: <20221010094842.4123037-1-hezhongkun.hzk@bytedance.com>
 <Y0Y/oGToVk3ags7h@debian.me>
From:   Zhongkun He <hezhongkun.hzk@bytedance.com>
In-Reply-To: <Y0Y/oGToVk3ags7h@debian.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> On Mon, Oct 10, 2022 at 05:48:42PM +0800, Zhongkun He wrote:
>> There is usecase that System Management Software(SMS) want to give a
>> memory policy to other processes to make better use of memory.
>>
> 
> Better say "There are usecases when system management utilities
> want to apply memory policy to processes to make better use of memory".
> 
>> The information about how to use memory is not known to the app.
>> Instead, it is known to the userspace daemon(SMS), and that daemon
>> will decide the memory usage policy based on different factors.
>>
> 
> Better say "These utilities doesn't set memory usage policy, but
> rather the job of reporting memory usage and setting the policy is
> offloaded to an userspace daemon."
> 
>> To solve the issue, this patch introduces a new syscall
>> pidfd_set_mempolicy(2).  it sets the NUMA memory policy of the thread
>> specified in pidfd.
>>
> 
> Better say "To solve the issue above, introduce new syscall
> pidfd_set_mempolicy(2). The syscall sets NUMA memory policy for the
> thread specified in pidfd".
> 
>> In current process context there is no locking because only the process
>> accesses its own memory policy, so task_work is used in
>> pidfd_set_mempolicy() to update the mempolicy of the process specified
>> in pidfd, avoid using locks and race conditions.
>>
> 
> Better say "In current process context there is no locking because
> only processes access their own memory policy. For this reason, task_work
> is used in pidfd_set_mempolicy() to set or update the mempolicy of process
> specified in pid. Thuse, it avoids into race conditions."
> 
>> The API is as follows,
>>
>> 		long pidfd_set_mempolicy(int pidfd, int mode,
>>                                       const unsigned long __user *nmask,
>>                                       unsigned long maxnode,
>>                                       unsigned int flags);
>>
>> Set's the [pidfd] task's "task/process memory policy". The pidfd argument
>> is a PID file descriptor (see pidfd_open(2) man page) that specifies the
>> process to which the mempolicy is to be applied. The flags argument is
>> reserved for future use; currently, this argument must be specified as 0.
>> Please see the set_mempolicy(2) man page for more details about
>> other's arguments.
>>
> 
> Why duplicating from the Documentation/ below?
> 
>> Suggested-by: Michal Hocko <mhocko@suse.com>
>> Signed-off-by: Zhongkun He <hezhongkun.hzk@bytedance.com>
>> ---
>>   .../admin-guide/mm/numa_memory_policy.rst     | 21 ++++-
>>   arch/alpha/kernel/syscalls/syscall.tbl        |  1 +
>>   arch/arm/tools/syscall.tbl                    |  1 +
>>   arch/arm64/include/asm/unistd.h               |  2 +-
>>   arch/arm64/include/asm/unistd32.h             |  3 +-
>>   arch/ia64/kernel/syscalls/syscall.tbl         |  1 +
>>   arch/m68k/kernel/syscalls/syscall.tbl         |  1 +
>>   arch/microblaze/kernel/syscalls/syscall.tbl   |  1 +
>>   arch/mips/kernel/syscalls/syscall_n32.tbl     |  1 +
>>   arch/mips/kernel/syscalls/syscall_n64.tbl     |  1 +
>>   arch/mips/kernel/syscalls/syscall_o32.tbl     |  1 +
>>   arch/parisc/kernel/syscalls/syscall.tbl       |  1 +
>>   arch/powerpc/kernel/syscalls/syscall.tbl      |  1 +
>>   arch/s390/kernel/syscalls/syscall.tbl         |  1 +
>>   arch/sh/kernel/syscalls/syscall.tbl           |  1 +
>>   arch/sparc/kernel/syscalls/syscall.tbl        |  1 +
>>   arch/x86/entry/syscalls/syscall_32.tbl        |  1 +
>>   arch/x86/entry/syscalls/syscall_64.tbl        |  1 +
>>   arch/xtensa/kernel/syscalls/syscall.tbl       |  1 +
>>   include/linux/mempolicy.h                     | 11 +++
>>   include/linux/syscalls.h                      |  4 +
>>   include/uapi/asm-generic/unistd.h             |  5 +-
>>   kernel/sys_ni.c                               |  1 +
>>   mm/mempolicy.c                                | 89 +++++++++++++++++++
>>   24 files changed, 146 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/mm/numa_memory_policy.rst b/Documentation/admin-guide/mm/numa_memory_policy.rst
>> index 5a6afecbb0d0..b864dd88b2d2 100644
>> --- a/Documentation/admin-guide/mm/numa_memory_policy.rst
>> +++ b/Documentation/admin-guide/mm/numa_memory_policy.rst
>> @@ -408,9 +408,10 @@ follows:
>>   Memory Policy APIs
>>   ==================
>>   
>> -Linux supports 4 system calls for controlling memory policy.  These APIS
>> -always affect only the calling task, the calling task's address space, or
>> -some shared object mapped into the calling task's address space.
>> +Linux supports 5 system calls for controlling memory policy.  The first four
>> +APIS affect only the calling task, the calling task's address space, or some
>> +shared object mapped into the calling task's address space. The last one can
>> +set the mempolicy of task specified in pidfd.
>>   
>>   .. note::
>>      the headers that define these APIs and the parameter data types for
>> @@ -473,6 +474,20 @@ closest to which page allocation will come from. Specifying the home node overri
>>   the default allocation policy to allocate memory close to the local node for an
>>   executing CPU.
>>   
>> +Set [pidfd Task] Memory Policy::
>> +
>> +        long sys_pidfd_set_mempolicy(int pidfd, int mode,
>> +                                     const unsigned long __user *nmask,
>> +                                     unsigned long maxnode,
>> +                                     unsigned int flags);
>> +
>> +Set's the [pidfd] task's "task/process memory policy". The pidfd argument is
>> +a PID file descriptor (see pidfd_open(2) man page) that specifies the process
>> +to which the mempolicy is to be applied. The flags argument is reserved for
>> +future use; currently, this argument must be specified as 0. Please see the
>> +set_mempolicy(2) man page for more details about other's arguments.
>> +
>> +
>>   
>>   Memory Policy Command Line Interface
>>   ====================================
> 
> The wording can be improved:
> 
> ---- >8 ----
> 
> diff --git a/Documentation/admin-guide/mm/numa_memory_policy.rst b/Documentation/admin-guide/mm/numa_memory_policy.rst
> index b864dd88b2d236..6df35bf4f960bd 100644
> --- a/Documentation/admin-guide/mm/numa_memory_policy.rst
> +++ b/Documentation/admin-guide/mm/numa_memory_policy.rst
> @@ -410,8 +410,8 @@ Memory Policy APIs
>   
>   Linux supports 5 system calls for controlling memory policy.  The first four
>   APIS affect only the calling task, the calling task's address space, or some
> -shared object mapped into the calling task's address space. The last one can
> -set the mempolicy of task specified in pidfd.
> +shared object mapped into the calling task's address space. The last one
> +sets the mempolicy of task specified in the pidfd.
>   
>   .. note::
>      the headers that define these APIs and the parameter data types for
> @@ -481,11 +481,11 @@ Set [pidfd Task] Memory Policy::
>                                        unsigned long maxnode,
>                                        unsigned int flags);
>   
> -Set's the [pidfd] task's "task/process memory policy". The pidfd argument is
> -a PID file descriptor (see pidfd_open(2) man page) that specifies the process
> -to which the mempolicy is to be applied. The flags argument is reserved for
> -future use; currently, this argument must be specified as 0. Please see the
> -set_mempolicy(2) man page for more details about other's arguments.
> +Sets the task/process memory policy for the [pidfd] task. The pidfd argument
> +is a PID file descriptor (see pidfd_open(2) man page for details) that
> +specifies the process for which the mempolicy is applied to. The flags
> +argument is reserved for future use; currently, it must be specified as 0.
> +For the description of all other arguments, see set_mempolicy(2) man page.
>   
>   
>   
> 
> Thanks.
> 

Hi Bagas

I got it, thanks for your suggestions.
