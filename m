Return-Path: <linux-doc+bounces-39014-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF0EA403E1
	for <lists+linux-doc@lfdr.de>; Sat, 22 Feb 2025 01:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 663FE16C9B5
	for <lists+linux-doc@lfdr.de>; Sat, 22 Feb 2025 00:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B723D81;
	Sat, 22 Feb 2025 00:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3VDXjXhl"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7A520ED
	for <linux-doc@vger.kernel.org>; Sat, 22 Feb 2025 00:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740182937; cv=none; b=ILvGb4jRMU1CH56yYAi3WnCECJpESIEEbc5axWfVa4AQCRe2HobsEhIsHX5K/138XFpriVglAEwjV0p4zQfhf57RLXhOfFdleAO9QN/CzK110aeXJGJh+DI0rY2c2vsXg0U3eKpSWIFKHgoIcaDo9ADYfxaRDn4kMGkw59bIP9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740182937; c=relaxed/simple;
	bh=PdvNIGHQi28mOeEpG9qqj09SgaiMTVaG11C/XJdJ5Ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4qFIoY5puwgJXJk6Y2uxMiYaCAuKbdIYsbpDpxJ7xC7pHh3YMvEJP0rnO0shLJ2q1CRAp00TzxrCI6CR9zktAPX7kXgybQxN7POIvsJd/dMcOrlTZCGzv2bG45B3D5LBBkVkUjYdeS9eChhTJ6H9eid/jKZW+7B3fneqJX8O7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3VDXjXhl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22117c396baso31655ad.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 16:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740182935; x=1740787735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LxlF2XPfvnxZQ102MjlGXWCnz/+GLqNslH9rkDQj9E=;
        b=3VDXjXhlKsicl4qvrvmhgcf/JPDjS7t0lstX2si0dOioTTINRnLZ++N6fd2KYYNDc0
         SFiHoKRCtBaQLLCxluInYkdOF3IxNoQ9rVMhKcQIlq5kVy1AjxIcjBFqB6lNlpLqKJxT
         xYfoofA9msgYYOvQeILwWGSFaHeSvfv+9Gm6hmzbspC+2vPKOBGv02yL0y3BiqVunMQO
         VZCffSrv70KHqgPTCJ07a35xTnPsPsdEk5mZPocr/BTO3HCB/J5qHiem9GuRZn3gqnlU
         uEUoOd6/GNpxnVSTlA4BMdvErAFf1OBBougXgugYMpsV0YiUfotm1K05msjIWtD9vsg8
         hosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740182935; x=1740787735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LxlF2XPfvnxZQ102MjlGXWCnz/+GLqNslH9rkDQj9E=;
        b=fuz7TrxIPeXqSrr+GOpyM5LPu7aNJ2/J0oRHE0fviTvdrd8CSJN2IrpXXeu+vwQjNO
         OUzxDZrqoB8qCnmbmVUq+QANev+wGJ3fbKm5fWmzorRacV6CfC6PGSSwnWtb9tDuVUcu
         alaVtP+lIamu/81V9F8n39vD4SHFrqRwJytz1CXofotl74YBmKvKsytP1pYaHFKMnQNX
         RXRQc1gQ2rcTihUreAOfsjixQ4E3mI542HedAlIhdbugOa6XBaO9jjwJZSEEGkDvhfzL
         w9tu79I+4WKvpyxIQ1RM68x7dK53Khu8BTBjrO18O8mpJXVx3qy3v1f2iYtTtro1OgCh
         CFoA==
X-Forwarded-Encrypted: i=1; AJvYcCVFlnENlZz11+zIc24/o8qleMAH7NF34tH3+xeZWE8GM9ZVBzpvRrdVBY4CNy4E36ogxy7mRIH5TmI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yydx2qurXH7xaSyNxX5+93t2u764+wl+TzAkNsPvZiMATWEetFN
	3cS5gd3b7IALC3LafwKdILvBrVuvki7ZjEP1oFqX45l6Pj7ANsRQzxjI0UnaOiDnS80uns3Hk8F
	xq2a7PbI/tGWHDkSg32fA+attpGuM/LAZdxKA
