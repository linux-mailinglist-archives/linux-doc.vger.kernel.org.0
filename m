Return-Path: <linux-doc+bounces-73461-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FwQNhrwcGk+awAAu9opvQ
	(envelope-from <linux-doc+bounces-73461-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 16:26:18 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D71659277
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 16:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4C63B70BEA6
	for <lists+linux-doc@lfdr.de>; Wed, 21 Jan 2026 14:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399194418EB;
	Wed, 21 Jan 2026 14:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JuQvBZUM"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AD930EF94
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 14:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006701; cv=pass; b=k11C2uR9P8qNzcbTpgMl4NGgqUjdwAZ6OSpzR9LGGeFUGNe9sz5irBIvb3wv+Q2Ix4kGn71vOYdq0ACwIoRjTt/EqvZSsUellVqhUskeLD9y5Ig+p5iTMIGU26OvrV38enjq+F05KHmRy1nxql39isKBzZ/RKQZvz5BucBkIyJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006701; c=relaxed/simple;
	bh=Xu/hTwMLUvS81y97PgpDx0XsQ5SQXxVaA2e6jtW6itk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ghv8KBtcT6DMZ6JYugxcGl19LanzvmLsVa1IR0dPtqWSkZattSiILcFsC5KptG3Rj1iUEjM4TeIsh3j5Y6xtEg5MR1rcpuHM/qlt0U4TEdLUNDMjLR2BfayamaOHUEkscUzoEooa+DaoFEwoSNZ3nbVsJ7eI0sGh0ByySMAXjHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JuQvBZUM; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5018ec2ae21so57629561cf.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 06:44:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769006698; cv=none;
        d=google.com; s=arc-20240605;
        b=DGamCH+pFEiW2T+q1Z+7VvpXlXA5veiYeSJNQQoguMvjMKRWO55qOrAkkec4Oh4LZj
         PHLNrjAESFY6nBxwtI4B8kx5mJsBoxRC/R8lxXNwViwJbrfkljOdWewsl6wWF/Q2vjYL
         es3IVyFcClUAXUo2+UuyfdrE/Trxywu6o/a4iTsPBcD5h4mW4ycFX0fLqO5ZtnY3k4mN
         5ZvMI+Vmrihu/tl4QR1DGZcjK8m67nx8S7BC0yzKEbJJ8SqBT6YQoRGldD4b0NCo7Bq3
         fReu4Z/6IjjOMgRmUx5zNYqFmuO9v+T9Uk4gf7LGJb8OQNXW/QSngYsHB2QA6x9epi+M
         rLnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WDknDeeriRuUySYC4BIAbGBmZKe22ziZVXk3IrvrB/Q=;
        fh=TJKvygQVL8kEix4MBfuK41Eu5Y134eL8/tuE/xD61m0=;
        b=JFmg693ewXzdZyGIzl8nplIy4wl8ZNWf5+/YpX3FMuuWGwKaWLUUy6BabSdwao/2Lo
         RzH++qqvsORDJ7Qpdh5TowR7heKzOzM2j+9t0a5k7nq6PQTKxTXrN6106pu0Vlea4FCY
         KjnPbf5xs+7ZMzNR2rngCjw1DHR74+PnHpd+zm2RxKS3zGtUX5+vn8nz5ySiVR83vHAO
         N3UBSDZfBeZ8vb6uUar03vlRq4AdmTQ3p0YDffjPtD72kd3j3WUWQ44Q0FUl1H4d1S8M
         3gzPjCD4Z162yIsYkoXs09kSdJYaFv1c3Qr4Eq+lhZsQeFtAqBCkeU28kkBaiD2C/+IC
         IrWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769006698; x=1769611498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDknDeeriRuUySYC4BIAbGBmZKe22ziZVXk3IrvrB/Q=;
        b=JuQvBZUMHV8GkQ3lzJYfdnQSMm4I6zL7A0RLc3DyjQw3Mbcd8OIh5NCJtQw/sjopJA
         9/1MeMk7SYiiaRO5wVZfUZgKWR/AFdT26uMakfQ0NX7Jjm8XoUcW/D6PfDFUpUpnzAiF
         iv1uhgi+bfkm+kII3eD9OBZRyKdTbFNCS4fDS24MWA3SGzdF3WZ0KMul+LF0QO+1fgWP
         cmJ+nrWapmZTKD6jUKI1Ay6LZoW9NuSw/CkzlZw5ha7PynzLodke4JfvzFg018aEI9LS
         Qo0Bigw9jyGM101Q84orsOMJAsgBqHoTZSENBE84WBA37y9XFFZsivmguyV/AsHgneDM
         V4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769006698; x=1769611498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WDknDeeriRuUySYC4BIAbGBmZKe22ziZVXk3IrvrB/Q=;
        b=CVZyYcKQkwYMfTU2twTkbi3bcwFxsqNFJMtOipvLmrGVM1nrop7xCrG0MzVG9h+Ymf
         IlNxTbgT2ZqAzbKj9WtlYjFWEIvsPohQzhAk5S78iBdHiM5SvcvIRkJPrdIX2W/8X4bc
         9ThEf9NjCIL09e3qeZbOadcGCjBfkfe4nwOOn1A/fgS7SiovCW3R+BSjsVNfbPwtOlui
         X+K4mkSh1Fpfnqcm9Yr64Y/0r0jb8Emz6+VtN9CQPIt/Nhe+0EVAhBvjXr/t9EQCGAb/
         9SPPkD1oZIcSFODj9f2oXZa7NmWg+Yrx69COQ1X16yDUQosSlS2yHebz6kbi7OjnQIIL
         jpYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqVPaLCL3tBMBrDQpkaSlbUgETUseFutAqMTJy7saAPUZrtXmQgZB4inl72R08x8JSzAcMO1R48VM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/lBLQZfFo8RojTC/KrPT548i6SX6hdqMmZqJ+PHuOAr4Y2FDy
	Ub3F14EUA6CGNkWVRAhX9+wpXxCXd5jwmv2lB7cy1pkc3sQLAM/I7AQcI7LIxuybAhUIBiOZnIX
	f3JHf0v5uZ6EGMEeceeSg7u2amKtthEhLO0Skrg17
X-Gm-Gg: AZuq6aIIUkwZfaEF91g49Lq8ASF1O88n58oQc+FDAODRYBa767khkiPd+217LoMs93r
	CI4+tTRmh5ZF3xV2K8cD+dUoQG5QFGdCLNGZjmzl9vS+4SF0LUT0MD4tX4c2m1PHzBdBUj3vZJC
	iQMejfY1fUryTQuJYchmLFFkNQF2u4WWGNgOAPj3Sg/7J/DtoL0wSFfYLoQTn0GgCDbiJqeNXzm
	NGGrfXVZKUiuKlJZI+cv8BjC3REv3ZT7b2eu5e+SKNChrt84LFToyGgr9RO6gbKOx26bdM=
X-Received: by 2002:ac8:7f89:0:b0:501:50c4:a9fb with SMTP id
 d75a77b69052e-502d85c766dmr69283611cf.80.1769006697633; Wed, 21 Jan 2026
 06:44:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121143215.14717-1-chia-yu.chang@nokia-bell-labs.com> <20260121143215.14717-11-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260121143215.14717-11-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 21 Jan 2026 15:44:46 +0100
X-Gm-Features: AZwV_QglfYe-rR61PYDqNirvWqL5d8wU90xI4swixYbQudivaPcO8KkO1yRJQIE
Message-ID: <CANn89iJz1Au-kfk8Kp001vwvuxdndYX-Y++vB6NK5A_CBXVLHA@mail.gmail.com>
Subject: Re: [PATCH v10 net-next 10/15] tcp: accecn: unset ECT if receive or
 send ACE=0 in AccECN negotiaion
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
	TAGGED_FROM(0.00)[bounces-73461-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,nokia-bell-labs.com:email,mail.gmail.com:mid,ietf.org:url]
X-Rspamd-Queue-Id: 7D71659277
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 3:32=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Based on specification:
>   https://tools.ietf.org/id/draft-ietf-tcpm-accurate-ecn-28.txt
>
> Based on Section 3.1.5 of AccECN spec (RFC9768), a TCP Server in
> AccECN mode MUST NOT set ECT on any packet for the rest of the connection=
,
> if it has received or sent at least one valid SYN or Acceptable SYN/ACK
> with (AE,CWR,ECE) =3D (0,0,0) during the handshake.
>
> In addition, a host in AccECN mode that is feeding back the IP-ECN
> field on a SYN or SYN/ACK MUST feed back the IP-ECN field on the
> latest valid SYN or acceptable SYN/ACK to arrive.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>

Reviewed-by: Eric Dumazet <edumazet@google.com>

