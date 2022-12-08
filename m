Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA339646810
	for <lists+linux-doc@lfdr.de>; Thu,  8 Dec 2022 05:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbiLHECM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 7 Dec 2022 23:02:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiLHECK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Dec 2022 23:02:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB22C2B24F;
        Wed,  7 Dec 2022 20:02:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C5AB4B8212D;
        Thu,  8 Dec 2022 04:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AF9C433C1;
        Thu,  8 Dec 2022 04:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670472126;
        bh=hlgc5yYVsjGb4WHGVBYTyyDJ6trEXn8gG/+0cePmN3E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hF/93tlxEfKtR4zZDJaMAvIUlhTkgDxlaJUDYcHYJBpIJDWKmgvRM6SIqx/PM4N+N
         0IzXMR4CtHpJUuKOOibNCCBlVmW4FOYSCvFMni27zhJikJUA+LfGyLu7oQfN9HJ7Oo
         UWeqzearrQ83DISLinyGjcS1rju08cUrZPG4couZtKQ3v0QIRfkZHoj8QDN7EiImnk
         rFq7bWaz5yi6S8TMcMF2rGjAukxn59JvoCgnX7W1ozuMp5BuAoJc0sysi18XKvjSBJ
         fD/rOEW1vosjJqJXUdMTleLQkUooTGDcSzHoyZkiHfpHNn5F5An+CzZIU6YiiCOS1M
         gWWKPARKf2NWw==
Date:   Wed, 7 Dec 2022 20:02:04 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Veerasenareddy Burru <vburru@marvell.com>
Cc:     Leon Romanovsky <leon@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Liron Himi <lironh@marvell.com>,
        Abhijit Ayarekar <aayarekar@marvell.com>,
        Sathesh B Edara <sedara@marvell.com>,
        Satananda Burla <sburla@marvell.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH net-next v2 2/9] octeon_ep: poll for control
 messages
Message-ID: <20221207200204.6819575a@kernel.org>
In-Reply-To: <BYAPR18MB24234AE72EF29F506E0B7480CC1D9@BYAPR18MB2423.namprd18.prod.outlook.com>
References: <20221129130933.25231-1-vburru@marvell.com>
        <20221129130933.25231-3-vburru@marvell.com>
        <Y4cirWdJipOxmNaT@unreal>
        <BYAPR18MB242397C352B0086140106A46CC159@BYAPR18MB2423.namprd18.prod.outlook.com>
        <Y4hhpFVsENaM45Ho@unreal>
        <BYAPR18MB2423229A66D1C98C6C744EE1CC189@BYAPR18MB2423.namprd18.prod.outlook.com>
        <Y42nerLmNeAIn5w9@unreal>
        <20221205161626.088e383f@kernel.org>
        <Y48ERxYICkG9lQc1@unreal>
        <20221206092352.7a86a744@kernel.org>
        <BYAPR18MB24234E1E6566B47FCA609BF8CC1B9@BYAPR18MB2423.namprd18.prod.outlook.com>
        <20221206172652.34ed158a@kernel.org>
        <BYAPR18MB24234AE72EF29F506E0B7480CC1D9@BYAPR18MB2423.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 8 Dec 2022 03:17:33 +0000 Veerasenareddy Burru wrote:
> We have a follow up patch after this series implementing
> ndo_get_vf_xxx() and ndo_set_vf_xxx().

We don't accept new drivers which use those interfaces.
