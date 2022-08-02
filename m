Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8725880DA
	for <lists+linux-doc@lfdr.de>; Tue,  2 Aug 2022 19:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbiHBRQU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 2 Aug 2022 13:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbiHBRQT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Aug 2022 13:16:19 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35F641C931
        for <linux-doc@vger.kernel.org>; Tue,  2 Aug 2022 10:16:18 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id f14so11144028qkm.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Aug 2022 10:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=e6NijbvqJl8I0P3m6XHrZ81f2mOc7XtHT6+K/U+OWxY=;
        b=DsXX8JrT5LsPXdsw++Wlq0MCRC1wxpg01IFPY/k1QbzXqA/zirsGJH9qqfYIXPQL4G
         10+koW0tw14F0n15lu2K/eA7v7I0F2k2wGhSCYlIw0eX1EuE9zPn7XJS7e3TvicvP8Gf
         ThcV7QAalbemYLI74l6jesYmSS0Rl/fH5O8F0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=e6NijbvqJl8I0P3m6XHrZ81f2mOc7XtHT6+K/U+OWxY=;
        b=gZnqOxyqlesb7aRBpinuQq+hnY8+VflivL96N0ldQ31KNWImBRojZXPuxjMricuVfe
         PhPJqMI5ph2jrD0/P7AJOGy2EmPG9xbvEJQfJm3zNsWQlkvGgHN9GBehXS3EcaReU/Qp
         XkuNEhDNfgoUdJp5vdUVAK9M5MU0Sz6rAf2zKvEVoXgVV+Vy65eaF7A/MSjhOwwjJkSh
         5atCgpRPdRr8Xi8+rEQh6diHNZ4gowLDmZTkD0Wvj6s3KqIxK8mmoGdhe9poFejIZw5W
         ReQOoL5RtkhJ9HSKtMZGREKQ/hQLA6k4IHQsrGFQEY1/Z5RqNf10/2C4xsoRinOx6obS
         Yogg==
X-Gm-Message-State: AJIora/x/36fraBm1eT9Rw2wjUDDme9cPv1ymbsfyReO4y9Ir3DH8fDB
        wZ17LDZ+dLViHi6Kg4C/PHeZqw==
X-Google-Smtp-Source: AGRyM1u2DDPa/mdWTCYghTu8DIlK0fMUycCBiC23JG7/2DlXnPD82mYXL5SI0mdchretdUvgeoAn1w==
X-Received: by 2002:a05:620a:1926:b0:6b8:3f1f:fcd9 with SMTP id bj38-20020a05620a192600b006b83f1ffcd9mr15658943qkb.443.1659460577286;
        Tue, 02 Aug 2022 10:16:17 -0700 (PDT)
Received: from nitro.local (host-142-67-156-76.public.eastlink.ca. [142.67.156.76])
        by smtp.gmail.com with ESMTPSA id t22-20020ac87396000000b0031ec44aa37bsm9035499qtp.93.2022.08.02.10.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 10:16:16 -0700 (PDT)
Date:   Tue, 2 Aug 2022 13:16:14 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 3/5] maintainer-pgp-guide: update ECC support
 information
Message-ID: <20220802171614.qrcs7aowhqtd7egj@nitro.local>
References: <20220727-docs-pgp-guide-v1-0-c48fb06cb9af@linuxfoundation.org>
 <20220727-docs-pgp-guide-v1-3-c48fb06cb9af@linuxfoundation.org>
 <YuOkPtg+Wa7KldPm@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YuOkPtg+Wa7KldPm@debian.me>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 29, 2022 at 04:11:26PM +0700, Bagas Sanjaya wrote:
> > -    If for some reason you prefer to stay with RSA subkeys, just replace
> > -    "ed25519" with "rsa2048" in the above command. Additionally, if you
> > -    plan to use a hardware device that does not support ED25519 ECC
> > -    keys, like Nitrokey Pro or a Yubikey, then you should use
> > -    "nistp256" instead or "ed25519."
> > +    Note, that if you plan to use a hardware device that does not
> > +    support ED25519 ECC keys, you should choose "nistp256" instead or
> > +    "ed25519."
> >  
> 
> nistp256 isn't just ECC key algo other than ed25519. In fact, it is a
> part of NIST curve family (the others are nistp384 and nistp521).
> 
> Maybe we can just say "If unsure, or if your hardware device does not
> support ED25519, use one of NIST curves (nistp256, nistp384, or nistp521)
> instead".

Hm... ED25519 is the default for GnuPG 2.3+, so I'm not sure it makes sense to
go into this level of detail here. Folks who are likely to need to use NIST
curves will probably already know this information without needing to list it
in this guide. As far as I can recall, TPMs and older Nitrokey Pros are some
of the few remaining devices that can't do ed25519, so the number of people
who would need to use NIST curves will likely be super small.

-K
