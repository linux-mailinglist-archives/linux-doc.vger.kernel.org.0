Return-Path: <linux-doc+bounces-18303-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD8D90432A
	for <lists+linux-doc@lfdr.de>; Tue, 11 Jun 2024 20:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DBD92830F1
	for <lists+linux-doc@lfdr.de>; Tue, 11 Jun 2024 18:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65DEE5B1FB;
	Tue, 11 Jun 2024 18:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ORBH1T28"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA1D5BAF0
	for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 18:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718129374; cv=none; b=fFDt7idQWKAqQxmCUlu3TcEVBY01ARapeVsUJ6W1/v+f+AW6uiN14V7m3nYj2sZ4wJAuei0M2EZdi1y/GKO42dUOxiDkOYIu4F5MUjVaMB573rmMT85Lh+EDMkTduHqfMwRM5onSgBBtTfbu3IBb8aajUpGPch+Une1Dsei7OFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718129374; c=relaxed/simple;
	bh=+lxPetrPpHvENSTokBRC6xognbIAj4RmicEAyuXDxTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQM6KKznUHizFz6FOsjxLcbkk3rXmZV/rk3jSZY6SBfvHgb6fuYC2mHDaXrWImcOLgf+XpCgR26tu06G97HwamPfWt8D4iWhsX/jzUb9x/lSCZ5B2xGE+3/SxlQIdXzQMvuzEXEaS3HaEkJ3Petb0zVPCIq0oS0NBTQLXcHFo1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ORBH1T28; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57c923e03caso1608973a12.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 11:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718129370; x=1718734170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lxPetrPpHvENSTokBRC6xognbIAj4RmicEAyuXDxTU=;
        b=ORBH1T28Kv+Gm9vfDRFh0o9KoHNuPBRhIxafHB3qgyANZSEAx+9LLa6Wv5Iv2FulVM
         1C4r4QsMP/tolax4DaWy4QrJlMTPTRDUpbMg8JdQqiADkwRyXa1Iy11Ylt5B7YbjRIRq
         OctBI7JiWrNqmKnqBVdhpMRueuExFqKOmwSK+7OfBSrsjK4SgORfTkvjgaMoS3DMo0Q7
         FkTsN8QksrcUNYzFDEG1UmAfTCd8yxst6SYakYd6YSlIZ9FEq+7SBeD6XMUjZNk9BCcy
         Wrv4JJvkiSqmCMz3b9EpLjg4cplFB6acY4gYixvwk4VoXVVCe+PzWeGjji2mognTN5AY
         C0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718129370; x=1718734170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lxPetrPpHvENSTokBRC6xognbIAj4RmicEAyuXDxTU=;
        b=CeJbNBLEoipWRpEKcYd4XLadyXt22fBOx2wARgsPtABNopdKsIxbM2ynLfl9gPEbiE
         e6/gZIGYGTDBkVD6wvaOVKrRY3QUrt5eBlHcshed1hl4bNm3k81d9pU6L+YnlMoHQjht
         0IIIvmiORdpZKqrEqTvDkgGFi+EIF/iVWAtsEZ2X6fFp/VBy6Yj0Q1gHV+k/7unMADwW
         a5EWBDp/KvmhqvQxqj4sFsnqbCTborEMM7JDkgSJhvbGSxvbYJidyrp1+Dpifpdu/xOl
         9dBsM+GU86O00Sc2m0cAs3BgN++f6WqG0pEEHrmLITLFHd7sT2dS3UhZK4aEYpJ/Gczr
         8hAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWErMDM+Je1gJLfTB7zp8/2597m4xfNJi6+ZuHJ96apjTQWZE2zWGRecbIjtAQe3xRFYtUOQ4A2zw9n6CFmYHBh0G3B4fcV9Swv
