Return-Path: <linux-doc+bounces-57084-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDB4B2F8D7
	for <lists+linux-doc@lfdr.de>; Thu, 21 Aug 2025 14:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33737564DE1
	for <lists+linux-doc@lfdr.de>; Thu, 21 Aug 2025 12:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F89311977;
	Thu, 21 Aug 2025 12:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yv6pOtbB"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B231B30DEA0
	for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 12:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780425; cv=none; b=qErcmlZG0ovYnQXNfETHb5ABVvA2r64m5PuPgTDpiW1B4i7o0TeseXcTdYe0uOfdjfHq4wEkm7UkK+fXSqaFTcDhd7iBO201ObsB7Bhe4Wh9VjK8peGWS9lPDDUgdCVffZwhWpa/RbvpSETYTCzmH66K85ZhgPt8Wy1iZKEUblA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780425; c=relaxed/simple;
	bh=T5vFxjCh6b953wcDu7Rlc6rHd98sJerhHHx1XzU9U48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LHtuVcIFaZl6r9qyTRgx9TeMETedaNeVSx2brCq4+aHoEVlauujaeGsWER4i+yALXdh2IqN7yp/F+8aA27pSnY7QMPqh6bT1glxKAsC9IfkT7qB/yozqvGNQa46N3qg71ZqZoa7KwtAuLG4blRvGE4kxiSK39IJHZNzWVeqIW8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yv6pOtbB; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4b121dc259cso7155621cf.1
        for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 05:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755780422; x=1756385222; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shHdVfFUGDzfHfFpOtcyKZwrJCRaSaLcw+8WiOuBh54=;
        b=yv6pOtbB5XXd2DqAK3srZwLPFEsGqPP8/nSdGY4ODesRvwTch6sP7WnVp7cZzlUrMH
         PlcYLsYV/RI+BnLggWpwUUz+ZlEg/9YExWDroP22aXWAxctFb0kitYWo2lrydObBz250
         OptfgJQolTJ/csXo8D+vpoOoU/gNupjoizan/28NVs+VEHe3/vIHzw6+LAIYtHZopl9F
         +H08hZ/SxsOA9Hwn3LrCKMZVkiaLjq+Fwob3wJi0kwS0vDcHtr4Ra9gw44XyyRl7F783
         IeCVuT48Si4hZi++JieKbAzg8F4gz8hQ/1VR/iMer86hBBhW29jZHAllOSpKzw8yUCrH
         IgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755780422; x=1756385222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shHdVfFUGDzfHfFpOtcyKZwrJCRaSaLcw+8WiOuBh54=;
        b=ChQnrArEUSfnFB7Wq21R2EoFWiJ37K5fGptC+pD3ZWSCnsd/l1l6oNTgaS1R7zAf4p
         gAuaGRvU5cC+61zAsRG6vVNEfV+zwYjeOjbNfGlBCvgSzp01EHwGrGAp11HGgqsB/Wn3
         cFkWAq5rmPpRGqfTJkpw5EO2RV7Fo1we8RSIzzAIXOajHksNW7CwPcoa7I88qVjMsWai
         vkF/3Is7Rz/d5sbTPBXmVPmfWl/guXUw+43RL9zYsioBwIKX/W/LSPA96lgI3aDJoT7E
         F/Br3CVY/+TTU/vdSFY9rBJ6Cm3p78X2egGZlsxQtpJVx9trvM6DAQo4hewbGRBfYIEB
         CXow==
X-Forwarded-Encrypted: i=1; AJvYcCUvckJhsdSVhXJ2gNvJVjkIaBwt33Tc5Ip+Gr7is2ZpHXOub0fmAdS2DXCU58lQJOYsRBvrseoJRcM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv3Rd5GTVQL5AEktiB7wo6dy84QYO7qRj2HgGFQEtDr7RXkuw9
	dhnH836Elxggdq4gqvYY2n3HXfl+PKI/chyKK1oVqJnR4hSBu/Qt4qWsip9NDE/R7AtbBiX1GKC
	V0ATof7Ny4ZRXMgO50thr+lJ0dTO6RYXMtu3nwehW
X-Gm-Gg: ASbGncuJNnor8xS7vj11HAgDWT1SX1bwPwitUqqPUiIK2rnKS9WEVGjTXExbxK87hy6
	ZgSrjmVDSh2rcHxsoNVyl95F2gbonaFLTr+Pi4EVJqdBcxkR8oDNAEL1ADbxItGXG/DKr63q8id
	vN3dICrdxGq4Z3J/9q2WYQhg0rUjav36JYcu0SAq5Xo5Qk5Do9wLdCE+spEIvG3EKwzoHrNiwlQ
	UlKlcl7ypFM8bl5AZdmwciSjA==
