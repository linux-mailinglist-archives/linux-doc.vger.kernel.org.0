Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55DDA5AB7AB
	for <lists+linux-doc@lfdr.de>; Fri,  2 Sep 2022 19:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236668AbiIBRl0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 2 Sep 2022 13:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237080AbiIBRlZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Sep 2022 13:41:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36A2DF4CD;
        Fri,  2 Sep 2022 10:41:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4E70362211;
        Fri,  2 Sep 2022 17:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA429C433D6;
        Fri,  2 Sep 2022 17:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662140482;
        bh=Fhpz1/e1H4HMa8Jtwgh0t8VzDicCBOWzSpuCa2Lmwbo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gFBRhA2BOL7MvGuouJRoyb3fUbvKNAtmooGPN+NY6lYQwKCWYUiVKqhmMGr1JJ7BC
         KqMafQu/Vw8/9bCWvPOnB9H1oN/sJflozPajNK7ujhSWPHfyp8CwbZ8QisTz/3qJGT
         tL6tdsfQZhbV0pEF05vlIQi8kFS93RdBj+GFQDTS9Q3hQgN4RocJelo1+EIuXH0wpj
         6dKpnCSnz8P+osDbw3jxnHdFHLjnYLcWLDIdIaMXa7yjhOhP+QGev9O6YZVMi0VSHy
         3MivnCmDTGiqZh2ZazTkJseGCB8J1Hqi4qpKpWr5PWZtqki0NGeaTXYsiBUnd7fPDE
         YYguD0oecoW9Q==
Date:   Fri, 2 Sep 2022 23:11:17 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, Li Yang <leoyang.li@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 0/8] phy: Add support for Lynx 10G SerDes
Message-ID: <YxJAPbfBpUpHeiqX@matsya>
References: <20220804220602.477589-1-sean.anderson@seco.com>
 <6d312336-4bfc-a8d4-783c-116a21284edf@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d312336-4bfc-a8d4-783c-116a21284edf@seco.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30-08-22, 17:44, Sean Anderson wrote:

> 
> ping?
> 
> Vinod/Kishon: any comments on the driver itself?

Not sure why this is not in my queue or pw, can you please rebase and
resend

Thanks

-- 
~Vinod
