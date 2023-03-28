Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 581286CC64B
	for <lists+linux-doc@lfdr.de>; Tue, 28 Mar 2023 17:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233104AbjC1P3O (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 28 Mar 2023 11:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233158AbjC1P2z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Mar 2023 11:28:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 403E8F76C
        for <linux-doc@vger.kernel.org>; Tue, 28 Mar 2023 08:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680017221;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3DsgcTYFWxhX9PLfaIyKWk2AVWDq7BUElXbxQWwuPGo=;
        b=KYP1DIZgiZZC2cwHEoUToHFfsdNasoub2pbbqP4gK1X8srMnIbfcg4hk+ngE7VaZHd1w3x
        IHkcCKBPGHCmzgl+0slnfL4wyVD7KC4bSv4HP/oE1kyBtxZB2Hw6h4t/CmV9y4jEZHcYAQ
        q69Kr3TpF2YAZml8Ka4/w36qKjLT+FQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-kFJyWBNXOnmoabIlWMjg-g-1; Tue, 28 Mar 2023 11:13:24 -0400
X-MC-Unique: kFJyWBNXOnmoabIlWMjg-g-1
Received: by mail-qv1-f70.google.com with SMTP id pe26-20020a056214495a00b005df3eac4c0bso2092014qvb.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Mar 2023 08:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680016403; x=1682608403;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3DsgcTYFWxhX9PLfaIyKWk2AVWDq7BUElXbxQWwuPGo=;
        b=UBRa819MGdCLICRgBh2Nbcp0FkQC1Sc9WU2COBHm5kGjWqWBMVDjYu0pV4IoV4/6t2
         cFffVH0BYTwOvpbpesVimK2BhcUxFLMDZ8qq48mtpmDijB7zCMw8W804exYo+qRXerST
         aXu0qepldlaZV5Q1u7S5g6HaEd+SGLlFzOZJaHVl1qBrJZskBK9Ra/WmBVW9BKKql7g8
         83Octu9eFg0VOG/ymYOfQMw6kVCpcVZXEW7y9qeST7Hzipb1GM/deX+728x6XBa6yHd7
         QECY/RqQkoggugTEKkFCUAsHMiLjRuiLCfnvYZ6WxM4/v0KVRDrYVwsC5DFGXIKTa/Xd
         5C8w==
X-Gm-Message-State: AO0yUKXW9l5rEdtiZNpLy5gx+W6ZXLzzuIfK/8ScrLvpOgG4TfP2YAXC
        18D6OQvejxsEcQ4estowyicRnPadp4T0E6aDe4qfqAyTZqiFfbU9Q2Zrdg2/L3LSgysYOCzSYg+
        WD/W9dLPwga9E2de8IbTI
X-Received: by 2002:ac8:5905:0:b0:3d9:56ce:a8cd with SMTP id 5-20020ac85905000000b003d956cea8cdmr27300510qty.6.1680016403648;
        Tue, 28 Mar 2023 08:13:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350YwwGHDreK24ccOM1fRksnfMcjyV+HDpQvkvYlDeAaCKhWxUqK0D0aDc17Jr9LYaSTFZIprTg==
X-Received: by 2002:ac8:5905:0:b0:3d9:56ce:a8cd with SMTP id 5-20020ac85905000000b003d956cea8cdmr27300446qty.6.1680016403274;
        Tue, 28 Mar 2023 08:13:23 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-232-148.dyn.eolo.it. [146.241.232.148])
        by smtp.gmail.com with ESMTPSA id y16-20020a376410000000b00746aa4465b4sm8103982qkb.43.2023.03.28.08.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 08:13:22 -0700 (PDT)
Message-ID: <9331f1358cf7c24442d705d840812e9cd490e018.camel@redhat.com>
Subject: Re: [PATCH net-next] net/core: add optional threading for backlog
 processing
