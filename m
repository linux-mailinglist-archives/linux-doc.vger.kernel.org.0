Return-Path: <linux-doc+bounces-36148-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CAEA1C847
	for <lists+linux-doc@lfdr.de>; Sun, 26 Jan 2025 15:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C749C3A6BAB
	for <lists+linux-doc@lfdr.de>; Sun, 26 Jan 2025 14:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFBC13F434;
	Sun, 26 Jan 2025 14:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="U4xemzTi"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B2F56446
	for <linux-doc@vger.kernel.org>; Sun, 26 Jan 2025 14:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737900654; cv=none; b=G3iqN/xdEixGWKtc4A9x/a5b2mvRZRJnJN50dwgPeTXalzXiubMX3kxjWpRTmop/vYW+kgA0Hwto0DmDOvr8RcstjpdqwZJ3G0T4IKdtfz9vjV6khhHbV5QwLZoUQqogO8z7DJqcoGpCaLKXVnL8g6o27Sl9NWNNWOE5Dh3+29E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737900654; c=relaxed/simple;
	bh=M5WLy1DxNP8qgUCHlq9+eiJMlU/LVKdDp0LRxkwAU9Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MoSWboSnietvcm6zKuF0cR+Y3iKlICPjGWVFqXW/tpuX8hCYBuc3aDfMq/J1M0Kdv1lLjS9+GWOYPst+ogmtYEOYNol9FyIWPbLjS5ik5lNwHfScFfIOA2IV8LbiQT/NpVjcQJMzkzrjbMEqzxrJX8/gk53glCa28eClNCtaFFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=U4xemzTi; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dbfab8a2b0so7104934a12.3
        for <linux-doc@vger.kernel.org>; Sun, 26 Jan 2025 06:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1737900650; x=1738505450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5WLy1DxNP8qgUCHlq9+eiJMlU/LVKdDp0LRxkwAU9Y=;
        b=U4xemzTi6t5tcTns93W9iamQrcXEKYsP0/lJOvT2Yf/2l1YMtwNQz709HGrHNXiOgv
         tdVcgAE0Jn/bUSpKyDoE/qVfpDtGyVLaT730VWxZlo6iGeZqXcB1VTDpznLUF/4FmxER
         cyvTHjMicqTzsJegFj7SDioxNQrnljZAa4fs1J8K4GTq0I0naPqWAmH9kxK8HyBTob90
         jYzfLUrefp7sQpfemcJDEyGOTN+qx/+EM0B+T3+k7vpGbFEfBKxk1Da172805Rrxcng4
         4UxCk7FIRRsQeo+8BcwTMbBndCGJWnxn6UU1oEWEPog8FeD9d6HM/fuRIx5wPeAqxMod
         PxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737900650; x=1738505450;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5WLy1DxNP8qgUCHlq9+eiJMlU/LVKdDp0LRxkwAU9Y=;
        b=WEgT+GV4omdGVqvcXzuZmKsYUiYyxfvAv/28purheRJHFnkpBMT9BwazHKRLvqMZxI
         CuAPHbHAZqSDvMfDgEYJcSclFDgwQcprMIWC2kvP2mfqXqlJttUlEOMTiabw5BfRyDwj
         WjpDJlQp1vbHsLbUayH/MgrMwG7mdfSPElYo06Z+K8bSAbq0AJM3WlQMPhipFo5YpB6x
         5ZkIn0o57lDtRxfu5eCYcgq6T+96IkmDjcRZJU0fFIIOarFm4cneQwhR7qm7dQwnD0LY
         gHTo6FMN3ONQ2lF+zIglOkySKTWJLYK+xq+IJQvMV8AOy9TLlhgbY3tGBcnsGCwHHXrk
         K78g==
X-Forwarded-Encrypted: i=1; AJvYcCW5fPZsj+vtwSlhX81/rhbTlIN3dFwwLo73NTAxu+XD6ommT7gXjz7kWWlcDFKYJ9la2Z1I0oxQzdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYf3hvRq86MLRhq7oSrpo2LvaJ2E2cfnivRwdAarbjErq1pEvA
	f0mFBIov3j0KVR8z/e+vMsMT5tArors2uooWEhnlvVet5+z1GakSVlTxALEXFiQ=
