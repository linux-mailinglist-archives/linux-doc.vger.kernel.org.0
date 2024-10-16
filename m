Return-Path: <linux-doc+bounces-27719-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E859A029D
	for <lists+linux-doc@lfdr.de>; Wed, 16 Oct 2024 09:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71B40286E49
	for <lists+linux-doc@lfdr.de>; Wed, 16 Oct 2024 07:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F191B3F3D;
	Wed, 16 Oct 2024 07:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="dlnk1jIu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3271918E741
	for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 07:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729063865; cv=none; b=aj39ndjLQPNRTVPmDdNf5VkHPifajJrjuyRW4fgkEMXgzArU9OIVT8Tcx2xuiPc8rqo2S6Z22P3xjLmuoDc6Q7p6KNUVl/KsR0zHpsycMRq/f4UOJDYjq+gwrnSFMXjmOUNrTLr3Msm/7I5zp1KfOlhqLHho2j+qPF0X+DKxiBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729063865; c=relaxed/simple;
	bh=qDCAzGXoZ0pOdnIynMDnFsAu40UrMUBUAHTC2okKCYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YrAgqps7npghnS9rKQbLr5/NRvqTR99biBsF5zkNQRBeh6czC4+Nd9K8awhiMNptApRKdult7ZIa7kuSYK0EyEgYwpRIeNb4aS/TabkXhFIYnCsNy28KT/yeT8+FCMPzUqHSFVurkHyhg+gNMfE/282Cg07DyAKIIEFgl1bQE+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=dlnk1jIu; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so20914551fa.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 00:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1729063860; x=1729668660; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R34hHdvFIYMq9ZmXSvfE0IG+MHVNqzXq4FOqKZ22TY0=;
        b=dlnk1jIu7SWMpQ6rcxAqfJ1nYIna9+tQWxqn95djO6cBBQrLq0g9HrCrytWgE6odtU
         QrSAab/DXF6QZWalAFREBBN7dCsARv5iM4gJrpDZCzxVWE58lx4hEs4A4ZKWhj4zOpi9
         PYMCthmhSVLTnLa76G2dP7k2gkwBIiJKAIZFB8n05urZm7G4dUbrsYDsTjl0P3QekLqs
         6thQ1lQ0ExdmC8Cmdc7vAkRgBDqKjmDeL7KjlU4YDegWvqBopLl/24+pIq4CQILHNi4A
         7yryG6AqiQLkKxEyZPU4ZBFP2nTadHaP0h44CFXUiaVEAiI1jAYQV165TgEjLh/KJpnQ
         yQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729063860; x=1729668660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R34hHdvFIYMq9ZmXSvfE0IG+MHVNqzXq4FOqKZ22TY0=;
        b=IfuxZwrRV2k/OiFYqApq2srOPjxayHLmfvTCgHOn05o2RmNOQW7I4LHLiDPvpWKzqx
         VYlYz+kiHreuYy7/3LtzzVzP8R+1IzqwKltdSlinEoz/vizTfTuEfw+P/qIz1thNd0xD
         P5JAUNfceCshqO3NAL7Usvn1Y9AeOdmgAHR2pvT2mIKXWXEwhrQZYgCJXcZeXMpnwAgb
         IvgAT5OBBarbMFCLp1LHUWEoXpt+zSOy/BIRaPquCtJ1N4h6FdI3I8Og6ciAopy3LPp3
         LHvvx/VfVDiSGQNqy+yO4KjjkbAS5vzvPjebWgQ7OI7lJJATFJuDHwFhRBon8xS25tRU
         L5ug==
X-Forwarded-Encrypted: i=1; AJvYcCVLLB4rCkr7/PMfxazImBeuG4FRxulHMJQhBSZN0nYYqmRw729shurVIFQO8hHGjmVZJRjYzLA4sfA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh6Qw5uR4+q1TUbAv4cVg6+RW4xFkWW4Dxi2xHuIGRyiuOio4u
	45XNw8+duMOLfGre+iMMEm/j4VEJxmR9AbGzRkLMNzKUGsy97bHarXJLV2eWWFI=
X-Google-Smtp-Source: AGHT+IHldw33jGlDpRijQvlYNzDaS979Wd9CwKdwa32VsF108XYz7aKToHH+pl4TTjCUxVNH7ilcrA==
X-Received: by 2002:a05:651c:154b:b0:2fb:65c8:b4ca with SMTP id 38308e7fff4ca-2fb65c8b665mr6122741fa.40.1729063860180;
        Wed, 16 Oct 2024 00:31:00 -0700 (PDT)
Received: from [192.168.0.245] ([62.73.69.208])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d7b73bdsm1416283a12.85.2024.10.16.00.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 00:30:59 -0700 (PDT)
Message-ID: <4accc34d-77f2-46d4-bf66-c10fe5e8f372@blackwall.org>
Date: Wed, 16 Oct 2024 10:30:57 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] bonding: return detailed error when loading
 native XDP fails
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
References: <20241016031649.880-1-liuhangbin@gmail.com>
 <20241016031649.880-2-liuhangbin@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20241016031649.880-2-liuhangbin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/10/2024 06:16, Hangbin Liu wrote:
> Bonding only supports native XDP for specific modes, which can lead to
> confusion for users regarding why XDP loads successfully at times and
> fails at others. This patch enhances error handling by returning detailed
> error messages, providing users with clearer insights into the specific
> reasons for the failure when loading native XDP.
> 
> Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
> ---
>  drivers/net/bonding/bond_main.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index b1bffd8e9a95..f0f76b6ac8be 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -5676,8 +5676,11 @@ static int bond_xdp_set(struct net_device *dev, struct bpf_prog *prog,
>  
>  	ASSERT_RTNL();
>  
> -	if (!bond_xdp_check(bond))
> +	if (!bond_xdp_check(bond)) {
> +		BOND_NL_ERR(dev, extack,
> +			    "No native XDP support for the current bonding mode");
>  		return -EOPNOTSUPP;
> +	}
>  
>  	old_prog = bond->xdp_prog;
>  	bond->xdp_prog = prog;

I guess this is based on our discussion earlier?

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

