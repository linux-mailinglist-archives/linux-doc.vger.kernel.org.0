Return-Path: <linux-doc+bounces-244-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E23747C9050
	for <lists+linux-doc@lfdr.de>; Sat, 14 Oct 2023 00:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9643B1F218CE
	for <lists+linux-doc@lfdr.de>; Fri, 13 Oct 2023 22:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A46D2C846;
	Fri, 13 Oct 2023 22:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CNJhhVoc"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932F12C84D
	for <linux-doc@vger.kernel.org>; Fri, 13 Oct 2023 22:35:55 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85CA1B7
	for <linux-doc@vger.kernel.org>; Fri, 13 Oct 2023 15:35:51 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-534694a9f26so1648a12.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Oct 2023 15:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697236550; x=1697841350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSeOd+rYnOzhF1ReZbddCmvmJexTwHpOy+fpUODbkOA=;
        b=CNJhhVock8IDFK3Wu6SntkES8kAfPX+KDiRD7Au6H+P9EdgUEHMn0G7nUwLl6f3zyQ
         pAQYQrF5bkso1ka3P72+mmsoQ6P2P1TBTA5SdSTAH8pysOKZZ0Rm2klnu07TRE0Nd28T
         wIpXbXoGfrug6vz07MEw3KLd9my6geFIiyaeCooyhBotPhBwIpM3RtN3lEYnzGtMTNKn
         sWtfxCBbeR0/1zdRReII4jHH7lfBPWvCSUDnjDt3B+6z0cCmQCJjMArvtKB7cfhZ8gPh
         32MKP6MAAt6pSYiphT8J2Dc6I/39v5uz+7uBORtNiDcSBkUcJUy7DkMbLPayi6urlcOW
         xsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697236550; x=1697841350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSeOd+rYnOzhF1ReZbddCmvmJexTwHpOy+fpUODbkOA=;
        b=r2YNmQgYxMxGb18P2DrOzJoiFMtAHYXVYmjKoJgMw1kGF2bxXCALpPrfVjwb1T7lUB
         rVbtFQ00Fk5hEfyM9Ys9S72ognUP1PiBKzPHjm6wn4RBYSz1iUpRSJSREqfYL5CB6pgX
         Kse7d4WcFCtndj9GSSv1JF9aKiJRqGc+MAcAoOSd2v1Jj8i08BGCqZNSl5hLdPLvCNQw
         pqVZVeQdyjatJ/BkJ89hcrEqe7kiIEhwMxe+bc5xTdEym+4+bYTWcx3bfttERo9TrPWJ
         tmZipIm9LIC2Ce8/femv2wuFJbdRg+Bdfe7ULxEFVhn3M3F5hSBJjT9OVppatW/3oXOW
         ecBw==
X-Gm-Message-State: AOJu0YwYdfysE4sCaNTjZy58a1RpV78E39fEcV4Y8+zbFZt+/AIj7W9X
	MbZ0qRL0yKihn5p6JdqQ/cfBfAKjWgHq7RHl30V6eA==
X-Google-Smtp-Source: AGHT+IGab/hjqlvQOWvzU8uiN4cTgE2c1UwEFpeNxmfQ9loSAkD0F0d/KgLPzEzVpZJ5dRiRT82FMJcpybdv+jzM5Xg=
X-Received: by 2002:a50:cdde:0:b0:53d:b53c:946b with SMTP id
 h30-20020a50cdde000000b0053db53c946bmr42816edj.2.1697236549785; Fri, 13 Oct
 2023 15:35:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009142005.21338-1-quic_kriskura@quicinc.com>
 <20231009142005.21338-2-quic_kriskura@quicinc.com> <CANP3RGfEk2DqZ3biyN78ycQYbDxCEG+H1me2vnEYuwXkNdXnTA@mail.gmail.com>
 <CANP3RGcCpNOuVpdV9n0AFxZo-wsfwi8OfYgBk1WHNHaEd-4V-Q@mail.gmail.com>
 <CANP3RGdY4LsOA6U5kuccApHCzL0_jBnY=pLOYrUuYtMZFTvnbw@mail.gmail.com>
 <d19d9d08-c119-4991-b460-49925f601d15@quicinc.com> <fad5a7fb-cce1-46bc-a0af-72405c76d107@quicinc.com>
 <CANP3RGcqWBYd9FqAX47rE9pFgBTB8=0CGdwkScm-OH1epHcVWQ@mail.gmail.com>
 <8ff92053-52ff-4950-95c8-0e986f6a028a@quicinc.com> <CANP3RGd4G4dkMOyg6wSX29NYP2mp=LhMhmZpoG=rgoCz=bh1=w@mail.gmail.com>
 <b12eb7b1-54e7-406f-8c19-0046555b82d3@quicinc.com>
