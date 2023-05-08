Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2703A6FB013
	for <lists+linux-doc@lfdr.de>; Mon,  8 May 2023 14:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233223AbjEHMdb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 8 May 2023 08:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbjEHMda (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 May 2023 08:33:30 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267AF4C16;
        Mon,  8 May 2023 05:33:29 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3064099f9b6so2758937f8f.1;
        Mon, 08 May 2023 05:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683549207; x=1686141207;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JStEWxv4xCJMqPA1l4lKKePAaSY/BC/a6wyd9/5XLH0=;
        b=WtlAsIw2oCm3vJdZWIiVLOk3TEVdF4Gr5O+rMrs+smXOIirIanY3q8m7Yp6JncoOeL
         Asl+F2YrE2SW/tug1MAZIgYWc8x2BV3hxSLa5zgguRAQavNkXmxDPF4xDBb7AeXiinGL
         VEUqCXbozBTNsFkdMhWyd1ZJQBgVnE1ZgxvvqkogqS611VN11qFqnfupNgPTXLKU0x4e
         ICW3vwXQ5guT7kFkhvJvoThci95C8oBxRVOXkfDE09Ip9XqM6air3oDOy323vF7sldoc
         uVad5mVOoaj1Sdj9f0ehs1GE+n8ZKTXK/6esuVD0ZiTHLjoSVTyCgb1UPOl2Y6op0OPq
         EaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683549207; x=1686141207;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JStEWxv4xCJMqPA1l4lKKePAaSY/BC/a6wyd9/5XLH0=;
        b=HCbdRiKKDknchEnDTTWkpMW7oWf9D8R3SzgU7vvxWMweUsPYAObTQNZ5cnAR/ixSmQ
         CIl24N376Yk5SJWI4ONtCVfDnYPKhVUcjPw6BjPUePQpAydRQVxsy0ISZusEcOt734aH
         xEknLEX2xxh+opvYwo7x6UJSYpGwAHX7HTN3l0yBcvVev02opvonEhYD6sOEeIt4VH62
         wp8jNt6gMQq6l/2+h0vtgSVG7zjV+w3mQlrOfjwEItnCrODn7+jPHS9mxs2pGIXyJgyo
         TZFM9SFvYui+PO7Qon1ZKRBvOEv+Wb8aKBJ7rLqEd33hQVQcDPjCApniw35BVbEVy6QP
         3ppw==
X-Gm-Message-State: AC+VfDwRIFiFt8Ih/uvNnhXcsx/gCJElq7fpzbBj94HLYHd5W4c3ENGR
        Gdy8i9NGu76iYgBueEXikDA=
X-Google-Smtp-Source: ACHHUZ4lqQikYbRH2bLReLhnMxmtiS6uFVwXOZNKXTzP8Mo0ytucp95swqYrDr1g7XHVr6MURMJsXw==
X-Received: by 2002:a5d:4c4f:0:b0:307:93ec:b323 with SMTP id n15-20020a5d4c4f000000b0030793ecb323mr2892825wrt.69.1683549207342;
        Mon, 08 May 2023 05:33:27 -0700 (PDT)
Received: from Ansuel-xps. (93-34-93-173.ip49.fastwebnet.it. [93.34.93.173])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b003f4069417absm13831480wmz.24.2023.05.08.05.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 05:33:26 -0700 (PDT)
Message-ID: <6458ec16.050a0220.21ddf.3955@mx.google.com>
X-Google-Original-Message-ID: <ZFjsFSJSzpxYWhql@Ansuel-xps.>
Date:   Mon, 8 May 2023 14:33:25 +0200
From:   Christian Marangi <ansuelsmth@gmail.com>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Jonathan Corbet <corbet@lwn.net>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 00/11] leds: introduce new LED hw control APIs
References: <20230427001541.18704-1-ansuelsmth@gmail.com>
 <ZFjqKoZtgOAWrkP+@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFjqKoZtgOAWrkP+@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 08, 2023 at 02:25:14PM +0200, Sascha Hauer wrote:
> Hi Christian,
> 
> On Thu, Apr 27, 2023 at 02:15:30AM +0200, Christian Marangi wrote:
> > This is a continue of [1]. It was decided to take a more gradual
> > approach to implement LEDs support for switch and phy starting with
> > basic support and then implementing the hw control part when we have all
> > the prereq done.
> 
> I tried to apply this series to give it a try. To what tree should this
> series be applied upon?
>

Hi,
since this feature affect multiple branch, the prereq of this branch are
still not in linux-next. (the prereq series got accepted but still has
to be merged)

Lee created a branch.

We are waiting for RC stage to request a stable branch so we can
reference ti to correctly test this.

Anyway you should be able to apply this series on top of this branch [1]

Consider that a v2 is almost ready with some crucial changes that should
improve the implementation. (so if you are planning on adding support
for other device I advice to check also v2, just an additional ops to
implement)

[1] https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/log/?h=for-leds-next-next
[2] https://github.com/Ansuel/linux/commits/leds-offload-support-reduced

> > [1] https://lore.kernel.org/lkml/20230216013230.22978-1-ansuelsmth@gmail.com/
> > 
> > Changes from previous v8 series:
> > - Rewrite Documentation from scratch and move to separate commit
> > - Strip additional trigger modes (to propose in a different series)
> > - Strip from qca8k driver additional modes (to implement in the different
> >   series)
> > - Split the netdev chages to smaller piece to permit easier review
> 
> The changelog reads as if it should be applied instead of v8, but this
> series doesn't apply on a vanilla kernel. For example, TRIGGER_NETDEV_TX
> is moved around in this series, but not present in vanilla Linux.
> 

> 
> -- 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

-- 
	Ansuel
