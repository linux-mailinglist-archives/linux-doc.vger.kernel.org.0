Return-Path: <linux-doc+bounces-12204-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C48787E24B
	for <lists+linux-doc@lfdr.de>; Mon, 18 Mar 2024 03:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24F441C2098A
	for <lists+linux-doc@lfdr.de>; Mon, 18 Mar 2024 02:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001B62030B;
	Mon, 18 Mar 2024 02:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="iV4pzRO6"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1A01EB2B
	for <linux-doc@vger.kernel.org>; Mon, 18 Mar 2024 02:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710730188; cv=none; b=Tkxd7J+1Zqbn0rhfHYMCuqndRVmcxtd1xQG7Sp5FJjqojsGVBg0n52ZitzH+hxMHt7mBxLqI1PxP+l0qe+GYs8CTZE4/dehO3TYy3Rco7qkf9tstdJo0mSfuo2wb6+Df+BgrmF0+GcrNq9uBOUZEPsPNKIusbVV30NXCaelo8Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710730188; c=relaxed/simple;
	bh=ybVBqVNCXzGJGuz6lwF+tzdhl5wD9gmQp2PXPNadGZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o4Mi97IkUSekmnkT9bxM8eKLTylT1PW1wFLvMUywzyqJ7W2d5nCTJbAahZXDIr1yF6PC+8CZJ7JhBl6UpXj4LcEvPvf7zZ5AWbwQ0tQxleGbhTt1afRBGxN0FZRhgzwzJjtAoy/mSCfuyVoMdif5862vShfCKMluyCMqZsNInMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=iV4pzRO6; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5a4a2d99598so479865eaf.2
        for <linux-doc@vger.kernel.org>; Sun, 17 Mar 2024 19:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1710730186; x=1711334986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QE0CXFBu76tpBM6gpoJrOe0mC6QUf5XbAI8puJxCLjs=;
        b=iV4pzRO6P3GXwlCKnBLXNP1M23gu1zQrspv6JPJ8fStuXR6pQ39ApKrDntPI5tx/uE
         /MnuWm41o/lbyJAypmV8amaK7R/DY9hx5GRXs/0r9iXayTGjDZNX/3a3xzI+TRbmrgc5
         CKaIjiPutwDoASk/sLDAWwavRiaWn0pBM9030+PUUupT3yeK7y4jPmhcyEMY7r4Hl52y
         XWNfIYJJTMt5wTngWdOXFC2+N/RSAkoF1vsgGy7/X1ZW8EIw0zE/PfsaGzUF6O4qnNcM
         v/ZuzSbzmtn0escS9ERzZ4uMFZQ9IggD068oFEU9q2JSyZaFtYe56f0HASQWjPvNI5se
         3jpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710730186; x=1711334986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QE0CXFBu76tpBM6gpoJrOe0mC6QUf5XbAI8puJxCLjs=;
        b=XsOxw9EWodJEuMvkly1/Jr3G9dyahsb0tlmR8Hd2oP2OuwPcs7qXdxcRRmQt+xY9kf
         o1FUpw6fQTy/iAulMOrdBw3aI6y8DjQ+NCdEV7tS85e3om/P3KAIJuVtG0ELj3qAAptV
         7DFCc9L/d08DGRwR4bsQyauojfEUg+/K1SRxR1LqQNm9kkBY3/gjGpA1TT2L6gNRJ8rd
         rq6wJfsRbey7VJVtQh4ZX4+wopv5rNEhBc5aC3CNZ8vgrJn9v3t/gnJR25ma/zxL4ft5
         b3OJnY6B+Oer+/1NLK38rq1UnNnbOg0h+zdk7gD88eEf3JpvsrOfNQU/9fw6DJdmB42w
         p79g==
X-Forwarded-Encrypted: i=1; AJvYcCXqxy94TCKIGdINH5dV+yScaDBRx6SA4JnOdLVVUSziVcHB+TZLc4GTqUeir6oRwBRcPYHzDGG7cv3QS117PNRG65fOEiTYYV8E
X-Gm-Message-State: AOJu0Yw9aWGpqmIOOw8sxAzQjGnQ2Jn0K+ir3r+4UZf0sRmeqmcBvdqY
	9DAQXQClfiehGPWFpn0gg5ufnfxpOWeAYIrslle0cxaKhT/S/fELRjP3LKEIOuI=
X-Google-Smtp-Source: AGHT+IENq8waTwhUkJrEOrb8DEHjfl4QDem6FZJYYGTlmjRRGItMoHQ4P2wTQfIoEZJr502KAVnEEA==
X-Received: by 2002:a05:6870:8e05:b0:222:d6a:9ae8 with SMTP id lw5-20020a0568708e0500b002220d6a9ae8mr10284561oab.35.1710730185882;
        Sun, 17 Mar 2024 19:49:45 -0700 (PDT)
Received: from [192.168.1.24] (71-212-18-124.tukw.qwest.net. [71.212.18.124])
        by smtp.gmail.com with ESMTPSA id i189-20020a62c1c6000000b006e66a76d877sm7120229pfg.153.2024.03.17.19.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Mar 2024 19:49:45 -0700 (PDT)
Message-ID: <b938514c-61cc-41e6-b592-1003b8deccae@davidwei.uk>
Date: Sun, 17 Mar 2024 19:49:43 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v6 02/15] net: page_pool: create hooks for
 custom page providers
Content-Language: en-GB
To: Christoph Hellwig <hch@infradead.org>,
 Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240305020153.2787423-1-almasrymina@google.com>
 <20240305020153.2787423-3-almasrymina@google.com>
 <ZfegzB341oNc_Ocz@infradead.org>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <ZfegzB341oNc_Ocz@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-03-17 19:02, Christoph Hellwig wrote:
> On Mon, Mar 04, 2024 at 06:01:37PM -0800, Mina Almasry wrote:
>> From: Jakub Kicinski <kuba@kernel.org>
>>
>> The page providers which try to reuse the same pages will
>> need to hold onto the ref, even if page gets released from
>> the pool - as in releasing the page from the pp just transfers
>> the "ownership" reference from pp to the provider, and provider
>> will wait for other references to be gone before feeding this
>> page back into the pool.
> 
> The word hook always rings a giant warning bell for me, and looking into
> this series I am concerned indeed.
> 
> The only provider provided here is the dma-buf one, and that basically
> is the only sensible one for the documented design.  So instead of
> adding hooks that random proprietary crap can hook into, why not hard
> code the dma buf provide and just use a flag?  That'll also avoid
> expensive indirect calls.

I'm working on a similar proposal for zero copy Rx but to host memory
and depend on this memory provider API.

Jakub also designed this API for hugepages too IIRC. Basically there's
going to be at least three fancy ways of providing pages (one of which
isn't actually pages, hence the merged netmem_t series) to drivers.

> 

