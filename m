Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE17A6AD5F3
	for <lists+linux-doc@lfdr.de>; Tue,  7 Mar 2023 05:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjCGEIf (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 6 Mar 2023 23:08:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjCGEIe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Mar 2023 23:08:34 -0500
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C87E22821E;
        Mon,  6 Mar 2023 20:08:31 -0800 (PST)
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
        LIVER,40,3)
Received: from 192.168.10.46
        by mg.richtek.com with MailGates ESMTP Server V5.0(22240:0:AUTH_RELAY)
        (envelope-from <cy_huang@richtek.com>); Tue, 07 Mar 2023 12:08:05 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Tue, 7 Mar
 2023 12:08:04 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Tue, 7 Mar 2023 12:08:04 +0800
Date:   Tue, 7 Mar 2023 12:08:04 +0800
From:   ChiYuan Huang <cy_huang@richtek.com>
To:     Lee Jones <lee@kernel.org>
CC:     ChiaEn Wu <chiaen_wu@richtek.com>, <corbet@lwn.net>,
        <pavel@ucw.cz>, <matthias.bgg@gmail.com>,
        <andriy.shevchenko@linux.intel.com>, <jacek.anaszewski@gmail.com>,
        <angelogioacchino.delregno@collabora.com>,
        <linux-doc@vger.kernel.org>, <peterwu.pub@gmail.com>,
        <linux-leds@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <szunichen@gmail.com>
Subject: Re: [PATCH v17 RESEND 3/3] docs: leds: Add MT6370 RGB LED pattern
 document
Message-ID: <20230307040804.GA15766@linuxcarl2.richtek.com>
References: <cover.1677150607.git.chiaen_wu@richtek.com>
 <c6487954daff5e514023056ad7de1d0ddee674a8.1677150607.git.chiaen_wu@richtek.com>
 <20230305101824.GE2574592@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230305101824.GE2574592@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, Lee:

    Some question about the comment.
On Sun, Mar 05, 2023 at 10:18:24AM +0000, Lee Jones wrote:
> On Thu, 23 Feb 2023, ChiaEn Wu wrote:
> 
> > From: ChiYuan Huang <cy_huang@richtek.com>
> > 
> > Document the MT6370 RGB LED pattern trigger.
> > 
> > This simply describe how the pattern works, each timing period, and the
> > pattern diagram for MT6370 RGB LED.
> > 
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > ---
> >  Documentation/leds/leds-mt6370-rgb.rst | 64 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> >  create mode 100644 Documentation/leds/leds-mt6370-rgb.rst
> > 
> > diff --git a/Documentation/leds/leds-mt6370-rgb.rst b/Documentation/leds/leds-mt6370-rgb.rst
> > new file mode 100644
> > index 00000000..d1b2e4f
> > --- /dev/null
> > +++ b/Documentation/leds/leds-mt6370-rgb.rst
> > @@ -0,0 +1,64 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +=========================================
> > +Kernel driver for Mediatek MT6370 RGB LED
> 
> Are you describing the device or the kernel driver?
> 
But referring to others, it seems each one also write this as 'Kernel driver'.
Sorry, I cannot catch the point. Did you mean to modify this description as
'The device for MT6370 RGB LED'?
> > +=========================================
> > +
> > +Description
> > +-----------
> > +
> > +The MT6370 integrates a four-channel RGB LED driver, designed to provide a
> > +variety of lighting effect for mobile device applications. The RGB LED driver
> 
> "devices"
> 
> > +includes a smart LED string controller and it can drive 3 channels of LEDs with
> > +a sink current up to 24mA and a CHG_VIN power good indicator LED with sink
> > +current up to 6mA. It provides three operation modes for RGB LEDs:
> > +PWM Dimming mode, breath pattern mode, and constant current mode. The device
> > +can increase or decrease the brightness of the RGB LED via I2C interface.
> 
> "an I2C interface"
> 
> > +The breath pattern for a channel can be programmed using the "pattern" trigger,
> > +using the hw_pattern attribute.
> > +
> > +/sys/class/leds/<led>/hw_pattern
> > +--------------------------------
> > +
> > +Specify a hardware breath pattern for a MT6370 RGB LED.
> > +
> > +The breath pattern is a series of timing pairs, with the hold-time expressed in
> > +milliseconds. And the brightness is controlled by
> > +'/sys/class/leds/<led>/brightness'. The pattern doesn't include the brightness
> > +setting. Hardware pattern only controls the timing for each pattern stage
> > +depending on the current brightness setting.
> > +
> > +Pattern diagram::
> > +
> > +     "0 Tr1 0 Tr2 0 Tf1 0 Tf2 0 Ton 0 Toff" --> '0' for dummy brightness code
> > +
> > +      ^
> > +      |           ============
> > +      |          /            \                                /
> > +Icurr |         /              \                              /
> > +      |        /                \                            /
> > +      |       /                  \                          /   .....repeat
> > +      |      /                    \                        /
> > +      |   ---                      ---                  ---
> > +      |---                            ---            ---
> > +      +----------------------------------============------------> Time
> > +       < Tr1><Tr2><   Ton    ><Tf1><Tf2 ><  Toff    >< Tr1><Tr2>
> > +
> > +Timing description::
> > +
> > +Tr1:    First rising time for duty 0 to 30%.
> > +Tr2:    Second rising time for duty 31% to 100%.
> > +Ton:    On time for duty 100%.
> > +Tf1:    First falling time for duty 100% to 31%.
> > +Tf2:    Second falling time for duty 30% to 0%.
> > +Toff:   Off time for duty 0%.
> > +
> > +Tr1/Tr2/Tf1/Tf2/Ton: 125ms to 3125ms, 200ms per step.
> > +Toff: 250ms to 6250ms, 400ms per step.
> > +
> > +Pattern example::
> > +
> > +       "0 125 0 125 0 125 0 125 0 625 0 1050"
> > +
> > +This Will configure Tr1/Tr2/Tf1/Tf2 to 125m, Ton to 625ms, and Toff to 1050ms.
> > -- 
> > 2.7.4
> > 
> 
> -- 
> Lee Jones [李琼斯]