X-Google-Smtp-Source: AGHT+IEwz3FB3i63JUlDizKlKFLIMm5I13VlasfnbwjfR4YX2pffIoWLATjFY51kSeKijUik2nVHlu+EnaAdU+CfakY=
X-Received: by 2002:a05:622a:2b46:b0:4b2:8ac4:ef57 with SMTP id
 d75a77b69052e-4b29ffc0c7bmr28111071cf.78.1755780422300; Thu, 21 Aug 2025
 05:47:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815083930.10547-1-chia-yu.chang@nokia-bell-labs.com> <20250815083930.10547-12-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250815083930.10547-12-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 21 Aug 2025 05:46:49 -0700
X-Gm-Features: Ac12FXz4nWLVsht97nfgNdGgE1s4G1y9w8ArleUb8uD5uJxc6BIM7EIe7pA-Kak
Message-ID: <CANn89i+qYjt45-qO11vu_v=TrK7tn-C=iA5q7bw9YbK-qe5KZA@mail.gmail.com>
Subject: Re: [PATCH v15 net-next 11/14] tcp: accecn: AccECN option send control
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, linux-doc@vger.kernel.org, corbet@lwn.net, 
	horms@kernel.org, dsahern@kernel.org, kuniyu@amazon.com, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com, 
	kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com, 
	jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch, 
	donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org, 
	ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 1:40=E2=80=AFAM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Instead of sending the option in every ACK, limit sending to
> those ACKs where the option is necessary:
> - Handshake
> - "Change-triggered ACK" + the ACK following it. The
>   2nd ACK is necessary to unambiguously indicate which
>   of the ECN byte counters in increasing. The first
>   ACK has two counters increasing due to the ecnfield
>   edge.
> - ACKs with CE to allow CEP delta validations to take
>   advantage of the option.
> - Force option to be sent every at least once per 2^22
>   bytes. The check is done using the bit edges of the
>   byte counters (avoids need for extra variables).
> - AccECN option beacon to send a few times per RTT even if
>   nothing in the ECN state requires that. The default is 3
>   times per RTT, and its period can be set via
>   sysctl_tcp_ecn_option_beacon.
>
> Below are the pahole outcomes before and after this patch,
> in which the group size of tcp_sock_write_tx is increased
> from 89 to 97 due to the new u64 accecn_opt_tstamp member:
>
> [BEFORE THIS PATCH]
> struct tcp_sock {
>     [...]
>     u64                        tcp_wstamp_ns;        /*  2488     8 */
>     struct list_head           tsorted_sent_queue;   /*  2496    16 */
>
>     [...]
>     __cacheline_group_end__tcp_sock_write_tx[0];     /*  2521     0 */
>     __cacheline_group_begin__tcp_sock_write_txrx[0]; /*  2521     0 */
>     u8                         nonagle:4;            /*  2521: 0  1 */
>     u8                         rate_app_limited:1;   /*  2521: 4  1 */
>     /* XXX 3 bits hole, try to pack */
>
>     /* Force alignment to the next boundary: */
>     u8                         :0;
>     u8                         received_ce_pending:4;/*  2522: 0  1 */
>     u8                         unused2:4;            /*  2522: 4  1 */
>     u8                         accecn_minlen:2;      /*  2523: 0  1 */
>     u8                         est_ecnfield:2;       /*  2523: 2  1 */
>     u8                         unused3:4;            /*  2523: 4  1 */
>
>     [...]
>     __cacheline_group_end__tcp_sock_write_txrx[0];   /*  2628     0 */
>
>     [...]
>     /* size: 3200, cachelines: 50, members: 171 */
> }
>
> [AFTER THIS PATCH]
> struct tcp_sock {
>     [...]
>     u64                        tcp_wstamp_ns;        /*  2488     8 */
>     u64                        accecn_opt_tstamp;    /*  2596     8 */
>     struct list_head           tsorted_sent_queue;   /*  2504    16 */
>
>     [...]
>     __cacheline_group_end__tcp_sock_write_tx[0];     /*  2529     0 */
>     __cacheline_group_begin__tcp_sock_write_txrx[0]; /*  2529     0 */
>     u8                         nonagle:4;            /*  2529: 0  1 */
>     u8                         rate_app_limited:1;   /*  2529: 4  1 */
>     /* XXX 3 bits hole, try to pack */
>
>     /* Force alignment to the next boundary: */
>     u8                         :0;
>     u8                         received_ce_pending:4;/*  2530: 0  1 */
>     u8                         unused2:4;            /*  2530: 4  1 */
>     u8                         accecn_minlen:2;      /*  2531: 0  1 */
>     u8                         est_ecnfield:2;       /*  2531: 2  1 */
>     u8                         accecn_opt_demand:2;  /*  2531: 4  1 */
>     u8                         prev_ecnfield:2;      /*  2531: 6  1 */
>
>     [...]
>     __cacheline_group_end__tcp_sock_write_txrx[0];   /*  2636     0 */
>
>     [...]
>     /* size: 3200, cachelines: 50, members: 173 */
> }
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Co-developed-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
>

Reviewed-by: Eric Dumazet <edumazet@google.com>

