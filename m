Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 451A511D966
	for <lists+linux-doc@lfdr.de>; Thu, 12 Dec 2019 23:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731002AbfLLWdf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 12 Dec 2019 17:33:35 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36580 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730979AbfLLWde (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Dec 2019 17:33:34 -0500
Received: by mail-lf1-f66.google.com with SMTP id n12so489248lfe.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Dec 2019 14:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uNFsQyJIBMP610s+itpyeXuJ5AUNsir6dpBt7MH9KCs=;
        b=gpQRyl32JgLNoYvplD3NJnHKCMfmAtJwwP/Uje32i2vycfQId3lC7NGwJ02bPHxkPl
         416/v8p3WKzukSO9ASd6S83IL+etsV7SDfX6Ei4AfcyKmGzdpQkTC6K6780v/HUGj3RR
         iLUfie1VoKjVKeIGJT87YTn0GXTHkKQi7NqNy/9KSjErrhDPtSknZgkYNBhXB0T/pE2d
         y0moZcvaKx6gmRQ4SegnrlCg+6OhLNIwi27yH3HnFB8LmmmZPhmcqxjFh1dxsy+5pV7P
         i2pAe++sZ0c+QzV1r+3l8WmQ8Y9hGv/sFjnVAC/HxIM+9lEQVAmXNGxNi5Vh7wSJ4bDW
         WWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uNFsQyJIBMP610s+itpyeXuJ5AUNsir6dpBt7MH9KCs=;
        b=NgQfdHec6Ew+EHp1IUSsIRUFgXPuJIP8Wh7xbm8RIIvPggXbmlHw8yFOcun3OqAT4h
         nkeBvjY/zGqx/sW1jH1Xqd/TKv3Bzu7yRnSBm/hflB+Pq6l0aHdJxwFlbCDvyOqfroMP
         zGoPIIfPdw8ZWVYtOOkfLtYlm3QHgLBCcRRXNB9qRKwN0tpRDhL7qbv4bMPn9irYHVs0
         LQBdfsI99l1D+JB2yIdZXMIT251b+cmx/Nok2/BLsB6q5/OP1ImgZ4DVnN5ndY0v8LMB
         IoXibLWtS901h/iLzGXRyQblTsjLu9ttA4zA5zuQw0XGDUid1jVgr0+nTs3lyIoeEdUw
         3FDA==
X-Gm-Message-State: APjAAAXTN6eoydoLDbjSNTUsM+kFUzVxLiRmhVC66CMmbXtMLcwJVJo4
        n14+44zcnKvapX0qpyvhCO8I01dPhXeW86m2csic+A==
X-Google-Smtp-Source: APXvYqxBNleWcBiVw8vm+KLiN9cqlOqFb4vt8UFlmyhiMj4gyQ/eihgXoJiUMkAfFT3r7gvQyvk8XyGDODnEWS6zG6M=
X-Received: by 2002:ac2:55a8:: with SMTP id y8mr6997366lfg.117.1576190012878;
 Thu, 12 Dec 2019 14:33:32 -0800 (PST)
MIME-Version: 1.0
References: <20191209052119.32072-1-linux@roeck-us.net> <20191209052119.32072-2-linux@roeck-us.net>
In-Reply-To: <20191209052119.32072-2-linux@roeck-us.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Dec 2019 23:33:21 +0100
Message-ID: <CACRpkdYjidQHB0=S_brDxH3k+qJ2mfXCTF9A3SVZkPvBaVg6JQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] hwmon: Driver for temperature sensors on SATA drives
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-scsi@vger.kernel.org, linux-ide@vger.kernel.org,
        Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Guenther,

needless to say I am a big fan of this patch, so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

It's a nice addition with the SCT command, I never
figured that part out. Also nice how you register the
scsi class interface I never saw that before, it makes it
a very neat plug-in.

The comments are more discussion points on how to
(maybe) take it further after this.

On Mon, Dec 9, 2019 at 6:21 AM Guenter Roeck <linux@roeck-us.net> wrote:

> If the drive supports SCT transport and reports temperature limits,
> those are reported as well.

If I understand the patch correctly it will prefer to use
SCT transport to read the temperature, and only fall back
to the SMART attributes if this is not working, so I guess the
commit message should state the heuristics used here.

> +++ b/Documentation/hwmon/satatemp.rst

Excellent doc.

> + * If the SCT Command Transport feature set is not available, drive temperatures
> + * may be readable through SMART attributes. Since SMART attributes are not well
> + * defined, this method is only used as fallback mechanism.

So this maybe cut/paste to commit message as well so people understand
the commit fully.

> +       for (i = 0; i < ATA_MAX_SMART_ATTRS; i++) {
> +               u8 *attr = buf + i * 12;
> +               int id = attr[2];
> +
> +               if (!id)
> +                       continue;
> +
> +               if (id == SMART_TEMP_PROP_190) {
> +                       temp_raw = attr[7];
> +                       have_temp = true;
> +               }
> +               if (id == SMART_TEMP_PROP_194) {
> +                       temp_raw = attr[7];
> +                       have_temp = true;
> +                       break;
> +               }
> +       }
> +
> +       if (have_temp) {
> +               *temp = temp_raw * 1000;
> +               return 0;
> +       }

This looks like it will work fine, I had some heuristics to determine
the vendor-specific max/min temperatures in property 194 in my
patch, but I can certainly add that back in later.

> +static const struct hwmon_channel_info *satatemp_info[] = {
> +       HWMON_CHANNEL_INFO(chip,
> +                          HWMON_C_REGISTER_TZ),

I suppose this means I will also have a temperature zone as
I want :D

When I read the comments from the previous thread I got the
impression the SCSI people wanted me to use something like
the SCT transport and the hook in the SMART thing in the
libata back-end specifically for [S]ATA in response to the
SCT read log command.

In  drivers/ata/libata-scsi.c I suppose.

I guess one thing doesn't exclude the other though.

We can attempt to move the code for [S]ATA over to libata
at some point and respond to the SCT read log command
from within the library in that case.

I don't understand if that means the SCT read log also works
on some SCSI drives, or if it is just a slot-in thing for
ATA translation that has no meaning on SCSI drives.
But that can be resolved by people who want to use this
for SCSI drives and not by us.

Yours,
Linus Walleij