X-Gm-Gg: ASbGncvr9aj1EKc7DNGys9trT6fpNP/FFPmmB3ER9EHJF7YtqsfpS3VHHHE8ANCIWxL
	OAPBx6tIeeStRoNr+lTuaVGyUrdoRdO5IxuEn/+KF1RQl2gHGM5z2MIUO9/uCo9GnfBbE/bBY1f
	rkOOwlUZ88V8Kn3542ZGC+GcpNcVxG9+aC3SaZZ79SRnnozM7B2kUd7KuXC9Ptr7zh7nUTYCFNY
	UPwH2fiLbWXxixNNCPCfAK1QvSKYIbTqcl3o5M9AUJ7wCIREJc6aJdlGnboXzbGkgO7ylPJSg==
X-Google-Smtp-Source: AGHT+IHmiL1x/cK57mDrEyZlSiKzsVH7Pb4ZWh6Me4KnpzE8zDPhlrVO8QVqTEA/mMnO8vlAwtv50g==
X-Received: by 2002:a05:6402:34c7:b0:5d8:253:b7df with SMTP id 4fb4d7f45d1cf-5db7db086cfmr33360402a12.27.1737900650420;
        Sun, 26 Jan 2025 06:10:50 -0800 (PST)
Received: from cloudflare.com ([2a09:bac5:506b:2432::39b:69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc186d895bsm4010079a12.68.2025.01.26.06.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 06:10:48 -0800 (PST)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Eric Dumazet <edumazet@google.com>, Jiayuan Chen <mrpre@163.com>
Cc: bpf@vger.kernel.org,  john.fastabend@gmail.com,  netdev@vger.kernel.org,
  martin.lau@linux.dev,  ast@kernel.org,  davem@davemloft.net,
  dsahern@kernel.org,  kuba@kernel.org,  pabeni@redhat.com,
  linux-kernel@vger.kernel.org,  song@kernel.org,  andrii@kernel.org,
  mhal@rbox.co,  yonghong.song@linux.dev,  daniel@iogearbox.net,
  xiyou.wangcong@gmail.com,  horms@kernel.org,  corbet@lwn.net,
  eddyz87@gmail.com,  cong.wang@bytedance.com,  shuah@kernel.org,
  mykolal@fb.com,  jolsa@kernel.org,  haoluo@google.com,  sdf@fomichev.me,
  kpsingh@kernel.org,  linux-doc@vger.kernel.org,
  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf v9 2/5] bpf: fix wrong copied_seq calculation
In-Reply-To: <20250122100917.49845-3-mrpre@163.com> (Jiayuan Chen's message of
	"Wed, 22 Jan 2025 18:09:14 +0800")
References: <20250122100917.49845-1-mrpre@163.com>
	<20250122100917.49845-3-mrpre@163.com>
Date: Sun, 26 Jan 2025 15:10:45 +0100
Message-ID: <87r04pd5sq.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 06:09 PM +08, Jiayuan Chen wrote:
> 'sk->copied_seq' was updated in the tcp_eat_skb() function when the action
> of a BPF program was SK_REDIRECT. For other actions, like SK_PASS, the
> update logic for 'sk->copied_seq' was moved to tcp_bpf_recvmsg_parser()
> to ensure the accuracy of the 'fionread' feature.
>
> It works for a single stream_verdict scenario, as it also modified
> sk_data_ready->sk_psock_verdict_data_ready->tcp_read_skb
> to remove updating 'sk->copied_seq'.
>
> However, for programs where both stream_parser and stream_verdict are
> active (strparser purpose), tcp_read_sock() was used instead of
> tcp_read_skb() (sk_data_ready->strp_data_ready->tcp_read_sock).
> tcp_read_sock() now still updates 'sk->copied_seq', leading to duplicate
> updates.
>
> In summary, for strparser + SK_PASS, copied_seq is redundantly calculated
> in both tcp_read_sock() and tcp_bpf_recvmsg_parser().
>
> The issue causes incorrect copied_seq calculations, which prevent
> correct data reads from the recv() interface in user-land.
>
> We do not want to add new proto_ops to implement a new version of
> tcp_read_sock, as this would introduce code complexity [1].
>
> We could have added noack and copied_seq to desc, and then called
> ops->read_sock. However, unfortunately, other modules didn=E2=80=99t fully
> initialize desc to zero. So, for now, we are directly calling
> tcp_read_sock_noack() in tcp_bpf.c.
>
> [1]: https://lore.kernel.org/bpf/20241218053408.437295-1-mrpre@163.com
> Fixes: e5c6de5fa025 ("bpf, sockmap: Incorrectly handling copied_seq")
> Suggested-by: Jakub Sitnicki <jakub@cloudflare.com>
> Signed-off-by: Jiayuan Chen <mrpre@163.com>
> ---

I'm happy with how this turned out, but let's run it by Eric.

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>

