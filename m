Return-Path: <linux-doc+bounces-19846-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A808B91E833
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jul 2024 21:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D48D1F228C1
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jul 2024 19:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B68916B739;
	Mon,  1 Jul 2024 19:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2MyhNwXk"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DDF16F27A
	for <linux-doc@vger.kernel.org>; Mon,  1 Jul 2024 19:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719860705; cv=none; b=pCvIH7XLNmA2z8bEcYrlASP23/cqFCWnoPPqyS/e5uyYMAzelfiGG5gWIs3wzpqc2f2FcBigkuMOq5sJnsfyKVcNoUGgf0LyGawqFAgFhmAA6KHnczQDu/p9YEEKmn6v3Uj9A5VjsKTqTw4Vl0gl0AG5j7Ub4J8i8ajLb+SVtWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719860705; c=relaxed/simple;
	bh=8k0AtF9KiolyJWuK8HLhDCv/hmVhr/rBk1ct5cuT9AA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tV5xhHm0OkRk3TAp5eCpb9SyYbZ+1XWYZIf4alRSHyPUHoHx0NJaY67hne8l1v4FtnxwNXMPenTv9KwQLYvF2DX7OKv38s+MQ31IzXfD70y8esWES4fukkjiSNm5axHh4C8VYe2vovValZKa7UOj77rE6d2baojeHEhwYZ0yT7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2MyhNwXk; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-79c06169e9cso236745585a.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Jul 2024 12:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719860702; x=1720465502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1iyaJckUfwKLOavZsL0Dti/NvsfMxOg4fM60nbeLb3c=;
        b=2MyhNwXkCa2AA3Z+FkWBFUSIczECBuY034xv2sUMnsVK1JAGLplHV/guNmfssGc5I1
         D8a0j2y08JPde7IkGpN8LX30r6ezveA3/hMjlXq8zLe04mWt0qnAaEPrTDd2BA5v2l+6
         Iv6dLD0aQ4owbIcrPfZLc6za9Tr+2iQ9eqqZvMOtORPI139I+ePbnZT4DFLnSJ0yCTX/
         I/orwGmbJSNtOjqGr9Dob5WykAAa2DWlpbQrXkaBJxQatFPLN+TjE2bJtG1b6pQdCRRg
         3423j6YO0fWBhsDvK3mvzQk7JxL7pIv0ng1zlCqmSW/aZyWSkjeH3DBPrQtlyq6xCOFw
         myxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719860702; x=1720465502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1iyaJckUfwKLOavZsL0Dti/NvsfMxOg4fM60nbeLb3c=;
        b=MWcPvW718SqxWPm2aA5JjkWe3FY9GN2rsWGA30wcDmmv+eEphfVprSCt1eE3CoZmGk
         mX3kqy5cxx0fZ+YimUZnCORn4iFTD3xPw0f5M2fDxm69cQ7UXldfRkEp+p/quCYLHblr
         N8l/dEWu89ow8AaevUjgJd4iRF9Q2DADB4RMIo2siiJfY8U7w0qsUSu64oA4erGCOTUW
         DEzoKww8E2pSRjFXZoOkZsHhknBti7OSP0XGwL1MngVjezzm9djDOeLeAULfbJEusXXj
         7qcpTPIC6TkgEgOn4mib2WaKavcG4XDAswR4/xUNJ1Kf6j+zXTx061/80JV23tZbvnkB
         biFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFLd7EqL3PymNVgI45X4SDc5rIcff+3YbQjExuBPafC421alcAx/mc/1tFgXGiYoT7axF7Laz2FcGA5ybCihIclNdghiu6pw0b
X-Gm-Message-State: AOJu0YxZwFlkiZU1YtSWJIn4ptwXkWVmvfZllOL3GHgSwLJV6e1+rLJS
	Qz78juEFL4/gGp2ETNXIu8+59NTB9QzO7QkGapK0IAT1/fX0BQ7CmwSGvXFDyCWtak751yD8ggi
	AvGr1znZMuvTcpS4ZR7nbzAoMu86YOv7XoeE2
X-Google-Smtp-Source: AGHT+IFMk/Fy8HmApu9Nagm7rkVtZNRgXI7ZtAkmxpMtHuX4P9lSyGrItN72Z9tf2GD9wH/LCrC3alUkG3t3FzAjxFY=
X-Received: by 2002:ad4:5762:0:b0:6b5:413a:3f96 with SMTP id
 6a1803df08f44-6b5b704f0e0mr82787156d6.10.1719860701461; Mon, 01 Jul 2024
 12:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628003253.1694510-1-almasrymina@google.com>
 <20240628003253.1694510-3-almasrymina@google.com> <m27ce9cris.fsf@gmail.com>
In-Reply-To: <m27ce9cris.fsf@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 1 Jul 2024 12:04:49 -0700
Message-ID: <CAHS8izNM8TjJ1DU+7gzq-0kH=tVeM6j-QsaKk=2FHNDF6RLwnA@mail.gmail.com>
Subject: Re: [PATCH net-next v15 02/14] net: netdev netlink api to bind
 dma-buf to a net device
To: Donald Hunter <donald.hunter@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Stanislav Fomichev <sdf@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 3:10=E2=80=AFAM Donald Hunter <donald.hunter@gmail.=
com> wrote:
>
> Mina Almasry <almasrymina@google.com> writes:
> > +  -
> > +    name: bind-dmabuf
> > +    attributes:
> > +      -
> > +        name: ifindex
> > +        doc: netdev ifindex to bind the dma-buf to.
>
> Minor nit:
>
> The series uses a mix of dmabuf and dma-buf but the doc additions
> (devmem.rst) consistently uses dmabuf. I think it would be helpful to be
> consistent here and say 'devmem dmabuf' in the docstring to highlight
> whos dmabuf it is and keep the generated netdev docs in alignment.
>

To be honest, even the dmabuf docs mixes 'dma-buf' and 'dmabuf', to my eye:

https://docs.kernel.org/driver-api/dma-buf.html

I can edit these docs I'm adding so these are consistent.

But on 'devmem dmabuf', not sure to be honest. Technically all dmabufs
are supported, even non-devmem ones. I'm not sure non-devmem dmabufs
are common at all, the only example I can think of is udmabuf whose
primary user is qemu and testing, so it's somewhat implied that the
dmabuf is devmem, and even if it isn't, it would be supported. I
prefer to keep the docs saying just 'dmabuf' as technically all are
supported. Maybe I should add a note about this somewhere in the
dedicated docs.

--=20
Thanks,
Mina

