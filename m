Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49A14FC545
	for <lists+linux-doc@lfdr.de>; Thu, 14 Nov 2019 12:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfKNL1K (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 14 Nov 2019 06:27:10 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22747 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726592AbfKNL1J (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Nov 2019 06:27:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573730828;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L/gwESRRR03S0wRJMnaNaIygulhbwzzIij7KolEFnN8=;
        b=jNq1Y0NwamFJJp168HxJ2DIXGKB+kKF3xNZsDbUslywUvQudhtNAtAS8LbviSqYZCgTpPP
        I/oT/iuxRmVBO6REBq6nMirTnc9tsLp/X+XQwBx/TOr9YAms2ii+PpxRWObzbfvwjuqRY3
        AW4B4GdsI8x0t7Nfn7/jYLnXOrYRalY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-VwTW5e3tOdCXzXxGN6q9jg-1; Thu, 14 Nov 2019 06:27:04 -0500
Received: by mail-wr1-f69.google.com with SMTP id q6so4210824wrv.11
        for <linux-doc@vger.kernel.org>; Thu, 14 Nov 2019 03:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5jWJINQzU7DIjSgJJ1kpu7evn0eK8lUV8vqPcpC4Jlw=;
        b=q1GxE2wOKGEsWDEiaa1HPIeHykuYfFs2neFrKYTGeVo/amoBNTVRq/oNnGVBK4AHye
         ayUe1OJ268yt80qyD7Hrnn48Bg1+SCN9oioqD7YHpl4BxhHzGKmPN+wNgofxEzEPEXdR
         F5eFDp/V66b9wXP1/EqnNHIbwLZY6oNYvGJS19s/QgyMyZfJVhh83RwRod+FAmT01e9Z
         OY9IE2eM2XGDu9NWzLQ/UUraFoTk2WgOyNqEcGdr5bNoLFLTzvUrU0sBc5a+luoTYoXr
         af0dvBdNRe3NdzX1wADBCECFCFcyerCQBIHYYUzx1aAf0ybQompov3LuMndZOhA2EWaj
         ifnw==
X-Gm-Message-State: APjAAAWhv1nTHu7ezjL08h/nJG8NaCXWPztu2JvPVVUwROO2D0uzHldZ
        QE8m/6wTmzBR6rRmVAHCipxzaWp3PeT6iw03tg6ZVonnVJ9mH6iGTP0wHzUdfJi/5Knla/L4OW7
        w+pphNmJxhZbmlCyAfqSY
X-Received: by 2002:a1c:3b05:: with SMTP id i5mr7655055wma.8.1573730822918;
        Thu, 14 Nov 2019 03:27:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqzNadAhb3uVoWTx1LAhrlTsop88HOIAwDGjG+zbVgrV8lStQGTeYoYWPW0Kneg5Vd1CAyJU+g==
X-Received: by 2002:a1c:3b05:: with SMTP id i5mr7655029wma.8.1573730822681;
        Thu, 14 Nov 2019 03:27:02 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id z4sm6280823wmf.36.2019.11.14.03.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2019 03:27:02 -0800 (PST)
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e7bd40ff-20d1-3aed-8516-9fffd4c3a207@redhat.com>
Date:   Thu, 14 Nov 2019 12:27:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191011144834.GL16384@42.do-not-panic.com>
Content-Language: en-US
X-MC-Unique: VwTW5e3tOdCXzXxGN6q9jg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Luis,

Thank you for the reviews and sorry for being a bit slow to respind.

On 11-10-2019 16:48, Luis Chamberlain wrote:
> On Fri, Oct 04, 2019 at 04:50:50PM +0200, Hans de Goede wrote:
>> +static int __init efi_check_md_for_embedded_firmware(
>> +=09efi_memory_desc_t *md, const struct efi_embedded_fw_desc *desc)
>> +{
>> +=09const u64 prefix =3D *((u64 *)desc->prefix);
>> +=09struct sha256_state sctx;
>> +=09struct embedded_fw *fw;
>> +=09u8 sha256[32];
>> +=09u64 i, size;
>> +=09void *map;
>> +
>> +=09size =3D md->num_pages << EFI_PAGE_SHIFT;
>> +=09map =3D memremap(md->phys_addr, size, MEMREMAP_WB);
>=20
> Since our limitaiton is the init process must have mostly finished,
> it implies early x86 boot code cannot use this, what measures can we
> take to prevent / check for such conditions to be detected and
> gracefully errored out?

As with all (EFI) early boot code, there simply is a certain order
in which things need to be done. This needs to happen after the basic
mm is setup, but before efi_free_boot_services() gets called, there
isn't really a way to check for all these conditions. As with all
early boot code, people making changes need to be careful to not
break stuff.

>=20
>> +=09if (!map) {
>> +=09=09pr_err("Error mapping EFI mem at %#llx\n", md->phys_addr);
>> +=09=09return -ENOMEM;
>> +=09}
>> +
>> +=09size -=3D desc->length;
>=20
> Remind me again, why we decrement the size here?

Basically this is another way of writing:

=09for (i =3D 0; (i + desc->length) < size; i +=3D 8) {

> I was going to ask if we didn't need a:
>=20
> if (desc->length > size) {
> =09memunmap(map);
> =09return -EINVAL;
> }

That is a good point, unlikely but still a good point,
so I guess that writing:

=09for (i =3D 0; (i + desc->length) < size; i +=3D 8) {

Instead would better as that avoids the need for that check.
I will fix this for the next version.

Regards,

Hans

>=20
>> +=09for (i =3D 0; i < size; i +=3D 8) {
>> +=09=09u64 *mem =3D map + i;
>> +
>> +=09=09if (*mem !=3D prefix)
>> +=09=09=09continue;
>> +
>> +=09=09sha256_init(&sctx);
>> +=09=09sha256_update(&sctx, map + i, desc->length);
>> +=09=09sha256_final(&sctx, sha256);
>> +=09=09if (memcmp(sha256, desc->sha256, 32) =3D=3D 0)
>> +=09=09=09break;
>> +=09}
>> +=09if (i >=3D size) {
>> +=09=09memunmap(map);
>> +=09=09return -ENOENT;
>> +=09}
>> +
>> +=09pr_info("Found EFI embedded fw '%s'\n", desc->name);
>=20
> Otherwise looks good.
>=20
>    Luis
>=20

