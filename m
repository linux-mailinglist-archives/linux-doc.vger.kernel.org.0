Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 628CE6BEAAF
	for <lists+linux-doc@lfdr.de>; Fri, 17 Mar 2023 15:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbjCQOFI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 17 Mar 2023 10:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjCQOFH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Mar 2023 10:05:07 -0400
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com [64.147.123.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2DF5F96B;
        Fri, 17 Mar 2023 07:05:04 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailnew.west.internal (Postfix) with ESMTP id 00A052B06280;
        Fri, 17 Mar 2023 10:05:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 17 Mar 2023 10:05:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1679061901; x=1679069101; bh=xzu8SPPxcjWpdn/tXzgXEXIZ4nx2l8jL4Ah
        btNthvR4=; b=NFpM+PZoh9wA6eIbbY9536usdkrVLzkJGpQ+rLLRJx12/3taqCL
        C5I++q7hqyU4wDSJRWl9/hHfafPZ53hjCKd9nV1hkiOjIPynmlA0AIZSlnXXwROE
        12MJovXg8omPEpjcFwJ/WvwSazv9H8pJ5uKU75DLB8qYzCzJCDNUDJBk/Kd60oDT
        Y4WMIgFQ59z0Sl0RJa5u5MYpovCV3EIHTRoyUTMAmx1N+nc/dzWYd77dPEln9eJc
        1GI7GmzIunjKJ2SuX5s1BgD4bUnSVDfyyZez9htH582fFJPprT0+9VXTmQmZWn89
        gApCy7s5j6uRweQVlJiwCa56jt1/Wu1nIOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1679061901; x=1679069101; bh=xzu8SPPxcjWpdn/tXzgXEXIZ4nx2l8jL4Ah
        btNthvR4=; b=tZrkfiB1xKrF7qS0dUbLZ8eHYdKo/35HXW+OO8rAUudnCOPYeLJ
        XRsFwFRQAN10Cf3E+XsJ0o2xHUFdzS1m+FOSgp4eOOjmBaezvsKw2wuIpKpGjCMJ
        +UyX4Brhx4VYownMsOAGltrjh3Ca0j2+VFkl1k6NSlD3818P/zMocOHQsSDt5aXe
        JqFEIdy3Rd4g6ASr+VV7zwdpBeSG+ix7dkTFCOGTOaNW/BLNJJhIT9k5NJR63sj1
        eInr2iRRJ7kABpZnefjec6MkDGI+pLKNsGoiPTzH+UWovzOiZ8Kbjp2oimmkzlmu
        rjrrwLn+5rY+wlA5xrKmQSHIVhSAW2yf4dw==
X-ME-Sender: <xms:hnMUZHfzckxb7aRm-zF4kFikvuiDjFape0cyILyZavp9_VWB_Fgw6w>
    <xme:hnMUZNOvWL-OYlrpur-cHE34k7q8cxRKiPCyAWx8DgVoczgfbifmGMRQdqh9PhYyH
    83ulw90FPpCOpcTSZM>
X-ME-Received: <xmr:hnMUZAjHni68kD6__MjHeVzyHLbV4AqypYfq1nLKeY6-1i8mlqJZyC1D3u4xPHPweG4dNl2QpMbO7K6NPy-ux8TsTzfwWMM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefvddgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnheptdekvddtgeefheevfeekffegieffudejgfdtgfeludetkeejjeetfeel
    jefffffgnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghr
    nhhordhtvggthh
X-ME-Proxy: <xmx:h3MUZI9arzDspWDBC782dyfG8uPRsdWqsjgozsU0-M52H--42EDxsg>
    <xmx:h3MUZDvNHQBFN47gWryh2nRdpLvYPe6h8YpSllH7_U5c68T0KtRYCA>
    <xmx:h3MUZHEAXrAc4tB9ZXbBA1kirUI2MJjajeXFOVB4PwyC3Mks-f9HFA>
    <xmx:jXMUZE4-ZrbtL2k8J2GyTjQN6XEY4v_BdcNkDQBka5orfhN9uubTqluK0sw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Mar 2023 10:04:53 -0400 (EDT)
Date:   Fri, 17 Mar 2023 15:04:51 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        dafna@fastmail.com, ogabbay@kernel.org, airlied@gmail.com,
        daniel@ffwll.ch, stanislaw.gruszka@linux.intel.com,
        dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com,
        quic_carlv@quicinc.com
Subject: Re: [PATCH v3 8/8] MAINTAINERS: Add entry for QAIC driver
Message-ID: <20230317140451.uywz7szrzvusyrjy@houat>
References: <1678138443-2760-1-git-send-email-quic_jhugo@quicinc.com>
 <1678138443-2760-9-git-send-email-quic_jhugo@quicinc.com>
 <5e912413-eee4-5b25-5f6d-00ccc7501b9d@linux.intel.com>
 <daa3100e-8f5b-8dbb-297f-ca3a87b44a97@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <daa3100e-8f5b-8dbb-297f-ca3a87b44a97@quicinc.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 16, 2023 at 11:04:05AM -0600, Jeffrey Hugo wrote:
> On 3/14/2023 3:59 AM, Jacek Lawrynowicz wrote:
> > Hi
> >=20
> > On 06.03.2023 22:34, Jeffrey Hugo wrote:
> > > Add MAINTAINERS entry for the Qualcomm Cloud AI 100 driver.
> > >=20
> > > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > > Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> > > Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> > > ---
> > >   MAINTAINERS | 9 +++++++++
> > >   1 file changed, 9 insertions(+)
> > >=20
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index b0db911..feb2974 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -17253,6 +17253,15 @@ F:	Documentation/devicetree/bindings/clock/q=
com,*
> > >   F:	drivers/clk/qcom/
> > >   F:	include/dt-bindings/clock/qcom,*
> > > +QUALCOMM CLOUD AI (QAIC) DRIVER
> > > +M:	Jeffrey Hugo <quic_jhugo@quicinc.com>
> > > +L:	linux-arm-msm@vger.kernel.org
> > > +L:	dri-devel@lists.freedesktop.org
> > > +S:	Supported
> > > +F:	Documentation/accel/qaic/
> > > +F:	drivers/accel/qaic/
> > > +F:	include/uapi/drm/qaic_accel.h
> >=20
> > Aren't you missing repo link?
> > T:	git git://anongit.freedesktop.org/drm/drm-misc
>=20
> Maarten/Maxime/Thomas are we ok to follow the iVPU example and use drm-mi=
sc
> for this, or would a separate tree be preferred?

Yeah, please go ahead with drm-misc

Do you have commit rights?

Maxime
