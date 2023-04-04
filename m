Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1DC6D6069
	for <lists+linux-doc@lfdr.de>; Tue,  4 Apr 2023 14:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234864AbjDDMcu (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Apr 2023 08:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233431AbjDDMct (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Apr 2023 08:32:49 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65EBD187
        for <linux-doc@vger.kernel.org>; Tue,  4 Apr 2023 05:32:48 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id y4so129975313edo.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Apr 2023 05:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google; t=1680611567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lQcIyFOncurjIT+o4UGlZG60aNWai/f0x3s0axT5Vnk=;
        b=Hlk10fbl41Yt3mAA1sLhOCtYwU+5MrGRM9l6Q50SIWkL2G7lL0R6bctIQ+euviHG2N
         04a2bXOWGCpPOyMAACyEh1dQyVqrosplVE1AMsqnXw09pPAw3i3bzTejssbgjLfl9uQl
         4adx/r5EONmyXwFMxy5qTzUMmCU9p8f/V7e24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680611567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQcIyFOncurjIT+o4UGlZG60aNWai/f0x3s0axT5Vnk=;
        b=A/xL9EYBxi6B4dm4w9v3mCt3gNrDr9Xhsxfp84dwPzZWUwSTgKqlx6yND0/sJ5tYsb
         5Fm9log6Gsm/DgFICmVTrOYuEkIQMynNbFK49dV6euhxoqvEP+t7/6OZXnFaCZ/kb/RK
         0twzS/K3uNvtSdvj1zySjmTonW+PkIbE5gbiMLUWAqx5enMHYO4recP3YldjTC6NrsvY
         eZkjx8n0UZ9g0D2SItEEJBy/YLjT4ggwI/xxXrdozmyqS/EdreSTKKGQvRTwdC7s2xyB
         bMkt8FlrjDNCHOUXci2podfBYOK0ktaQ2FCEqdtaUlw8t2T74fsUeOI2cHHJGojfQhnW
         GnuA==
X-Gm-Message-State: AAQBX9fxQ5YdpnC4DyJcPW68S6v1KjlXT+nQ7lqpvbnRgfYTEJEw+kAi
        lxp5V8q7a1HMPgErZMRBmPnXive7ZfXsL2KskfZUNg==
X-Google-Smtp-Source: AKy350azIld49dPJgTGch+/F72rJ1DiHbu3mAmSox/D9KQsMNjU9Z810jCIlKZHAZzU4O1hlq4ZNJ3nqSXbWEJQv6do=
X-Received: by 2002:a17:907:8c10:b0:920:3bf5:7347 with SMTP id
 ta16-20020a1709078c1000b009203bf57347mr1460144ejc.0.1680611566935; Tue, 04
 Apr 2023 05:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230329180502.1884307-1-kal.conley@dectris.com>
 <20230329180502.1884307-9-kal.conley@dectris.com> <CAJ8uoz330DWzHabpqd+HaeAxBi2gr+GOTtnS9WJFWrt=6DaeWQ@mail.gmail.com>
 <CAHApi-nfBM=i1WeZ-jtHN87AWPvURo0LygT9yYxF=cUeYthXBQ@mail.gmail.com>
 <CAJ8uoz0SEkcXQuoqYd94GreJqpCxQuf1QVgm9=Um6Wqk=s8GBw@mail.gmail.com>
 <CAHApi-=ui3JofMr7y+LvuYkXCU=h7vGiKXsfuV5gog-02u-u+Q@mail.gmail.com>
 <CAJ8uoz0GgzzfrgS0189=zwY-zzogZq+=v-NCY7O+RuWrwe1n6w@mail.gmail.com> <CAHApi-kVF5dS=ym7PXttCVAz7jEod2cOhh27YYwkidCUogu6-A@mail.gmail.com>
In-Reply-To: <CAHApi-kVF5dS=ym7PXttCVAz7jEod2cOhh27YYwkidCUogu6-A@mail.gmail.com>
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Tue, 4 Apr 2023 14:37:27 +0200
Message-ID: <CAHApi-mXt27N0dWW1QN5qZ6OOV9uVGxc-kuEd+SBF8hDJ2NPXA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 08/10] xsk: Support UMEM chunk_size > PAGE_SIZE
To:     Magnus Karlsson <magnus.karlsson@gmail.com>
Cc:     =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        netdev@vger.kernel.org, bpf@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> > > > > > Is not the max 64K as you test against XDP_UMEM_MAX_CHUNK_SIZE in
> > > > > > xdp_umem_reg()?
> > > > >
> > > > > The absolute max is 64K. In the case of HPAGE_SIZE < 64K, then it
> > > > > would be HPAGE_SIZE.
> > > >
> > > > Is there such a case when HPAGE_SIZE would be less than 64K? If not,
> > > > then just write 64K.
> > >
> > > Yes. While most platforms have HPAGE_SIZE defined to a compile-time
> > > constant >= 64K (very often 2M) there are platforms (at least ia64 and
> > > powerpc) where the hugepage size is configured at boot. Specifically,
> > > in the case of Itanium (ia64), the hugepage size may be configured at
> > > boot to any valid page size > PAGE_SIZE (e.g. 8K). See:
> > > https://elixir.bootlin.com/linux/latest/source/arch/ia64/mm/hugetlbpage.c#L159
> >
> > So for all practical purposes it is max 64K. Let us just write that then.
>
> What about when CONFIG_HUGETLB_PAGE is not defined? Should we keep it
> set to PAGE_SIZE in that case, or would you like it to be a fixed
> constant == 64K always?

Sorry. Now it's not clear to me if you are suggesting the
documentation be changed or the code or both?
