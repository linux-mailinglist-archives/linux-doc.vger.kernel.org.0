Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 037FD1EC397
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2020 22:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbgFBUTS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 2 Jun 2020 16:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbgFBUTS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Jun 2020 16:19:18 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF18DC08C5C1
        for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2020 13:19:17 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id e16so92190qtg.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2020 13:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2kH+c9aUDFBXS9s9kKGzuRINDn8BQbJAM1Dyn57dqTg=;
        b=vUcG4I9N4mCobCOVJckSHosoeFClEfZlEDisL91uLYBgvgM//AL2jVJxM4Cwwcb6Sc
         k5h9KQsbMPnA230WnR9khyJ77e4fk1euYuFBZTdMQWBjfVjcQPzJLj1grqdFaPU6XHOC
         adKPw5619wbCKK+CvT7Qx7qRhtmgo2PcY1tTw0x9W6oZkAXsr4UI185AMK1HSrR4yx/Q
         l182Yo/wjpt50BmN/P1pVPaoFjVzZENZ9r3/SHBvnEidX+kUf4An4+Qcshi70YXipjnD
         tonl/zvQ4txcworwKR0EOaYLnSvbbBaLnKNj+ZwisqO5k0vCGOUbWVuLjv1Szh9PuRif
         ARcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2kH+c9aUDFBXS9s9kKGzuRINDn8BQbJAM1Dyn57dqTg=;
        b=Rwm67Urdl7EfLFSI53cDBcMz9NizHrQ0mWl1Vf6ShSW5oMADQuW2Tz2o7gx8r8hnA7
         GrFTJUPIlxAOUPNt+ty5Q+rA/3ZzqjpspWDVc8QglsXr4z3Q6hgBT1YJUdEj/+gr2U6K
         Obmm+yArLNV5WOmV07mvSQ6Zuu+oZi30j3xS6F/VNC9vTtKyfUSahyH8LwHjekGv10/l
         004V7taj0uYus4oziXaTm+zcfXwl0cQlAWCwB6kT3BnlqTrZNz7gFNwVS5ToTM0tnBDC
         3WhvPxiWfiICG9i+Jz27Ar3kHkAdc30C84vvzjbElGApxXvmxTfhJBIjOhBpmUe0VdBu
         qxPA==
X-Gm-Message-State: AOAM532mgEjcoyR/dG7KSxrrnN5Rd+23Be45YjiWv1Zs8c2u+PPiRNVf
        T6GNiKz6kojY4Gv9trRW0pg5+0IC
X-Google-Smtp-Source: ABdhPJw41qDk8eK4Uq6n4jl9gjCGfqLVSGG4/jewft0+tky0UtMtnKigS+EIAXqrexls6n5SuHAf/Q==
X-Received: by 2002:aed:29e6:: with SMTP id o93mr29256721qtd.135.1591129156472;
        Tue, 02 Jun 2020 13:19:16 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id n13sm3741643qtb.20.2020.06.02.13.19.14
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 13:19:15 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id p123so7700446yba.6
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2020 13:19:14 -0700 (PDT)
X-Received: by 2002:a25:3187:: with SMTP id x129mr46106604ybx.428.1591129153446;
 Tue, 02 Jun 2020 13:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200602080535.1427-1-victor@inliniac.net> <CA+FuTSfD2-eF0H=Qu09=JXK6WTiWKNtcqRXqv3TfMfB-=0GiMg@mail.gmail.com>
 <b0a9d785-9d5e-9897-b051-6d9a1e8f914e@inliniac.net> <CA+FuTSd07inNysGhx088hq_jybrikSQdxw8HYjmP84foXhnXOA@mail.gmail.com>
 <06479df9-9da4-dbda-5bd1-f6e4d61471d0@inliniac.net> <CA+FuTSci29=W89CLweZcW=RTKwEXpUdPjsLGTB95iSNcnpU_Lw@mail.gmail.com>
 <6a3dcce9-4635-28e9-d78e-1c7f1f7874da@inliniac.net> <CA+FuTSdmtC4+0cnC2K1gwRLksXgb4hffUpyRbHjjGZbOJOfL0w@mail.gmail.com>
 <21a2224a-65f2-6375-589d-9cadb4fab840@inliniac.net>
In-Reply-To: <21a2224a-65f2-6375-589d-9cadb4fab840@inliniac.net>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Tue, 2 Jun 2020 16:18:36 -0400
X-Gmail-Original-Message-ID: <CA+FuTSdczH+i8+FO+eQ+OT4-bsRAKG+jacPiuRu3jMszpV_2XA@mail.gmail.com>
Message-ID: <CA+FuTSdczH+i8+FO+eQ+OT4-bsRAKG+jacPiuRu3jMszpV_2XA@mail.gmail.com>
Subject: Re: [PATCH net-next v2] af-packet: new flag to indicate all csums are good
To:     Victor Julien <victor@inliniac.net>
Cc:     Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Network Development <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Eric Dumazet <edumazet@google.com>,
        Mao Wenan <maowenan@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
        Neil Horman <nhorman@tuxdriver.com>, linux-doc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Alexander Drozdov <al.drozdov@gmail.com>,
        Tom Herbert <tom@herbertland.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 2, 2020 at 4:05 PM Victor Julien <victor@inliniac.net> wrote:
