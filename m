Return-Path: <linux-doc+bounces-24833-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DAF971F9F
	for <lists+linux-doc@lfdr.de>; Mon,  9 Sep 2024 18:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03A581F2417C
	for <lists+linux-doc@lfdr.de>; Mon,  9 Sep 2024 16:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70F116EBED;
	Mon,  9 Sep 2024 16:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zftvtENv"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998F61BC40
	for <linux-doc@vger.kernel.org>; Mon,  9 Sep 2024 16:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725900872; cv=none; b=JFO8NOHQZzcgPMYnpsxpcAJo9k6gtn6MC49rYS+WaR5E6He58qnm5nVF3ZjVRkNeyHIu62Sm1IyCe7trp+07cIfTJu2gRI8CGELeYvxi3NkswYsN9qjC+4qlauNYMuLlUpVtO5wBHTtb/5KIvUvfDE7BaMGAenobNZwdnk++gEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725900872; c=relaxed/simple;
	bh=6Q+C9ogz7U8bywbJQGcpiixXLogu0mto8kJ/rFDq1hM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NXjyOKL7JxkX7Bnq1clBojRPpJw6mT+PLyYF3fu7wcTbDqWtkyrgdxYZwFXoiBhd9WfDxj0bTVsjzHpPpbgXlR7Vad1InuX0jD7iBl1d+tHuR1hUXYWTjEZRSVbKe3O1ErBCQjvM+IpMNL31mC1+Sj0P6jqxSAczYTTyxOFS9LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zftvtENv; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4582b71df40so3511cf.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Sep 2024 09:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725900869; x=1726505669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Q+C9ogz7U8bywbJQGcpiixXLogu0mto8kJ/rFDq1hM=;
        b=zftvtENvf4uW4nTJnM1KzDdzsjU/F6GJgfAfeBgXXP2uuc5R0x0Kin63bhC9hvd/vH
         lOfRESNkXIoUeuO16b3giev/BkoRw7HYGj2RZ8Lvd9He0RUoi88r8+K3kPT1CoOLj4/Q
         usEGOwEPS+E/A3x6BI69rphus4gz+2y9PLzEtKsUTePo6eeOEWQGGvbVRhz1y2fmHjMC
         99BOrVbl1AxyGX4XP5qEycLLC6+4z0njV0eGcMUD/+tvUU+W2czbSU+g7M+ms3vNBMUl
         x2mDCVPwq0Ouv1sjdvlcfWatCwNaWuDoFUgH7or5cgIBrnlgKvOKQYOhkTRB9ftp5kzZ
         rc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725900869; x=1726505669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Q+C9ogz7U8bywbJQGcpiixXLogu0mto8kJ/rFDq1hM=;
        b=XJRwM7qz4saCAtPj4lsDQEVSv7LnyahTVBdGFottK+BRyOzYkD6qe164SsHFTp74YT
         57GPRClEiWnQfzQlgAyJRPx6/WfVtprRvdH8adsOhsw0XTBSfqPTanDOJLbPf+bqTV9b
         zeh3fnd1F6jUS62asEWzYZF1OCjkunb6WIRSkIwODRn7M6avIqtcDkK5NBJ8/DzkoU8T
         2Lov7jI4sAeNsdPGV39iMGKQh5Sk3U1HVkzzXK201gjs6tm0JP7Oa2+3mkEdIb8jMFIQ
         mau59fquxqXDuCa6Xw2025K4pUOevM4GULLCvAMF6jFqQHSA1SBxL+lulL3GJKhMZexC
         OkOA==
X-Forwarded-Encrypted: i=1; AJvYcCXVje6gFuBYpIxm8AFbf+FyTE31hzj0FFOwS9bC3ur14r7souyuneakNl1BsPcKko/RRef1ql2A708=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0u+Jxc2/G3FpgHWMPPUaFGxMfLIYlm9QgenFOWOx+MKoMbygB
	kG/HTFfRDLWR/+hfWybVlpWiRVjIK9UpSJLTRE/2sipEwfZRSNsDjq+uQEwa6iiZfmkSo4P6YeF
	Wk8LFAAf8gNgFDAnHSjDtQPuOsbPd2CuLXq7W
X-Google-Smtp-Source: AGHT+IH5CAMa7jyagoL/SPMKxnbKYwRciBwcTHNa9+5fhr4aw1DzDFUIylCWU3J1Sf54qZeykPAuKVr/EjpKtXIeTYU=
X-Received: by 2002:ac8:7f0f:0:b0:456:7501:7c4d with SMTP id
 d75a77b69052e-458214943fbmr5401741cf.9.1725900869141; Mon, 09 Sep 2024
 09:54:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909054318.1809580-1-almasrymina@google.com> <42c202e6-8c4c-494f-8c28-17d66ed75880@huawei.com>
In-Reply-To: <42c202e6-8c4c-494f-8c28-17d66ed75880@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 9 Sep 2024 09:54:16 -0700
Message-ID: <CAHS8izMX+9F1NngbPx6w7ikKR9TgPvm+jMwZ8168NJYhFC7sVQ@mail.gmail.com>
Subject: Re: [PATCH net-next v25 00/13] Device Memory TCP
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
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
	Shailend Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 4:21=E2=80=AFAM Yunsheng Lin <linyunsheng@huawei.com=
> wrote:
>
> On 2024/9/9 13:43, Mina Almasry wrote:
>
> >
> > Perf - page-pool benchmark:
> > ---------------------------
> >
> > bench_page_pool_simple.ko tests with and without these changes:
> > https://pastebin.com/raw/ncHDwAbn
> >
> > AFAIK the number that really matters in the perf tests is the
> > 'tasklet_page_pool01_fast_path Per elem'. This one measures at about 8
> > cycles without the changes but there is some 1 cycle noise in some
> > results.
> >
> > With the patches this regresses to 9 cycles with the changes but there
> > is 1 cycle noise occasionally running this test repeatedly.
> >
> > Lastly I tried disable the static_branch_unlikely() in
> > netmem_is_net_iov() check. To my surprise disabling the
> > static_branch_unlikely() check reduces the fast path back to 8 cycles,
> > but the 1 cycle noise remains.
>
> Sorry for the late report, as I was adding a testing page_pool ko basing
> on [1] to avoid introducing performance regression when fixing the bug in
> [2].
> I used it to test the performance impact of devmem patchset for page_pool
> too, it seems there might be some noticable performance impact quite stab=
ly
> for the below testcases, about 5%~16% performance degradation as below in
> the arm64 system:
>

Correct me if I'm wrong here, but on the surface here it seems that
you're re-reporting a known issue. Consensus seems to be that it's a
non-issue.

In v6 I reported that the bench_page_pool_simple.ko test reports a 1
cycle regression with these patches, from 8->9 cycles. That is roughly
consistent with the 5-15% you're reporting.

I root caused the reason for the regression to be the
netmem_is_net_iov() check in the fast path. I removed this regression
in v7 (see the change log) by conditionally compiling the check in
that function.

In v8, Pavel/Jens/David pushed back on the ifdef check. See this
entire thread, but in particular this response from Jens:

https://lore.kernel.org/lkml/11f52113-7b67-4b45-ba1d-29b070050cec@kernel.dk=
/

Seems consensus that it's 'not really worth it in this scenario'.

--=20
Thanks,
Mina

