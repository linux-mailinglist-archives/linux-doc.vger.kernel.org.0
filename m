Return-Path: <linux-doc+bounces-4622-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F86C80B89A
	for <lists+linux-doc@lfdr.de>; Sun, 10 Dec 2023 04:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70E98280ED9
	for <lists+linux-doc@lfdr.de>; Sun, 10 Dec 2023 03:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E363817CE;
	Sun, 10 Dec 2023 03:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YrPzBP0E"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47751106
	for <linux-doc@vger.kernel.org>; Sat,  9 Dec 2023 19:48:10 -0800 (PST)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5c6a04d3a8bso1823590a12.2
        for <linux-doc@vger.kernel.org>; Sat, 09 Dec 2023 19:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702180090; x=1702784890; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jTjMvUzMQM9T6vvixVNHYaRMSP0ZcmvH/bM1JLogYsw=;
        b=YrPzBP0EnDIP+0ooeVbdXpE56iFddkdZtq0c2Q76nSfCz77q3zwZ5mz8nvvYdgLL8n
         3O4kxbbBr6uytnOZ5AnOhSRtjc849E7puGEdIizTdnMZ19HFnp7lUz+N6kOAA2kLIJk+
         EkHViUdFCdL/Lch8wHsIFPOKUO/u0us6dfnT4U7aVjoNytVliR8vbVky+cCOgPWIfXzc
         aCEH0gXvuTacfaY7RyuMiLxoJrJ0kvde83uAwWoLj5gnae4W3QH9xG47kDDhy+z1MTTB
         vhyyyQJaZhHEYBm5+iY21/YSESMrnnhxmWSSmB/x6dpTIZaOrcWZjYUNGhNEgbwoYJM0
         irWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702180090; x=1702784890;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jTjMvUzMQM9T6vvixVNHYaRMSP0ZcmvH/bM1JLogYsw=;
        b=M9fE9ZA/aRPs7D4wYtj2upZfRpR49q1hasHkh8S2/pk52LOnwGucTYUn0TOzRkCBbZ
         sQ2t9w5YMm9x0VNrTtAVMYBR/9k7i7UxC3lNRX0/HIVYR5N+hX5BPWjN+mmNQ6PqJQ5f
         sWclAbThHoOJoDXXPCCGPIJkxJtceT/qFHXiHpoJCd1Sv7Cox0DRiE/LCG/vpFlAw5s8
         WhAM/S3QSbyG69iXnkO+fs+y31TzaSZL2Gi4k7jIXFmjgAtzI0vFrP+KtExS++fxfYcj
         owobW9Ap7sa6vWcHbhUvMybU2yWuAcFQ98bCN/JqoysHOPWwznu7GZnWCrWkAdC4yHhy
         1kCA==
X-Gm-Message-State: AOJu0Yw01lyMJKRqNoxvoL25pBU9cMp0cY/FVapZhaJu7Ao8NBki9P16
	dM6QBZuRg/NwYWupGMLzZPdB8PVdXWn3bw==
X-Google-Smtp-Source: AGHT+IEuVYUkbdK82q9MQX/+KKZwtIfK+d+dsTME32So5XP7njZIF7u7LEU9iLCbfAno9hDEov5qyerx5QbU2Q==
X-Received: from shakeelb.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:262e])
 (user=shakeelb job=sendgmr) by 2002:a63:9854:0:b0:5bd:bbb4:5275 with SMTP id
 l20-20020a639854000000b005bdbbb45275mr16828pgo.10.1702180089637; Sat, 09 Dec
 2023 19:48:09 -0800 (PST)
Date: Sun, 10 Dec 2023 03:48:07 +0000
In-Reply-To: <20231208005250.2910004-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
Message-ID: <20231210034807.kqspmykhxpkdtoiy@google.com>
Subject: Re: [net-next v1 00/16] Device Memory TCP
From: Shakeel Butt <shakeelb@google.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Shailend Chand <shailend@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	David Ahern <dsahern@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Yunsheng Lin <linyunsheng@huawei.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Dec 07, 2023 at 04:52:31PM -0800, Mina Almasry wrote:
[...]
> 
> Today, the majority of the Device-to-Device data transfers the network are

'the network' in above can be removed.

> implemented as the following low level operations: Device-to-Host copy,
> Host-to-Host network transfer, and Host-to-Device copy.
> 

[...]

> 
> ** Part 5: recvmsg() APIs
> 
> We define user APIs for the user to send and receive device memory.
> 
> Not included with this RFC is the GVE devmem TCP support, just to

no more RFC

> simplify the review. Code available here if desired:
> https://github.com/mina/linux/tree/tcpdevmem
> 
> This RFC is built on top of net-next with Jakub's pp-providers changes

no more RFC

[...]
> 
> ** Test Setup
> 
> Kernel: net-next with this RFC and memory provider API cherry-picked

no more RFC

> locally.
> 
> Hardware: Google Cloud A3 VMs.
> 
> NIC: GVE with header split & RSS & flow steering support.
> 

