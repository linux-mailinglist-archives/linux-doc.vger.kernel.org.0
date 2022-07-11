Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50E3455C2CA
	for <lists+linux-doc@lfdr.de>; Tue, 28 Jun 2022 14:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345832AbiF1MbH (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 28 Jun 2022 08:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345830AbiF1MbG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jun 2022 08:31:06 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE3A2ED40
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 05:31:05 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id g10-20020a17090a708a00b001ea8aadd42bso12527028pjk.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 05:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ew4GY/jK0/nNgtH7SJeMlPioCDoaamIUs3ZnK2M3w5E=;
        b=7+OrJqXHyc9fE+RnOg3u2ePtSunThr293XZZGGJAov+euIE8grcxieCkv+pgLujeGY
         BsPTKiPOfs7RacJUPeY7vcXMi2fIMRc0eNE8XmvjiuFqVTfaQsClkGhMMDF+RWOu7wmP
         x1EJ8u3Cq4zhOPWaD/2J1HFAoFqxEnWr2TrSJADR/1iAll7iQ6OkMLVrlhbTfb2Io1V2
         Y0nj0VWWf29/wtyN/b1zPf4Al5+i6ZDDnzxTJMSQDy+TSUxP4iq290Ytilz5DI5ulTYJ
         AlcqhaqCimP3IiKa6ep18/y9elgCWHlxQs6mtJGuKdVx8q6TXnXBLsXlY837ApDYswvO
         Js2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ew4GY/jK0/nNgtH7SJeMlPioCDoaamIUs3ZnK2M3w5E=;
        b=A/AKQw9LA0YUUhXB7rafVgMBQtu9gJiiPuWHUfr4zsTShy7qDRNrFx1aBMLX4ervH7
         rzLFRiOYjwuzwTJtmOHxOzFtMS/FgjdIvCiHCVmrWAMfNTeHRroK+/OtgdwHHGmsZatO
         sVlI/KnF3qMt4p7FGWY7x6ecGv+2VhQ6UUx21erAsRklslShCFUfV1yQsY4nxSwrZ/Fj
         S4aneAXcEXOpjXm+mTvFmwD0s3QI1GGjhWE120tiriS2wou2zGgo2jsSnntXOCP2yMvR
         kbSmEf6b1tDHU5lQil3EbONPgD43eLaXR+fGJM8EwZ/JJbMNzDpJelEQyoghVT3u6v2r
         GpGg==
X-Gm-Message-State: AJIora9NGmEY593n1etkgTOSTG6pBhxE80FhS9lOeAl2T7yxJy+2iPeC
        eix0l3Z7s+ObOW6gvm4gnGRn0A==
X-Google-Smtp-Source: AGRyM1u/JuHnHc9P4M0v4WqcKsI5JkwRMHzLu9K1oHzJjdtjRw0qILCwr6t0IOoU7CgTrc+rBrvHWw==
X-Received: by 2002:a17:902:7282:b0:16b:7a53:3b41 with SMTP id d2-20020a170902728200b0016b7a533b41mr4699654pll.1.1656419464798;
        Tue, 28 Jun 2022 05:31:04 -0700 (PDT)
Received: from MacBook-Pro.local.net ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id p26-20020a056a0026da00b005251e2b53acsm9275986pfw.116.2022.06.28.05.30.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jun 2022 05:31:03 -0700 (PDT)
From:   lizhe.67@bytedance.com
To:     dave.hansen@intel.com
Cc:     bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        lizefan.x@bytedance.com, lizhe.67@bytedance.com, mingo@redhat.com,
        tglx@linutronix.de, x86@kernel.org
Subject: Re: [RFC] memmap: introduce cmdline parameter "memmap=nn[KMG]$" without start addr
Date:   Tue, 28 Jun 2022 20:30:51 +0800
Message-Id: <20220628123051.14414-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <de2500c4-fce4-31dc-29bc-aa3007027eb9@intel.com>
References: <de2500c4-fce4-31dc-29bc-aa3007027eb9@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

 On Thu, 23 Jun 2022 07:06:36, dave.hansen@intel.com wrote:
>> In our scenario, we need reserve or alloc large continous memory like
>> 256M in machine which have different memory specification at just
>> boot phase for a user land process.
>
>Just marking the memory reserved doesn't do any good by itself.  There
>must be some *other* kernel code to find this reserved area and make it
>available to userspace.
>

Sorry for not describing clearly. We wanted to use /dev/mem as our
interface to access the memory from userspace. So we don't add
other kernel code.

>It seems kinda silly to add this to the kernel without also adding the
>other half of the solution.  Plus, we don't really even know what this
>is for.  Are there other, better solutions?  I certainly can't offer any
>because this changelog did not provide a full picture of the problem
>this solves.

Again, sorry for not describing clearly. Here is our scenario. We need
to reserve large continous memory at least 256M in 512G's machine, and
need reserve more memory in larger machine. A userspace program will use
it through /dev/mem to store some data. Besides, a hardware will need
the data stored by the userspace program to do it's job. Why we need
continous physical memory is that our hardware can only access memory
without mmu. So allocing an area of large continous memory for userspace
is the best way for us. Considering that we have several type of machine
with different memory specification, so we want an easy way to reserve
memory with only one size parameter.

I find a better way to realize the requirement. I will send a v2 patch
soon.
