Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 485F952D1BB
	for <lists+linux-doc@lfdr.de>; Thu, 19 May 2022 13:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237131AbiESLqs (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 19 May 2022 07:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237536AbiESLqi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 May 2022 07:46:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DB5BE60A96
        for <linux-doc@vger.kernel.org>; Thu, 19 May 2022 04:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652960793;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GSpkaZjpG+wr9/klHZRZ2SJRW1tcfr1HJfk966Tzpq8=;
        b=OLe8A5nmF45CHu9F560R5KMoJMuMVa5+SSAJxO94FCsAXAYI6UujmpHw81Jij5WiiU7lHg
        F5CLeFO2JyoZ1Da/IpLKkBbDGSNuQo23WZLZ0SJO3hAJf/cuyqNKJ2EhVsbi/JbckGDqKH
        VYPhPM94BvylVR7WdTN3BSqqF83CqAo=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-mfWotVJNMxmqQreNnCIkcA-1; Thu, 19 May 2022 07:46:32 -0400
X-MC-Unique: mfWotVJNMxmqQreNnCIkcA-1
Received: by mail-pj1-f71.google.com with SMTP id r14-20020a17090a1bce00b001df665a2f8bso2899421pjr.4
        for <linux-doc@vger.kernel.org>; Thu, 19 May 2022 04:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GSpkaZjpG+wr9/klHZRZ2SJRW1tcfr1HJfk966Tzpq8=;
        b=mADaKiekJI1eLZ4s14OGjbpmQlwDGzIyWVW0sEz91Z1FmghysUY5a104+mIpwIJN/t
         CaUF9dznDU3/dx9Tjq413WtrN01Wkme5GSBQeZPlKeUw6YlYRO4qbbfEsq1Gf3h9TZTT
         OYli3MrI+ynrqhI7yfE2Z+ZGSkrJxv1JDHhRh6DAkNXA7wPxg7o86n5pKW8i48kpBBjU
         OiTtWqecuFgIn+c4VZQgkxiiKBt0ts0WMJlLXLE5/6ExMEe/yamjiMuC50sSpMbJU7rK
         kJhLB8xK+COsJnzcPOaRFbGrVoO5lcJ4PhbdDOP+jMxLGaQ2Vhqz27WiKajRLJCgpBRW
         jZtA==
X-Gm-Message-State: AOAM530IwpDko+UQ/902wPApxFqIzT1v1BUOXDru5Kao6ClChFAJb3nz
        R9/3imjO1mjthi0nCvAYptIKRIygCRZYJz3e4qKfFZtTFBSbuEMHVs+fMVXwPLOSx5GeJYBgp2q
        juGdOIxc454L1pV1++VhaxoK1EKPP4shXuzu+
X-Received: by 2002:a17:903:22c6:b0:15f:14e1:1518 with SMTP id y6-20020a17090322c600b0015f14e11518mr4389726plg.116.1652960791504;
        Thu, 19 May 2022 04:46:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzioMf82ETXq8PfZUw04Ya3sdzxwtRppBH/zQS6f6PkiKtChfcyE8u9CczNO3BytCe9N5VvBeRF1NwdZOPfyio=
X-Received: by 2002:a17:903:22c6:b0:15f:14e1:1518 with SMTP id
 y6-20020a17090322c600b0015f14e11518mr4389693plg.116.1652960791232; Thu, 19
 May 2022 04:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220518205924.399291-1-benjamin.tissoires@redhat.com>
 <YoX7iHddAd4FkQRQ@infradead.org> <YoX904CAFOAfWeJN@kroah.com>
 <YoYCIhYhzLmhIGxe@infradead.org> <YoYcw5a6EOvVPzay@kroah.com>
In-Reply-To: <YoYcw5a6EOvVPzay@kroah.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 19 May 2022 13:46:19 +0200
Message-ID: <CAO-hwJK0VAu9kAVzqQrcApZok3UGhACzoVamUH3N2PeyDWZnoQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 00/17] Introduce eBPF support for HID devices
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Jiri Kosina <jikos@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Dave Marchevsky <davemarchevsky@fb.com>,
        Joe Stringer <joe@cilium.io>, Jonathan Corbet <corbet@lwn.net>,
        Tero Kristo <tero.kristo@linux.intel.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 19, 2022 at 12:32 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, May 19, 2022 at 01:38:58AM -0700, Christoph Hellwig wrote:
> > On Thu, May 19, 2022 at 10:20:35AM +0200, Greg KH wrote:
> > > > are written using a hip new VM?
> > >
> > > Ugh, don't mention UDI, that's a bad flashback...
> >
> > But that is very much what we are doing here.
> >
> > > I thought the goal here was to move a lot of the quirk handling and
> > > "fixup the broken HID decriptors in this device" out of kernel .c code
> > > and into BPF code instead, which this patchset would allow.
> > >
> > > So that would just be exception handling.  I don't think you can write a
> > > real HID driver here at all, but I could be wrong as I have not read the
> > > new patchset (older versions of this series could not do that.)
> >
> > And that "exception handling" is most of the driver.
>
> For a number of "small" drivers, yes, that's all there is as the
> hardware is "broken" and needs to be fixed up in order to work properly
> with the hid core code.  An example of that would be hid-samsung.c which
> rewrites the descriptors to be sane and maps the mouse buttons properly.
>
> But that's it, after initialization that driver gets out of the way and
> doesn't actually control anything.  From what I can tell, this patchset
> would allow us to write those "fixup the mappings and reports before the
> HID driver takes over" into ebpf programs.
>
> It would not replace "real" HID drivers like hid-rmi.c that has to
> handle the events and do other "real" work here.
>
> Or I could be reading this code all wrong, Benjamin?

You get it right. hid-rmi is a good example of something that can not
sanely be done with eBPF.
We can do some filtering on the events (dropping one event, changing
one other), but anything outside that would not be possible. This
driver does a lot of scheduling, synchronisation, and various setup
that would require a lot of back and forth between userspace and
BPF/kernel, which makes it definitively not fit for a BPF
implementation.

>
> But even if it would allow us to write HID drivers as ebpf, what is
> wrong with that?  It's not a licensing issue (this api is only allowed
> for GPL ebpf programs), it should allow us to move a bunch of in-kernel
> drivers into smaller ebpf programs instead.

The one thing I also like with eBPF is that it is safe. When you
declare an array of bytes, the verifier enforces we don't go outside
of the boundaries.
I know rust is coming, but compared to plain C, that is much better,
even if more restrictive.
And it will also prevent some potential bugs where we have a report
fixup that writes outside of the reserved memory.

>
> It's not like this ebpf HID driver would actually work on any other
> operating system, right?  I guess Microsoft could create a gpl-licensed
> ebpf HID layer as well?  As Windows allows vendors to do all of this
> horrible HID fixups in userspace today anyway, I strongly doubt they
> would go through the effort to add a new api like this for no valid
> reason.

OTOH, managing to push Microsoft to implement HID-BPF would be some
achievement :) (just kidding).

Cheers,
Benjamin