In-Reply-To: <b12eb7b1-54e7-406f-8c19-0046555b82d3@quicinc.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Fri, 13 Oct 2023 15:35:32 -0700
Message-ID: <CANP3RGcUrFTaFL8V3tpuh+qQoEi84O0Dy9ie+XD=-H01c2btAw@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: gadget: ncm: Add support to update
 wMaxSegmentSize via configfs
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, onathan Corbet <corbet@lwn.net>, 
	Linyu Yuan <quic_linyyuan@quicinc.com>, linux-usb@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_wcheng@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Oct 13, 2023 at 12:58=E2=80=AFPM Krishna Kurapati PSSNV
<quic_kriskura@quicinc.com> wrote:
>
>
>
> On 10/14/2023 12:09 AM, Maciej =C5=BBenczykowski wrote:
> > On Thu, Oct 12, 2023 at 8:40=E2=80=AFAM Krishna Kurapati PSSNV
> > <quic_kriskura@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 10/12/2023 6:02 PM, Maciej =C5=BBenczykowski wrote:
> >>> On Thu, Oct 12, 2023 at 1:48=E2=80=AFAM Krishna Kurapati PSSNV
> >>>
> >>> Could you paste the full patch?
> >>> This is hard to review without looking at much more context then emai=
l
> >>> is providing
> >>> (or, even better, send me a link to a CL in gerrit somewhere - for
> >>> example aosp ACK mainline tree)
> >>
> >> Sure. Will provide a gerrit on ACK for review before posting v2.
> >>
> >> The intent of posting the diff was two fold:
> >>
> >> 1. The question Greg asked regarding why the max segment size was
> >> limited to 15014 was valid. When I thought about it, I actually wanted
> >> to limit the max MTU to 15000, so the max segment size automatically
> >> needs to be limited to 15014.
> >
> > Note that this is a *very* abstract value.
> > I get you want L3 MTU of 10 * 1500, but this value is not actually mean=
ingful.
> >
> > IPv4/IPv6 fragmentation and IPv4/IPv6 TCP segmentation
> > do not result in a trivial multiplication of the standard 1500 byte
> > ethernet L3 MTU.
> > Indeed aggregating 2 1500 L3 mtu frames results in *different* sized
> > frames depending on which type of aggregation you do.
> > (and for tcp it even depends on the number and size of tcp options,
> > though it is often assumed that those take up 12 bytes, since that's th=
e
> > normal for Linux-to-Linux tcp connections)
> >
> > For example if you aggregate N standard Linux ipv6/tcp L3 1500 mtu fram=
es,
> > this means you have
> > N frames: ethernet (14) + ipv6 (40) + tcp (20) + tcp options (12) +
> > payload (1500-12-20-40=3D1500-72=3D1428)
> > post aggregation:
> > 1 frame: ethernet (14) + ipv6 (40) + tcp (20) + tcp options (12) +
> > payload (N*1428)
> >
> > so N * 1500 =3D=3D N * (72 + 1428) --> 1 * (72 + N * 1428)
> >
> > That value of 72 is instead 52 for 'standard Linux ipv4/tcp),
> > it's 40/60 if there's no tcp options (which I think happens when
> > talking to windows)
> > it's different still with ipv4 fragmentation... and again different
> > with ipv6 fragmentation...
> > etc.
> >
> > ie. 15000 L3 mtu is exactly as meaningless as 14000 L3 mtu.
> > Either way you don't get full frames.
> >
> > As such I'd recommend going with whatever is the largest mtu that can
> > be meaningfully made to fit in 16K with all the NCM header overhead.
> > That's likely closer to 15500-16000 (though I have *not* checked).
> >
> >> But my commit text didn't mention this
> >> properly which was a mistake on my behalf. But when I looked at the
> >> code, limiting the max segment size 15014 would force the practical
> >> max_mtu to not cross 15000 although theoretical max_mtu was set to:
> >> (GETHER_MAX_MTU_SIZE - 15412) during registration of net device.
> >>
> >> So my assumption of limiting it to 15000 was wrong. It must be limited
> >> to 15412 as mentioned in u_ether.c  This inturn means we must limit
> >> max_segment_size to:
> >> GETHER_MAX_ETH_FRAME_LEN (GETHER_MAX_MTU_SIZE + ETH_HLEN)
> >> as mentioned in u_ether.c.
> >>
> >> I wanted to confirm that setting MAX_DATAGRAM_SIZE to
> >> GETHER_MAX_ETH_FRAME_LEN was correct.
> >>
> >> 2. I am not actually able to test with MTU beyond 15000. When my host
> >> device is a linux machine, the cdc_ncm.c limits max_segment_size to:
> >> CDC_NCM_MAX_DATAGRAM_SIZE               8192    /* bytes */
> >
> > In practice you get 50% of the benefits of infinitely large mtu by
> > going from 1500 to ~2980.
> > you get 75% of the benefits by going to ~6K
> > you get 87.5% of the benefits by going to ~12K
> > the benefits of going even higher are smaller and smaller...
> >  > If the host side is limited to 8192, maybe we should match that here=
 too?
