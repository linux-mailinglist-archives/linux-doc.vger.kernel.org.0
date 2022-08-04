Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A11A0589FA3
	for <lists+linux-doc@lfdr.de>; Thu,  4 Aug 2022 19:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236855AbiHDRAv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 4 Aug 2022 13:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236435AbiHDRAu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Aug 2022 13:00:50 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8222E18368
        for <linux-doc@vger.kernel.org>; Thu,  4 Aug 2022 10:00:49 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id r6so208508ilc.12
        for <linux-doc@vger.kernel.org>; Thu, 04 Aug 2022 10:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jvy0fCnX0DRedowwEftFJKnnw/dV8L4EkJyROfdefMM=;
        b=GCTol8bkoW2jnNBEBEbU17E9LI7Zjetsc/ppZMZtrGBGw2aWXlecu9Tw0lyWxaGD04
         87I3E82B5rr/x02CG0rx+uQ3PicNK8+h6XcWxPi5lFSYwbEFcPzQOzehJueFrZzWzjim
         Hf4Jkf3vAet3gKbJhP/OQdL9VBqM5HUG/VtiWZwEKUYPP93c0TPco3l7lHkyE2j2dtRt
         D/dAGCFcWqec82s/preuBbTZKQOOnwMUmBOHdUNFr4EAQleq+6EpX2OS3M7Iej4ZqzH4
         njsIrBmL7lG+Ww4qhYy6vNS2ZDbAR/yEYyJ8rdQm+HMCFHVGvc8LX+j93rUQqGSNsP3i
         j7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jvy0fCnX0DRedowwEftFJKnnw/dV8L4EkJyROfdefMM=;
        b=yJxWHOKi/g9R5PhC4Yk1KlMTipDsj8nSCH8fGM2vEruCQtogiO5eFGZt/iaxjWIcj6
         c3xvyaJHnXq7TMyQyoY/n8jlJdFXoql+S5ihJvs5+Fcq2InA3euXctWoCB3xUSWG4Xt9
         tyi5zt/hUbDjaDL9/XQzMgXWEiM9uoHjDJBvDWoMsG+5RTDjpH4qn2zCIf6VfGTxaePD
         +SnGQEuPVVcJA/OcVXu5vCpi1KjGv1vBoupxovgR8VGVqkK8cj1BW3ipqvw5sXEoHF27
         dEhl6wBwe+kKjYuG4x65KkLaI0dPuXiP56o2UAVO5cwDYq1aaJcghNmmswr+Zc9JjEUb
         5W7g==
X-Gm-Message-State: ACgBeo3Ow+jFWQtOEfOmE47dcvS5aPb7WA42O1OsmOfcQIwFwQJp28Wm
        Ne5XK2XBGPriK7M1FNyxgLz4rnq1XWQgnVTQSK90Ow==
X-Google-Smtp-Source: AA6agR4ADzJb9ifBaDrvf/UhliByQtDrhmc5TslfY0Uoqa2icqeRHQJLATQItp+HvQydnqKD0Njj/xHL+hdjXZbVXIQ=
X-Received: by 2002:a05:6e02:1a63:b0:2df:3655:a661 with SMTP id
 w3-20020a056e021a6300b002df3655a661mr1306855ilv.187.1659632448585; Thu, 04
 Aug 2022 10:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <adel.abushaev@gmail.com> <20220803164045.3585187-1-adel.abushaev@gmail.com>
 <20220803164045.3585187-2-adel.abushaev@gmail.com> <Yuq9PMIfmX0UsYtL@lunn.ch>
 <4a757ba1-7b8e-6012-458e-217056eaee63@gmail.com> <Yuvl9uKX8z0dh5YY@lunn.ch> <7c42bf11-8a30-3220-9d52-34b46b68888f@gmail.com>
In-Reply-To: <7c42bf11-8a30-3220-9d52-34b46b68888f@gmail.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Thu, 4 Aug 2022 10:00:37 -0700
Message-ID: <CANn89iJMCrLBbPPEnk2U7ja58AawCrDe01JmBStN9btBPQQgOQ@mail.gmail.com>
Subject: Re: [RFC net-next 1/6] net: Documentation on QUIC kernel Tx crypto.
To:     Adel Abouchaev <adel.abushaev@gmail.com>
Cc:     Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
        David Miller <davem@davemloft.net>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        David Ahern <dsahern@kernel.org>,
        Shuah Khan <shuah@kernel.org>,
        Menglong Dong <imagedong@tencent.com>,
        netdev <netdev@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 4, 2022 at 9:58 AM Adel Abouchaev <adel.abushaev@gmail.com> wrote:
>
> Looking at
> https://github.com/shemminger/iproute2/blob/main/misc/ss.c#L589 the ss.c
> still uses proc/.
>

Only for legacy reasons.

ss -t for sure will use netlink first, then fallback to /proc

New counters should use netlink, please.

> Adel.
>
> On 8/4/22 8:29 AM, Andrew Lunn wrote:
> > On Wed, Aug 03, 2022 at 11:51:59AM -0700, Adel Abouchaev wrote:
> >> Andrew,
> >>
> >>     Could you add more to your comment? The /proc was used similarly to kTLS.
> >> Netlink is better, though, unsure how ULP stats would fit in it.
> > How do tools like ss(1) retrieve the protocol summary statistics? Do
> > they still use /proc, or netlink?
> >
> >       Andrew