X-Gm-Gg: ASbGncs/lpkI9U4E41HXQa1BHBaDWqz2ij5eMIN4cx+3ca9CL/L1uTiKBAD8mqpATw0
	YwaqilEWe5xj6iZjhetaQ1Kmn7sp+dLgdjs1P8FV8grMCJjpq27kK16kGdYSI2OqDIu8m0tI7GM
	F8ePh25KA=
X-Google-Smtp-Source: AGHT+IFs8OSDbikLuc4z8Je8QeS+ag2Wiy+VmDy4SB3aG6a3gth4nejCH8UkdT2ijydQhcSXWuEfpYlNQX3au+sfJ1A=
X-Received: by 2002:a17:902:e852:b0:216:6dab:8042 with SMTP id
 d9443c01a7336-221b9d2e706mr1003815ad.12.1740182935131; Fri, 21 Feb 2025
 16:08:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220020914.895431-1-almasrymina@google.com>
 <20250220020914.895431-10-almasrymina@google.com> <Z7eKHlA0rCF2Wgxb@mini-arch>
In-Reply-To: <Z7eKHlA0rCF2Wgxb@mini-arch>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 21 Feb 2025 16:08:42 -0800
X-Gm-Features: AWEUYZmBWXmjjwtaXgQB3UGLCCYTeJGLoZajHgAmTK8d-xFcEm-al47z60fCJhk
Message-ID: <CAHS8izPA2eQ251-whnsT7ghG01c0e=tERL4Cwg1tBr+ZfVNHpA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 9/9] selftests: ncdevmem: Implement devmem TCP TX
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Shailend Chand <shailend@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn <willemb@google.com>, David Ahern <dsahern@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	sdf@fomichev.me, asml.silence@gmail.com, dw@davidwei.uk, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Victor Nogueira <victor@mojatatu.com>, 
	Pedro Tammela <pctammela@mojatatu.com>, Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stan,

Thank you very much for testing. I was wondering/worried that there
will be some churn in getting the test working on both our setups.
It's not unheard of I think because your ncdevmem changes had to go
through a couple of iterations to work for our slightly different
setups, but do bear with me. Thanks!

On Thu, Feb 20, 2025 at 12:01=E2=80=AFPM Stanislav Fomichev
<stfomichev@gmail.com> wrote:
> > @@ -25,18 +25,36 @@ def check_rx(cfg) -> None:
> >      require_devmem(cfg)
> >
> >      port =3D rand_port()
> > -    listen_cmd =3D f"./ncdevmem -l -f {cfg.ifname} -s {cfg.v6} -p {por=
t}"
> > +    listen_cmd =3D f"{cfg.bin_local} -l -f {cfg.ifname} -s {cfg.v6} -p=
 {port}"
> >
> >      with bkg(listen_cmd) as socat:
> >          wait_port_listen(port)
> > -        cmd(f"echo -e \"hello\\nworld\"| socat -u - TCP6:[{cfg.v6}]:{p=
ort}", host=3Dcfg.remote, shell=3DTrue)
> > +        cmd(f"echo -e \"hello\\nworld\"| socat -u - TCP6:{cfg.v6}:{por=
t},bind=3D{cfg.remote_v6}:{port}", host=3Dcfg.remote, shell=3DTrue)
>
> IPv6 address need to be wrapped into [], so has to be at least:
>         socat -u - TCP6:[{cfg.v6}]:{port},bind=3D[{cfg.remote_v6}]:{port}
>

Yeah, I will need to propagate the ncdevmem ipv4 support to devmem.py
in the future, but unnecessary for this series. Will do.

> But not sure why we care here about bind address here, let the kernel
> figure out the routing.
>

I will need to add this in the future to support my 5-tuple flow
steering setup in the future, but it is indeed unnecessary for this
series. Additionally the bind in the check_tx test is unnecessary,
removed there as well. Lets see if it works for you.

> Also, seems like "bkg(listen_cmd)" needs to be "bkg(listen_cmd,
> exit_wait=3DTrue)", otherwise sometimes I see racy empty result.

It passes for me with/without, but also fine, will do!

Thanks again for testing!

--=20
Thanks,
Mina

