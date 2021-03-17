Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC0D33E8BB
	for <lists+linux-doc@lfdr.de>; Wed, 17 Mar 2021 06:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhCQFGB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 17 Mar 2021 01:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhCQFF3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Mar 2021 01:05:29 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08ECC06175F
        for <linux-doc@vger.kernel.org>; Tue, 16 Mar 2021 22:05:28 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id c204so288457pfc.4
        for <linux-doc@vger.kernel.org>; Tue, 16 Mar 2021 22:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=MIc7mavbJhN4OuOMILSSjW63cQv0oc3j9t7W7Zfvn3k=;
        b=fU9xwamVIvSaTTINr66eyaN/9vLWy/U3RHTRoQtlV+QGM22cjCkVK6UdNds3atZs+v
         lwrY+tDyL/ppBr9hKvCmc5IxfzdMip2gaTAgZDGXQ6Xs04cFN2LQ24LlJRHotVOKvUCH
         3JTOqAzlDX8icJ+kSfK70sn7CrFvm1RYy3tiSUBmK5a1Qe6+mTFpFeTnFypUUxw9fUu+
         hmf2R+m08ZuVrQbnJz+5Z8NNKAvjRoeEgTM+fUUo3ZGYXk8A+F9ucXE8MBG9I3okFz/m
         2Vpx5x4E0li1OV10ow0sYyZw5BNS2RTRFdcPPoFDjl2yv+JiAs3XTkXMoVO32+7qLasj
         1GLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=MIc7mavbJhN4OuOMILSSjW63cQv0oc3j9t7W7Zfvn3k=;
        b=Gykq4VaisLIOmmQBwsMhNOVDzcYFyLpAh2Wd3cDsUiub9zv4b3cVIL9BHlvmyPZKq4
         d0lKYN/QxXOZUfT3apkKKJWts+gZKyUaRacelV5YX301Q3EIVrD9gisaG23vXWopIi3z
         LHSSyHByXsGWSQS5igo4LZjomJEH1JxM7BTsG6zDbCvhp029iz4ikPr72/IZ0P8W92X4
         iqyxt+FPUG2+hy/YUzUOaegy7Y+J81VGLDwQsAiB4XW3TS+J2G/RSNtM9Zkos9gPm51k
         5FyiIIYksbQElMAZJDCNVT6EadtfBrs0dLcGJ35y7GWOOEcyKhVARrAelJ+OBcAffYGk
         rjyA==
X-Gm-Message-State: AOAM5328CdfrYUI5CxQFWBNxphPMAMM409GyRD55vLYFFrJoavuvIt4D
        ZBlZTAxmZG4D8x21YM0WGOPf2g==
X-Google-Smtp-Source: ABdhPJyDuEZydtGMqDr8/DG+kP9sdLoSZtmtej+zUMoDcsn6rZDQkEvlHQ9u8k2GdIn70gdBhSt7iA==
X-Received: by 2002:a62:e708:0:b029:1f8:c092:ff93 with SMTP id s8-20020a62e7080000b02901f8c092ff93mr2675554pfh.21.1615957528395;
        Tue, 16 Mar 2021 22:05:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id i17sm19789935pfq.135.2021.03.16.22.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 22:05:27 -0700 (PDT)
Date:   Tue, 16 Mar 2021 22:05:27 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Mar 2021 21:58:03 PDT (-0700)
Subject:     Re: [PATCH 0/3] Move kernel mapping outside the linear mapping
In-Reply-To: <0bb85388-c4e1-523a-9bf3-0ccec6c4041e@ghiti.fr>
CC:     corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
        aryabinin@virtuozzo.com, glider@google.com, dvyukov@google.com,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-mm@kvack.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     alex@ghiti.fr
Message-ID: <mhng-08cda2bf-fcd9-4848-b549-632d015e1acd@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 13 Mar 2021 01:26:47 PST (-0800), alex@ghiti.fr wrote:
> Hi Palmer,
>
> Le 3/9/21 à 9:54 PM, Palmer Dabbelt a écrit :
>> On Thu, 25 Feb 2021 00:04:50 PST (-0800), alex@ghiti.fr wrote:
>>> I decided to split sv48 support in small series to ease the review.
>>>
>>> This patchset pushes the kernel mapping (modules and BPF too) to the last
>>> 4GB of the 64bit address space, this allows to:
>>> - implement relocatable kernel (that will come later in another
>>>   patchset) that requires to move the kernel mapping out of the linear
>>>   mapping to avoid to copy the kernel at a different physical address.
>>> - have a single kernel that is not relocatable (and then that avoids the
>>>   performance penalty imposed by PIC kernel) for both sv39 and sv48.
>>>
>>> The first patch implements this behaviour, the second patch introduces a
>>> documentation that describes the virtual address space layout of the
>>> 64bit
>>> kernel and the last patch is taken from my sv48 series where I simply
>>> added
>>> the dump of the modules/kernel/BPF mapping.
>>>
>>> I removed the Reviewed-by on the first patch since it changed enough from
>>> last time and deserves a second look.
>>>
>>> Alexandre Ghiti (3):
>>>   riscv: Move kernel mapping outside of linear mapping
>>>   Documentation: riscv: Add documentation that describes the VM layout
>>>   riscv: Prepare ptdump for vm layout dynamic addresses
>>>
>>>  Documentation/riscv/index.rst       |  1 +
>>>  Documentation/riscv/vm-layout.rst   | 61 ++++++++++++++++++++++
>>>  arch/riscv/boot/loader.lds.S        |  3 +-
>>>  arch/riscv/include/asm/page.h       | 18 ++++++-
>>>  arch/riscv/include/asm/pgtable.h    | 37 +++++++++----
>>>  arch/riscv/include/asm/set_memory.h |  1 +
>>>  arch/riscv/kernel/head.S            |  3 +-
>>>  arch/riscv/kernel/module.c          |  6 +--
>>>  arch/riscv/kernel/setup.c           |  3 ++
>>>  arch/riscv/kernel/vmlinux.lds.S     |  3 +-
>>>  arch/riscv/mm/fault.c               | 13 +++++
>>>  arch/riscv/mm/init.c                | 81 +++++++++++++++++++++++------
>>>  arch/riscv/mm/kasan_init.c          |  9 ++++
>>>  arch/riscv/mm/physaddr.c            |  2 +-
>>>  arch/riscv/mm/ptdump.c              | 67 +++++++++++++++++++-----
>>>  15 files changed, 258 insertions(+), 50 deletions(-)
>>>  create mode 100644 Documentation/riscv/vm-layout.rst
>>
>> This generally looks good, but I'm getting a bunch of checkpatch
>> warnings and some conflicts, do you mind fixing those up (and including
>> your other kasan patch, as that's likely to conflict)?
>
>
> I fixed a few checkpatch warnings and rebased on top of for-next but had
> not conflicts.
>
> I have just sent the v2.

Thanks.  These (and the second patch of the one I just put on fixes) are
for-next things, so I'm not going to get a look at them tonight because I want
to make sure we don't have any more fixes outstanding.
