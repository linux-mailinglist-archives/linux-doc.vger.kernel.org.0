Return-Path: <linux-doc+bounces-18172-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A285902B6A
	for <lists+linux-doc@lfdr.de>; Tue, 11 Jun 2024 00:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72E471C22023
	for <lists+linux-doc@lfdr.de>; Mon, 10 Jun 2024 22:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9CB14F9FB;
	Mon, 10 Jun 2024 22:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="DV1B8yAB"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3693115098F
	for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 22:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718057708; cv=none; b=qQXXn/qdPxqEsvQDxFpqMN9AzoxqMDm3p8LVp2wwC5dcGT8Qg7wie45rtbpdwI92ksBAsQ+hNfyFRnMF0ocwyXkueBjif2sJTu0vq2IykkrAtPBP8hIaIqCnt1k56ZcRh/8r8NGqu+5QtVEu16T/1vBWqF1uf2Gb9jXQKVz7D6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718057708; c=relaxed/simple;
	bh=z+wd9sAGfEDNr43zUFts3rXiT7ShOZVNnrA/+9o7y3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HK7nMcbau4K8/BqZMMv2K4vKmKIuYZncM5+yCprvrqvEDMrCvEeFF2d5q3wF+fJApYOiLrSvTkh7DfzYBZqTEvV/iHNVF17dIMhn+j702X7JDnSqFuPYbMvLdxHZz2cWelhUBzuyzPCquTc4P0ficI/v6/603hEQ7DRRCmNxDbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=DV1B8yAB; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-43fecdecd32so26994151cf.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 15:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718057705; x=1718662505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fYxIeKtLL3lQwNiFRr25O1e9GIX4G5slG5d4Uc4G46M=;
        b=DV1B8yABKh8zcLUmgBZlPAFY0iTcPLR8YOx7LLCpFjMnV7rXNkaRxAYuvwk3C7PPOH
         jZB05ZxEeozQlYPvsSKrdHH9XRsHaWMfRgA07nc67PzNRXJVUcgHaMaIwTLkn/0NBaej
         Y+DkdkBwr03IdCK/sG3d/54s8BvaqhWBnl/jBki+4FuzFDk5MC/R7srQTW0MtfyTEffw
         S/cazkXqzTrhTNLq77EhsuipjQDoKG+ONrmQBCCYr/YTuVzQ2K1qnCx+gVlmf+ptUByB
         YHBold4jl4t0CXl3DWfVhfY0nGwvEmmEftLaTtJM4KO8eLCbZeisPO65pggAcwOIB0GE
         jnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718057705; x=1718662505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYxIeKtLL3lQwNiFRr25O1e9GIX4G5slG5d4Uc4G46M=;
        b=sgAq5pJsiwL5X+9DU1FSSdgnP0mMtjK4mm1iVLVkqlpI3ESlZPKvJCoYc/2lIrS6BK
         VKZ8O2sg4HBr74trTf7H71y7hxQLB/Bfn3x6jKiuEuuoeNtgYcdPMvw0XGipIJafguhF
         vF3GpCNhulc9RvhDtRbkrnit03F1Ramni74toGS1cqBdX21sp8DWUFGY6Uyok1eegrDa
         M7oQHiSuzjtu18/SCceU2XQRFh11ShidBJSJStklMwR7gdaK3r8aQuwQ9j3OLFxA6ROp
         B2tRx9u8EM8C+ptbkCKvFF9GJbx6zSNDv9eVQZH6pJ2NLndyS5XVT1bIunIa+IKZMQdX
         snOg==
X-Forwarded-Encrypted: i=1; AJvYcCW6JsC9t0RWw8Nmw7D8MEb3VFrbxwFFxnvTBkGy6vVHyWg/jpagCkmo3Dzn7vCoL661M7cNkiHDFO4nY/K+37KTFEXVvLx/aGMg
X-Gm-Message-State: AOJu0YzCcvwG5nqnxnY87aXnsbxznM2nzrCEnVa8Bj/yYsVeXpPKMZHH
	aVckjsJckZr8Ahk6lnO3YE/OfZfCtqnUPfLVbw9NEAWf1+17wZtu/oOfirZQOgI=
X-Google-Smtp-Source: AGHT+IGNwK7dorh82QSLW5MV/WzZAixZNPt6ZilaFo6ceP30TQ1KYPRJL2ImTAjvrOrdYOBtAU+f5Q==
X-Received: by 2002:a05:6214:4a06:b0:6b0:72ef:2877 with SMTP id 6a1803df08f44-6b072ef2a2bmr79573716d6.40.1718057705068;
        Mon, 10 Jun 2024 15:15:05 -0700 (PDT)
Received: from ziepe.ca ([128.77.69.89])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b076a42242sm20947266d6.59.2024.06.10.15.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:15:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sGnI4-00FsKs-9Z;
	Mon, 10 Jun 2024 19:15:00 -0300
Date: Mon, 10 Jun 2024 19:15:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>,
	Mina Almasry <almasrymina@google.com>,
	Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Yunsheng Lin <linyunsheng@huawei.com>,
	Shailend Chand <shailend@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>
Subject: Re: [PATCH net-next v10 02/14] net: page_pool: create hooks for
 custom page providers
Message-ID: <20240610221500.GN791043@ziepe.ca>
References: <5aee4bba-ca65-443c-bd78-e5599b814a13@gmail.com>
 <CAHS8izNmT_NzgCu1pY1RKgJh+kP2rCL_90Gqau2Pkd3-48Q1_w@mail.gmail.com>
 <eb237e6e-3626-4435-8af5-11ed3931b0ac@gmail.com>
 <be2d140f-db0f-4d15-967c-972ea6586b5c@kernel.org>
 <20240607145247.GG791043@ziepe.ca>
 <45803740-442c-4298-b47e-2d87ae5a6012@davidwei.uk>
 <54975459-7a5a-46ff-a9ae-dc16ceffbab4@gmail.com>
 <20240610121625.GI791043@ziepe.ca>
 <59443d14-1f1d-42bb-8be3-73e6e4a0b683@kernel.org>
 <00c67cf0-2bf3-4eaf-b200-ffe00d91593b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00c67cf0-2bf3-4eaf-b200-ffe00d91593b@gmail.com>

On Mon, Jun 10, 2024 at 08:20:08PM +0100, Pavel Begunkov wrote:
> On 6/10/24 16:16, David Ahern wrote:

> > > There is no reason you shouldn't be able to use your fast io_uring
> > > completion and lifecycle flow with DMABUF backed memory. Those are not
> > > widly different things and there is good reason they should work
> > > together.
> 
> Let's not mix up devmem TCP and dmabuf specifically, as I see it
> your question was concerning the latter: "... DMABUF memory registered
> through Mina's mechanism". io_uring's zcrx can trivially get dmabuf
> support in future, as mentioned it's mostly the setup side. ABI,
> buffer workflow and some details is a separate issue, and I don't
> see how further integration aside from what we're already sharing
> is beneficial, on opposite it'll complicate things.

Again, I am talking about composability here, duplicating the DMABUF
stuff into io_uring is not composable, it is just duplicating things.

It does not match the view that there should be two distinct layers
here, one that provides the pages and one that manages the
lifecycle. As HCH pushes for pages either come from the allocator and
get to use the struct folio or the come from a dmabuf and they
don't. That is it, the only two choices.

The iouring stuff is trying to confuse the source of the pages with
the lifecycle - which is surely convenient, but is why Christoph is
opposing it.

Jason

