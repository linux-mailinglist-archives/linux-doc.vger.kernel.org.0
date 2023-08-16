Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0AA77E531
	for <lists+linux-doc@lfdr.de>; Wed, 16 Aug 2023 17:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344168AbjHPPb0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 16 Aug 2023 11:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344207AbjHPPbM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Aug 2023 11:31:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F124F26AD
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 08:31:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 84D9D62B07
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 15:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7701AC433C7;
        Wed, 16 Aug 2023 15:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692199868;
        bh=xSUdEwDHmtt6X2IeU+QIEDoT7uyMmmI80HF6ze8EQKk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZMYCQG+ni+RC1vpjMoMFXh7IUed5fLKVgyDqYiPCQTVV76sKQMmruYx23xlJGkEY6
         LHJgntXcJJRYk3njWJ1shjlHL448A24d/3fKfAaLGUtTXlbqvH4BXhUCXM/yrWkMG2
         IjioPxXWb7QRxi5ppr2gkPqmETwYXYucKZP+v1wZ/ualx3EdMjC+Sts1QGpADuR2BH
         usLtv9alydt4EpLGY93haQYpDBCk/phbdiD6W1jo6gJGDRMY1fPFyRkRyxeLVIHI0c
         e9XXa0dmw7UZWlFx76aiko38GRMgMZW4U4ptU0c6rRGxsZXsIBJsmeo4qRf6jiYouq
         tjNA/NkwFYa9A==
Date:   Wed, 16 Aug 2023 08:31:07 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Donald Hunter <donald.hunter@gmail.com>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        donald.hunter@redhat.com
Subject: Re: [PATCH net-next v2 07/10] tools/net/ynl: Implement nlattr
 array-nest decoding in ynl
Message-ID: <20230816083107.488282c9@kernel.org>
In-Reply-To: <20230815194254.89570-8-donald.hunter@gmail.com>
References: <20230815194254.89570-1-donald.hunter@gmail.com>
        <20230815194254.89570-8-donald.hunter@gmail.com>
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

On Tue, 15 Aug 2023 20:42:51 +0100 Donald Hunter wrote:
> Add support for the 'array-nest' attribute type that is used by several
> netlink-raw families.
> 
> Signed-off-by: Donald Hunter <donald.hunter@gmail.com>

Reviewed-by: Jakub Kicinski <kuba@kernel.org>
