Return-Path: <linux-doc+bounces-59906-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0336B52EAA
	for <lists+linux-doc@lfdr.de>; Thu, 11 Sep 2025 12:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1C3A1C2201F
	for <lists+linux-doc@lfdr.de>; Thu, 11 Sep 2025 10:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAB4311944;
	Thu, 11 Sep 2025 10:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NiCS0//c"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250C8347D0
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 10:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757586981; cv=none; b=jdRFqSY6WaehtdzRA949+HmAFps5FmBai8muOYOF1BvTrNlkaEa1m6tc7RfzPdJT5vn7+hZKctl8cz3qUm85hOssisciOEcrIAq4LwqSCDBbG1qzgcsEpwOmm6Wko5yyVCL4I8vy6BbpFrs01AoNESQkvky3UwMFwelV+Eu/5N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757586981; c=relaxed/simple;
	bh=fzU09DMCAq3+s6xAcPw9iQSsM2DMfpbhX8B7RMRaHmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cA9sJhnUeJZEilj3gF09ka4CYn2xi9jTQLflt9cVa7GoNH9QAG8ouLG/tYDr19lOfpzPGdZ/Hy84+8k8q568Fi8aovE8wWhL9YpIDAMTuoxG6+AfUKR7oScGf+rXcxDqPhcZ9fvo/7b6NcnPnWIThd5foZ0Vpo+Ozo8FvfSEekk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NiCS0//c; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-810e642c0bbso56054585a.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 03:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757586978; x=1758191778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIp65c74emW84B2YnB6/i2/DDD4Hn+llC22C9hRiCnk=;
        b=NiCS0//cSD0FrocGwKmaptnuhyVu+xdGCjs7S41OVTIIIVnZ0ISxW/VHKQ71EGMwpY
         0Q3RkgOaPwXrnh/ywwA8douNZwBVnTfp3zMH0pV/jIVwBGu/OzJTW2qQKXAvrz04ZV6H
         6HubEQF3Wpt5a2Sqh/+lKXYyavdvqYRUkJuQ8ZrqGlZAp/RmetqYfprBI1M0UKsn7FkR
         k6R3W7S2mVe7e185GenMupvOZmtUrZXG1LJCGujqHx0QMX1twaB3qE/06s39IhB6Yhc4
         ca25L/CY0OfcyP4JyoxOWSZTOTbCDu12yhFJoZ4wPQt/Fh9MlpQpLAnkiXXfK34r6B6t
         6Utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757586978; x=1758191778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIp65c74emW84B2YnB6/i2/DDD4Hn+llC22C9hRiCnk=;
        b=G2MiPlzE7exw2cFHsETfD57I9jqc1s4wTmj4cIcQY7zZzd0QuxeFJz5XQbepK88LwG
         gvOa7mmBW75yU1B/irykUqVoTno1paWc5a3vUKR6+OSS3gS3H/rmDA/e0P5NUg5Ig0/U
         vZJ0gsylxVa6mWG1h+OPrsQ0s1gRyaA8Tstlycx/6fVbhA8zSLHinJJGaY9fatm7sHQo
         1/wYRkSH9nBFnPSqRNKLwcTA5KpcNf9SFHFn4dPIbLsoNGBdiBYacJ86hmIH2nkrBj8w
         aaoXhkUW6ALdyHHnAQcuY0axk0HXTXasyExTG1fRLMGeXPrus1nKgOM8q8qbaEDgbPYB
         uY4g==
X-Forwarded-Encrypted: i=1; AJvYcCURq3z2n0zOmeJOYrNY65u03NgW1SowEl98cxri8hUzbHaQTuJDbMy8hQx1dxdlNEQAGAvA3Lra6YY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTRsokJZDJ9Lv/r90115we1O54oLXl5X4CZfV1mzU3i6GhKpck
	lEWz/tk7tUEFtg5maHHZVTRMykoLs9fOp4jZrC2wBVBS1yQUpYMt4jAnsPzb0sIqh1dz4NA5UMD
	7TWBd/ieFSRyXlosWjmMd0vagMPi93OavL10HDVsK
X-Gm-Gg: ASbGnctoXGTJRw0ZTjFaNh2nDtSdxrL7oCEjigqRoaRnmJRCYnujHy6h3kQUiQ78gkO
	pc+Tg9wuOhUxWNLGtLzR140n87U/eJtzmPgfHlnT9sl3wYxj72o/C0HmHNg1PkSKrF2Xj5RI49/
	rcHjLS3kQ5U5YGprzMznCwF7MfsWFwj+OzNWv0bJ++xT+61LKIjL9fFcG9Wfme3qavDaap/c2dX
	OvxHqUXDmZrWg==
X-Google-Smtp-Source: AGHT+IHkeK8FRTt1/uOZZvt19SPsFH61ba3vv8ohKTWkwH3zfvM5AA5iGlKW7xE0TOEjkPaubARP4koKOEFkohcuvOU=
X-Received: by 2002:a05:620a:2985:b0:7fd:6709:f08d with SMTP id
 af79cd13be357-813c70b42a3mr1975265785a.81.1757586977361; Thu, 11 Sep 2025
 03:36:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908173408.79715-1-chia-yu.chang@nokia-bell-labs.com> <20250908173408.79715-13-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250908173408.79715-13-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 11 Sep 2025 03:36:05 -0700
X-Gm-Features: Ac12FXy6oEMGb8kpdEpmCoxkyIVYHYpg1RYuIGBFn_nQMm1knd9KsxNR4ndbi6g
Message-ID: <CANn89iJcyWE_SxM+sHWM_Es8KibOQpfs+HUTD0G+bnHr3WQn-A@mail.gmail.com>
Subject: Re: [PATCH v17 net-next 12/14] tcp: accecn: AccECN option failure handling
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

On Mon, Sep 8, 2025 at 10:34=E2=80=AFAM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> AccECN option may fail in various way, handle these:
> - Attempt to negotiate the use of AccECN on the 1st retransmitted SYN
>         - From the 2nd retransmitted SYN, stop AccECN negotiation
> - Remove option from SYN/ACK rexmits to handle blackholes
> - If no option arrives in SYN/ACK, assume Option is not usable
>         - If an option arrives later, re-enabled
> - If option is zeroed, disable AccECN option processing
>
> This patch use existing padding bits in tcp_request_sock and
> holes in tcp_sock without increasing the size.
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>


...

> diff --git a/include/uapi/linux/tcp.h b/include/uapi/linux/tcp.h
> index 53e0e85b52be..00604b7f2f3f 100644
> --- a/include/uapi/linux/tcp.h
> +++ b/include/uapi/linux/tcp.h
> @@ -316,6 +316,8 @@ struct tcp_info {
>                                          * in milliseconds, including any
>                                          * unfinished recovery.
>                                          */
> +       __u16   tcpi_accecn_fail_mode;
> +       __u16   tcpi_accecn_opt_seen;

We never add fields in the middle of tcp_info , even in a patch series.

Some people might miss this rule in the future, by looking at a patch
doing this,
and repeating the mistake...


>         __u32   tcpi_received_ce;    /* # of CE marks received */
>         __u32   tcpi_delivered_e1_bytes;  /* Accurate ECN byte counters *=
/
>         __u32   tcpi_delivered_e0_bytes;