>
> Hi Maciej,
>
>   Thanks for the detailed explanation. I agree with you on setting
> device side also to 8192 instead of what max_mtu is present in u_ether
> or practical max segment size possible.
>
> >
> > But the host side limitation of 8192 doesn't seem particularly sane eit=
her...
> > Maybe we should relax that instead?
> >
> I really didn't understand why it was set to 8192 in first place.
>
> > (especially since for things like tcp zero copy you want an mtu which
> > is slighly more then N * 4096,
> > ie. around 4.5KB, 8.5KB, 12.5KB or something like that)
> >
>
> I am not sure about host mode completely. If we want to increase though,
> just increasing the MAX_DATAGRAM_SIZE to some bigger value help ? (I
> don't know the entire code of cdc_ncm, so I might be wrong).
>
> Regards,
> Krishna,

Hmm, I'm not sure.  I know I've experimented with high mtu ncm in the past
(around 2.5 years ago).  I got it working between my Linux desktop (host)
and a Pixel 6 (device/gadget) with absolutely no problems.

I'm pretty sure I didn't change my desktop kernel, so I was probably
limited to 8192 there
(and I do more or less remember that).
From what I vaguely remember, it wasn't difficult (at all) to hit
upwards of 7gbps for iperf tests.
I don't remember how close to the theoretical USB 10gbps maximum of
9.7gbps I could get...
[this was never the real bottleneck / issue, so I didn't ever dig
particularly deep]

I'm pretty sure my gadget side changes were non-configurable...
Probably just bumped one or two constants...

I do *very* *vaguely* recall there being some funkiness though, where 8192 =
was
*less* efficient than some slightly smaller value.

If I recall correctly the issue is that 8192 + ethernet overhead + NCM
overhead only fits *once* into 16384, which leaves a lot of space
wasted.
While ~7.5 kb + overhead fits twice and is thus a fair bit better.

I don't remember if I found a way to boost the 16384 to double or triple th=
at.
That should have been a win, I can't remember if we were usb3 spec
limitted there.

