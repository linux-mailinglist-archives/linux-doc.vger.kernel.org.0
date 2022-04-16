Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96568503556
	for <lists+linux-doc@lfdr.de>; Sat, 16 Apr 2022 10:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbiDPIuL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 16 Apr 2022 04:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbiDPIuK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Apr 2022 04:50:10 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16A0D9E8B
        for <linux-doc@vger.kernel.org>; Sat, 16 Apr 2022 01:47:38 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6FCD72CC;
        Sat, 16 Apr 2022 08:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6FCD72CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1650098858; bh=xkYq9WwKRCBcAs6y9G+PznCtruesO57X/LaoL49mcKE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=khIRkj45izfuMTTzB5W5c77cu7/KDtejf0HVI367OJ4xJysz7T6ZFhWKJPHNrh9ZT
         TMLpE5BHWV1UXqn7Eru3KJREqqwzuBDTVd+H3YyFnisi5XxwglaBmCKZs6cJDNhYXt
         aenZs2rNoh92igmP/hCw861X/76/vOXNVUxXFZprTbXtcymU5JPq8VQ11w+9c+xBAO
         hIdic1VEA8/HPbrv+gMt/ZayqWRexlHEypyFCwfwNZvyg0EwVURn6f0zMciwyXG3yZ
         AQ7d+pO2rdeJZqdaUv1hnFug//QVteZbtI2cljggiAYUgLn/M5wFuvI6k1vm4roZzy
         Gi34FnaMw4gaQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Akinobu Mita <akinobu.mita@gmail.com>,
        Dylan Yudaken <dylany@fb.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs: fault-injection: fix defaults
In-Reply-To: <CAC5umyiBGqkO=G4diJwSMLxv_xFiO+dSkLjb9kLwBSoavB9F2A@mail.gmail.com>
References: <20220405095414.816060-1-dylany@fb.com>
 <CAC5umyiBGqkO=G4diJwSMLxv_xFiO+dSkLjb9kLwBSoavB9F2A@mail.gmail.com>
Date:   Sat, 16 Apr 2022 02:47:34 -0600
Message-ID: <87zgkl2z4p.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Akinobu Mita <akinobu.mita@gmail.com> writes:

> 2022=E5=B9=B44=E6=9C=885=E6=97=A5(=E7=81=AB) 18:54 Dylan Yudaken <dylany@=
fb.com>:
>>
>> ignore-gfp-wait and ignore-gfp-highmem defaults are actually true (Y) in
>> both failslab and fail_page_alloc, not false as the docs suggest. See
>> page_alloc.c:3762 and failslab.c:13
>>
>> At the same time use 'Y' instead of '1' in the example scripts just for
>> consistency. (though 1 would work)
>>
>> Signed-off-by: Dylan Yudaken <dylany@fb.com>
>
> Looks good.
>
> Reviewed-by: Akinobu Mita <akinobu.mita@gmail.com>

Applied, thanks.

I'm thinking, now that I look, that this documentation really belongs in
the dev-tools book; any objections to moving it?

jon
