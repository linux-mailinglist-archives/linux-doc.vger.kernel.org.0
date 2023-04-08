Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A66326DBC59
	for <lists+linux-doc@lfdr.de>; Sat,  8 Apr 2023 19:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbjDHRdd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 8 Apr 2023 13:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbjDHRdd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 Apr 2023 13:33:33 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD96EB756
        for <linux-doc@vger.kernel.org>; Sat,  8 Apr 2023 10:33:30 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9476e2fa157so228019666b.3
        for <linux-doc@vger.kernel.org>; Sat, 08 Apr 2023 10:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dectris.com; s=google; t=1680975209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RWnk3r/ZKxNzmFwcfRG9jBXukIQvdhKh3XXK8OCGzWM=;
        b=hxNr1hoZmnIwnoHDVcv2GhaPllcDjvLoN2jZN8CM1AHISKYHraI4fV2JwMFp4ynCkn
         xaN5OlVRG1OxJF8YhhLjWK72UFhQ4xF9KAOtxG2eTTTUnY5ZFWLUt1D+01uZOa++Rb8J
         PNd8doDgVbKoUmFfFD9gE0gQM8aBb/wHYeqKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680975209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWnk3r/ZKxNzmFwcfRG9jBXukIQvdhKh3XXK8OCGzWM=;
        b=M3p8wBQ/qID5DPeOkjQyQ1SCg9goktwrXni8KOMB5MogNRiD91iDC5DSd5ghMqCk06
         1Lbm1eaUiRJN0wo+OiZno3wmFhpiEYj318VOkR/DqF+Wtjtq88xF0JAJeTao7nMm2l7Q
         X0fho9GX4Gy53E1Wf000vgcfNNCs/E0Rkio97L/h6ul9pLS5sLnQ/XwCuqQeTekaFDnh
         JWngJiMOBwpDmsXn30ici9mefiVC7zwAOpfwPm3mCtPZBZqMMhGkI4PYci9wCaZ6AMnd
         M56uMHeWLn9LvUgl3XqDyH03K+aEf7eu1C7mM4p8Pm7XmhlzyjsYW+PpxGEbKOT2bNL7
         1GHQ==
X-Gm-Message-State: AAQBX9e9mJesAjlOQFliGpQlvf6Tr2OXwQzxxyqEdlmeK+T+l6iffOa2
        pzCLZEjAwNNSbL//YBqhMYqoxxDL+SsnRqv+xXAovA==
X-Google-Smtp-Source: AKy350atVtpuKNWtfg0ZdhZlaFfElzRQx9WPR6dWwTp9mdeMFEkeyxQpxNMihhgd8gBTYuzKpf+5tRgA65ek5/plImk=
X-Received: by 2002:a50:ba8d:0:b0:4fb:e0e8:5140 with SMTP id
 x13-20020a50ba8d000000b004fbe0e85140mr3140178ede.6.1680975209172; Sat, 08 Apr
 2023 10:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230406130205.49996-1-kal.conley@dectris.com>
 <20230406130205.49996-2-kal.conley@dectris.com> <87sfdckgaa.fsf@toke.dk> <ZDBEng1KEEG5lOA6@boxer>
In-Reply-To: <ZDBEng1KEEG5lOA6@boxer>
From:   Kal Cutter Conley <kal.conley@dectris.com>
Date:   Sat, 8 Apr 2023 19:38:09 +0200
Message-ID: <CAHApi-nuD7iSY7fGPeMYiNf8YX3dG27tJx1=n8b_i=ZQdZGZbw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 1/3] xsk: Support UMEM chunk_size > PAGE_SIZE
To:     Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc:     =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
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

> > > Add core AF_XDP support for chunk sizes larger than PAGE_SIZE. This
> > > enables sending/receiving jumbo ethernet frames up to the theoretical
> > > maxiumum of 64 KiB. For chunk sizes > PAGE_SIZE, the UMEM is required
> > > to consist of HugeTLB VMAs (and be hugepage aligned). Initially, only
> > > SKB mode is usable pending future driver work.
> >
> > Hmm, interesting. So how does this interact with XDP multibuf?
>
> To me it currently does not interact with mbuf in any way as it is enabled
> only for skb mode which linearizes the skb from what i see.
>
> I'd like to hear more about Kal's use case - Kal do you use AF_XDP in SKB
> mode on your side?

Our use-case is to receive jumbo Ethernet frames up to 9000 bytes with
AF_XDP in zero-copy mode. This patchset is a step in this direction.
At the very least, it lets you test out the feature in SKB mode
pending future driver support. Currently, XDP multi-buffer does not
support AF_XDP at all. It could support it in theory, but I think it
would need some UAPI design work and a bit of implementation work.

Also, I think that the approach taken in this patchset has some
advantages over XDP multi-buffer:
    (1) It should be possible to achieve higher performance
        (a) because the packet data is kept together
        (b) because you need to acquire and validate less descriptors
and touch the queue pointers less often.
    (2) It is a nicer user-space API.
        (a) Since the packet data is all available in one linear
buffer. This may even be a requirement to avoid an extra copy if the
data must be handed off contiguously to other code.

The disadvantage of this patchset is requiring the user to allocate
HugeTLB pages which is an extra complication.

I am not sure if this patchset would need to interact with XDP
multi-buffer at all directly. Does anyone have anything to add here?

What other intermediate steps are needed to get to ZC? I think drivers
would already be able to support this now?

Kal
