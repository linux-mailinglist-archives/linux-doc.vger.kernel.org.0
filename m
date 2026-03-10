Return-Path: <linux-doc+bounces-78611-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DwcGajar2kzdAIAu9opvQ
	(envelope-from <linux-doc+bounces-78611-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 09:47:36 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7446F247935
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 09:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 97EDA30093B6
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 08:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6792443637B;
	Tue, 10 Mar 2026 08:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WfoLbIQA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1740542EECB
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 08:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132398; cv=pass; b=bIasNNt1gk5y9ymFtmA3zGpHDEybSfTEz/4eE77l/kQlZsbXCvfy2D196oSjyvadPB3uNvCpDwSY+j1xjCSx2+Rf3BCo0O8/NDDlJdYL+tfkbGCUKikvdg07bmL4RE7AxCb3HoMcOR+91GaXP2pr9I8VOe8GFXskytYIP5RqxEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132398; c=relaxed/simple;
	bh=RszETrACILeYN/zC7YLvxSjKCkmrXHy7cyN9O/Mz3ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qxNUSzSHTxHpq4i021rhPCv6XzDFIdSbo6hJGpf1vXdaj1PbsAsLPVzfawQhJlz9bXJBDB7/mT4XlveVXtl7tfZfnbbN2eJUcmYTbsbmxDLhZAK2/0IH5UoJZ5BmTnUWfhs/M/lzQ51mJUZ1psN8++RRbJOD2dExHRG9JGrfgl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WfoLbIQA; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50904a8f421so26140071cf.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 01:46:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773132396; cv=none;
        d=google.com; s=arc-20240605;
        b=ZlukUxzdgwAgprNJAwptAXYvzOcNwYn+VZZnCksGCfnqyR0B9MxNjEIlwMqfYr/CgT
         bZoZjAAEdzfDXxNf1x1Gj0/K4jxtF8SgjiqqGqN0YWQq53eYBqmHMn2U0LyseJVi1iZP
         RWud0JFjzb6Xr0siJ3K/h/uTCCfxvmYdWB2aebCib6gCHwUqxvJtpickVmndh89kwubd
         evpjvVTLdyPKdaeoWiqNlOvecqOrgiyHe1ilTvQArdqiWp4K36esGS/L76uvEyO9twAS
         nacVFFnYlmYJyVLI5+DlIvTOc+a7f89w8BYYuvcPTFs+jOJKoBvJzINx38etbUQ2XjXb
         Lqfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3nEimDqly9kpV/fuktlYtnq2NPSlAX7VPlv+iNqng0A=;
        fh=7+dzb8tG2cJQPBEHYVEIlbhlfy9wXwGYzY+c1eaDycM=;
        b=hnYARnyjdb8bQ6DEPBgzvOIsLNjkehz0bNtNawv+sRIhg94uHJKM4OnCGRtsbwXVhd
         I24718L+mWe/qMa0ErcraRxYsq6TQrzhCkO8Gyv2JMefCxBf4JVLKOaEMsgwhju8EC9l
         aCCHWLV8IZTJOZcO+R2sUiiNOztX6kETHMDboHeIUbIxGU6hM++sjV0c7F5cKG7a+V2f
         SWhRLRK2Z7EEv7jDtwUCjeVmCLpROZ7M78AqKU6bb4MDwqdk9WuEYrxojVB96hkKw+63
         PrsiSA9cHDYctqrSZwaZy4NCH4/8peCghMxvuNRfE2qgCCaZgZwZBciDK/urZeDpoewT
         Wbrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773132396; x=1773737196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nEimDqly9kpV/fuktlYtnq2NPSlAX7VPlv+iNqng0A=;
        b=WfoLbIQAD6GXIH2YYz4hBqNgFaASWppvh7aqRvCgMSoJK+r9lpVxAjRyzI69G5zxAM
         GCZYAQS6+GZyBzp2OxNDykljQK3vnDfi7y14Yea7YvEUhvTz2XjTgRbsagmtQ9bCmRM7
         /A68e0V1XxoDf5c3TZswd2LYDIqW7iIijVLbQmMlYau0H2m25MZRILLfCYwGacgvSPKL
         gRTgExW6j6eiTxE+VzNWqYWdUX5TWdWML8Hd+b0l5anKjAIaoiPIOdJd+8sFcjUlT35I
         2xe6xItTljxBeWLasuLgyjxvrD/lPRi0RlnTWarmTN+zKfvlTVR0brk8bN0sT9ZNsjTe
         kmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773132396; x=1773737196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3nEimDqly9kpV/fuktlYtnq2NPSlAX7VPlv+iNqng0A=;
        b=NQnYV6ffD3nUCeSUCbLxM15nSouxPASdykOcE3jieokUqln74x7ygf5tT1V4IwOLe6
         BiuitGGwQw3xSeepCdL2K9+Udh1H+uw9WzKRazfvmGV8cuAJPhc/wZr8C3aDu6N6pVEK
         1Hp6kHKi8w5jcvMEbhWHXPpkFaaEiFrpau5AxSgGjNvX40TgMzAxfQL/b0wRRxuCdFcm
         vKN+/fN2rNUBV70Xme75CCLmRREypNcUs2gxzpAXqv1FtIpEZQM4VfM6VfO7guJ5GtZO
         sgLMvlJ6ATvKpDvw5MzNBX3SsefsKv2364IfZD5T8v+AnXqb3ov8qMZ5I5orFOyxxk+l
         OFug==
X-Forwarded-Encrypted: i=1; AJvYcCXNjvflt7+/ufbwGTbUR8Ge650bm9hUdnKMCyeJvV+G6WGp/U7uaFuCHXRizrVWq7EY2iKCk5Ps7uk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo0iiTvMkt+3NM4QQYPtm2hPldemSfrkO2KityUSEany8asPbB
	DRSVdcLiA5vW9R4rK8q2fCubeEGeardsGvvbiEMdWgd16S0qi6QRCdfkp1L4R9ZbSwcAZ/2JpJ3
	PqUVlEBLbg7rL8Y03psQUPxrFQP4CcGrlzhKTVZdr
X-Gm-Gg: ATEYQzxlAZ39b6KrnarO+5x1N6lIGiPn6kqGA7o7LOUc8Xyy4+Oll0wsXGSOibNe51V
	9cu2l2qw6m8uIH8OzUhcULzmBVe3Auf86XiimjKJahh+QgMfgZ1vieiRF49zXL8rXlLF+MU1wxM
	vxaQ1UOXcXOmamxVonv7brQrFdj8lcp5UaSGYbmPBag/PY/bur6AfsG0jaW1Rzpmpy1R1T9qSgz
	ayeR3wzcpbWXyNjjZ87pe1hTRMM8wpXggbva7ZuRlLGKy7+fA3GE9kMtW6JD1KoVlZ8FGAZUFnc
	/kjMRvygFn/kgTAjVw==
X-Received: by 2002:a05:622a:1a84:b0:509:21f6:df9b with SMTP id
 d75a77b69052e-50921f6ea75mr47026791cf.15.1773132395635; Tue, 10 Mar 2026
 01:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com> <20260309-tcp_rfc7323_retract_wnd_rfc-v3-2-4c7f96b1ec69@gmail.com>
In-Reply-To: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-2-4c7f96b1ec69@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 10 Mar 2026 09:46:24 +0100
X-Gm-Features: AaiRm50AVSa2QQoRJnA4Sp6RmxAkhC4YiZSP7XkFIO_4j9Qiq68pO__J-NefzKc
Message-ID: <CANn89iJU2ejyGSm-OyBeRUNZpdzds6H-bNA8KnR085ekF+W0dw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/6] mptcp: keep rcv_mwnd_seq in sync with
 subflow rcv_wnd
To: gmbnomis@gmail.com
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Ahern <dsahern@kernel.org>, 
	Jon Maloy <jmaloy@redhat.com>, Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com, 
	Shuah Khan <shuah@kernel.org>, Stefano Brivio <sbrivio@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7446F247935
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-78611-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[google.com,davemloft.net,kernel.org,redhat.com,lwn.net,linuxfoundation.org,gmail.com,cloudflare.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edumazet@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 9, 2026 at 9:03=E2=80=AFAM Simon Baatz via B4 Relay
<devnull+gmbnomis.gmail.com@kernel.org> wrote:
>
> From: Simon Baatz <gmbnomis@gmail.com>
>
> MPTCP shares a receive window across subflows and applies it at the
> subflow level by adjusting each subflow's rcv_wnd when needed.  With
> the new TCP tracking of the maximum advertised window sequence,
> rcv_mwnd_seq must stay consistent with these subflow-level rcv_wnd
> adjustments.
>
> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>