X-Gm-Message-State: AOJu0Yx5HL86ibzE9MSq69+F6659OSD6W0YCPboOCTRnWmTwtPIh7EWe
	HSQtUMus4J/DMbaYLSR0yPomsa6hnpGQN42ny30gxBVvfZvfMCqPJXv1p2eOobT+cBBW9pTD6Xu
	ihvXheYFcI02FppmhkAa66TYJKDdJbssLMb/t
X-Google-Smtp-Source: AGHT+IHSnbMlQQE9x/zPWpkI90JIlOTBHgyEzLn5RoXQZyiGaSSB2YwhfXwjdqq72pgI+LQF0hGDSafJjuWqavJQlB4=
X-Received: by 2002:a17:906:4742:b0:a6f:393a:9dea with SMTP id
 a640c23a62f3a-a6f393aa161mr132795366b.77.1718129370030; Tue, 11 Jun 2024
 11:09:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5aee4bba-ca65-443c-bd78-e5599b814a13@gmail.com>
 <CAHS8izNmT_NzgCu1pY1RKgJh+kP2rCL_90Gqau2Pkd3-48Q1_w@mail.gmail.com>
 <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com> <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
 <20240607145247.GG791043@ziepe.ca> <45803740-442c-4298-b47e-2d87ae5a6012@davidwei.uk>
 <54975459-7a5a-46ff-a9ae-dc16ceffbab4@gmail.com> <20240610121625.GI791043@ziepe.ca>
 <59443d14-1f1d-42bb-8be3-73e6e4a0b683@kernel.org> <00c67cf0-2bf3-4eaf-b200-ffe00d91593b@gmail.com>
 <20240610221500.GN791043@ziepe.ca>
In-Reply-To: <20240610221500.GN791043@ziepe.ca>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 11 Jun 2024 11:09:15 -0700
Message-ID: <CAHS8izNRd=f=jHgrYKKfzgcU3JzkZA1NkZnbQM+hfYd8-0NyBQ@mail.gmail.com>
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Pavel Begunkov <asml.silence@gmail.com>, David Ahern <dsahern@kernel.org>, 
	David Wei <dw@davidwei.uk>, Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 3:15=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Mon, Jun 10, 2024 at 08:20:08PM +0100, Pavel Begunkov wrote:
> > On 6/10/24 16:16, David Ahern wrote:
>
> > > > There is no reason you shouldn't be able to use your fast io_uring
> > > > completion and lifecycle flow with DMABUF backed memory. Those are =
not
> > > > widly different things and there is good reason they should work
> > > > together.
> >
> > Let's not mix up devmem TCP and dmabuf specifically, as I see it
> > your question was concerning the latter: "... DMABUF memory registered
> > through Mina's mechanism". io_uring's zcrx can trivially get dmabuf
> > support in future, as mentioned it's mostly the setup side. ABI,
> > buffer workflow and some details is a separate issue, and I don't
> > see how further integration aside from what we're already sharing
> > is beneficial, on opposite it'll complicate things.
>
> Again, I am talking about composability here, duplicating the DMABUF
> stuff into io_uring is not composable, it is just duplicating things.
>
> It does not match the view that there should be two distinct layers
> here, one that provides the pages and one that manages the
> lifecycle. As HCH pushes for pages either come from the allocator and
> get to use the struct folio or the come from a dmabuf and they
> don't. That is it, the only two choices.
>
> The iouring stuff is trying to confuse the source of the pages with
> the lifecycle - which is surely convenient, but is why Christoph is
> opposing it.
>

Just curious: in Pavel's effort, io_uring - which is not a device - is
trying to share memory with the page_pool, which is also not a device.
And Pavel is being asked to wrap the memory in a dmabuf. Is dmabuf
going to be the kernel's standard for any memory sharing between any 2
components in the future, even when they're not devices? As in you
expect dmabuf exporters which are not devices to be added to the
kernel? Currently the only dmabuf exporter which is not a device
(AFAIK) is udmabuf, which is used for testing and emulation, not
really a production thing, I think.

--=20
Thanks,
Mina

