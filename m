Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2423A7623B3
	for <lists+linux-doc@lfdr.de>; Tue, 25 Jul 2023 22:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbjGYUls (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 25 Jul 2023 16:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbjGYUln (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Jul 2023 16:41:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AED62703
        for <linux-doc@vger.kernel.org>; Tue, 25 Jul 2023 13:41:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 941346187D
        for <linux-doc@vger.kernel.org>; Tue, 25 Jul 2023 20:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F86C433C9;
        Tue, 25 Jul 2023 20:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690317684;
        bh=4V1XXxIW5oRnhknxJ2XuysM/hqs0Fd0JpSgwRpnx7JU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lSlUdVfKUV9Bh3jPsCExGKGOHdD0ZuAjtGsICKq/f602KKHb0qrjBkeao1pS6rIr3
         EFCYA16xqDhktZ7IauZuuydw13btbP1YFtBRMZqbqK+XjRzAaP82lxo6bvX5mWH8xZ
         Zp8B1U/m0WbH0MeRA63iFVFFOF20EVRFd4ehPGOik00L0JaaFw8Zqedb6TbzX4vWra
         GdY7bnKcad4IYrseznj/yhAhKUcrzS9R+peSXaLi5HPkFqy1iLVjor9yTVxwOFs60U
         VC4qfhy2tN1MDlEgzzyhpdY6SV5YOCCqqG3vccTDgNd+0O+COUi0+FhmUwn1O0oAF5
         7yhUrOg1CHquA==
Date:   Tue, 25 Jul 2023 13:41:22 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Alexander Duyck <alexander.duyck@gmail.com>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH net] docs: net: clarify the NAPI rules around XDP Tx
Message-ID: <20230725134122.1684a2f1@kernel.org>
In-Reply-To: <CAKgT0UdKWmogiFD_Gip3TCi8-ydy+CVjwca1hPTYBRQQZ8_mGQ@mail.gmail.com>
References: <20230720161323.2025379-1-kuba@kernel.org>
        <c429298e279bd549de923deba09952e7540e534a.camel@gmail.com>
        <20230725115528.596b5305@kernel.org>
        <CAKgT0UdKWmogiFD_Gip3TCi8-ydy+CVjwca1hPTYBRQQZ8_mGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 25 Jul 2023 13:10:18 -0700 Alexander Duyck wrote:
> On Tue, Jul 25, 2023 at 11:55=E2=80=AFAM Jakub Kicinski <kuba@kernel.org>=
 wrote:
> > > This isn't accurate, and I would say it is somewhat dangerous advice.
> > > The Tx still needs to be processed regardless of if it is processing
> > > page_pool pages or XDP pages. I agree the Rx should not be processed,
> > > but the Tx must be processed using mechanisms that do NOT make use of
> > > NAPI optimizations when budget is 0.
> > >
> > > So specifically, xdp_return_frame is safe in non-NAPI Tx cleanup. The
> > > xdp_return_frame_rx_napi is not.
> > >
> > > Likewise there is napi_consume_skb which will use either a NAPI or no=
n-
> > > NAPI version of things depending on if budget is 0 or not.
> > >
> > > For the page_pool calls there is the "allow_direct" argument that is
> > > meant to decide between recycling in directly into the page_pool cache
> > > or not. It should only be used in the Rx handler itself when budget is
> > > non-zero.
> > >
> > > I realise this was written up in response to a patch on the Mellanox
> > > driver. Based on the patch in question it looks like they were calling
> > > page_pool_recycle_direct outside of NAPI context. There is an explicit
> > > warning above that function about NOT calling it outside of NAPI
> > > context. =20
> >
> > Unless I'm missing something budget=3D0 can be called from hard IRQ
> > context. And page pool takes _bh() locks. So unless we "teach it"
> > not to recycle _anything_ in hard IRQ context, it is not safe to call. =
=20
>=20
> That is the thing. We have to be able to free the pages regardless of
> context. Otherwise we make a huge mess of things. Also there isn't
> much way to differentiate between page_pool and non-page_pool pages
> because an skb can be composed of page pool pages just as easy as an
> XDP frame can be. All you would just have to enable routing or
> bridging for Rx frames to end up with page pool pages in the Tx path.
>=20
> As far as netpoll itself we are safe because it has BH disabled and so

We do? Can you point me to where netpoll disables BH?

> as a result page_pool doesn't use the _bh locks. There is code in
> place to account for that in the producer locking code, and if it were
> an issue we would have likely blown up long before now. The fact is
> that page_pool has proliferated into skbs, so you are still freeing
> page_pool pages indirectly anyway.
>=20
> That said, there are calls that are not supposed to be used outside of
> NAPI context, such as page_pool_recycle_direct(). Those have mostly
> been called out in the page_pool.h header itself, so if someone
> decides to shoot themselves in the foot with one of those, that is on
> them. What we need to watch out for are people abusing the "direct"
> calls and such or just passing "true" for allow_direct in the
> page_pool calls without taking proper steps to guarantee the context.
>
> > > We cannot make this distinction if both XDP and skb are processed in
> > > the same Tx queue. Otherwise you will cause the Tx to stall and break
> > > netpoll. If the ring is XDP only then yes, it can be skipped like what
> > > they did in the Mellanox driver, but if it is mixed then the XDP side
> > > of things needs to use the "safe" versions of the calls. =20
> >
> > IDK, a rare delay in sending of a netpoll message is not a major
> > concern. =20
>=20
> The whole point of netpoll is to get data out after something like a
> crash. Otherwise we could have just been using regular NAPI. If the Tx
> ring is hung it might not be a delay but rather a complete stall that
> prevents data on the Tx queue from being transmitted on since the
> system will likely not be recovering. Worse yet is if it is a scenario
> where the Tx queue can recover it might trigger the Tx watchdog since
> I could see scenarios where the ring fills, but interrupts were
> dropped because of the netpoll.

I'm not disagreeing with you. I just don't have time to take a deeper
look and add the IRQ checks myself and I'm 90% sure the current code
can't work with netpoll. So I thought I'd at least document that :(
