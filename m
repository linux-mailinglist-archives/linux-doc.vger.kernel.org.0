Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0E955A38E3
	for <lists+linux-doc@lfdr.de>; Sat, 27 Aug 2022 18:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233712AbiH0Qvt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 27 Aug 2022 12:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbiH0Qvs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 27 Aug 2022 12:51:48 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C062952E7A;
        Sat, 27 Aug 2022 09:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=/jjJwMIKq+LkKLsQ3h3uBoD2NrQzjkqoycsjMRPfpkY=; b=ftnHIn1BMISOUlm3ZGPblgRYuN
        jfFUUeFilOhnIKjVGA/b0ZNyuyfWwgBdnebgTvFHG2K/LSMwKzUfWtJcag1VDNRSoZkW2Vt88MWpY
        A0rXrzWbhQC4Y9fBImdSpEdqAJZ5IPYlbagzIqTzQGB2F3xDjQzA8MSSY3OYA40x9ZwY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1oRz1y-00En20-QT; Sat, 27 Aug 2022 18:51:34 +0200
Date:   Sat, 27 Aug 2022 18:51:34 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        kernel test robot <lkp@intel.com>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        David Jander <david@protonic.nl>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Robert Marko <robert.marko@sartura.hr>
Subject: Re: [PATCH net-next v3 6/7] ethtool: add interface to interact with
 Ethernet Power Equipment
Message-ID: <YwpLlr3nr0rM/JPY@lunn.ch>
References: <20220827051033.3903585-1-o.rempel@pengutronix.de>
 <20220827051033.3903585-7-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220827051033.3903585-7-o.rempel@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> +Kernel response contents:
> +
> +  ======================================  ======  =============================
> +  ``ETHTOOL_A_PSE_HEADER``                nested  reply header
> +  ``ETHTOOL_A_PODL_PSE_ADMIN_STATE``          u8  Operational state of the PoDL
> +                                                  PSE functions
> +  ``ETHTOOL_A_PODL_PSE_PW_D_STATUS``          u8  power detection status of the
> +                                                  PoDL PSE.
> +  ======================================  ======  =============================

It would be good to document that everything but ETHTOOL_A_PSE_HEADER
is optional.

     Andrew
