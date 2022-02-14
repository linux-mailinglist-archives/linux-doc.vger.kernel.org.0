Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 308C44B4DF2
	for <lists+linux-doc@lfdr.de>; Mon, 14 Feb 2022 12:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350226AbiBNLRM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 14 Feb 2022 06:17:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350479AbiBNLQ7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Feb 2022 06:16:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7657274855
        for <linux-doc@vger.kernel.org>; Mon, 14 Feb 2022 02:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644835703;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+l7hpn1bL8odV+gyyAWmIY7KuNRjJIE1ZtTHLa6TWCo=;
        b=B8gdDjWwdbW5GBemTkchWxwLMShgLe4OQKs/e46078uHd/HVvBPDJusw3sq7QzbWnAJ5ck
        gOuoj0ICiWfPNr3IDe2yXxV16Fj7BCIuxGeEJLzt9BvkXUIgkL++KWsUIeK4LVgvfcznac
        1Jmh0bhqaEDrHf3CzdhqiuSr1V7RhEM=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-iZAnOq5uMmS7y__zk7Agtg-1; Mon, 14 Feb 2022 05:48:22 -0500
X-MC-Unique: iZAnOq5uMmS7y__zk7Agtg-1
Received: by mail-pj1-f71.google.com with SMTP id jf17-20020a17090b175100b001b90cf26a4eso11975378pjb.3
        for <linux-doc@vger.kernel.org>; Mon, 14 Feb 2022 02:48:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+l7hpn1bL8odV+gyyAWmIY7KuNRjJIE1ZtTHLa6TWCo=;
        b=3puVJJLRCWm3m6cdnuzFY1vPXqRqZxfdrccOM3e06OPIFAO4dyrJUrs1z6dWNvYuRx
         pxvm/uOn8DMOLtLaypSnXExrln8BdOPoeWSPH0k6LN6p/iJh5jvwdGXhYJm9IPfKahtx
         mHiIOG32l+xLFPwJQiJDUFaBgSZTX9CRHErWZzPxLMPP/G49RZ/beN6icr62iuua1II4
         iDvi5q5YDyqGSiEZs2wSX5XgeGokpTsry3h5u0gYk6iFzbOwd41WjMtOfRDAoMhN++Jg
         z9cGUXpY4np8SZKtCrrjw014f8SEZCmeGCb8Q3NR0mcGXbskuvxPjAQ8UXBDG0+amLwc
         bCNA==
X-Gm-Message-State: AOAM531BUnZyp+nN7KYwKAxx2A/qfKQhFJntV4yataoZukjA+oJ38/Gn
        68FuinbMmBjPRK3ogOfwus51r0Mt2vS7cAi65avRg3O3Gjx8VPk5k6XdAxMZC97ySQfbgKz3Slf
        hSz15Lzy6Xc0IrTXP9t8J/IxHjEmrLIKsv/bi
X-Received: by 2002:a17:90a:be02:: with SMTP id a2mr14115821pjs.113.1644835701231;
        Mon, 14 Feb 2022 02:48:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAJJMrZoxa0gI6bcZdaLyASagoTjq0CGWMV+m1iVayk/YJaM8O1MizoUGpXXVhW0z6wqLu5aF7WXaO6PPW584=
X-Received: by 2002:a17:90a:be02:: with SMTP id a2mr14115801pjs.113.1644835701012;
 Mon, 14 Feb 2022 02:48:21 -0800 (PST)
MIME-Version: 1.0
References: <20220126161832.3193805-1-benjamin.tissoires@redhat.com>
 <20220126161832.3193805-13-benjamin.tissoires@redhat.com> <YgNdokzzATwy/57P@quokka>
In-Reply-To: <YgNdokzzATwy/57P@quokka>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 14 Feb 2022 11:48:10 +0100
Message-ID: <CAO-hwJ+xo8yq05jPz19CoyF5x_U_O_imDXScLVhvhnm7hkdEhw@mail.gmail.com>
Subject: Re: [PATCH 12/12] Input: docs: add more details on the use of BTN_TOOL
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?Q?Ahelenia_Ziemia=C5=84ska?= 
        <nabijaczleweli@nabijaczleweli.xyz>,
        Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Jason Gerecke <killertofu@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Peter,


Looks like you commented on v1, and I made some changes in the v2 :)

On Wed, Feb 9, 2022 at 7:22 AM Peter Hutterer <peter.hutterer@who-t.net> wrote:
>
> On Wed, Jan 26, 2022 at 05:18:32PM +0100, Benjamin Tissoires wrote:
> > The HID core stack used to be very relaxed considering the BTN_TOOL_*
> > usage. With the recent commits, we should now enforce to have only one
> > tool at a time, meaning that we can now express that requirement in the
> > docs.
> >
> > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > ---
> >  Documentation/input/event-codes.rst | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
> > index b24ae7d292cc..41b1fa647dab 100644
> > --- a/Documentation/input/event-codes.rst
> > +++ b/Documentation/input/event-codes.rst
> > @@ -137,7 +137,10 @@ A few EV_KEY codes have special meanings:
> >      code should be set to a value of 1. When the tool is no longer interacting
> >      with the input device, the BTN_TOOL_<name> code should be reset to 0. All
> >      trackpads, tablets, and touchscreens should use at least one BTN_TOOL_<name>
> > -    code when events are generated.
> > +    code when events are generated. Likewise all trackpads, tablets, and
> > +    touchscreens should export only one BTN_TOOL_<name> at a time. It is
>
> s/export/set to nonzero/ to avoid any ambiguity with setting the evbit on the
> device vs setting the value to nonzero.

I can carry this change in the v3.

>
> > +    however accepted to switch tool in one EV_SYN frame by setting the old
> > +    BTN_TOOL_<name> at a value of 0 and the new one at 1.
>
> I would even s/accepted/recommended/ but this LGTM to me, thanks.

In v2 I used recommended, but I turned the meaning the other way
around. In the v2 it reads:
"To not break existing userspace, it is recommended to not switch tool
in one EV_SYN frame but first emitting the old BTN_TOOL_<name> at 0,
then emit one SYN_REPORT and then set the new BTN_TOOL_<name> at 1."

So maybe I should use "accepted" in v3?

>
> Acked-by: Peter Hutterer <peter.hutterer@who-t.net>

Do I keep your acked-by in the v2/3?

Cheers,
Benjamin

