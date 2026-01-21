Return-Path: <linux-doc+bounces-73488-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDdiMOb1cGmgbAAAu9opvQ
	(envelope-from <linux-doc+bounces-73488-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 16:51:02 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4184D597AC
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 16:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BA2DEAC7510
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 15:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A5C4A33E1;
	Wed, 21 Jan 2026 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZjExIxLc"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EC14A1390
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007491; cv=pass; b=mXsQYkP7d/FquTkmSjWXcpSJC/sTtYqyGhj8cNjhIeOhiQLCQ07XLWBDwqQmPQgoCcGOi5AcUFTKkBX3JywdRtP4wBIZ+Rp49j8Zy6ZKKu5L+FgD21/z1za9ANNO8qY6rj6fgVszK5R9PFlhmh8Yq/ODqbGgGZqZzf29TZSyXmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007491; c=relaxed/simple;
	bh=pXnTl94BbhB/76UcLMWFQmfo8hdhUhMeAxYtkkN1M+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBDTZqiYqVCDumlQzf57dHhvUBTkcXUUtXU7cdLhMsfjHeUTtdMovd2k49Cz3o9P5zSQHdw3N9B/cFEbKgNshamoEMSoWds94Nz3OgGUqjR6QbwdGUm2B1XYBVmW2cX0fmfJxcJyq45i5vmUR+f0ToknXrOQT5mDOtKIs6Uc3lY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZjExIxLc; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5028fb9d03bso53824891cf.3
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 06:58:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769007486; cv=none;
        d=google.com; s=arc-20240605;
        b=iRPO0tmZeHt63KRNHBDuQXeQ24ZaBc7C2JadJcuRCnk7rdjT/rLLebF8z7gwcBJ4PP
         Vyoz2B+yLGd1We7S3/trVnYTDPpxbhDclDDO4KTxzfRR0ejm20WqQlIbQiax6d+uCiSL
         2mxiKjgnVrBBc6vvMvB3WAiihquIY8LB4ava9gCtNUQr3GQK9U9xI4MBZfOQDydVjk0N
         bfAIU3vd6ytuTNyRCCblm8akw8DxYkvCkWvzAtNmhNS3MFqti8/ffP9IP7LczUBTbxsV
         do7jPI1LCqP0ozNb8mBg7sFJc+031ap/1I4MybQRGfUR7Q4e5X7pnz5GEJ4lcW66+QG2
         CKjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F/VqqIhXdgX7j/dXUyWw4LxUrc07WTrCM45z7FHNuOc=;
        fh=4SfLX0BLNnb8nGV2xAXFb56WbQ8H5G+nB+0kknrPtEM=;
        b=aWwAidIzeJzbYHaDN2QhTND6Sal8z/lbbpQM6SC0HMGZ5EUX62YBXz6sg7TW3h9i0t
         yZIzvyBZjLir4fkO5rSFUFo1E10I/Z107sJedLwGbaryoOrsIRVJFCZ3buaaAQmn7v1V
         XAilZksh/ZPKYkfZlDjFiH3JItnVxwTpVISBXEpoa3GHp6RI6CDq8L1e38u/4ZITwf8B
         UFnv+r8PG7Sufc7XAy2aGCTyaq4aYEAPYIQtXRJz+zXUd+5CEj/aQCUCo6rdegeEPFM9
         Tl0h2Sh5UTh362APfMpZYAedVHO3Ja1PxM1/f4ekk15VkbrNFW4Ggq3b6RcrXTy4zOyY
         pOTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769007486; x=1769612286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/VqqIhXdgX7j/dXUyWw4LxUrc07WTrCM45z7FHNuOc=;
        b=ZjExIxLc2LNqlP24QAI+e6v0pZxcrEgpu+95SusdGyi51+bDN1XnBwncQP1b0ZlZUy
         HQH1KhN4CzuV41ctbFYWvDmZ4TWXX4kHgXU3DH1EIUgxX2Ud+34hG2A55SeTLmqKw9c1
         xnSA+aOQIIPWSvVGNDVLVmsIFwOFlyKyj7G9UJgbULURinDg1hgwAFme6ZzFNbfz4Ef9
         54O0ojMRsFrIZOCsXVmWH/wmVupVjp+L05gNkjOHsl73Nf7cDtHXpqZYLIov2KCctP8m
         kzLCuiZIAzeZo0n+Zh+KLbGphBEyzIwMC/HNlRnPyKtj39Cv/lnT0vaOOZapIHLFhZtU
         Jm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769007486; x=1769612286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F/VqqIhXdgX7j/dXUyWw4LxUrc07WTrCM45z7FHNuOc=;
        b=WjmBRtrC337oJOSIza36sDAMDk78P9//X79rzEDTV1GaciYSWwaOjW6GHlE6/CCvvK
         WAYSP4cayZs1Gv7O/7NGS6vkcMBt/0qEBn2m0Bc56DAm8kBzNwTCvtUMleS573kVvdTo
         KROc+tEPxcBjNmVVWp40YajRId+4gKtE5lwzTjoI/yZPszZwtXImna3QR5M/istFsUcw
         KwLLyW8rnEs0qjkcjR37rdEX0c599kpigx/jM6peYkSeNaul3/9JJ2pI4mqQgzzN5HQk
         6tKlOk9NyTUq3WQ6sP9rh9uCP3HLwFE/luPjDaO7JdZdL7lpG3jpPft8rWzyL7AkGp/d
         lwwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ3rfcPUi2yaqyXDESR7EuYmbUGbbzKBUGKayHGaOb1vazOwtGCCqqoz60yhQCGLOu+wUL27KNEr0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7IxMmmpCSEGkzEEgATgo9Iu0dBPEH+9HmthrGi2cW7poXz+wG
	lvfGobFmblF8+dzUsE7xARWzL6+iUj098SW+qqkyEa4Qhuq5IqwNrKIKd0wPEf+hWFQKV/T95JW
	BcxxIaN2mY46exIWKpdmwNluKdeYundPlXd7TBpxD
X-Gm-Gg: AZuq6aK8BImFwfBOtY48ckbnTv7//jjsHNkoZO5JKewdxDR1kYeSbn32EUxCa57R3iH
	wYm5TCDUpLgc/533r74HVZPmwQ3ybXSIRLQcTkOUWTTvgOv9BkT7QeXG0kDVCVHx2BHfq3FMNOZ
	yfjuY5uYp2IflqzkPBjkgGSprROZSrIaU7WHly1QoV9SBZdLkkVEaKaIK5dkzavKlO0lTq4Ie/q
	rEh4EhmEWsTNmmrKBk6Amk0R6zozkvk30NKFAgRuVVE263VQPvPssF/sKgvskCFZACqXy4=
X-Received: by 2002:a05:622a:1b8d:b0:502:a026:3157 with SMTP id
 d75a77b69052e-502a1757181mr221595791cf.41.1769007486020; Wed, 21 Jan 2026
 06:58:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121143215.14717-1-chia-yu.chang@nokia-bell-labs.com> <20260121143215.14717-14-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260121143215.14717-14-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 21 Jan 2026 15:57:53 +0100
X-Gm-Features: AZwV_Qj20kr6mRoNXbwQWdkosCn3zjOMui9Vi7kFMCTUHw3XP2Q1RPMTHZwkrjA
Message-ID: <CANn89iK3DOU4DX4=S-C7cKy-57DemUjToYVpYMT926mjFmyajg@mail.gmail.com>
Subject: Re: [PATCH v10 net-next 13/15] tcp: accecn: add tcpi_ecn_mode and
 tcpi_option2 in tcp_info
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, parav@nvidia.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, horms@kernel.org, dsahern@kernel.org, kuniyu@google.com, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, dave.taht@gmail.com, 
	jhs@mojatatu.com, kuba@kernel.org, stephen@networkplumber.org, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net, 
	andrew+netdev@lunn.ch, donald.hunter@gmail.com, ast@fiberby.net, 
	liuhangbin@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[redhat.com,nvidia.com,vger.kernel.org,lwn.net,kernel.org,google.com,gmail.com,mojatatu.com,networkplumber.org,resnulli.us,davemloft.net,lunn.ch,fiberby.net,nokia-bell-labs.com,cablelabs.com,ericsson.com,apple.com,gmx.at,comcast.com];
	TAGGED_FROM(0.00)[bounces-73488-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[google.com,reject];
	DKIM_TRACE(0.00)[google.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edumazet@google.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,mail.gmail.com:mid,nokia-bell-labs.com:email]
X-Rspamd-Queue-Id: 4184D597AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 3:32=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Add 2-bit tcpi_ecn_mode feild within tcp_info to indicate which ECN
> mode is negotiated: ECN_MODE_DISABLED, ECN_MODE_RFC3168, ECN_MODE_ACCECN,
> or ECN_MODE_PENDING. This is done by utilizing available bits from
> tcpi_accecn_opt_seen (reduced from 16 bits to 2 bits) and
> tcpi_accecn_fail_mode (reduced from 16 bits to 4 bits).
>
> Also, an extra 24-bit tcpi_options2 field is identified to represent
> newer options and connection features, as all 8 bits of tcpi_options
> field have been used.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Co-developed-by: Neal Cardwell <ncardwell@google.com>
> Signed-off-by: Neal Cardwell <ncardwell@google.com>
> ---
>

 +
>  struct tcp_info {
>         __u8    tcpi_state;
>         __u8    tcpi_ca_state;
> @@ -316,15 +334,17 @@ struct tcp_info {
>                                          * in milliseconds, including any
>                                          * unfinished recovery.
>                                          */
> -       __u32   tcpi_received_ce;    /* # of CE marks received */
> +       __u32   tcpi_received_ce;    /* # of CE marked segments received =
*/
>         __u32   tcpi_delivered_e1_bytes;  /* Accurate ECN byte counters *=
/
>         __u32   tcpi_delivered_e0_bytes;
>         __u32   tcpi_delivered_ce_bytes;
>         __u32   tcpi_received_e1_bytes;
>         __u32   tcpi_received_e0_bytes;
>         __u32   tcpi_received_ce_bytes;
> -       __u16   tcpi_accecn_fail_mode;
> -       __u16   tcpi_accecn_opt_seen;
> +       __u32   tcpi_ecn_mode:2,
> +               tcpi_accecn_opt_seen:2,
> +               tcpi_accecn_fail_mode:4,
> +               tcpi_options2:24;
>  };

I guess this is fine, iproute2 got no support yet for
tcpi_accecn_fail_mode / tcpi_accecn_opt_seen

Reviewed-by: Eric Dumazet <edumazet@google.com>

BTW, are you planning to patch iproute2 misc/ss soon ?

