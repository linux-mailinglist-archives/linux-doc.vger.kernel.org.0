Return-Path: <linux-doc+bounces-90794-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jo3+AV1hIGo62QAAu9opvQ
	(envelope-from <linux-doc+bounces-90794-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 19:16:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF2B63A195
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 19:16:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=blackwall.org header.s=google header.b=J43NUAr6;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90794-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90794-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E504530143C5
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 17:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C624E44BCA5;
	Wed,  3 Jun 2026 17:12:27 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EB43E63BE
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 17:12:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780506747; cv=none; b=hovet8u7cs1I62RP9/f2QdgXX02V2eGIDmqcKPsX/qHP55T/O/GZPwtMZzK0ABL4EiH8pmYjP2fQeLS4xWd/eSmm13LRHknJI07IfIMbA4Rwnn0eAdm9ZMMZtwf7oHeJ0pYTbFTLWs3Pew4R/4CcU7PuxT710nMLSvEPTEyM5ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780506747; c=relaxed/simple;
	bh=TN5VN5nZYGpZ0cgk6I+DWPRMt4OBymg3kF+L1ZSTg10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VkMI3MCE/QAe/5sMwLmkGmz9OLqwBBZuSw4mYNuTnhIFUTj5cYS/cftcg4UF2rABotdyq2JCLdCOo/5ghr73s4GoCWp5CIxjBPgZbnkde1YSCYabIuCkgch7hZg1xyMoE8zJIPvhCG7GdIiK1IO/EhD93icShuEjTa8gCsDeImM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=J43NUAr6; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ef372c58aso2984584f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 10:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1780506745; x=1781111545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WShIXeDXg6osn/1BPpnCqqp3TWGu+yv09MQ0gxlHZ/8=;
        b=J43NUAr6UxcD6FhnwU3H5ssro/H+8XGFqQJSoNhiMs3ztDp8Q8P4c0V4dndmvxoB9u
         HGLYWSSg/r/hz7VWdpSLHoZXMi9kTS9DtnC8iKQWzEpjAIUj+BYzxmxi4S7E5BSmqwfn
         rkkklpjH0ZOVxOShxgYaB4k9F71N8npU26s3nDsEymw6CQ+de50yUol829sxw9znEOKC
         tgW2CPTzcTc+wzz9f3pYS+fJ8gXhWlSeVPAGv2b87BtaKX8qFi/1JAVnIrRzksUXckom
         cGdxPwDy3l3pkO/Cv0IoLx3U0SLmT5DwSOr08RKc8RGcbYpX47iCv4rsl1mJ26oum2Oy
         koPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780506745; x=1781111545;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WShIXeDXg6osn/1BPpnCqqp3TWGu+yv09MQ0gxlHZ/8=;
        b=E3uDT7Sx/rR5EhcsTZ8c25Pw/f/8UsjNUGO+/py62m7n1pksgXTVePSivsZHKY2PlY
         XCgQ/uR3N6/AzvOX+60OPU1GPO4mtrKqMVH+XgqzM98TXynBmEzxkSgFfEZAlMowj+17
         ZMk0EtCu91U6nM5fBiw/sHDdQ+wxcgPUqU+hUY5qI8ZO9LQMcioWmNbUKFguN52CjlZW
         iRfofo12eI40qKwclgPgtJ/Al7IfiQ+o+UnzfIACvFG+2GluHrsp9o0Xh3WR3dSlvkwQ
         x+xAdoX6Y896DSbWCh+G4LjfkRQCgyR2B++oyO7D0MyGcmXopqJ0ScgAOjRDt/GbvAGT
         7h3A==
X-Forwarded-Encrypted: i=1; AFNElJ8BS797TtitFNzeMSc2jh1i6vGNyLM2LdKaS7m+eu+LpJSTnI8TteFvww+8OCLmzbTZDdtg1nDXWBA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0VRi7knAU+Yka8duJXmCCkClEKPWa17JmvsMfeltOrnf5uuVY
	/bS2LwPfOnf0VUQbtb1Xvyl5Mm8pnuRc/eCC7CHae2Hpc0SDdGsOIYlxs4a0EnxlzK8=
X-Gm-Gg: Acq92OFZAYGv/TeokUhsy+/kUCjn7OhuWGfRsFxEruwkh4DC+Laf/Cyax/G55nKOi3L
	owzbXhS5oJx0r457KuCZgJdLuCa+ZBanyjt5h7FP9NmYw6raIVoYJIsn4WOcZ5MDcmyHj++A+1L
	Q3KemS4cq7WtgNF7ped4kxUnIlFDIX8RCUoJxO20hgTEO7DTtOjDdGkLCDKKPgz9mnZDNV2lerD
	GmcfSXPqPUbP3d6DyTCnEkrPUDck8jGy/tYUUQdtOwXY14g01KncljNR0dxWoNWx3hpy0ikgexZ
	Q+yFdi9N7OaHG8evURfvwzbVOre++DTdqYwQIl6lcgw5Sszx0z2EjRV2M1hOQDggckLN8mqXgok
	vLxt99gP4r1Knsi7g9jbMVsqrIhoW34B+DvMt3i4pjr7tzzF+A1q6JplUt5+t9UvLMyPUWB/hLq
	QT3xvGdhskesgmWY1qmIcwJKnIyWJGmaISqA33QI7NTTc6lSPWPOGivMNK946v/qmC
X-Received: by 2002:a5d:5f8c:0:b0:45e:f29d:d42d with SMTP id ffacd0b85a97d-4602181eea2mr6197828f8f.25.1780506744671;
        Wed, 03 Jun 2026 10:12:24 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm8997419f8f.9.2026.06.03.10.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 10:12:24 -0700 (PDT)
Message-ID: <b087dc20-7398-4ad3-9787-efef883d81b1@blackwall.org>
Date: Wed, 3 Jun 2026 20:12:22 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next V3 0/2] devlink: add generic device max_sfs
 parameter
