Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC1F25E9537
	for <lists+linux-doc@lfdr.de>; Sun, 25 Sep 2022 20:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbiIYSFT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 25 Sep 2022 14:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbiIYSFG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Sep 2022 14:05:06 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B4B5167D3
        for <linux-doc@vger.kernel.org>; Sun, 25 Sep 2022 11:05:04 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id j10so2954858qtv.4
        for <linux-doc@vger.kernel.org>; Sun, 25 Sep 2022 11:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=JWBdsjn/upYE6CL/KyWVQAv4sKoeadPEgDQ2x+ZFj9E=;
        b=GE5ImGgXdEgZK/gbUhr1N9Kr/lUFrnfKYPTzmAezp5rDny8MNM2FnjhLTNoMHHkUxI
         AaVGTgUrXzWlZo+Lb9KQoOTn77v8KiuLZPYR2c4iG3VLCyiyvxxrVA9aUNCWHYXI7rfa
         C3MgFoUcfLIUr7QGdaNZqbJoQclDs20l4C4NA5qHQrhMeb34GCTjLu5wijQs9Bdn00hL
         dBfe0xE7Rlc+N3KnuLFMYvnBVRe1lqjSK6jcMbhrnnHuuqc0aaxzU/W8SlXkKKxEhVBI
         XUZ0pFRsz7derRDzXahFirVrf/72sRu+cKzvr5ppiNmTcDRcQmGTxrMTbOIdQlrZzLBU
         ZFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JWBdsjn/upYE6CL/KyWVQAv4sKoeadPEgDQ2x+ZFj9E=;
        b=aPBH90P85PNTseFQtF/X96S93wlc33kRjq30y2nE+AncRhrtMTAJvTiXMGlXDsSbMm
         N0U4CSiozdyc6sk7Gj0T9poYQ+Ii06GeoKNivlAsYK0YdMeeUS4uW31LR6ddWRn5JTDa
         7M2WlR6zcSOaihPDJudFNk02/wy76mu9bCY86OOgmIM2sobWMWRRTDk7L/I3IKBroaiw
         1zAtnVGDKj+K00R/wAmXUXrbF2vXPQY3i8tzMCa28lG5HyjU4ubxZEaZ63wu76AI9Heg
         4aSF8rH9N6AE0oLqn74DtHHvLKxERN2QtFUJRKeyg45EuS/LNjiwMbt2XI8rnRKlKpPw
         xTSg==
X-Gm-Message-State: ACrzQf2nkwEfa3ek+6RO3eP8nxw7XWiovtSaPATnWgluiPCmHHkAU70H
        GBstqdjbtdr50UNHh2LmkYFopd6KoM8xjg==
X-Google-Smtp-Source: AMsMyM5LX5f4CZNcO9XLpqoLfftIQhG34BvAWi/l8f7bTT+vyooFtyJAO82JlNkr3c76OsOowF/izQ==
X-Received: by 2002:a05:622a:111:b0:35d:ebd:41a6 with SMTP id u17-20020a05622a011100b0035d0ebd41a6mr15399867qtw.387.1664129103388;
        Sun, 25 Sep 2022 11:05:03 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id e19-20020ac86713000000b0035bb6c3811asm9319079qtp.53.2022.09.25.11.05.02
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 11:05:02 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-3450990b0aeso47947347b3.12
        for <linux-doc@vger.kernel.org>; Sun, 25 Sep 2022 11:05:02 -0700 (PDT)
X-Received: by 2002:a81:de44:0:b0:341:6954:52b2 with SMTP id
 o4-20020a81de44000000b00341695452b2mr17053316ywl.208.1664129101777; Sun, 25
 Sep 2022 11:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <adel.abushaev@gmail.com> <20220817200940.1656747-1-adel.abushaev@gmail.com>
 <CADvbK_fVRVYjtSkn29ec70mko9aEwnwu+kHYx8bAAWm-n25mjA@mail.gmail.com> <f479b419-b05d-2cae-4fd0-4e88707b8d8b@gmail.com>
In-Reply-To: <f479b419-b05d-2cae-4fd0-4e88707b8d8b@gmail.com>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Sun, 25 Sep 2022 11:04:23 -0700
X-Gmail-Original-Message-ID: <CA+FuTSf_8MjF4jeUjEqDrOwqXzf485jX_GJyVP5kPUDzOFezkg@mail.gmail.com>
Message-ID: <CA+FuTSf_8MjF4jeUjEqDrOwqXzf485jX_GJyVP5kPUDzOFezkg@mail.gmail.com>
Subject: Re: [net-next v2 0/6] net: support QUIC crypto
To:     Adel Abouchaev <adel.abushaev@gmail.com>
Cc:     Xin Long <lucien.xin@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
        davem <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        David Ahern <dsahern@kernel.org>, shuah@kernel.org,
        imagedong@tencent.com, network dev <netdev@vger.kernel.org>,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> >
