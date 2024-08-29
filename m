Return-Path: <linux-doc+bounces-24131-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6EC964F12
	for <lists+linux-doc@lfdr.de>; Thu, 29 Aug 2024 21:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B104DB20F49
	for <lists+linux-doc@lfdr.de>; Thu, 29 Aug 2024 19:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0921BA289;
	Thu, 29 Aug 2024 19:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vyqjdfwa"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD8F1B9B45
	for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2024 19:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960310; cv=none; b=PG+JIjSOVrit6/WKrHK4HxLW2xMzdClkqv1y4zMQBg4Cz9HNKMqHipsJ3D9fOorssC9NrbrC6VxK5ACzqm0tGddnkNzX2BWW3urZP9k4XO1IlFajUhEd7nOGfz4G86ZaVGFSPkEAJ5kBH/2idHpGv6eivysDMxF5LSJ9l3V2MsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960310; c=relaxed/simple;
	bh=4ASADOnCoqNrKV+beHl14a4vrTkq7UjCX+g5PUIp7tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehnciuuE6OsLcxrZKL+8s+TCG0uLQB3R4Rca67K2/s+HZvzebCgcL9AnrVFHur+AGOBuSAPu6v+b5Swam1tSkVL9X1KJlNaqszlB0LwYUWbVpcpsxQ16SORyq7MpD41213A8HRo3p7q3Vq7AgPzMzxXyvdRsdr5H8FRuUX4zQJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vyqjdfwa; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4567fe32141so78631cf.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2024 12:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724960307; x=1725565107; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZUAgIcTyrR43pe3gP0emMAssjHjCGemTU8nsF1ejxc=;
        b=VyqjdfwarXMeB4Y4INlQGUPhZkirtCNWsnj7M3szpM9Xkt7avb/e7YL2r2AdYlJkCS
         /Bpf7hR7X6IlL1U00gOg9VKWrTicKAP4a4yqJWgpfD21VBRGI411IWdBSUD/5Y7hsg9E
         wiVrzRVTIUriossLHYwrF3NOTBlUA3fP1JfXXgA9ryu2/FdUqqHMT8zgBxP1tTSWZWlL
         QCyKGDNZFHsNdIEwBTf7SgOpdzJpSQ9AKGvSvwmWIzeVHSp0cwe2o0wB9IAFaHfCkgXB
         wDw8hEMaWDSzGdgfIQ/2EvAJXL3hA9d/YHiz5Hi5yCNbiwnKJ3rLPdpN++PpwyVTZWmo
         hrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724960307; x=1725565107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZUAgIcTyrR43pe3gP0emMAssjHjCGemTU8nsF1ejxc=;
        b=RMjZn3vevZEbazWVXj1rwFeVmDNNSfwpzHfoi+JNVTylnd4F1D3OEz/GRU7MxP2T/s
         hGhPF1qF5s7GOw4q1ZISGyZ4fgRU70oJwKmAl6hn8RHGCmSzfARv8+8XlE16Km63KeOP
         MBEaSxAGvzrGntG0/Z8uYbh0ggL6lvxp7p6+I8j63J+rmJ8zp/JG4A+wWL+R2s/V3jwM
         9kHPd3znljb9ZSEOdsAiOehn51H9K7eFRmOJEahiuV6PZdZ60suy4YlpDWlhGUj2OX+J
         dZTWjSkmbXh4GWoJ1WIRab6+Wx5JY3L1WYo8oe34a0Q+b1pkzBHykKvps7A/cG9jJml4
         cCjg==
X-Forwarded-Encrypted: i=1; AJvYcCUcJYv/amr7Gijj9AYxaherM2eaPTPyHdYBPxKx9dDF3dhz4ihNFkbKQdOdPKDbkwngkmV/1IMdkWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWM3iy3sAABLoeJjkusPFFcrb64vcQ+Mi60lzIdDx7sR8BPIT0
	6uEYSw/U2WepBMwi+OmwnD261cVwm1S9XGLUKOEYbry+JP0XM4qSbgf6wFElbG5EuJ88gPHVwD+
	YAZLYiDLkSHqn5w5cNtAQ3yHoR2D7UGd31iCa
X-Google-Smtp-Source: AGHT+IEckjBQSLEDMwf1jYHRwORJ2ZVKtBH36SKJpIYMP8NrCeogwJVm7Q7nebuPSmPKh9r8A+fJeiK+617lAC3ocsU=
X-Received: by 2002:a05:622a:281:b0:447:e59b:54eb with SMTP id
 d75a77b69052e-4568aacd777mr496041cf.26.1724960306474; Thu, 29 Aug 2024
 12:38:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829060126.2792671-1-almasrymina@google.com> <20240829060126.2792671-4-almasrymina@google.com>
In-Reply-To: <20240829060126.2792671-4-almasrymina@google.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 29 Aug 2024 12:38:13 -0700
Message-ID: <CAHS8izMCZbynEQQ3rPs2QaEbD51ew7VK0sMziBTayCi2yEZ_EA@mail.gmail.com>
Subject: Re: [PATCH net-next v23 03/13] netdev: support binding dma-buf to netdevice
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Arnd Bergmann <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>, 
	Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"

> +#include <linux/list.h>
>  #include <uapi/linux/netdev.h>
>
...

>
> +#include <linux/list.h>
>  #include <uapi/linux/netdev.h>
>

Darn, I went too overboard with sorting of includes. ynl-regen.sh
wants these in the reverse order, which is unsorted. I'll fix it in
the next iteration, and I added this check as well to my presubmits.

BTW I submitted 2 iterations already this week, Sunday and Wednesday.
This is easily fixable and I can resend before the end of the week,
but if I'm stressing NIPA too much with reposts of this large series I
can wait until next week. Sorry about that.

-- 
Thanks,
Mina

