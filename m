Return-Path: <linux-doc+bounces-20430-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE2992DCC7
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jul 2024 01:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE8A31C221FB
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jul 2024 23:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ABFF158D92;
	Wed, 10 Jul 2024 23:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dWrM/6qT"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90831586C4
	for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 23:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720654940; cv=none; b=mZaUL8Y+/p5Efp7ptmULZOVw/1hny6kdBP5P9gxnAH41eVQeU/WRj8aOwUbZP4gtwYLRMaVPjjYC4IIkEGA+UGk2M16awNAgiGtZdnm/kj9yZSAEC7ExOrd8xGXz6b4HutRk1d53rk2V1Waqt8uHYZ3Q02xow61o5pF7+5VOR5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720654940; c=relaxed/simple;
	bh=WmCXshM9BwamSUxd01N4bO9J01nXQuiD7Ah98aEMfxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uivR/Yf1TJZda5PxXD/Ib47dNgIU0fcchhzZGyQUEOeUMUgOT3Ai5PWcajDOc/pMvYel3Fa2gY+2BDo7HNBxxilQpLowB1qR7E+mamOVarWb1nQhn5Y+1Eql7zUJhqc48c4JIHy05Zf+7Lj8bkicbC/XV/16jWSb9wp02Ze4Hb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dWrM/6qT; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6b5d3113168so2040876d6.2
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 16:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720654936; x=1721259736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xw22ZH4c8gyTKnFajh7vcYEJsOdrHlsxvg9OLt0kZtA=;
        b=dWrM/6qT8jNEjecjc9s08cKSX4h+fb6bTc35XK4KJuziyKO+fD/7CbRZJ4UwApGsfl
         1W71iFYoXZAhm3NUXU7xD7Et5TuKbhgYB9RICTMsmQqsulI9HWNXvdCZHwLpiCf52//6
         G0IPDLquKspE/p1oSvCYSjr7fUwxb4l6eRxqgiHh75JUIw5D2hPSiYm8K+UJe5eH7SRd
         /dF+ZtLkEny2rN/U/siaCZX8u0XTToiPx05I65KGy53ugYyndbw8ILn+iDK4dSayMnmE
         xi0fKa2ZiL0jp2pJtdOoi+Vg+Muzkoc1dZnbx7V4UDdtpTsUIEoFy1CaPVb9D9iyk86J
         c36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720654936; x=1721259736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xw22ZH4c8gyTKnFajh7vcYEJsOdrHlsxvg9OLt0kZtA=;
        b=Efec32fhsZaTYdi6T1WCwWrDc13WeaK2Dt4YtkXELVTe14+gJyOa3Bd567Hbtyhhc6
         ul5edVi0Qs2MCtpJHGI9PRV8a/nA/UP311k+xafVk3oPuZlRKLEmuj9KC7EboP+0eSFl
         ekkb4c6Dvz2k4T22gdIr7Ni1Nkl8JEl1naxj/+730+CdSyG56aDu2nO1+vNYrMtzF8rF
         tmznir2tqvNQVJrnstzwOc0kP+IcEUozbjVsZkDAdhTgpvkXoKW+Dn+Zl3mzaf95o52C
         x0b8mX6C29swGI7mG0v2AWS3UKlvK4rHsoTXgKNNafdXv0/3LDs89cMUQNBlpOEfHqq2
         Y+gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH8BGwM1hHbSXDXzf/WekeHFqKlC6STwU+e3rGbPPeySkx//9To8Y5gO5jH45DMVRKbjzzYQSN+UBk1FYEXiaoEU4Rfsyqh/lb
X-Gm-Message-State: AOJu0YxO99XeQIYyou8Clh8N5qg9Yp07h24/75rt5wcqSIrs2mn9xdQZ
	LeCX/od1xc/DlvqkqDDokPDTUtiSRZmZ5IvAfqrQbH+4/ERtXs6CfBmYVAZSN5GdgNJ9TynLY29
	xUmuQ0fbVeH8EmffvcDCeTC6DlCA4F9QQDyGf
X-Google-Smtp-Source: AGHT+IGOLOQ6K3/3da49V2eHyCz+KQjRCyIEiAYnB4b8F1iCu2D4bkJxhlzGFfxvSjmRGC6gzv7EI1OWCLflWXtCr4A=
X-Received: by 2002:a05:6214:20e2:b0:6b5:9c9c:7baf with SMTP id
 6a1803df08f44-6b61bca896amr97392016d6.23.1720654936406; Wed, 10 Jul 2024
 16:42:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710001749.1388631-1-almasrymina@google.com>
 <20240710001749.1388631-6-almasrymina@google.com> <20240710094900.0f808684@kernel.org>
In-Reply-To: <20240710094900.0f808684@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 10 Jul 2024 16:42:04 -0700
Message-ID: <CAHS8izPTqsNQnQWKpDPTxULTFL4vr4k6j9Zw8TQzJVDBMXWMaA@mail.gmail.com>
Subject: Re: [PATCH net-next v16 05/13] page_pool: devmem support
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, linux-mm@kvack.org, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 9:49=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 10 Jul 2024 00:17:38 +0000 Mina Almasry wrote:
> > +static inline struct net_iov *__netmem_clear_lsb(netmem_ref netmem)
> > +{
> > +     return (struct net_iov *)((__force unsigned long)netmem & ~NET_IO=
V);
> > +}
> > +
> > +static inline unsigned long netmem_get_pp_magic(netmem_ref netmem)
> > +{
> > +     return __netmem_clear_lsb(netmem)->pp_magic;
> > +}
> > +
> > +static inline void netmem_or_pp_magic(netmem_ref netmem, unsigned long=
 pp_magic)
> > +{
> > +     __netmem_clear_lsb(netmem)->pp_magic |=3D pp_magic;
> > +}
> > +
> > +static inline void netmem_clear_pp_magic(netmem_ref netmem)
> > +{
> > +     __netmem_clear_lsb(netmem)->pp_magic =3D 0;
> > +}
> > +
> > +static inline struct page_pool *netmem_get_pp(netmem_ref netmem)
> > +{
> > +     return __netmem_clear_lsb(netmem)->pp;
> > +}
> > +
> > +static inline void netmem_set_pp(netmem_ref netmem, struct page_pool *=
pool)
> > +{
> > +     __netmem_clear_lsb(netmem)->pp =3D pool;
> > +}
>
> Why is all this stuff in the main header? It's really low level.
> Please put helpers which are only used by the core in a header
> under net/core/, like net/core/dev.h

Sorry none of those are only used by net/core/*. Pretty much all of
these are used by include/net/page_pool/helpers.h, and some have
callers in net/core/devmem.c or net/core/skbuff.c

Would you like me to move these pp specific looking ones to
include/net/page_pool/netmem.h or something similar?

--=20
Thanks,
Mina

