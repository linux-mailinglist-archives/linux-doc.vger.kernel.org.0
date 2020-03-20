Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F253718D4B5
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2020 17:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbgCTQmY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 20 Mar 2020 12:42:24 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:30593 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727278AbgCTQmX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Mar 2020 12:42:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584722542;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JuSmP8mzKRWutGuMEZMfymlnZMnuod1hdzuq2jOD+58=;
        b=JW+0sg1sBQ5zmb06AXpp3FVhNNw7rmHvyXSmgjAfBZ7l7oPo93aEOb3kMZQOHBsrwZWM2R
        +w1s7MvBjNmRcVrSdRgcY/7AbAXCpNysE5qIYr5lyH2i8rvtoencRpNvpIteDbnaNKlLjC
        IqjKl6sV9myC+Zhs9nNniC+jekorSYs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-C_Yle4jhOaWd7-yNNXxkGg-1; Fri, 20 Mar 2020 12:42:04 -0400
X-MC-Unique: C_Yle4jhOaWd7-yNNXxkGg-1
Received: by mail-wr1-f70.google.com with SMTP id e10so1112141wru.6
        for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2020 09:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JuSmP8mzKRWutGuMEZMfymlnZMnuod1hdzuq2jOD+58=;
        b=SYvD9clP831BehsTkfOfbpVCJ2sT7LI9GpAm6Yd2wQucN206/J+NGl1RTb/uRC+Ws4
         RFxtlJJjaL5GlQjnDB6PXWBuYmyT4XXuPchPwCV53TrLqKg9y8Vz3aGEGm1G6MHAfT7A
         rifBP5Cgwv+Mm9/UePy3xAWfsqb4A+ZgFKijxzQeKPR1d0Gh6V/hE7yBAtDpjYeNT/hQ
         PeSXRE9rjZBijpWLeN8veVx5ue1x2XIseaL8HXRepa+KGbllb8TGNOYRdceFIKv7EvoZ
         GHLEpabbmqoZFQJtf9is2EOmsjo/UUkKiPS2oIUaA+d67FJsSQZ5BI54+xlvrsHyPLKS
         6oVA==
X-Gm-Message-State: ANhLgQ1eSgOsYqzbbiELiBPOUm8HjKr1w5lFGBLErp2pIl93yk+/xQjZ
        0ctLocJCT28ieyUndWmoSmQjUNHbGtPg6gs/f3Dp3vfSDQdV+J3PqHU4l+GnqcsMy0jWTw617BW
        j0jshofEewaAtGZnzMKNS
X-Received: by 2002:a7b:c62a:: with SMTP id p10mr10969805wmk.46.1584722523071;
        Fri, 20 Mar 2020 09:42:03 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtkHHEonfjGBQvTJugKUJaMlAw3gGqsGRrGUr+boHYRapviCIkmO3jmDajId8xSHmrus3yopw==
X-Received: by 2002:a7b:c62a:: with SMTP id p10mr10969692wmk.46.1584722521899;
        Fri, 20 Mar 2020 09:42:01 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id s7sm9067396wro.10.2020.03.20.09.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2020 09:42:01 -0700 (PDT)
Subject: Re: [PATCH v12 03/10] firmware: Rename FW_OPT_NOFALLBACK to
 FW_OPT_NOFALLBACK_SYSFS
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Lutomirski <luto@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Jones <pjones@redhat.com>,
        Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20200115163554.101315-1-hdegoede@redhat.com>
 <20200115163554.101315-4-hdegoede@redhat.com>
 <20200124085751.GA2957916@kroah.com>
 <d25d5d6e-0348-b19f-539e-048cfa70d6a6@redhat.com>
 <20200318132741.GA2794545@kroah.com>
 <8fa336bd-339f-40e0-08fe-e6b968736679@redhat.com>
 <20200320140243.GA636547@kroah.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1107490b-0290-5b65-c392-84de0d9dbe0e@redhat.com>
Date:   Fri, 20 Mar 2020 17:41:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320140243.GA636547@kroah.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 3/20/20 3:02 PM, Greg Kroah-Hartman wrote:
> On Wed, Mar 18, 2020 at 02:56:23PM +0100, Hans de Goede wrote:
>> Hi Greg,
>>
>> On 3/18/20 2:27 PM, Greg Kroah-Hartman wrote:
>>> On Fri, Jan 24, 2020 at 10:16:48AM +0100, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 1/24/20 9:57 AM, Greg Kroah-Hartman wrote:
>>>>> On Wed, Jan 15, 2020 at 05:35:47PM +0100, Hans de Goede wrote:
>>>>>> This is a preparation patch for adding a new platform fallback mechanism,
>>>>>> which will have its own enable/disable FW_OPT_xxx option.
>>>>>>
>>>>>> Note this also fixes a typo in one of the re-wordwrapped comments:
>>>>>> enfoce -> enforce.
>>>>>>
>>>>>> Acked-by: Luis Chamberlain <mcgrof@kernel.org>
>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>
>>>>> I've taken this in my tree for now in a quest to try to get others to
>>>>> pay attention to this series...
>>>>
>>>> Thank you.
>>>>
>>>> As mentioned before I believe that this series is ready for merging now.
>>>>
>>>> Andy Lutomirski had one last change request for v12 of the second
>>>> patch in the series, specifically to replace the loop searching for
>>>> the prefix with a memem, but the kernel does not have memmem.
>>>>
>>>> Andy, are you ok with v12 as is, given that we don't have memmem ?
>>>>
>>>> Assuming Andy is ok with v12 as is, then to merge this we need
>>>> to probably wait for 5.6-rc1 and then have the x86/efi folks do
>>>> an immutable branch with the first 2 patches of the series.
>>>
>>> Did this every happen?  Or do I need to dump this all into my tree?
>>
>> Ard has done a immutable branch with just the 2 patches:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git/tag/?h=stable-shared-branch-for-driver-tree
>>
>> I did not see any mails about this being pulled / merged, but I just
>> checked and this has landed in the tip tree 10 days ago:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/include/linux/efi.h?h=efi/core
>>
>> So if you merge the stable-shared-branch-for-driver-tree tag and then
>> merge patches 3-8 of this series (or rather 4-8 since you already
>> merged 3 IIRC) that would be great.
> 
> Ok, I've merged the above branch with just the two patches, and the rest
> of yours now, 

Great, thank you!

> sorry this took so long.

No problem, I'm quite happy this is queued for 5.7 now, I was
afraid it was going to slip to 5.8.

Regards,

Hans

