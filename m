Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39988D10CA
	for <lists+linux-doc@lfdr.de>; Wed,  9 Oct 2019 16:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729865AbfJIOGQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 9 Oct 2019 10:06:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60722 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728019AbfJIOGQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 9 Oct 2019 10:06:16 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 999597652B
        for <linux-doc@vger.kernel.org>; Wed,  9 Oct 2019 13:59:13 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id o128so2179494wmo.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Oct 2019 06:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IlNxxlW30AXk2pCJR6QVkj5c2p86veqQztlocOKMAv0=;
        b=FKJ0r31HV4k+olBDv7FStJ745mZEI+MptbcY6sP1SPczZGYlkFEktZqbZH0gmq1wPn
         8+AmGpXpvIUdWiAxan327e/r8oR/JCKdPD2WLgLcVJdZhXfW29xVt8HK10FHtrtyU0Ce
         4vVXUEUUrP7KZu24QcclH7/KtCz72uMi7yw3h5DszXXDypSYWs4pHGoFG3fgRfT4d2eE
         RyMvS0HtADFHRXavsA0C0uGGXe6tLAaG0bdbhU0EztVdqm5GlHefxIZS+keIGCe2NtH+
         A6qDNQXsfeDYuQ7wJhcHBms7j7jKU1dB+Gng8czbHwa1mYecy2Dsyr4Z45XKNfZI/4Xz
         vVQw==
X-Gm-Message-State: APjAAAVj/2SPjkwSIAOGbBD7EcGkMKGmLvum4HkZjmNFS2/8bczknCXY
        hBnWAmZM9k9+6ggK2coIJB1TmZUMc6udhxZmsAcMrodLq+Ch1Z4NeqnyYmLmsZz83iSpLZaoGLS
        Bq0InTIkNOjNuAXkw+9CY
X-Received: by 2002:a5d:6250:: with SMTP id m16mr3047879wrv.322.1570629552225;
        Wed, 09 Oct 2019 06:59:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxK6exxvy56MGfd32RiDNMWAT27CUblCzLWExqhg7dIsvGAXRbTbZ4PDSeCcTu8k/dGE3uV7Q==
X-Received: by 2002:a5d:6250:: with SMTP id m16mr3047868wrv.322.1570629552001;
        Wed, 09 Oct 2019 06:59:12 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id h125sm3227806wmf.31.2019.10.09.06.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2019 06:59:11 -0700 (PDT)
Subject: Re: [PATCH v7 1/8] efi: Export boot-services code and data as
 debugfs-blobs
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Jones <pjones@redhat.com>,
        Dave Olsthoorn <dave@bewaar.me>,
        the arch/x86 maintainers <x86@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        linux-efi <linux-efi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-input@vger.kernel.org
References: <20191004145056.43267-1-hdegoede@redhat.com>
 <20191004145056.43267-2-hdegoede@redhat.com>
 <CAKv+Gu9OU3rS-j+L+pxpK7HZi41XtQZTq9BDs6VpUC8RCq5X6g@mail.gmail.com>
 <c0256726-0aa3-b005-0a18-7b6a41533a0b@redhat.com>
 <CAKv+Gu9YLesC1abXAcUMe+0BE8Vv52Y_BhN-1Ps+h161Q00KKQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <81c648d6-428e-d978-246b-9a87d43c5d21@redhat.com>
