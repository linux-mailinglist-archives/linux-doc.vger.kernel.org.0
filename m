Return-Path: <linux-doc+bounces-324-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6594F7CA6DB
	for <lists+linux-doc@lfdr.de>; Mon, 16 Oct 2023 13:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 222AA281281
	for <lists+linux-doc@lfdr.de>; Mon, 16 Oct 2023 11:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC890250E8;
	Mon, 16 Oct 2023 11:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2Q5uhr7K"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566E51C2AD
	for <linux-doc@vger.kernel.org>; Mon, 16 Oct 2023 11:41:02 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1017AE1
	for <linux-doc@vger.kernel.org>; Mon, 16 Oct 2023 04:41:00 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so11465a12.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Oct 2023 04:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697456458; x=1698061258; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2I6xiVgm8CDmOxobNPXJ5HYpt0gEXNwuNgT27rQ1pK8=;
        b=2Q5uhr7KZnIOPozm+oy0vHWbp03Q1sFUZSwBPx0LsVQC/w/dnP/c3KuRsVKTGEu7kM
         AROIj0DxDxL1/YKoSGX7rM5Lq1lTKGlp1lkaJWGbrOjLbVJXxdpyCT1WYWzb3vbWOBgk
         anltbr9L+X2Hn1JBwCIzkQjRdEjjugweYDFB8mohX2nuHlw0wCfQMUy4FqZzgBkBaHdR
         8SPVoFEJSGtEulLCD0j5oxaLuLvVE5dUJvuP0kmBS9RuKVQIuAeZGQ6X55Aqyj9Vn3md
         s2mtdAxgTRbWRYgZ+LzvH0GL2oEeUQ6/l+nyB3P1/YMPXJaPilTrFc8I/841CfVH1Yba
         CarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697456458; x=1698061258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2I6xiVgm8CDmOxobNPXJ5HYpt0gEXNwuNgT27rQ1pK8=;
        b=Vu7swBbLVvQ+vICyYvvSJV+xdadvv7SZRvhWHrXf2+hzH8JmYM6btJb9yZHN2qUo29
         E1BxD3rURVSe69HP2UboqdtoF8w3jpAgY3AJ+E0Y5XsCDqehiP+R1FSVPUo1QY0xlEqk
         MKtRrO8M4WZ1CjHRJUXP1XqOzhOJSEMqEmBbFte4wPVDPaYO7Tob5z+oA7GpF97iZblT
         Ih9CQpcdRxwsjEL72tpg7FBaW0TDZ2v3Ob5HYByUM3JaookWTLT97f3ycvDs9gpCTNSq
         WtSvPvutybEp4pvQGoA1LnSLe6PM/+/LZKkbjkwo65mMjn3F2mgIRWJ+plol4mFXGWX0
         iEjQ==
X-Gm-Message-State: AOJu0YwYE9NqugwXTZ0AdZLJDbhpDL+Sw/Js21OAEXhyjbd/wMLau5nG
	FYs8EtOj/aSPi3GBG5vdIMjchwlEWLi7CvNWNzWa5g==
X-Google-Smtp-Source: AGHT+IEd7QsZDGvewhvSCOpW/J+FnpZ5jMRtoRoEZoPIfRkDvA7e50KC0N8Z+vcUAqp+1WNdbYbn6DP3CRW+eN2eV5Y=
X-Received: by 2002:a50:cd16:0:b0:538:1d3a:d704 with SMTP id
 z22-20020a50cd16000000b005381d3ad704mr155111edi.1.1697456458241; Mon, 16 Oct
 2023 04:40:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1697056244-21888-1-git-send-email-haiyangz@microsoft.com>
In-Reply-To: <1697056244-21888-1-git-send-email-haiyangz@microsoft.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 16 Oct 2023 13:40:43 +0200
Message-ID: <CANn89iLth-thO7=V=b+3dbP=K-m+hbBk75FtM+7cFiUphGXwoA@mail.gmail.com>
Subject: Re: [PATCH net-next,v3] tcp: Set pingpong threshold via sysctl
To: Haiyang Zhang <haiyangz@microsoft.com>
Cc: linux-hyperv@vger.kernel.org, netdev@vger.kernel.org, kys@microsoft.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, corbet@lwn.net, 
	dsahern@kernel.org, ncardwell@google.com, ycheng@google.com, 
	kuniyu@amazon.com, morleyd@google.com, mfreemon@cloudflare.com, 
	mubashirq@google.com, linux-doc@vger.kernel.org, weiwan@google.com, 
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

On Wed, Oct 11, 2023 at 10:31=E2=80=AFPM Haiyang Zhang <haiyangz@microsoft.=
com> wrote:
>
> TCP pingpong threshold is 1 by default. But some applications, like SQL D=
B
> may prefer a higher pingpong threshold to activate delayed acks in quick
> ack mode for better performance.
>

...

>
> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> index f207712eece1..7d0fe76d56ef 100644
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@ -170,10 +170,10 @@ static void tcp_event_data_sent(struct tcp_sock *tp=
,
>         tp->lsndtime =3D now;
>
>         /* If it is a reply for ato after last received
> -        * packet, enter pingpong mode.
> +        * packet, increase pingpong count.
>          */
>         if ((u32)(now - icsk->icsk_ack.lrcvtime) < icsk->icsk_ack.ato)
> -               inet_csk_enter_pingpong_mode(sk);
> +               inet_csk_inc_pingpong_cnt(sk);
>  }
>
>  /* Account for an ACK we sent. */

OK, but I do not think we solved the fundamental problem of using
jiffies for this heuristic,
especially for HZ=3D100 or HZ=3D250 builds.

Reviewed-by: Eric Dumazet <edumazet@google.com>

