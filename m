Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5655D6E5FCC
	for <lists+linux-doc@lfdr.de>; Tue, 18 Apr 2023 13:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbjDRL0k (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 18 Apr 2023 07:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230477AbjDRL0f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Apr 2023 07:26:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED98A10D3
        for <linux-doc@vger.kernel.org>; Tue, 18 Apr 2023 04:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681817146;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kWyZgCkBrZ1/Axz9/Rwj79MSJtzDJwVgqnG29eqUgKE=;
        b=Te09VoLm2MdD3E7C+IUQWpmyRkO920ckBihqWOzNK05MUmdavU6JvvOzCejqA+EiMkEMcA
        7Vx2bsiTYIc71JxOVqzqE1xVlKKgycjfOswgzE3MtrpgABHQyvUJpVOipbf9fCXiMUDBqw
        SX/ZptBSyMZbyRoTP1J8DKBOsCJCNt4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-H3u_HEF2P2-l91P1EvR0Nw-1; Tue, 18 Apr 2023 07:25:42 -0400
X-MC-Unique: H3u_HEF2P2-l91P1EvR0Nw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f08901fed3so12666435e9.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Apr 2023 04:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681817142; x=1684409142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWyZgCkBrZ1/Axz9/Rwj79MSJtzDJwVgqnG29eqUgKE=;
        b=j+aLCKLtpPL6rjenEUf8gcW+GCOaZo8Fk2RD4hfWlYzLFirgOLvHxfiFOJHSEjM8xb
         V1qmecVXkiiDj5nx14YVc9VWozhxjxMIM0Lcbl/Vjc0oLYzRbHzsoCnwVcl92sEZzqZH
         eMiVUv9P0sStpYO0aMIBlZcsEnE7jkg3TkHbN3GPnz8/o9ojCJa4bGyaVSTR0RJpqijx
         TX2wkWL4JDBjlyAoNt5nx8EqUXX+oj6346UjaEroJgdXMraA5hhFsAZgJFePBLxFbuRR
         4WyOEmCEKpZ9hVlrMLD/imDGToy1gVRBXOOFgrsSkDLOVdhkB4O8g8m5SedZhGYrJ6VE
         j5Vw==
X-Gm-Message-State: AAQBX9cr+QQQqfDcnOJOXUfnVZivDaV80fOG5gCc2KzgVhwsBx17DrcQ
        GUBksKgOUVNMYhrMmDG97XrugbzOkStykfL1wIkhf2p9X+KlN1zDOKHSvXVErRRXB8JDfOQhek6
        qvw/6yWFeO++T6CCrmmYD
X-Received: by 2002:adf:f787:0:b0:2f8:6c01:3bfc with SMTP id q7-20020adff787000000b002f86c013bfcmr1812230wrp.30.1681817141805;
        Tue, 18 Apr 2023 04:25:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350azIaI0Kxl3NyD8xy6Wc5DWoVBB0V9hbzIQevlayPH3k/wRvLwy36JwkUcm+mLFs05FzBWV6g==
X-Received: by 2002:adf:f787:0:b0:2f8:6c01:3bfc with SMTP id q7-20020adff787000000b002f86c013bfcmr1812209wrp.30.1681817141475;
        Tue, 18 Apr 2023 04:25:41 -0700 (PDT)
Received: from debian ([92.62.32.42])
        by smtp.gmail.com with ESMTPSA id t16-20020a7bc3d0000000b003f1692ebd0asm9413463wmj.3.2023.04.18.04.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 04:25:41 -0700 (PDT)
Date:   Tue, 18 Apr 2023 13:25:38 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     Samuel Thibault <samuel.thibault@ens-lyon.org>,
        James Chapman <jchapman@katalix.com>, tparkin@katalix.com,
        edumazet@google.com, davem@davemloft.net, kuba@kernel.org,
        pabeni@redhat.com, corbet@lwn.net, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PPPoL2TP: Add more code snippets
Message-ID: <ZD5+MouUk8YFVOX3@debian>
References: <20230416220704.xqk4q6uwjbujnqpv@begin>
 <ZD5V+z+cBaXvPbQa@debian>
 <20230418085323.h6xij7w6d2o4kxxi@begin>
 <ZD5dqwPblo4FOex1@debian>
 <20230418091148.hh3b52zceacduex6@begin>
 <ZD5uU8Wrz4cTSwqP@debian>
 <20230418103140.cps6csryl2xhrazz@begin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418103140.cps6csryl2xhrazz@begin>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 18, 2023 at 12:31:40PM +0200, Samuel Thibault wrote:
> Guillaume Nault, le mar. 18 avril 2023 12:17:55 +0200, a ecrit:
> > On Tue, Apr 18, 2023 at 11:11:48AM +0200, Samuel Thibault wrote:
> > > Guillaume Nault, le mar. 18 avril 2023 11:06:51 +0200, a ecrit:
> > > > On Tue, Apr 18, 2023 at 10:53:23AM +0200, Samuel Thibault wrote:
> > > > > Guillaume Nault, le mar. 18 avril 2023 10:34:03 +0200, a ecrit:
> > > > > > PPPIOCBRIDGECHAN's description
> > > > > > belongs to Documentation/networking/ppp_generic.rst, where it's already
> > > > > > documented.
> > > > > 
> > > > > Yes but that's hard to find out when you're looking from the L2TP end.
> > > > 
> > > > That's why I proposed linking to ppp_generic.rst.
> > > 
> > > Yes, but it's still not obvious to L2TP people that it's a ppp channel
> > > that you have to bridge. Really, having that 20-line snippet available
> > > would have saved me some head-scratching time.
> > 
> > But the reverse is also true: someone looking at the PPP documentation
> > is probably not going to realise that PPP sample code have been put in
> > the L2TP doc.
> 
> Yes, but for PPP people it is obvious that you'll want to bridge two
> channels.
> 
> The point of the code is not really the bridging ioctl call, but the
> fact that you have to use PPPIOCGCHAN over the two sessions, then open
> a ppp channel, to be able to make the bridging ioctl call. *That*
> is what is really not obvious, and will not actually fit in the PPP
> documentation. Of course we could move the few ppp-only lines to the PPP
> documentation, but I really don't see the point: that part is obvious in
> the PPP context.

For PPPIOCGCHAN, I agree it should be documented in l2tp.rst. This
ioctl is common to all PPPOX sockets, but it wouldn't make sense to
have a separate document just for it. And L2TP is the only PPPOX user
that is documented as far as I know.

As I said in my previous reply, a simple L2TP example that goes until PPP
channel and unit creation is fine. But any more advanced use of the PPP
API should be documented in the PPP documentation.

I mean, these files document the API of their corresponding modules,
their scope should be limitted to that (the PPP and L2TP layers are
really different).

That shouldn't preclude anyone from describing how to combine L2TP, PPP
and others to cover more advanced use cases. It's just better done in a
different file.

> Samuel
> 

