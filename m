Return-Path: <linux-doc+bounces-17346-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 871A58D5690
	for <lists+linux-doc@lfdr.de>; Fri, 31 May 2024 01:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1B6F1F27CC2
	for <lists+linux-doc@lfdr.de>; Thu, 30 May 2024 23:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9697190677;
	Thu, 30 May 2024 23:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="QL4+RqL0"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576361862BF
	for <linux-doc@vger.kernel.org>; Thu, 30 May 2024 23:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717113110; cv=none; b=rsLuflTBpbad82T8Q5Jzr4irlpizLsON1Ve6nqjYx6jwKBiCgUlPlqbUtgJoAMpn+meGrgRKUEsvRCILvXSVCNaOmRHuhQP0RAVJ+JNQjn9NZDjYaqg2jnjnhbYiml1OE+m7J9UV0IyJx+yC+nEBJRepzUZUsxcLJ9ebIeEEvLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717113110; c=relaxed/simple;
	bh=W93FmhGSt5rN/d9ZkTtKHNbj8y2kiVp3BB6JpqBPjtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P6E3YhJb0JWmZmyW6WJAMa+hiWjfy+6ntLOft19OHhGbMEU54Awukp4HQAPdN9k7U70f42ViRNwXHc3HbPX78MRvX11stZtq+TT0eA2knCpI8Mb1hCdt0EpZjVUWyWvL7hDJG7y1fLZo771L9IldNNDwz2F2ZSxM2l35lcho4Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=QL4+RqL0; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-702492172e3so33079b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 30 May 2024 16:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1717113107; x=1717717907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zLw2WCX7NzhXHaHBtGiNDa+0R1r9ENCFVNNCzI5O8YY=;
        b=QL4+RqL090NmzqnmmaV35StPPgSYrm0/E5FYyEyBNDFbnjFYn4+7lynHidmbHWfEVL
         1iBcOwtdX/+OmGH9OHA6Ly9dCXC0kAmMRNt7jsngsMzCorwTnvSYwsuvbd/30RasDM2J
         CgWFzSw7fo3h/P0Vna2SEUkG3BW1pwRp2ZYJmicLk3iur+HVCLaN4mTrgCpO4EGR65xr
         zvIJIWco9NeeSE1nTauAdHI2pE5kFmj0GGL6zKrRbn7msIZJ7JKuUeM9tM4Yd+OHVqGp
         tw2mwrdzVMXg0wyfG0apx+qaFVSep6SjKcJrNGom1L34fJ84bOjAqASDJTHdFqEXjqA6
         2XTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717113107; x=1717717907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLw2WCX7NzhXHaHBtGiNDa+0R1r9ENCFVNNCzI5O8YY=;
        b=gvhponaL+MYot9/Shcmn3KuAAtXwWXq3diHkk9/ZVMDquJHnInjai7gM+MMYFqafay
         LGki+NVoSpyPgSYnrpEcaZAJTk2T/ZRXp5cug+zCQo8nszevG84AP/82MPKfYei580I9
         WxJ0kZ9RIui3LF8f/HDPUxguQfTzLu0rPBWoYt8Gc5B3gRCrqjCq6+YjA6RHuNpBTng/
         c9opBBSdwdssThNRie+GmrOOSJvNpwyZlyTqLKmfwnAM84e5t7sbVjuzGw/ncQBP3Wjl
         ZxzEBzrQ6+ZXiKSi/tLqMDV+X7WQnhKzBNRezFhD97HzR5vrcJXxcmiuvfB3tX5TLP2M
         x/RA==
X-Forwarded-Encrypted: i=1; AJvYcCXkxvShdfMBA6Wg0U9O3RWcnMS+rXsKEbTc68WRi9AEo3CfJHXBjYTfWE+Xn4WXqWVIBjtT9Zm/dhrkubZXiH7EQM7ei//RFozn
X-Gm-Message-State: AOJu0YyiSZSbD/aoazscZSFsM3BHa2iXKW1UHaAOwNET81t8bWelqF1y
	Qz203cABzvkHJRRTgM0VqdZOeBfrgdUjE8LV/CDnIGcei5eUgvDZurrnltwy59Q=
X-Google-Smtp-Source: AGHT+IGLIircvxxELNZp6hQL4M8a4oqQMuIfbGbj5ESP+8hykh0tgC9NyJcGdtZhysmk5TffXmp10A==
X-Received: by 2002:a05:6a21:7807:b0:1af:f23c:804a with SMTP id adf61e73a8af0-1b26f245bedmr579669637.38.1717113107315;
        Thu, 30 May 2024 16:51:47 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:1cbd:da2b:a9f2:881? ([2620:10d:c090:500::4:5439])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423c7b7esm298915b3a.13.2024.05.30.16.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 16:51:46 -0700 (PDT)
Message-ID: <49e4d52c-59f1-4321-9012-aabb1e8cc005@davidwei.uk>
Date: Thu, 30 May 2024 16:51:41 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 01/14] netdev: add netdev_rx_queue_restart()
Content-Language: en-GB
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240530201616.1316526-1-almasrymina@google.com>
 <20240530201616.1316526-2-almasrymina@google.com>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20240530201616.1316526-2-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-05-30 13:16, Mina Almasry wrote:
[...]
> +err_start_queue:
> +	/* Restarting the queue with old_mem should be successful as we haven't
> +	 * changed any of the queue configuration, and there is not much we can
> +	 * do to recover from a failure here.
> +	 *
> +	 * WARN if the we fail to recover the old rx queue, and at least free
> +	 * old_mem so we don't also leak that.
> +	 */
> +	if (dev->queue_mgmt_ops->ndo_queue_start(dev, old_mem, rxq_idx)) {
> +		WARN(1,
> +		     "Failed to restart old queue in error path. RX queue %d may be unhealthy.",
> +		     rxq_idx);
> +		dev->queue_mgmt_ops->ndo_queue_mem_free(dev, &old_mem);

This should be ->ndo_queue_mem_free(dev, old_mem).