Content-Language: en-US, bg
To: Tariq Toukan <tariqt@nvidia.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>
Cc: Jiri Pirko <jiri@resnulli.us>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Mark Bloch <mbloch@nvidia.com>, Vlad Dumitrescu <vdumitrescu@nvidia.com>,
 Daniel Zahka <daniel.zahka@gmail.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Arthur Kiyanovski <akiyano@amazon.com>, Petr Machata <petrm@nvidia.com>,
 Ratheesh Kannoth <rkannoth@marvell.com>, David Ahern <dsahern@kernel.org>,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 Gal Pressman <gal@nvidia.com>, Amery Hung <ameryhung@gmail.com>
References: <20260603102646.404797-1-tariqt@nvidia.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20260603102646.404797-1-tariqt@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[blackwall.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90794-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tariqt@nvidia.com,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:jiri@resnulli.us,m:horms@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:saeedm@nvidia.com,m:leon@kernel.org,m:mbloch@nvidia.com,m:vdumitrescu@nvidia.com,m:daniel.zahka@gmail.com,m:aleksandr.loktionov@intel.com,m:przemyslaw.kitszel@intel.com,m:akiyano@amazon.com,m:petrm@nvidia.com,m:rkannoth@marvell.com,m:dsahern@kernel.org,m:netdev@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:gal@nvidia.com,m:ameryhung@gmail.com,m:andrew@lunn.ch,m:danielzahka@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[razor@blackwall.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	DMARC_NA(0.00)[blackwall.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[resnulli.us,kernel.org,lwn.net,linuxfoundation.org,nvidia.com,gmail.com,intel.com,amazon.com,marvell.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[razor@blackwall.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[blackwall.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,blackwall.org:mid,blackwall.org:from_mime,blackwall.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BF2B63A195

On 03/06/2026 13:26, Tariq Toukan wrote:
> Hi,
> 
> This series by Nikolay introduces a new generic devlink device
> parameter, max_sfs, to control the number of light-weight NIC
> subfunctions (SFs) that can be created on a device.
> 
> The first patch adds the generic devlink parameter and infrastructure
> support.
> The second patch implements support for the parameter in the mlx5
> driver.
> 
> With this addition, users can enable or disable SF creation directly via
> devlink, without relying on external vendor-specific tools.
> 
> Regards,
> Tariq
> 
>
Need to rebase due to commit d603517771d8 ("devlink: pass param values by 
pointer"). Sorry for the noise.