From:   Paolo Abeni <pabeni@redhat.com>
To:     Felix Fietkau <nbd@nbd.name>, Jakub Kicinski <kuba@kernel.org>
Cc:     netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Tue, 28 Mar 2023 17:13:20 +0200
In-Reply-To: <b001c8ed-214f-94e6-2d4f-0ee13e3d8760@nbd.name>
References: <20230324171314.73537-1-nbd@nbd.name>
         <20230324102038.7d91355c@kernel.org>
         <2d251879-1cf4-237d-8e62-c42bb4feb047@nbd.name>
         <20230324104733.571466bc@kernel.org>
         <f59ee83f-7267-04df-7286-f7ea147b5b49@nbd.name>
         <751fd5bb13a49583b1593fa209bfabc4917290ae.camel@redhat.com>
         <b001c8ed-214f-94e6-2d4f-0ee13e3d8760@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2023-03-28 at 11:45 +0200, Felix Fietkau wrote:
> On 28.03.23 11:29, Paolo Abeni wrote:
> > On Fri, 2023-03-24 at 18:57 +0100, Felix Fietkau wrote:
> > > On 24.03.23 18:47, Jakub Kicinski wrote:
> > > > On Fri, 24 Mar 2023 18:35:00 +0100 Felix Fietkau wrote:
> > > > > I'm primarily testing this on routers with 2 or 4 CPUs and limite=
d=20
> > > > > processing power, handling routing/NAT. RPS is typically needed t=
o=20
> > > > > properly distribute the load across all available CPUs. When ther=
e is=20
> > > > > only a small number of flows that are pushing a lot of traffic, a=
 static=20
> > > > > RPS assignment often leaves some CPUs idle, whereas others become=
 a=20
> > > > > bottleneck by being fully loaded. Threaded NAPI reduces this a bi=
t, but=20
> > > > > CPUs can become bottlenecked and fully loaded by a NAPI thread al=
one.
> > > >=20
> > > > The NAPI thread becomes a bottleneck with RPS enabled?
> > >=20
> > > The devices that I work with often only have a single rx queue. That =
can
> > > easily become a bottleneck.
> > >=20
> > > > > Making backlog processing threaded helps split up the processing =
work=20
> > > > > even more and distribute it onto remaining idle CPUs.
> > > >=20
> > > > You'd want to have both threaded NAPI and threaded backlog enabled?
> > >=20
> > > Yes
> > >=20
> > > > > It can basically be used to make RPS a bit more dynamic and=20
> > > > > configurable, because you can assign multiple backlog threads to =
a set=20
> > > > > of CPUs and selectively steer packets from specific devices / rx =
queues=20
> > > >=20
> > > > Can you give an example?
> > > >=20
> > > > With the 4 CPU example, in case 2 queues are very busy - you're try=
ing
> > > > to make sure that the RPS does not end up landing on the same CPU a=
s
> > > > the other busy queue?
> > >=20
> > > In this part I'm thinking about bigger systems where you want to have=
 a
> > > group of CPUs dedicated to dealing with network traffic without
> > > assigning a fixed function (e.g. NAPI processing or RPS target) to ea=
ch
> > > one, allowing for more dynamic processing.
> > >=20
> > > > > to them and allow the scheduler to take care of the rest.
> > > >=20
> > > > You trust the scheduler much more than I do, I think :)
> > >=20
> > > In my tests it brings down latency (both avg and p99) considerably in
> > > some cases. I posted some numbers here:
> > > https://lore.kernel.org/netdev/e317d5bc-cc26-8b1b-ca4b-66b5328683c4@n=
bd.name/
> >=20
> > It's still not 110% clear to me why/how this additional thread could
> > reduce latency. What/which threads are competing for the busy CPU[s]? I
> > suspect it could be easier/cleaner move away the others (non RPS)
> > threads.
> In the tests that I'm doing, network processing load from routing/NAT is=
=20
> enough to occupy all available CPUs.
> If I dedicate the NAPI thread to one core and use RPS to steer packet=20
> processing to the other cores, the core taking care of NAPI has some=20
> idle cycles that go to waste, while the other cores are busy.
> If I include the core in the RPS mask, it can take too much away from=20
> the NAPI thread.

I feel like I'm missing some relevant points.

If RPS keeps the target CPU fully busy, moving RPS processing in a
separate thread still will not allow using more CPU time.

Which NIC driver are you using?

thanks!

Paolo

