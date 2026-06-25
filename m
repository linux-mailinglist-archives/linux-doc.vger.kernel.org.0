Return-Path: <linux-doc+bounces-93491-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LdpoHczhPGrytggAu9opvQ
	(envelope-from <linux-doc+bounces-93491-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 10:07:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D467B6C3927
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 10:07:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=daMinCnv;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93491-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93491-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1452301233D
	for <lists+linux-doc@lfdr.de>; Thu, 25 Jun 2026 08:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403F4218592;
	Thu, 25 Jun 2026 08:07:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CC7276050
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 08:07:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782374856; cv=none; b=PHJOUVi1x5AWGgEeWSC9ZUfkTt1pJlEuvVXQzTLt0EbLx0hQfOsznt3U9FW9peA9WUuqiKWi6leZUqDX0aLTxnwJ/1X/mrrfcgCgfCAAdkonaDkVeBkAC7P5T04+LrBG8pN6RaelCpSeoQMCkRCuY4PMugQKYWFfZHYx4mckmbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782374856; c=relaxed/simple;
	bh=4qJuo5qU+I+SushrL2UeFNuIuwsBS6UwzTW5/V3pGsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cDNvMffrARMB9S48FnfaHue3x7CW7MjOulu6qB3wE4pDyVVD16/IMyS97na49S2zbFbpSAxLp38v7XDuXO1w71cs/H/JHb2XzaeIqSzKusGt/h0YSE+/A9G76HTcSxNou/LtCJhocU0n94FpgxYlEVr+HdF3HaKd3fJeOxW4uZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=daMinCnv; arc=none smtp.client-ip=209.85.167.44
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ad583dc41eso1913852e87.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 01:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782374853; x=1782979653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xMl7TRyc5Ti1eJSQjKVmCxsmv7qZYLjfLBy4mCsAAeg=;
        b=daMinCnv/xjQyCrEFNIAdSR3mgeyNn81DZDWzZosOf1ey3tU+jTMlMp1FUsoYDbtFa
         s4zFs/oAPbrXfGHUTNWlhx3Xc6r8VcuTkUuubxK6/hI093oGSvLHaKjfrGOAPUUYRmCc
         FKYo8wQlRkimEfU0H5YNXgSVncnLu7sXZhEjMe66zkPUmo/A9v2WQlTb1WumHWV7UM8U
         USbIvC1K5vEGgVak1mqYzUFwOhiOUgRAi0cct3A4TkbLrjiW12vnR8GoPe/KuayVFpdZ
         J61pFbDeevQQaF4kQ+VY+pmPLaijHH5km3qRxYMdwM25WVET7JIJz6q/r0ZyXUOd1OgS
         lTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782374853; x=1782979653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMl7TRyc5Ti1eJSQjKVmCxsmv7qZYLjfLBy4mCsAAeg=;
        b=dKVL7UpuGLkIekhbDZSUhpfPabON5TEb1N/VHeEwY/4r8MytAYMFz08H1MkLM1xgXU
         1p2ilEhNcioMBDZXdCuriL8taRcIdUVqzEhpIXru2qyHrFkGJgsJ8LVWwx6tMvYvP4Zq
         jsS8m8zUeV4ltUlzhgJcC2VWx6AW+lDuDOOyX3F+F4R56pIqRiVIpvtuKqORgGDQkC6M
         JsGcAiaToDK1FOk07SFRS03yP2uNBjUQhSndbkKk15lLxylTagSSlLMLUEsSIEwutRLr
         6l3s54+hSzAJMkIUf3buAGkTS8XMuuf/bYbBwG+RbX21x5+KfxaQ+Udn4vmQW0mbesOv
         kefg==
X-Forwarded-Encrypted: i=1; AHgh+Rrt9DXEuzl+/t2BrmS4bWz1XAaADD4uszYGLuNk/rVTErNETUjLqldNSkf17jhLvXj8QkRwO4V01k8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJBZMu2kr6Ft20m7aSTKQlREytqVZKbMmlXvC/vxgz8HJ5MkiG
	PgjSZo+enN7vht+Pi79+ck93k1UqVJqwF9ls5JdZAIyrrVYxt49sr6Ug
X-Gm-Gg: AfdE7ckR11GTb85jqHdRUfbVgJ7Rpv/cVMwl8Ck0PKhclfPNe1wXFwuW+V7gx7+UxP8
	3dP9/cNy7WIMxS95mwCWPdxJx8KizOaz1t4SKNaz3VsFRg9nTJMT+qRl3hbOxfr8fDlyfegmiVC
	Cu5F0OT+D2txo0vfz01RDAbXDLSvOLM2meGp2tEBaWE2l37igTGZl2sMGfCTcSUoSa/CqeRIIfe
	5KIsqqBQuZ4mNtDqfNbBfPNkZJWV8vPFKdUR6z49T49pFi6/nxe7ULuzEKdtjWD2njdYv0eHILh
	Rck2UkQYzAuYNKFtwjEbc0am7ADOVY730ChGqO1wXjithYjHPI4FSeuZ511queJmwKC3Uft3DxT
	FXA7BGVXQ76AFf2Ozl1WA6N3lRwkoGDXs9R8tFvyd4NW3/7dN0BACMmiJNiWWq2acBr6ATXUwo2
	Kl1ancmxu/HkM6zbSk3M8Njw==
X-Received: by 2002:a05:6512:40d0:10b0:5aa:6b8b:8c9c with SMTP id 2adb3069b0e04-5aea1f53efamr308064e87.42.1782374852743;
        Thu, 25 Jun 2026 01:07:32 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b1b1a7esm41585921fa.40.2026.06.25.01.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 01:07:31 -0700 (PDT)
Message-ID: <ef408da3-5d46-43c9-ad71-cd33a9fc6d23@gmail.com>
Date: Thu, 25 Jun 2026 11:07:30 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] power: supply: bd71828: add a terminating table border
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
 Sebastian Reichel <sebastian.reichel@collabora.com>, linux-pm@vger.kernel.org
References: <20260620011821.3568674-1-rdunlap@infradead.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260620011821.3568674-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93491-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rdunlap@infradead.org,m:linux-doc@vger.kernel.org,m:andreas@kemnade.info,m:sebastian.reichel@collabora.com,m:linux-pm@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mazziesaccount@gmail.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mazziesaccount@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,collabora.com:email,kemnade.info:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D467B6C3927

On 20/06/2026 04:18, Randy Dunlap wrote:
> Fix a documentation build error by adding a bottom table border:
> 
> Documentation/ABI/testing/sysfs-class-power-bd71828:1: ERROR: Malformed table.
> No bottom table border found.
> ============  ===========================================
> 1             automatic adjustment of input current limit
> 0             no adjustment of input current limit. This
>                helps for more unusual power sources like
>                solar modules. [docutils]
> 
> Fixes: e92786dd86a2 ("power: supply: bd71828: sysfs for auto input current limitation")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: Matti Vaittinen <mazziesaccount@gmail.com>
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Cc: linux-pm@vger.kernel.org
> 
>   Documentation/ABI/testing/sysfs-class-power-bd71828 |    1 +
>   1 file changed, 1 insertion(+)
> 
> --- linux-next-20260619.orig/Documentation/ABI/testing/sysfs-class-power-bd71828
> +++ linux-next-20260619/Documentation/ABI/testing/sysfs-class-power-bd71828
> @@ -10,3 +10,4 @@ Description:
>   		0             no adjustment of input current limit. This
>   		              helps for more unusual power sources like
>   			      solar modules.
> +		============  ===========================================

Acked-by: Matti Vaittinen <mazziesaccount@gmail.com>

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

