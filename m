Return-Path: <linux-doc+bounces-90184-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PjUNi1dHGpYNQkAu9opvQ
	(envelope-from <linux-doc+bounces-90184-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 31 May 2026 18:09:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC61617127
	for <lists+linux-doc@lfdr.de>; Sun, 31 May 2026 18:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D4563002B51
	for <lists+linux-doc@lfdr.de>; Sun, 31 May 2026 16:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF9135CB7B;
	Sun, 31 May 2026 16:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="4JOKONaP"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10E035AC05;
	Sun, 31 May 2026 16:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780243751; cv=none; b=fvBSXqhHb6YM9VbjQ4Ihb0gc/wdLtJMZt0KhjGf2xIv3NBP/AVdzK8U3YuQJJeV+loOrTBvdQW6JGGQ4GNz/VsjLEieJmYU1rI4yKFitoEgNghYWFFRtew2Uea4tAS7i3DZYCLaQIPsIHuqlZGRTcMtzJfuKmg+kkDoGTLgFzg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780243751; c=relaxed/simple;
	bh=m3kbTS558ni8RGNd8CAcj0ZJ9OO0IwDrX5RCzAdmapQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ksOH3Sb/fdWKZpZpWiQzTRy2ifTd9zts2QBB1s038Ofy49s5toXsoBykDHCNKwxl9GeGYM85M3AxkiIHUAX56VGRqk9AziFxjVic8kyChU6PMJyNBqtCHZM+z9Dubmp+uFbUf0TKvQ3O9s/9y99OsegDpSxzgBXllDKiELmxzhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=4JOKONaP; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=FSNGWHhjcttKVIlhEFASjYLPUJ1sMHHhhz+jqTaODJM=; b=4JOKONaPELV6d24fNH55YbKUGP
	hr7LEVyYNhOh8pExoAWTI/JyWMXLm5mmQRfBzYpMne2aYb2nOmjL/1vHtRVnoumwK5orLGyDpOVFM
	slX0Uqo+MJ0o8JkgYzEIvtmkSNVOA5eRCmodhFdSeo2xGEv8PHXXppUTWQ0rMI16ryUsos7ix52JG
	PlRvXCYrsAlJGD2iGjkzS0kuHLNbKzC131tF6rSL06numMzQmXYYrBHwTWNF1nEbfRXJIgN7Yfhtw
	sa2mFWPqnBhSgIFQoqOMmnGdpGEGKkIyh9fnHuUaQSVhntc+8MvsSGfHeLCHDD1YmAaHib08Cuhz2
	2JVd+dag==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTiir-00000009jvR-0Tjt;
	Sun, 31 May 2026 16:09:09 +0000
Message-ID: <9ba41c93-ff40-4a82-9c2e-d86a892f83d9@infradead.org>
Date: Sun, 31 May 2026 09:09:08 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs: kernel-parameters: Fix stale sticore file paths
To: Costa Shulyupin <costa.shul@redhat.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260531140541.4115641-1-costa.shul@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260531140541.4115641-1-costa.shul@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90184-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,infradead.org:email,infradead.org:mid,infradead.org:dkim]
X-Rspamd-Queue-Id: DDC61617127
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/31/26 7:05 AM, Costa Shulyupin wrote:
> Update file paths for sticore references that
> became stale when drivers were reorganized:
> - drivers/video/console/sticore.c -> drivers/video/
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/admin-guide/kernel-parameters.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 459ed0d72aeb..f94ec9f3a75c 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -7381,10 +7381,10 @@ Kernel parameters
>  			Set the STI (builtin display/keyboard on the HP-PARISC
>  			machines) console (graphic card) which should be used
>  			as the initial boot-console.
> -			See also comment in drivers/video/console/sticore.c.
> +			See also comment in drivers/video/sticore.c.
>  
>  	sti_font=	[HW]
> -			See comment in drivers/video/console/sticore.c.
> +			See comment in drivers/video/sticore.c.
>  
>  	stifb=		[HW]
>  			Format: bpp:<bpp1>[:<bpp2>[:<bpp3>...]]

-- 
~Randy

