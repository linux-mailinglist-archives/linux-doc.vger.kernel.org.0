Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3AA4FDD13
	for <lists+linux-doc@lfdr.de>; Fri, 15 Nov 2019 13:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbfKOMKJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 15 Nov 2019 07:10:09 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29830 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbfKOMKJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Nov 2019 07:10:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573819808;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4SLCfbXrVulZogYj/s2/SbxodvpIYXr2n3EpWJPZhgM=;
        b=PBLukaEqHyjPwXP2q6j15H7BHeAVqbBlnf8pqR/SfO3oi7mnbIN5PHvQZ7wyqc2EfUl+FH
        N7N/LVB3nINFDe2OgJtQ2m2wjpldS/RNosMi7c7iPvlhrdgPaXRxjYkLtW8Hrv7bYtKulj
        9zAmhzV6vybTkEYZkLMBdNfXWKjpnOs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-j5gnCwAJME6gb9sLXowgyQ-1; Fri, 15 Nov 2019 07:10:02 -0500
Received: by mail-wr1-f70.google.com with SMTP id k15so7555724wrp.22
        for <linux-doc@vger.kernel.org>; Fri, 15 Nov 2019 04:10:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s4+dQMXVTzdXBza6cpCVy4c3dq1dN1YlKsihA8W4Y8Y=;
        b=Sv8Dl+gm/juEgIDht46CtNPhcHmo/46dzLw5sF0qnxlwbWdxuo+k2ZMcI6hOPTd1y4
         QtVwAa/Pt2ZIF1BHq9+umDAvNuT8nVuyXd7pIUOSUSrLwyTTR3eA/dwIZMF8VFR9jSYR
         IO03Lv2utMveylBRM6a0z+2F6WowcUoAGPxJvqpzkAXuwkC2KmBB6rmSLdzV4pYGTl3m
         scbTpdqS6vghb6j1RlQ5lGDnEaAnIVQtwFUyDsb1U7Y9ZWaB4gdl730Ppu/c6bbQGPkH
         X8Yi9MGvztWyq/iYqkcDj4fy3SznCH2N7YJNF/n0UScXaaUuXRpiCV/zETH/UL2zflqq
         pJXw==
X-Gm-Message-State: APjAAAVc4yNgpS+QdULCfvcQEa1xzLB7s47tbEWsEUwy7xGiLlumQhJl
        z6ub1NHK60q6CYDwzooQcYnfZjny+kyl2vxkRCQCgDinIrQCCu6ePtjpMi7xNnXaDZUEev/GnN8
        JtM4yDgVTLVN+0HO0WJjq
X-Received: by 2002:a1c:30b:: with SMTP id 11mr13131550wmd.171.1573819801058;
        Fri, 15 Nov 2019 04:10:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqxVn+PxOzHLWEYlmy0V5fELKmqUNxPX2dvbZL7DihUzDLfdB4tPBTsaLy1Ld99Eg+Qze1qseg==
X-Received: by 2002:a1c:30b:: with SMTP id 11mr13131526wmd.171.1573819800855;
        Fri, 15 Nov 2019 04:10:00 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id y8sm9103529wmi.9.2019.11.15.04.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2019 04:10:00 -0800 (PST)
Subject: Re: [PATCH v7 2/8] efi: Add embedded peripheral firmware support
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
References: <20191004145056.43267-1-hdegoede@redhat.com>
 <20191004145056.43267-3-hdegoede@redhat.com>
 <20191011144834.GL16384@42.do-not-panic.com>
 <e7bd40ff-20d1-3aed-8516-9fffd4c3a207@redhat.com>
 <20191114194233.GE11244@42.do-not-panic.com>
 <f00804ae-e556-35e4-d0a3-cd9201fdd2d0@redhat.com>
 <9b0a0121-3e63-0602-6c0d-00547e389f76@redhat.com>
 <20191114215009.GF11244@42.do-not-panic.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d7546f63-5472-b867-4e79-912edf9cfa6c@redhat.com>
Date:   Fri, 15 Nov 2019 13:09:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191114215009.GF11244@42.do-not-panic.com>
Content-Language: en-US
X-MC-Unique: j5gnCwAJME6gb9sLXowgyQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 14-11-2019 22:50, Luis Chamberlain wrote:
> On Thu, Nov 14, 2019 at 09:48:38PM +0100, Hans de Goede wrote:

<snip>

>> But I guess what you really want is some error to be thrown if someone
>> calls firmware_request_platform() before we are ready.
>=20
> Yes.
>=20
>> I guess I could make efi_check_for_embedded_firmwares() which scans
>> for known firmwares and saved a copy set a flag that it has run.
>>
>> And then combine that with making efi_get_embedded_fw() (which underpins
>> firmware_request_platform()) print a warning when called if that flag
>> is not set yet.

<snip>

> That'd be great.

So I've been working on this, my first though was to use WARN_ON as
calling this too early would be a bug, but there is a bunch of
normal circumstances where efi_check_for_embedded_firmwares() never
runs. One of the being classic BIOS boot, but e.g. also when running
paravirtualized in a paravirt env. using UEFI.

Normally we should not end up calling efi_get_embedded_fw() in those
cases, for one it is unlikely for any drivers using firmware_request_platfo=
rm()
to be used in such an environment, and if we somehow do end up with
a case where firmware_request_platform() is called, since the EFI
emebedded fw fallback then will not work I would expect a copy of
the necessary fw to be under /lib/firmware so we never hit the fallback.

This all makes efi_get_embedded_fw() getting called in cases where
efi_check_for_embedded_firmwares() will never run unlikely, but not
impossible. Making a WARN_ON the wrong thing to do so for v8 of this
patch-set I will add a pr_warn for this.

Note I've looked into detecting all the circumstances where it is normal
for efi_check_for_embedded_firmwares() to never run, but after tracing
the call path leading up to it getting called I've found that a check
for that is complicated and more importantly error-prone and likely
to get out of sync with reality if any of the functions higher up
the call path ever change the conditions.

So a pr_warn it is, and since as explained one would normally not
expect to ever hit the fallback on systems where
efi_check_for_embedded_firmwares() does not get called, I see no
harm in simply always printing the warning if
efi_check_for_embedded_firmwares() was not called.

Regards,

Hans

