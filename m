Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25BDC7864D1
	for <lists+linux-doc@lfdr.de>; Thu, 24 Aug 2023 03:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239142AbjHXBq0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 23 Aug 2023 21:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239185AbjHXBqL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Aug 2023 21:46:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CFCE10E4
        for <linux-doc@vger.kernel.org>; Wed, 23 Aug 2023 18:46:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A224963500
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 01:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE29C4166B;
        Thu, 24 Aug 2023 01:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692841565;
        bh=QcxBPDj3EFvkzsVgWGRcZsaxw4CEy1HbhIOucoZS2DU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZdsbvsRE9H5Au13iYTDqjDHjU3D1UlP4Z7bZf3G3qq/aN2ZYvNmdz1YY+bl07S4wf
         2/7KVsrLpG+eFEnJaXsAJsqEeqnn3X5smrbv50k/IEXuegTHIvg+SKIWnBP+y9PXLO
         sSp2mhui1rL8GhoE/hMSj/A/oa9yzZAuiP9QTyfoE0P5S/iyyBlXo7Y2eC9B0ayfHC
         8dYZj/iEvknYYkGGWMJCeHjNdJwJX0E3ppE1l7F0Dyg4VZ0EsoxdLl44IqaE8U8iW0
         9Air/KVqcPf/uWoZfOkbLXI9FTZ1ItQSO2pKGKSRRsnqTKaRjl/bEOggwjwmiKygEr
         BspCqy2Opgf9g==
Date:   Wed, 23 Aug 2023 18:46:03 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Donald Hunter <donald.hunter@gmail.com>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        donald.hunter@redhat.com
Subject: Re: [PATCH net-next v4 07/12] tools/net/ynl: Add support for
 netlink-raw families
Message-ID: <20230823184603.7fda3b66@kernel.org>
In-Reply-To: <20230823114202.5862-8-donald.hunter@gmail.com>
References: <20230823114202.5862-1-donald.hunter@gmail.com>
        <20230823114202.5862-8-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 23 Aug 2023 12:41:56 +0100 Donald Hunter wrote:
> +    def get_mcast_id(self, mcast_name, mcast_groups):
> +        if mcast_name not in mcast_groups:
> +            raise Exception(f'Multicast group "{mcast_name}" not present in the spec')
> +        return mcast_groups[mcast_name].value
> +

if you repost - missing extra empty line here

> +class GenlProtocol(NetlinkProtocol):
> +    def __init__(self, family_name):
