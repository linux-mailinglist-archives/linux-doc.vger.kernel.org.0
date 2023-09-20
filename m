Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8C57A8A6B
	for <lists+linux-doc@lfdr.de>; Wed, 20 Sep 2023 19:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbjITRRf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 20 Sep 2023 13:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbjITRRe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Sep 2023 13:17:34 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E433A9;
        Wed, 20 Sep 2023 10:17:28 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCEDC433C8;
        Wed, 20 Sep 2023 17:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695230248;
        bh=ApF4wBrue9AayUL6Ck3kragbZU4GhEpInrtQl42fysw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pAwrwGGfLPvdxRuXUBHqhvpTtL/0GdhWjK6DLt1wxIc1b3ESpp9LEhXusBaqRUioJ
         8LOtI/7tMKdeXxdtorKoMSar+5F1MkPldkG/m51VMtBEsvX8DKu/2B1O8aIqG+jc/F
         5sl7y+iwZCH4ZFbVMf5cpqYxoDPXWC20MhCITDrLqsntbzulOgzWB9gi+oD8TAYSfS
         zq9vNmBvuQWcAU8CHlqnpcC05NHEf8BMvsTMUKjOCGiYx1QmiZA1mxfT/QHak5Io9U
         v94FNba2mfEmeFu3N6/yKZHHo6ZLoKufhfrwXifOvP7IN1yVWbt/NVofIBsE2Z0UUJ
         bUgGX6jKxROVA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.95)
        (envelope-from <maz@kernel.org>)
        id 1qj0pJ-00Ej2x-IY;
        Wed, 20 Sep 2023 18:17:25 +0100
Date:   Wed, 20 Sep 2023 18:17:19 +0100
Message-ID: <864jjopxwg.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morse <james.morse@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: errata: Add Cortex-A520 speculative unprivileged load workaround
In-Reply-To: <CAL_JsqJsQaA4N6xGenzZ=P2r+PR=x=bcB8ikrJzrJOn1FgKYmA@mail.gmail.com>
References: <20230912121120.380420-1-robh@kernel.org>
        <20230912121120.380420-2-robh@kernel.org>
        <20230918100102.GA17472@willie-the-truck>
        <dcb12b18edc02634be3ac9909fa70602@misterjones.org>
        <CAL_JsqLXBDaAUKDjRCyiuZeR4khxKzN5Q2_LhUPg34YDGpjmGg@mail.gmail.com>
        <86zg1icop8.wl-maz@kernel.org>
        <CAL_JsqJsQaA4N6xGenzZ=P2r+PR=x=bcB8ikrJzrJOn1FgKYmA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: robh@kernel.org, will@kernel.org, catalin.marinas@arm.com, corbet@lwn.net, james.morse@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 20 Sep 2023 17:47:35 +0100,
Rob Herring <robh@kernel.org> wrote:
>=20
> On Tue, Sep 19, 2023 at 7:50=E2=80=AFAM Marc Zyngier <maz@kernel.org> wro=
te:
> >
> > On Tue, 19 Sep 2023 13:29:07 +0100,
> > Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Mon, Sep 18, 2023 at 5:18=E2=80=AFAM Marc Zyngier <maz@misterjones=
.org> wrote:
> > > >
> > > > On 2023-09-18 11:01, Will Deacon wrote:
> > > > > On Tue, Sep 12, 2023 at 07:11:15AM -0500, Rob Herring wrote:
> > > > >> Implement the workaround for ARM Cortex-A520 erratum 2966298. On=
 an
> > > > >> affected Cortex-A520 core, a speculatively executed unprivileged=
 load
> > > > >> might leak data from a privileged level via a cache side channel.
> > > > >>
> > > > >> The workaround is to execute a TLBI before returning to EL0. A
> > > > >> non-shareable TLBI to any address is sufficient.
> > > > >
> > > > > Can you elaborate at all on how this works, please? A TLBI addres=
sing a
> > > > > cache side channel feels weird (or is "cache" referring to some T=
LB
> > > > > structures rather than e.g. the data cache here?).
> > > > >
> > > > > Assuming there's some vulnerable window between the speculative
> > > > > unprivileged load and the completion of the TLBI, what prevents a=
nother
> > > > > CPU from observing the side-channel during that time? Also, does =
the
> > > > > TLBI need to be using the same ASID as the unprivileged load? If =
so,
> > > > > then
> > > > > a context-switch could widen the vulnerable window quite signific=
antly.
> > > >
> > > > Another 'interesting' case is the KVM world switch. If EL0 is
> > > > affected, what about EL1? Can such a data leak exist cross-EL1,
> > > > or from EL2 to El1? Asking for a friend...
> > >
> > > I'm checking for a definitive answer, but page table isolation also
> > > avoids the issue. Wouldn't these scenarios all be similar to page
> > > table isolation in that the EL2 or prior EL1 context is unmapped?
> >
> > No, EL2 is always mapped, and we don't have anything like KPTI there.
> >
> > Maybe the saving grace is that EL2 and EL2&0 are different translation
> > regimes from EL1&0, but there's nothing in the commit message that
> > indicates it. As for EL1-to-EL1 leaks, it again completely depends on
> > how the TLBs are tagged.
>=20
> Different translation regimes are not affected. It must be the same
> regime and same translation.

It would be good to capture this, then.

>=20
> > You'd hope that having different VMIDs would save the bacon, but if
> > you can leak EL1 translations into EL0, it means that the associated
> > permission and/or tags do not contain all the required information...
>=20
> The VMID is part of the equation. See here[1].

I have a pretty good idea of how TLB are *supposed* to behave. The
fact that you need some sort of invalidation on ERET to EL0 is the
proof that this CPU doesn't follow these rules to the letter...

	M.

--=20
Without deviation from the norm, progress is not possible.
