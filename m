Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3807C40DA
	for <lists+linux-doc@lfdr.de>; Tue, 10 Oct 2023 22:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234687AbjJJUIt (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 10 Oct 2023 16:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234719AbjJJUI2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Oct 2023 16:08:28 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329A6D7
        for <linux-doc@vger.kernel.org>; Tue, 10 Oct 2023 13:07:11 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-452863742f3so2640227137.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Oct 2023 13:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696968430; x=1697573230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTqGU2u0PCAVxGXohb+XZJghexUD79dSwAsuPfMFR8E=;
        b=WT6DisU9reUrhgg09rIrN6lwKCebnZ5TT+dDuw+Wrghrt/5/oQ/qeytShnESjgeSgU
         SeVMavlryvaT/nBhYs4OWzGuLXaJsfm90oKU0k8wmfRIqCLGXURTn/nN2P2gonQ6VFE3
         BAEYNqP67rrCWwxvnTPNFDQeTAh5AxG5DQSofNM8t7c5ZI91DYuKH+C8SGKjH/8G3Sq2
         i/GdKjuU87vOraYXamXj0goGyJ8fzIiCQhQM5WCfwEgEb3an34Tr3TlgeBitOEjgpK7y
         gT5A8U9uFNYHg+HMh2JBFNmZg992QKnMsaCA+MNJWv9PpfvCdlCcgrgQw/dzVdtb/n8g
         AL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696968430; x=1697573230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTqGU2u0PCAVxGXohb+XZJghexUD79dSwAsuPfMFR8E=;
        b=ayrrcr7YNI5mrxDQ6id5PsV+VdXX83fd1lA+FDKh+y6eJZvYMmBv4CyCOR8M/WR/vi
         DbkvvcgkYnoIfE4iXO8613JTWClL3pKgzpdg2s0CvVFtT9JKXE43AqeIu4rB9IAPvOFd
         Tf6FenwP17jvHu9ghIWcNEGbcCZlXaW44byuKQIp9T9JiMg+DvxDp+DKLA64iTSUP0XB
         V8bVEKUxed0QnEceKqmq7SZyOTpoPzhSkYf3xZUSxCizYsPEfdCTP8GRPpwBE42IMhU6
         A5iO+DppDyVc0UI+lQd9dxQJozUWuMsQZrswiKA9N9EVj3rR49//a3PmyTms0YGDcOfC
         XFBw==
X-Gm-Message-State: AOJu0YzWG0Ud8p0cEM+RS73jx6ouurzo8sY05F+kBZfogYmhwwORIvVc
        JaBqd1Z6vq/5SoJs2VRrDyGYle/cNaJl4RoEmfFr7A==
X-Google-Smtp-Source: AGHT+IE8eKtBDoVkE+8koCfQqQXVQmpp2mVRQw5itaoq6P8ktmWX7lQetZItew800ypsGuJqpDugW+OhjNmTzNnenl8=
X-Received: by 2002:a05:6102:5e95:b0:457:5f7d:8aec with SMTP id
 ij21-20020a0561025e9500b004575f7d8aecmr10444801vsb.27.1696968429861; Tue, 10
 Oct 2023 13:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <1696965810-8315-1-git-send-email-haiyangz@microsoft.com>
In-Reply-To: <1696965810-8315-1-git-send-email-haiyangz@microsoft.com>
From:   Neal Cardwell <ncardwell@google.com>
Date:   Tue, 10 Oct 2023 16:06:53 -0400
Message-ID: <CADVnQy=tPcP+sRRVwvqober3cmi_3=LukzXC3-YcWudbf1e0HA@mail.gmail.com>
Subject: Re: [PATCH net-next,v2] tcp: Set pingpong threshold via sysctl
To:     Haiyang Zhang <haiyangz@microsoft.com>
Cc:     linux-hyperv@vger.kernel.org, netdev@vger.kernel.org,
        kys@microsoft.com, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, corbet@lwn.net,
        dsahern@kernel.org, ycheng@google.com, kuniyu@amazon.com,
        morleyd@google.com, mfreemon@cloudflare.com, mubashirq@google.com,
        linux-doc@vger.kernel.org, weiwan@google.com,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 10, 2023 at 3:24=E2=80=AFPM Haiyang Zhang <haiyangz@microsoft.c=
om> wrote:
>
> TCP pingpong threshold is 1 by default. But some applications, like SQL D=
B
> may prefer a higher pingpong threshold to activate delayed acks in quick
> ack mode for better performance.
>
> The pingpong threshold and related code were changed to 3 in the year
> 2019 in:
>   commit 4a41f453bedf ("tcp: change pingpong threshold to 3")
> And reverted to 1 in the year 2022 in:
>   commit 4d8f24eeedc5 ("Revert "tcp: change pingpong threshold to 3"")
>
> There is no single value that fits all applications.
> Add net.ipv4.tcp_pingpong_thresh sysctl tunable, so it can be tuned for
> optimal performance based on the application needs.
>
> Signed-off-by: Haiyang Zhang <haiyangz@microsoft.com>
> ---
> v2: Make it per-namesapce setting, and other updates suggested by Neal Ca=
rdwell,
> and Kuniyuki Iwashima.
>
> ---
>  Documentation/networking/ip-sysctl.rst |  8 ++++++++
>  include/net/inet_connection_sock.h     | 16 ++++++++++++----
>  include/net/netns/ipv4.h               |  1 +
>  net/ipv4/sysctl_net_ipv4.c             |  8 ++++++++
>  net/ipv4/tcp_ipv4.c                    |  2 ++
>  net/ipv4/tcp_output.c                  |  4 ++--
>  6 files changed, 33 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/netwo=
rking/ip-sysctl.rst
> index 5bfa1837968c..c0308b65dc2f 100644
> --- a/Documentation/networking/ip-sysctl.rst
> +++ b/Documentation/networking/ip-sysctl.rst
> @@ -1183,6 +1183,14 @@ tcp_plb_cong_thresh - INTEGER
>
>         Default: 128
>
> +tcp_pingpong_thresh - INTEGER
> +       TCP pingpong threshold is 1 by default, but some application may =
need a
> +       higher threshold for optimal performance.
> +
> +       Possible Values: 1 - 255
> +
> +       Default: 1
> +

It would be good to document what the meaning of the parameter is.
Perhaps consider something like:

'The number of estimated data replies sent for estimated incoming data
requests that must happen before TCP estimates that a connection is a
"ping-pong" (request-response) connection for which delayed
acknowledgments can provide benefits. This threshold is 1 by default,
but some applications may need a higher threshold for optimal
performance.'

Thanks for the patch!

best,
neal
