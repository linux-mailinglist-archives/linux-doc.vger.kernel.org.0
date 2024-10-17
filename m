Return-Path: <linux-doc+bounces-27831-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AB49A1D6E
	for <lists+linux-doc@lfdr.de>; Thu, 17 Oct 2024 10:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6120E28593E
	for <lists+linux-doc@lfdr.de>; Thu, 17 Oct 2024 08:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04731D47CD;
	Thu, 17 Oct 2024 08:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="JSyi44Gm"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A5C1D362B
	for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2024 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729154543; cv=none; b=PK5gsM/TAZj41Jeqd3KlF3fdxRKXrPn/8N3OTt0W6ZbHmVOWuZGMvPrvS7ARywcm9u8uHddGeki+4Fy7Stg8akKECU9GALZkPWZJPqYz1eCZsYWO4R+x1ZVlUo6vUFOrNuI01RXVvwgoB22VwhwSPwoY5CrNsO698ps2072MSF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729154543; c=relaxed/simple;
	bh=imPn2OPqQjFc9uR/Yy7wp5dlQvYjTRKKCHXGDkaSesc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fnSX+f7P1SV5QDQGNryjueKoENrTLMRfL9rgijYZYFkBa6qjzLBMJ7qiUyJ9wJhNCQHPOQFfB4MMoZ3v55+G32TqjDfQK/e1vqz8YFT4BoerCmUOk+Ax4+f/kth5warxIWB639fmzh8EUqLZE6ZAbJGeSV7ELyJsGB8/jEpOGhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=JSyi44Gm; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d49a7207cso445923f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2024 01:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1729154538; x=1729759338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mWiM0Qenq6snzqlNmhPji/4J58MYPGrBoRLNt739ca4=;
        b=JSyi44GmLja+vBAWU983gSGJwijYIj+UzlPCRQy5XIIZmEowc8Gk02IcLN+FcQZmjS
         ro8eVp4bzqxBIXCgsJdHe0/NNIfo2pyaIEKxi8pDe8KGBrJdiE9UVIaHIKRLRzgt90lO
         gLSLp/lvUpJER+rAeARBvkivZB/LMaUM/9O54W8Dn2wznkdN06snSx1PcGQIO/ZcqhBZ
         PsuvwbVbhf00tKCRporihlF2VIiNptzbOcnniFh+pc5KRyf0jJVfyW+P6a4Edb+QZOCn
         0U8Og1ixmBfN+Djy5tdozOvO5TQE8lhHEZ7HCyjlDkAuK3RkM6iwVQh7avzTdpXvY+gf
         6iXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729154538; x=1729759338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mWiM0Qenq6snzqlNmhPji/4J58MYPGrBoRLNt739ca4=;
        b=S9pPlCytJ8xU0hwhLlZ6F1MGUr+IZSDytFX6zXujBtEdvYXds0c3bvEHokrPSvgSYN
         WOKebpFYnvTHk4IAmCT8qzhK/8mkDHTX6eCrJo/uSxZ8WznoySIAiBUk/j5kIQlJGbYi
         zE5IXfnm5Lq3lxGDcRXIDXrmp0rmH+tUXT+sJnnm6uqMaVSJynZL8aGddMd3vpWEqR0f
         HeaZmbT+/l+W8i3UGNpt9pThtx4U0CVOCpNvmAAzOt1Pv6uESq0HFgcvmq+MV3jHci8w
         1ZNVSr/CQF0/kyrqhe9aZFvkWM/4oW72JBnFUwzg6NkvzwTjQuPK9icg5+EtylBELGUi
         1nxg==
X-Forwarded-Encrypted: i=1; AJvYcCUMVwTrbO4silSUcTJ6zeRnHsbTB8DPTFHNZxUVhLxORM7kd4xLHNc6GifRKXfZBYr6iWFRDJynTTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxodOv/E9OIMONM9uh84HtF3+v1KvNXYlfoMdhi2ED4Dqf2DdE2
	gWsYXM/WGIvokad7aiuH1+jTiKf31kQ2c0vpPmgFLuLonoi5/XrNiUP/xYiyHmU=
X-Google-Smtp-Source: AGHT+IEVgiUhH7ucVS53sBlraWGR7a3R6U5x91liQX4kmZ9vX7R+oJ19gK4jpj1dZi0K4wFZR1FHNQ==
X-Received: by 2002:a5d:47c2:0:b0:37d:37e4:f904 with SMTP id ffacd0b85a97d-37d5ffb9976mr14581893f8f.36.1729154538508;
        Thu, 17 Oct 2024 01:42:18 -0700 (PDT)
Received: from [192.168.0.245] ([62.73.69.208])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa8778csm6534498f8f.25.2024.10.17.01.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 01:42:18 -0700 (PDT)
Message-ID: <2b710dbe-3a61-4ec7-8205-73139b8a4170@blackwall.org>
Date: Thu, 17 Oct 2024 11:42:16 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 net-next 3/3] Documentation: bonding: add XDP support
 explanation
To: Hangbin Liu <liuhangbin@gmail.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrii Nakryiko <andriin@fb.com>,
 Jussi Maki <joamaki@gmail.com>, Jay Vosburgh <jv@jvosburgh.net>,
 Andy Gospodarek <andy@greyhouse.net>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org
References: <20241017020638.6905-1-liuhangbin@gmail.com>
 <20241017020638.6905-4-liuhangbin@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20241017020638.6905-4-liuhangbin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/10/2024 05:06, Hangbin Liu wrote:
> Add document about which modes have native XDP support.
> 
> Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
> ---
>  Documentation/networking/bonding.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/networking/bonding.rst b/Documentation/networking/bonding.rst
> index e774b48de9f5..5c4a83005025 100644
> --- a/Documentation/networking/bonding.rst
> +++ b/Documentation/networking/bonding.rst
> @@ -2916,6 +2916,18 @@ from the bond (``ifenslave -d bond0 eth0``). The bonding driver will
>  then restore the MAC addresses that the slaves had before they were
>  enslaved.
>  
> +9.  What bonding modes support native XDP?
> +------------------------------------------
> +
> +Currently, only the following bonding modes support native XDP:

If there's a new version please consider dropping this sentence.
It just repeats the title above in a different way.

> +  * balance-rr (0)
> +  * active-backup (1)
> +  * balance-xor (2)
> +  * 802.3ad (4)
> +
> +Note that the vlan+srcmac hash policy does not support native XDP.
> +For other bonding modes, the XDP program must be loaded with generic mode.
> +
>  16. Resources and Links
>  =======================
>  

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>


