Return-Path: <linux-doc+bounces-42735-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9610DA82BD3
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 18:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5312177910
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 15:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79C02673B7;
	Wed,  9 Apr 2025 15:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MZSN/I9Z"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C5A265CC6
	for <linux-doc@vger.kernel.org>; Wed,  9 Apr 2025 15:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744214343; cv=none; b=Td0jKmg7mMABHb91FPbJhP8s9VJhjIyk21R1V3DwY04Y6fs0XoNf05DSxJu8BenQp1d+ij+9+ib4TRJtXYFon3Xz8un59/i1Bkf47idB/xb6lc5TKH103FfrogQQpwZqRW9JsvoR7BWPmOqYmD2on9IkIPhfiMO6DuUfnjzVbAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744214343; c=relaxed/simple;
	bh=XcH7EcKvFmwxA3XYUg7s8/QJB4ZCktKtGLmASsozrng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uQ+bNY2TGivRCJM6uNu1OzTLqobAupBT4lgqXx8URsAVNqFsIojuM/qzUFvD1X2eszpVy9aZpXi2bTQiuFSWIxPehfo1EAFIhIVohcwAGp65x4qw5zrgvwaKwBRw07ddL6xJjn1nQFqWivtO88YAcS4cgRyDspHvZNXLS9AJs9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MZSN/I9Z; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4775ce8a4b0so119946761cf.1
        for <linux-doc@vger.kernel.org>; Wed, 09 Apr 2025 08:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744214341; x=1744819141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcH7EcKvFmwxA3XYUg7s8/QJB4ZCktKtGLmASsozrng=;
        b=MZSN/I9ZTBXnXbXn7NAaIKNt4H8XjYjVkO7mYEm5AOFzBwfUi/JDKRXIS73H/jNdrv
         ynKpFqe+xTMm9fRisFud4PyJqId+yKwYi6q/FzZMGzQlvomAehwqpX8pGJY7JEeLTJHh
         Wo3xfVw5qe7nnLk9hdgzglpc/Q5A4KRaKr7swf/RwyI59ticvz5v4SsQAJ/x4jy4tZfd
         7mv6Q7+1CaXPla6RRuo6GfxvrUP/2FaSai8ICB8zpglfBFOFOeN/l6CqxA5Dc5G6+Iqg
         OqGe8/9dbUB/HMQetf8jGPda/10v4LRRBlgnv8R7UsJG3po997isPFL3aZMNIucVXyd0
         qB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744214341; x=1744819141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcH7EcKvFmwxA3XYUg7s8/QJB4ZCktKtGLmASsozrng=;
        b=Htoqmc5+/SGj+W07xGMmBKGlE4WeMPSi1WtvPavY4YqweTF5WxvNLechY7Inzqe6w+
         J/ASorISxXbv2PJBc7fsL//F7VAK650+FRFRWtmV39T9RAy6hJQZfF8TwCK0QsYzM7nH
         +YVHIXWSfM6eBckBDQ6HOmwheYPu2CaXRAEDb2wXhG7/GQyCbmqMZ4F09vi45ITh6w4D
         NxC2mPofS8uNaQq9EZpinUWJQ5UX8IcuVtNcrRH6OZv6heeE/cxVyWaDIuIzZ3iAC+iR
         O9lISBHXpKyUL6HdN/6YHGSVnH6L9l9iutDmt/juhmC6VFN3FC37QYKj0PyikWgkeryt
         +1Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUy4tLsiD3Z+3n5hQ0yNrpjzszcipR+Z/h8NbisxzJafjToankzbE6rZp7+P+qMWaA0NOJzxLiukhg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0t3jo/9UYznhIllMDOWfbj+FhG/iYWPljDvKshtsTOTxzI4rN
	cAZ/gqLVnD+KDo/tw8pykUdMrTO2Bz9ivXcWnavS8Ecji4/z3wEPG27+ttAnMSkpDlQNFf7Wk+U
	1sda7LdoP1l1ee85dsnuYPKuEDewx+jbcx2JS
X-Gm-Gg: ASbGncuROgx7NRVslHID7ybxxsKfX0XxgMhsEA8lnl9qlms1cKxDH2vkZPuh8JXumPB
	huEbAMugvVOVaz9IR8s8R6SfIjxUW87RqtqT+RfMBdYJjg0L28KOZ+kEy5O3LhxP7ormDtiPlze
	YK6ereNpWFe6DeAMhZGpHT8g==
X-Google-Smtp-Source: AGHT+IH0RTESPK/NJ5Ou35TXpdrPGyuaN8DXVZD56fO3j6B3neA5pmFlXcOA2CYr67ILMi7s35IIrwWamYsSXF5CmhI=
X-Received: by 2002:a05:622a:1a0c:b0:476:6f90:395e with SMTP id
 d75a77b69052e-479600a8a0emr47831501cf.21.1744214341023; Wed, 09 Apr 2025
 08:59:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409112614.16153-1-jiayuan.chen@linux.dev>
In-Reply-To: <20250409112614.16153-1-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 9 Apr 2025 17:58:50 +0200
X-Gm-Features: ATxdqUGuWPO65Q8Izl_HTv6LGfTHz9AyxHrvgZCqKWrBazkw_CnhWTjlj0b-fTk
Message-ID: <CANn89iJi9+qn-QyrghvT5xZOvqi_FQX5iGeW3X0Ty=xRe9i2MA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/2] tcp: add a new TW_PAWS drop reason
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: kuba@kernel.org, mrpre@163.com, "David S. Miller" <davem@davemloft.net>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	David Ahern <dsahern@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Antony Antony <antony.antony@secunet.com>, 
	Christian Hopps <chopps@labn.net>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 1:27=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.dev=
> wrote:
>
> Devices in the networking path, such as firewalls, NATs, or routers, whic=
h
> can perform SNAT or DNAT, use addresses from their own limited address
> pools to masquerade the source address during forwarding, causing PAWS
> verification to fail more easily under TW status.
>
> Currently, packet loss statistics for PAWS can only be viewed through MIB=
,
> which is a global metric and cannot be precisely obtained through tracing
> to get the specific 4-tuple of the dropped packet. In the past, we had to
> use kprobe ret to retrieve relevant skb information from
> tcp_timewait_state_process().
>
> We add a drop_reason pointer and a new counter.

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks !

