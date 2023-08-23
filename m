Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4D69784E7E
	for <lists+linux-doc@lfdr.de>; Wed, 23 Aug 2023 04:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjHWCDt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 22 Aug 2023 22:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbjHWCDs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Aug 2023 22:03:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C05CF
        for <linux-doc@vger.kernel.org>; Tue, 22 Aug 2023 19:03:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C5F82631D3
        for <linux-doc@vger.kernel.org>; Wed, 23 Aug 2023 02:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3148C433C8;
        Wed, 23 Aug 2023 02:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692756225;
        bh=yFN0cQpMIat5ayx3g1CsZp0uk9eYWA06wwCrpsWjxkY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HA/TtqL3GIQBKA7JOLGo1omaxrH2T1Arg85bX+NFA/N6Td5PfOlpYXOOpLWo2uB4e
         qawm2VOGr6UZMLKYNSZ9M6m96F8WxQDmK22v9CAs2Lb6hwh+Ja++Hu2M4uYmJvLgsH
         mY6ECkznlMjexF/ixxe3uPGfIItushnEIl1CPGhctjCxMGX5IdG09B4aryN5emdszc
         WmKMPw8WjEXwmZNg6zGEMNP1ahF2Dk0XHnOD1GeikGJmZxpgqWsr8wX7XfoiVJLjht
         fO7pOsGjXY++oOyzpv0+I6PhZ60VWEjqgpKs7+iriIHe4aw4n0x/Rpz48Ildu+BB3m
         V32cTGKAE4Psw==
Date:   Tue, 22 Aug 2023 19:03:43 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Donald Hunter <donald.hunter@gmail.com>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        donald.hunter@redhat.com
Subject: Re: [PATCH net-next v3 00/12] tools/net/ynl: Add support for
 netlink-raw families
Message-ID: <20230822190343.3e780afb@kernel.org>
In-Reply-To: <20230822194304.87488-1-donald.hunter@gmail.com>
References: <20230822194304.87488-1-donald.hunter@gmail.com>
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

On Tue, 22 Aug 2023 20:42:52 +0100 Donald Hunter wrote:
> The netlink-raw schema is very similar to genetlink-legacy and I thought
> about making the changes there and symlinking to it. On balance I
> thought that might be problematic for accurate schema validation.
> 
> rtnetlink doesn't seem to fit into unified or directional message
> enumeration models. It seems like an 'explicit' model would be useful,
> to force the schema author to specify the message ids directly.
> 
> There is not yet support for notifications because ynl currently doesn't
> support defining 'event' properties on a 'do' operation. The message ids
> are shared so ops need to be both sync and async. I plan to look at this
> in a future patch.
> 
> The link and route messages contain different nested attributes
> dependent on the type of link or route. Decoding these will need some
> kind of attr-space selection that uses the value of another attribute as
> the selector key. These nested attributes have been left with type
> 'binary' for now.

Looks good, thanks!