Date:   Wed, 9 Oct 2019 15:59:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu9YLesC1abXAcUMe+0BE8Vv52Y_BhN-1Ps+h161Q00KKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 09-10-2019 15:35, Ard Biesheuvel wrote:
> On Wed, 9 Oct 2019 at 15:18, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 09-10-2019 15:07, Ard Biesheuvel wrote:
>>> On Fri, 4 Oct 2019 at 16:51, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Sometimes it is useful to be able to dump the efi boot-services code and
>>>> data. This commit adds these as debugfs-blobs to /sys/kernel/debug/efi,
>>>> but only if efi=debug is passed on the kernel-commandline as this requires
>>>> not freeing those memory-regions, which costs 20+ MB of RAM.
>>>>
>>>> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>> Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>> Changes in v5:
>>>> -Rename the EFI_BOOT_SERVICES flag to EFI_PRESERVE_BS_REGIONS
>>>>
>>>> Changes in v4:
>>>> -Add new EFI_BOOT_SERVICES flag and use it to determine if the boot-services
>>>>    memory segments are available (and thus if it makes sense to register the
>>>>    debugfs bits for them)
>>>>
>>>> Changes in v2:
>>>> -Do not call pr_err on debugfs call failures
>>>> ---
>>>>    arch/x86/platform/efi/efi.c    |  1 +
>>>>    arch/x86/platform/efi/quirks.c |  4 +++
>>>>    drivers/firmware/efi/efi.c     | 53 ++++++++++++++++++++++++++++++++++
>>>>    include/linux/efi.h            |  1 +
>>>>    4 files changed, 59 insertions(+)
>>>>
>>>> diff --git a/arch/x86/platform/efi/efi.c b/arch/x86/platform/efi/efi.c
>>>> index c202e1b07e29..847730f7e74b 100644
>>>> --- a/arch/x86/platform/efi/efi.c
>>>> +++ b/arch/x86/platform/efi/efi.c
>>>> @@ -232,6 +232,7 @@ int __init efi_memblock_x86_reserve_range(void)
>>>>                efi.memmap.desc_version);
>>>>
>>>>           memblock_reserve(pmap, efi.memmap.nr_map * efi.memmap.desc_size);
>>>> +       set_bit(EFI_PRESERVE_BS_REGIONS, &efi.flags);
>>>
>>> Should we add a Kconfig symbol to opt into this behavior [set by the
>>> driver in question], instead of always preserving all boot services
>>> regions on all x86 systems?
>>
>> This bit does not control anything, it merely signals that the arch early
>> boot EFI code keeps the boot-services code around, which is something
>> which the x86 code already does. Where as e.g. on arm / aarch64 this is
>> freed early on, this ties in with the other bits:
>>
>>>
>>>>
>>>>           return 0;
>>>>    }
>>>> diff --git a/arch/x86/platform/efi/quirks.c b/arch/x86/platform/efi/quirks.c
>>>> index 3b9fd679cea9..fab12ebf0ada 100644
>>>> --- a/arch/x86/platform/efi/quirks.c
>>>> +++ b/arch/x86/platform/efi/quirks.c
>>>> @@ -411,6 +411,10 @@ void __init efi_free_boot_services(void)
>>>>           int num_entries = 0;
>>>>           void *new, *new_md;
>>>>
>>>> +       /* Keep all regions for /sys/kernel/debug/efi */
>>>> +       if (efi_enabled(EFI_DBG))
>>>> +               return;
>>>> +
>>
>> This is the point where normally on x86 we do actually free the boot-services
>> code which is a lot later then on other arches. And this new code actually
>> does change things to keep the boot-services code *forever* but only
>> if EFI debugging is enabled on the kernel commandline.
>>
> 
> I get this part. But at some point, your driver is going to expect
> this memory to be preserved even if EFI_DBG is not set, right? My
> question was whether we should only opt into that if such a driver is
> enabled in the first place.

Ah, I see. No even with CONFIG_EFI_EMBEDDED_FIRMWARE selected, the
boot-services code still gets free-ed. The efi_get_embedded_fw()
function from drivers/firmware/efi/embedded-firmware.c runs before
efi_free_boot_services() and it memdup-s any found firmwares, so it
does not cause the EFI boot-services code to stick around longer
then usual.

The only thing which does cause it to stick around is enabling
EFI debugging with efi=debug, so that the various efi segments
(not only the code-services ones) can be inspected as debugfs
blobs.

Basically this first patch of the series is independent of the
rest. It is part of the series, because adding new
efi_embedded_fw_desc structs to the table of firmwares to check
for becomes a lot easier when we can easily inspect the efi
segments and see if they contain the firmware we want.


As for Kconfig options, the compiling of
drivers/firmware/efi/embedded-firmware.c is controlled by
CONFIG_EFI_EMBEDDED_FIRMWARE which is a hidden option, which
can be selected by code which needs this. currently this is
only selected by CONFIG_TOUCHSCREEN_DMI which is defined
in drivers/platform/x86/Kconfig.

Regards,

Hans
