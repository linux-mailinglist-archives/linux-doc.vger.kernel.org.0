Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30EC843BE79
	for <lists+linux-doc@lfdr.de>; Wed, 27 Oct 2021 02:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234507AbhJ0AgG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 26 Oct 2021 20:36:06 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:59409 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233975AbhJ0AgG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Oct 2021 20:36:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hf8nJ1rqnz4xbM;
        Wed, 27 Oct 2021 11:33:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1635294820;
        bh=O3XGDoaskA0/eghgUkL7IhHse34zdf+k1dTb0Ycr8Tg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=cja1ODRnYrVDWSEKyN0on9xo2nXEZEif7Wd5i+HjiIxOcNT2AigwJ5paEINk5o0Fy
         gE1u1cIo4EFV8yk2T1OULNyOkKDgSwwhYRsfPqJAhWqITaLcEJE+Mbp6QVgv1AbyhL
         M/rEH8B7ZznsgDIynTYkDxwiWF8Z20U1NaqeroaB7Qz3Guq8lxQUYqtRvO6hMeuA/m
         mUGn3gMFYqLjm6DkfoKDTTm9M6uke+GWynyZgbvrwbgiHgy0BmCLgMW6zFgxsM+zf5
         AZEhHFHi7QxPdg9xokc5WXntEBugja69S22D8w9laMLjoXhB9o79SUm2viBqGPg/Qo
         uopCptrxiLBWw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Hill Ma <maahiuzeon@gmail.com>,
        Nathan Lynch <nathanl@linux.ibm.com>
Cc:     linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] macintosh/via-pmu-led: make disk activity usage a
 parameter.
In-Reply-To: <CABpQrUMcCKbgSTnTB4BeUUVwq5jkOw7pGbUC53SGe-4DEVnUag@mail.gmail.com>
References: <20211026033254.1052-1-maahiuzeon@gmail.com>
 <87fssox7ah.fsf@linux.ibm.com>
 <CABpQrUMcCKbgSTnTB4BeUUVwq5jkOw7pGbUC53SGe-4DEVnUag@mail.gmail.com>
Date:   Wed, 27 Oct 2021 11:33:37 +1100
Message-ID: <87ee87b926.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hill Ma <maahiuzeon@gmail.com> writes:
> Thanks for the review.
>
> On Tue, Oct 26, 2021 at 6:08 AM Nathan Lynch <nathanl@linux.ibm.com> wrote:
>>
>> Hello,
>>
>> Hill Ma <maahiuzeon@gmail.com> writes:
>> > Whether to use the LED as a disk activity is a user preference.
>> > Some like this usage while others find the LED too bright. So it
>> > might be a good idea to make this choice a runtime parameter rather
>> > than compile-time config.
>>
>> Users already have the ability to change the LED behavior at runtime
>> already, correct? I.e. they can do:
>>
>>   echo none > /sys/class/leds/pmu-led::front/trigger
>>
>> in their boot scripts. Granted, a kernel built with ADB_PMU_LED_DISK=y
>> will blink the LED on disk activity until user space is running. Is this
>> unsatisfactory?
>
> Yes, indeed. As someone who does not like this behavior on iBooks.
>
>> > The default is set to disabled as OS X does not use the LED as a
>> > disk activity indicator.
>>
>> This is long-standing behavior in Linux and OS X has been EOL on this
>> architecture for a decade, so this isn't much of a consideration at this
>> point. Seems more important to avoid surprising existing users and
>> distributions with a behavior change that makes additional work for
>> them. See below.
>>
>> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> > index 43dc35fe5bc0..a656a51ba0a8 100644
>> > --- a/Documentation/admin-guide/kernel-parameters.txt
>> > +++ b/Documentation/admin-guide/kernel-parameters.txt
>> > @@ -250,6 +250,12 @@
>> >                       Use timer override. For some broken Nvidia NF5 boards
>> >                       that require a timer override, but don't have HPET
>> >
>> > +     adb_pmu_led_disk [PPC]
>> > +                     Use front LED as disk LED by default. Only applies to
>> > +                     PowerBook, iBook, PowerMac 7,2/7,3.
>> > +                     Format: <bool>  (1/Y/y=enable, 0/N/n=disable)
>> > +                     Default: disabled
>> > +
>> >       add_efi_memmap  [EFI; X86] Include EFI memory map in
>> >                       kernel's map of available physical RAM.
>> >
>> > diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
>> > index 5cdc361da37c..243215de563c 100644
>> > --- a/drivers/macintosh/Kconfig
>> > +++ b/drivers/macintosh/Kconfig
>> > @@ -78,16 +78,6 @@ config ADB_PMU_LED
>> >         behaviour of the old CONFIG_BLK_DEV_IDE_PMAC_BLINK, select this
>> >         and the disk LED trigger and configure appropriately through sysfs.
>> >
>> > -config ADB_PMU_LED_DISK
>> > -     bool "Use front LED as DISK LED by default"
>> > -     depends on ADB_PMU_LED
>> > -     depends on LEDS_CLASS
>> > -     select LEDS_TRIGGERS
>> > -     select LEDS_TRIGGER_DISK
>> > -     help
>> > -       This option makes the front LED default to the disk trigger
>> > -       so that it blinks on disk activity.
>> > -
>>
>> So, if I've been relying on CONFIG_ADB_PMU_LED_DISK=y and I upgrade to a
>> newer kernel with the proposed change, from my point of view the disk
>> activity LED has stopped working and I need to alter the bootloader
>> config or init scripts to restore the expected behavior. That seems
>> undesirable to me.
>>
>> I don't think we rigidly enforce Kconfig backward compatibility, but
>> when it comes to a user-visible function on a legacy platform where
>> users and distros likely have their configurations figured out already,
>> it's probably best to avoid such changes.
>
> I actually asked some distributions that still ship PowerPC BE
> architectures to unset it.
> https://github.com/void-ppc/void-packages/pull/48
> https://github.com/void-linux/void-packages/pull/33275
> https://git.adelielinux.org/adelie/packages/-/merge_requests/607
>
> And Debian, which still has PowerPC BE architectures as ports, does
> not turn it on.
> https://salsa.debian.org/kernel-team/linux/-/blob/master/debian/config/kernelarch-powerpc/config

Looks like all three distros have it disabled.

So let's drop the config option, make it disabled by default, and anyone
who wants to turn it on can do so in their initramfs or init scripts.

cheers
