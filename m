Return-Path: <linux-doc+bounces-58626-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B34E1B41C68
	for <lists+linux-doc@lfdr.de>; Wed,  3 Sep 2025 12:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DD34188D56C
	for <lists+linux-doc@lfdr.de>; Wed,  3 Sep 2025 10:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6342F7457;
	Wed,  3 Sep 2025 10:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dV+Jylym"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324702F745E
	for <linux-doc@vger.kernel.org>; Wed,  3 Sep 2025 10:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896809; cv=none; b=b/8KugKPmZCXUpRLaBe3zJ4a76PCqh9tgf7fSHX7EITPpf4K7d4xdUXbV0q7xPym9If+0Rxsmu5mRg8yNMuy3WSMjj1c7RCVGPxRUEzBaSj/E6n3MSEVld7PrAA4utOAIhAmDHmNyTaJtBJ0E8tLTAGXzvX9lk17BVK9Yr57xNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896809; c=relaxed/simple;
	bh=3e9oVt0w/svBQtWNoWSoYk3mpUNiPpo+o4wpoCKBBe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ohqXnyP0WPkstgzX8K/gKD33iGt0I9kCDhqOJHmeX6dK/UgsxHMfWTMYlp0mehhRfjXytlejzzi+1kX2dVh5qF3p8vu8dD2xbfol1zxm0Uq3938gd7ILY6bQrKW6qYHvscqIIcaRkYGKj4VstLdXaoyz0NllDhSTu6kXUkRV/0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dV+Jylym; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <be2b4af0-838e-4c7c-bae1-e74c027ad8fe@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756896803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BQM52vi5IgGsePrtSqbX4sI72O+u42u3GT3MlSFzMpU=;
	b=dV+Jylym2s7f47lDo8BasYH0lA1GhWy8yx3RqhGZJt9+WVR18sJk5RGePt/zM5wxUtTy6K
	MeF+RTqpnAjDxD9UNmsKPFucMcZsFB0jRj2dCthaNqSrqdAnTq2m1lVloQqwlqJaDsADue
	58uRJU9LzIIO+Rl6ulAutZLTeUmIsWo=
Date: Wed, 3 Sep 2025 11:53:17 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v10 3/5] net: rnpgbe: Add basic mbx ops support
To: Dong Yibo <dong100@mucse.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, gur.stavi@huawei.com,
 maddy@linux.ibm.com, mpe@ellerman.id.au, danishanwar@ti.com, lee@trager.us,
 gongfan1@huawei.com, lorenzo@kernel.org, geert+renesas@glider.be,
 Parthiban.Veerasooran@microchip.com, lukas.bulwahn@redhat.com,
 alexanderduyck@fb.com, richardcochran@gmail.com, kees@kernel.org,
 gustavoars@kernel.org, rdunlap@infradead.org
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250903025430.864836-1-dong100@mucse.com>
 <20250903025430.864836-4-dong100@mucse.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250903025430.864836-4-dong100@mucse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 03/09/2025 03:54, Dong Yibo wrote:
> Initialize basic mbx function.
> 
> Signed-off-by: Dong Yibo <dong100@mucse.com>
> ---
>   drivers/net/ethernet/mucse/rnpgbe/Makefile    |   3 +-
>   drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h    |  16 +
>   .../net/ethernet/mucse/rnpgbe/rnpgbe_chip.c   |   3 +
>   .../net/ethernet/mucse/rnpgbe/rnpgbe_mbx.c    | 393 ++++++++++++++++++
>   .../net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h    |  25 ++
>   5 files changed, 439 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.c
>   create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx.h
> 
> diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
> index 179621ea09f3..f38daef752a3 100644
> --- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
> +++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_chip.c
> @@ -1,8 +1,11 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /* Copyright(c) 2020 - 2025 Mucse Corporation. */
>   
> +#include <linux/string.h>

I don't see a reason to have string.h included into rnpgbe_chip.c

> +
>   #include "rnpgbe.h"
>   #include "rnpgbe_hw.h"
> +#include "rnpgbe_mbx.h"

I believe this part has to be done in the previous patch.
Please, be sure that the code can compile after every patch in the
patchset.