> > The patch seems to get the crypto_ctx by doing a connection hash table
> > lookup in the sendmsg(), which is not good from the performance side.
> > One QUIC connection can go over multiple UDP sockets, but I don't
> > think one socket can be used by multiple QUIC connections. So why not
> > save the ctx in the socket instead?
> A single socket could have multiple connections originated from it,
> having different destinations, if the socket is not connected. An
> optimization could be made for connected sockets to cache the context
> and save time on a lookup. The measurement of kernel operations timing
> did not reveal a significant amount of time spent in this lookup due to
> a relatively small number of connections per socket in general. A shared
> table across multiple sockets might experience a different performance
> grading.

I'm late to this patch series, sorry. High quality implementation. I
have a few design questions similar to Xin.

If multiplexing, instead of looking up a connection by { address, port
variable length connection ID }, perhaps return a connection table
index on setsockopt and use that in sendmsg.

> >
> > The patch is to reduce the copying operations between user space and
> > the kernel. I might miss something in your user space code, but the
> > msg to send is *already packed* into the Stream Frame in user space,
> > what's the difference if you encrypt it in userspace and then
> > sendmsg(udp_sk) with zero-copy to the kernel.
> It is possible to do it this way. Zero-copy works best with packet sizes
> starting at 32K and larger.  Anything less than that would consume the
> improvements of zero-copy by zero-copy pre/post operations and needs to
> align memory.

Part of the cost of MSG_ZEROCOPY is in mapping and unmapping user
pages. This series re-implements that with its own get_user_pages.
That is duplicative non-trivial code. And it will incur the same cost.
What this implementation saves is the (indeed non-trivial)
asynchronous completion notification over the error queue.

The cover letter gives some performance numbers against a userspace
implementation that has to copy from user to kernel. It might be more
even to compare against an implementation using MSG_ZEROCOPY and
UDP_SEGMENT. A userspace crypto implementation may have other benefits
compared to a kernel implementation, such as not having to convert to
crypto API scatter-gather arrays and back to network structures.

A few related points

- The implementation support multiplexed connections, but only one
crypto sendmsg can be outstanding at any time:

  + /**
  + * To synchronize concurrent sendmsg() requests through the same socket
  + * and protect preallocated per-context memory.
  + **/
  + struct mutex sendmsg_mux;

That is quite limiting for production workloads.

- Crypto operations are also executed synchronously, using
crypto_wait_req after each operationn. This limits throughput by using
at most one core per UDP socket. And adds sendmsg latency (which may
or may not be important to the application). Wireguard shows an
example of how to parallelize software crypto across cores.

- The implementation avoids dynamic allocation of cipher text pages by
using a single ctx->cipher_page. This is protected by sendmsg_mux (see
above). Is that safe when packets leave the protocol stack and are
then held in a qdisc or when being processed by the NIC?
quic_sendmsg_locked will return, but the cipher page is not free to
reuse yet.

- The real benefit of kernel QUIC will come from HW offload. Would it
be better to avoid the complexity of an in-kernel software
implementation and only focus on HW offload? Basically, pass the
plaintext QUIC packets over a standard UDP socket and alongside in a
cmsg pass either an index into a HW security association database or
the immediate { key, iv } connection_info (for stateless sockets), to
be encoded into the descriptor by the device driver.

- With such a simpler path, could we avoid introducing ULP and just
have udp [gs]etsockopt CRYPTO_STATE. Where QUIC is the only defined
state type yet.

- Small aside: as the series introduces new APIs with non-trivial
parsing in the kernel, it's good to run a fuzzer like syzkaller on it
(if not having done so yet).

> The other possible obstacle would be that eventual support
> of QUIC encryption and decryption in hardware would integrate well with
> this current approach.
> >
> > Didn't really understand the "GSO" you mentioned, as I don't see any
> > code about kernel GSO, I guess it's just "Fragment size", right?
> > BTW, it=E2=80=98s not common to use "//" for the kernel annotation.

minor point: fragment has meaning in IPv4. For GSO, prefer gso_size.

> Once the payload arrives into the kernel, the GSO on the interface would
> instruct L3/L4 stack on fragmentation. In this case, the plaintext QUIC
> packets should be aligned on the GSO marks less the tag size that would
> be added by encryption. For GSO size 1000, the QUIC packets in the batch
> for transmission should all be 984 bytes long, except maybe the last
> one. Once the tag is attached, the new size of 1000 will correctly split
> the QUIC packets further down the stack for transmission in individual
> IP/UDP packets. The code is also saving processing time by sending all
> packets at once to UDP in a single call, when GSO is enabled.
> >
> > I'm not sure if it's worth adding a ULP layer over UDP for this QUIC
> > TX only. Honestly, I'm more supporting doing a full QUIC stack in the
> > kernel independently with socket APIs to use it:
> > https://github.com/lxin/tls_hs.
> >
> > Thanks.
