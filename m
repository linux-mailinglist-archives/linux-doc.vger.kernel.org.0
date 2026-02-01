Return-Path: <linux-doc+bounces-74818-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KdjLgIqf2l+lAIAu9opvQ
	(envelope-from <linux-doc+bounces-74818-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 01 Feb 2026 11:25:06 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DF351C56F1
	for <lists+linux-doc@lfdr.de>; Sun, 01 Feb 2026 11:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8094E3004422
	for <lists+linux-doc@lfdr.de>; Sun,  1 Feb 2026 10:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1022EC0A5;
	Sun,  1 Feb 2026 10:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MIjfYEv3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4256C2E8E07
	for <linux-doc@vger.kernel.org>; Sun,  1 Feb 2026 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769941500; cv=pass; b=SXHs4a7C6M8JtGQa5yHyLjBoO+i8SVQTcleHyOic+ijtzpXT+sHjiLobsp+vZ0fTEv9eRMReAcT4ycDscMfsP6WIuQGSeuGDqBg4o8umXcLI+WqIu9nOw4P8Y4nOCAXmUZT5qE0brOZGL/x/gDiILkWQItuvrej7I4z/YSaa42I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769941500; c=relaxed/simple;
	bh=c13X9iCoqEMpER2AIG5Pt/jrhfKFm2Mm4FnRZDWIDoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NCCCu3HkSjVEpVKFXdhYTLMy0jRtI1XQPdvbZf6w5KD43rKpKnQGElX4lziHqR3s+xr76cf4+QFQf8MvQ+S/D7DDyBms/tIeVq5NiEC+pxCDvfy/ZrPJkx8MIIdbgtfs18xl5MuLCh/c4v8l4o2rN0uExy5qA274P1kkTpcQTPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MIjfYEv3; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5032e951106so28738201cf.0
        for <linux-doc@vger.kernel.org>; Sun, 01 Feb 2026 02:24:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769941498; cv=none;
        d=google.com; s=arc-20240605;
        b=LCx1yV7fbyH+GgVkBUo8hd24+lYbRzY7QeDSAcSDT4XU9ZtniNnEmN/HGJrNQsISTx
         5QGxr4GYeIQFc3liieShhvNea1C1qYrhyNGk9ib/pk+poz7Lm8xiZC0/OYIyx/YRcXcq
         mHV0zAiH73ztINlCB3vHhyQaSByX8zYA2PQ9Oi1l4lR4LOjfROaBkwyA7bA+VJSIhSyj
         3CWSBO+PVeqkHkJsS0wiQHB4t5bve5YzKv8tPQgErhJncQCHS/r/RQgiP9MRZPZO6Sd9
         2qiwNLegwcMdkzVwFzTLHmOgQmBLkeq9QeT+X8T8ZPNBii63Z8MrufhaiA6HMP4R3fKc
         xZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c13X9iCoqEMpER2AIG5Pt/jrhfKFm2Mm4FnRZDWIDoY=;
        fh=n/0qjOfASZR9qNdUOP/BttC7mq9APrcrmR71Nce+cl4=;
        b=lroGmaBmr5HvfSgzGv9X/C3AsEaFF99scNrq8z64NV7fXOk4Nndmhhhev5Y0fxketv
         L+xpv14ATQ/vemmWk/LZDPpnUHZk7ff2MYYMVNH+GHUSkJxgrXc58RUofKLd6YFBqUSJ
         z4ALNnBqgP2Svka6Td29SuzN8p8ti0OxN0Nztl+h9nrOVGkAtxKSLHBunLrtGVtzjdrD
         ZH0WakCAv4yXVy2ENJwRnHx/61KkRojcJaAVUtq199o9VEKM8SX1X7E+A3adVHyKVSAo
         7F4ACSBJunB+tAEktFp2/SBBb3nT+xNIl/U0/bO74oBd1BSGVsUK2zcTQd/UNRdTjus4
         SIEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769941498; x=1770546298; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c13X9iCoqEMpER2AIG5Pt/jrhfKFm2Mm4FnRZDWIDoY=;
        b=MIjfYEv3Li6hV8HO6FS2uLcjF2ZAWGHiV2K89t/jxIh7U/LFzvM7tuO2Vr0/5fAJn7
         W1lfRwlTpWXhXqgkDo9uwtizhOwQRPz4HZdv+l/cD4zGjTfanmdcnduR+P22Hu5jZ7RI
         R/U9Zjx5A/YmVYq23CZNHb+ZCaXbCBvoHivYaqTxjcCCrz8ZCx6XpzR+TveF3oVJgxAP
         KSlevuxG50TfBx/Sb1MP1A9Cnj7QJCoMtBAKEl/rhCE8hMbQTz5NuwYkuJqx5vHQQ0hU
         RacLMLDg/KbdMT2Dz5cCfjeZF3CWGCPZVJVJJnnPi52nFe5T+rxN62m4NjSRllgAiQ+e
         rXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769941498; x=1770546298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c13X9iCoqEMpER2AIG5Pt/jrhfKFm2Mm4FnRZDWIDoY=;
        b=wptfNu9aVlYs7J9pj/tCt82LZ+hahRRrmmxWQO7V9Z3SkJG2syj54WGLJttPCiBxO+
         IgAoF7XcV/20RKlv3JLV+/Ju6Dwask6Q5pVk5iuEDFQ50716virBriXJxGkQJ34drLtO
         Q+gZ3uYscq3aMxZMNFDkrA8o1D9zUBgX8a+XX9ye4JUkQsnlxYuUDmfXtTmDnAkIqdVw
         wC4JeRc9Eg8gCO54LR3TBIrv+BKtxsSJHG58pMf2ZQN0Av1pF0dTVjO7qorMwPOUVfcr
         +5xvtcg5zF1Y+heYvP3AseA7BnmkL+2JRPL2eTPeBoQXxctEdsNZ5KkiktAnnFcr4Uco
         jVLg==
X-Forwarded-Encrypted: i=1; AJvYcCWFhs7qFgHVheLWDfQoE6hV0UxgpdcTSTjmLAjjXZetQ5RVSd9S2IOLfcTRFcVVtLXMAHjFqC/9YyY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8mq7/EV8Yrxf1HMXfHYedSKO2Hk3no1gWTyDB2BXQsvPKP0mZ
	rprEogAXaR+e4K/JZX1z8Z3FlhtUapKnSxTbJVLlhaQ8rwA4VwQ2BERwK9LaBBg5PoiJrW11YuK
	jLhy9rLtmpPb64h1QoDEZkiQ1hoJ0zxGYNJKRyOQN
X-Gm-Gg: AZuq6aLc/aRLLxTSIB26WTLapkpJMo+7aUmueINXB38sDIM9yYs/8cC5t5CGoIz70r2
	9l3+W5NreZuZ3x7B1l1ufZTqMK1pxsawV7XmUG249Ry08PPgHiQNlG4m0YOygf5SOdd9KmLxAYk
	unT/lv9QfDfn5T5SiIbrGeNoIGDNr2lnPel1ioi392M5vrQg9Pe9ic7KmEkV6dPNqAYuVNFv6pv
	EIWasou51uT84r7fGx5c0VjZzIYUp8aKfm8f8rwYl4scFDO/JF3KCiAqDn4Gto6rw0p01U=
X-Received: by 2002:a05:622a:510:b0:503:36ba:1315 with SMTP id
 d75a77b69052e-505d212dc92mr105121131cf.17.1769941497854; Sun, 01 Feb 2026
 02:24:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260131222515.8485-1-chia-yu.chang@nokia-bell-labs.com> <20260131222515.8485-13-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260131222515.8485-13-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 1 Feb 2026 11:24:46 +0100
X-Gm-Features: AZwV_Qje-4lGonBagy2Li1XCvjDteYMc2SXNllbyqn7JUJVP33Ro8aW2ZhSaRR4
Message-ID: <CANn89i+8vG=DiXrd9tbv2PCH_ALpDYUKsj5jm4Jk+G7Qp+2EPQ@mail.gmail.com>
Subject: Re: [PATCH v13 net-next 12/15] tcp: accecn: detect loss ACK w/ AccECN
 option and add TCP_ACCECN_OPTION_PERSIST
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-74818-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[redhat.com,nvidia.com,vger.kernel.org,lwn.net,kernel.org,google.com,gmail.com,mojatatu.com,networkplumber.org,resnulli.us,davemloft.net,lunn.ch,fiberby.net,nokia-bell-labs.com,cablelabs.com,ericsson.com,apple.com,gmx.at,comcast.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edumazet@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	RCPT_COUNT_TWELVE(0.00)[33];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nokia-bell-labs.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DF351C56F1
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 11:26=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com=
> wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Detect spurious retransmission of a previously sent ACK carrying the
> AccECN option after the second retransmission. Since this might be caused
> by the middlebox dropping ACK with options it does not recognize, disable
> the sending of the AccECN option in all subsequent ACKs. This patch
> follows Section 3.2.3.2.2 of AccECN spec (RFC9768), and a new field
> (accecn_opt_sent_w_dsack) is added to indicate that an AccECN option was
> sent with duplicate SACK info.
>
> Also, a new AccECN option sending mode is added to tcp_ecn_option sysctl:
> (TCP_ECN_OPTION_PERSIST), which ignores the AccECN fallback policy and
> persistently sends AccECN option once it fits into TCP option space.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Acked-by: Paolo Abeni <pabeni@redhat.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>

