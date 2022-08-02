Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18A795880EC
	for <lists+linux-doc@lfdr.de>; Tue,  2 Aug 2022 19:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbiHBRV0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 2 Aug 2022 13:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbiHBRVZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Aug 2022 13:21:25 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456094599E
        for <linux-doc@vger.kernel.org>; Tue,  2 Aug 2022 10:21:24 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id d1so9648360qvs.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Aug 2022 10:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=tA46KDTeJHR4Zln1p5daEgLhZevj2TS3FGOjau7kOXQ=;
        b=XO1khEbSy72ep3NUPi7b7KYWEG2Ary43Fb6MZB6eDmX7JaW1PB6XwfIfkDLLzGO6qa
         C9nJY/kU1yzbitC3lb/EtVNxB7KDY9zVzU4zR+0dka61jJI7bZm+JK/iAkCtRSHrQWwK
         m2XSzIMac2vkdNU8ebzLTVJA0vXXP5BWZwo7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=tA46KDTeJHR4Zln1p5daEgLhZevj2TS3FGOjau7kOXQ=;
        b=DNL+A4/WHc5R8gheUviNRc59zcyktX/qJtv34h+AC6IaGRMLQcdGP+uDPzZ4bT45Y3
         w1LZ/yqSVRHNUz6ePCt9igGyD0hrlJZTbnRtThEqMyk/FeDJLfHo6FqfQ1HhTXBQ0SH2
         sPxgyV4/PLYlk4ybt6AJ3ATR3pE7n5djbJxx2xXmjUUx3WeikGRVDaSt5hkaaCQmqzN5
         9dJkuNdGp/a1YfUP9/Yk8zogrvCbKNO0vDzdkemEuMWy8fzNi/USXK7PPL7qAqbVXyys
         d7xjjfvKsuWpD1cxMgGxMJVfmLaEFrsgayS9mqZ4bKjBLtH0g5zKNKEmwo2SbK7EwWMt
         HKyg==
X-Gm-Message-State: ACgBeo0d+V06ANVhyVLUrfhRn2QqjjnT0r6emXKg2FuNYDsM9v6rxsjs
        G0MQ/nMcEkLLJ6RyGm0mXZWoWuJgY58/3MQj
X-Google-Smtp-Source: AA6agR4xpe82RYO0CXsU08vFsjQwecf+xOW1tCbyXfCw9F6tZWRxPawBYDmxaqoxBmhIR6zRb6DQGg==
X-Received: by 2002:a05:6214:5196:b0:476:6b95:8dd1 with SMTP id kl22-20020a056214519600b004766b958dd1mr11732529qvb.41.1659460883415;
        Tue, 02 Aug 2022 10:21:23 -0700 (PDT)
Received: from nitro.local (host-142-67-156-76.public.eastlink.ca. [142.67.156.76])
        by smtp.gmail.com with ESMTPSA id t18-20020a05620a451200b006b5e533e954sm11470123qkp.5.2022.08.02.10.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 10:21:23 -0700 (PDT)
Date:   Tue, 2 Aug 2022 13:21:21 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 2/5] maintainer-pgp-guide: remove keyserver
 instructions
Message-ID: <20220802172121.n47vnrtbxsyj4b6d@nitro.local>
References: <20220727-docs-pgp-guide-v1-0-c48fb06cb9af@linuxfoundation.org>
 <20220727-docs-pgp-guide-v1-2-c48fb06cb9af@linuxfoundation.org>
 <78f782da-1af9-a068-3aa5-1d6102f5e8c1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <78f782da-1af9-a068-3aa5-1d6102f5e8c1@gmail.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 29, 2022 at 08:47:02AM +0700, Bagas Sanjaya wrote:
> On 7/29/22 03:57, Konstantin Ryabitsev wrote:
> > Keyservers are largely a thing of the past with the replacement systems
> > like keys.openpgp.net specifically designed to offer no support for the
> > web of trust. Remove all sections that talk about keyservers and add a
> > small section with the link to kernel.org documentation that talks about
> > using the kernel.org public key repository.
> > 
> 
> AFAIK, keyservers are synchronized (federated).

This is only the case for the keyserver network that has to the large degree
gone dark. The few remaining keyservers are either configured to be
non-federating (pgp.mit.edu, afaik), or written without that feature in the
first place (keys.openpgp.org).

> For example, when I submit
> my key to keys.openpgp.net, other keyservers (like keyserver.ubuntu.com
> that I use) also gets a copy of my key.

I would be very much susprised if that's the case (unless the ubuntu keyserver
pulls updates from keys.openpgp.org). Last I looked, hagrid-keyserver did not
support replication/federation.

-K