>
> On 02-06-2020 21:38, Willem de Bruijn wrote:
> > On Tue, Jun 2, 2020 at 3:22 PM Victor Julien <victor@inliniac.net> wrote:
> >>
> >> On 02-06-2020 21:03, Willem de Bruijn wrote:
> >>> On Tue, Jun 2, 2020 at 2:31 PM Victor Julien <victor@inliniac.net> wrote:
> >>>> On 02-06-2020 19:37, Willem de Bruijn wrote:
> >>>>> On Tue, Jun 2, 2020 at 1:03 PM Victor Julien <victor@inliniac.net> wrote:
> >>>>>>
> >>>>>> On 02-06-2020 16:29, Willem de Bruijn wrote:
> >>>>>>> On Tue, Jun 2, 2020 at 4:05 AM Victor Julien <victor@inliniac.net> wrote:
> >>>>>>>>
> >>>>>>>> Introduce a new flag (TP_STATUS_CSUM_UNNECESSARY) to indicate
> >>>>>>>> that the driver has completely validated the checksums in the packet.
> >>>>>>>>
> >>>>>>>> The TP_STATUS_CSUM_UNNECESSARY flag differs from TP_STATUS_CSUM_VALID
> >>>>>>>> in that the new flag will only be set if all the layers are valid,
> >>>>>>>> while TP_STATUS_CSUM_VALID is set as well if only the IP layer is valid.
> >>>>>>>
> >>>>>>> transport, not ip checksum.
> >>>>>>
> >>>>>> Allow me a n00b question: what does transport refer to here? Things like
> >>>>>> ethernet? It isn't clear to me from the doc.
> >>>>>
> >>>>> The TCP/UDP/.. transport protocol checksum.
> >>>>
> >>>> Hmm that is what I thought originally, but then it didn't seem to work.
> >>>> Hence my patch.
> >>>>
> >>>> However I just redid my testing. I took the example tpacketv3 program
> >>>> and added the status flag checks to the 'display()' func:
> >>>>
> >>>>                 if (ppd->tp_status & TP_STATUS_CSUM_VALID) {
> >>>>                         printf("TP_STATUS_CSUM_VALID, ");
> >>>>                 }
> >>>>                 if (ppd->tp_status & (1<<8)) {
> >>>>                         printf("TP_STATUS_CSUM_UNNECESSARY, ");
> >>>>
> >>>>                 }
> >>>>
> >>>> Then using scapy sent some packets in 2 variants:
> >>>> - default (good csums)
> >>>> - deliberately bad csums
> >>>> (then also added a few things like ip6 over ip)
> >>>>
> >>>>
> >>>> srp1(Ether()/IP(src="1.2.3.4", dst="5.6.7.8")/IPv6()/TCP(),
> >>>> iface="enp1s0") // good csums
> >>>>
> >>>> srp1(Ether()/IP(src="1.2.3.4", dst="5.6.7.8")/IPv6()/TCP(chksum=1),
> >>>> iface="enp1s0") //bad tcp
> >>>
> >>> Is this a test between two machines? What is the device driver of the
> >>> machine receiving and printing the packet? It would be helpful to know
> >>> whether this uses CHECKSUM_COMPLETE or CHECKSUM_UNNECESSARY.
> >>
> >> Yes 2 machines, or actually 2 machines and a VM. The receiving Linux
> >> sits in a kvm vm with network pass through and uses the virtio driver
> >> (host uses e1000e). Based on a quick 'git grep CHECKSUM_UNNECESSARY'
> >> virtio seems to support that.
> >>
> >> I've done some more tests. In a pcap replay that I know contains packet
> >> with bad TCP csums (but good IP csums for those pkts), to a physical
> >> host running Ubuntu Linux kernel 5.3:
> >>
> >> - receiver uses nfp (netronome) driver: TP_STATUS_CSUM_VALID set for
> >> every packet, including the bad TCP ones
> >> - receiver uses ixgbe driver: TP_STATUS_CSUM_VALID not set for the bad
> >> packets.
> >
> > Great. Thanks a lot for running all these experiments.
> >
> > We might have to drop the TP_STATUS_CSUM_VALID with CHECKSUM_COMPLETE
> > unless skb->csum_valid.
> >
> > For packets with multiple transport layer checksums,
> > CHECKSUM_UNNECESSARY should mean that all have been verified.
> >
> > I believe that in the case of multiple transport headers, csum_valid
> > similarly ensures all checksums up to csum_start are valid. Will need
> > to double check.
> >
> > If so, there probably is no need for a separate new TP_STATUS.
> > TP_STATUS_CSUM_VALID is reported only when all checksums are valid.
>
> So if I understand you correctly the key may be in the call to
> `skb_csum_unnecessary`:
>
> That reads:
>
> static inline int skb_csum_unnecessary(const struct sk_buff *skb)
> {
>         return ((skb->ip_summed == CHECKSUM_UNNECESSARY) ||
>                 skb->csum_valid ||
>                 (skb->ip_summed == CHECKSUM_PARTIAL &&
>                  skb_checksum_start_offset(skb) >= 0));
> }
>
> But really only the first 2 conditions are reachable

.. from this codepath. That function is called in other codepaths as well.

> , as we already know
> skb->ip_summed is not CHECKSUM_PARTIAL when we call it.
>
> So our unmodified check is:
>
>         else if (skb->pkt_type != PACKET_OUTGOING &&
>                 (skb->ip_summed == CHECKSUM_COMPLETE ||
>                  skb->ip_summed == CHECKSUM_UNNECESSARY ||
>                  skb->csum_valid))
>
> Should this become something like:
>
>         else if (skb->pkt_type != PACKET_OUTGOING &&
>                 (skb->ip_summed == CHECKSUM_COMPLETE &&
>                  skb->csum_valid) ||
>                  skb->ip_summed == CHECKSUM_UNNECESSARY)
>
> Is this what you had in mind?

I don't suggest modifying skb_csum_unnecessary probably. Certainly not
until I've looked at all other callers of it.

But in case of packet sockets, yes, adding that csum_valid check is my
first rough approximation.

That said, first let's give others more familiar with
TP_STATUS_CSUM_VALID some time to comment.
