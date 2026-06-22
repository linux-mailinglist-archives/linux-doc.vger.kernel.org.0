Return-Path: <linux-doc+bounces-93137-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GbbLL6+WOWqDvQcAu9opvQ
	(envelope-from <linux-doc+bounces-93137-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 22:10:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 729DC6B237D
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 22:10:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=MuBcp2xc;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93137-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-93137-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44649303C7DE
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2026 20:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CCE52C21C7;
	Mon, 22 Jun 2026 20:10:18 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAEB1CAA7D;
	Mon, 22 Jun 2026 20:10:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782159018; cv=none; b=Ow+cV74n2xO8L7YcjIQprxC+4qRFyyUH7tT17n8DEQw5I4AoADWAzr6CpL/T+81zJW1py6t3gO/EMcqgnTrLBOH9YOdIqdYLastyh301vi/jVmslMqVrqXa8dWs8jgN0gERVpDAdcQfx8ccsUT5B1TOvr3NO5HeKKwNEDCqfH80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782159018; c=relaxed/simple;
	bh=Wm/K/tO/McR0gGphUYMbEQR3X8jp0cl1PcJXvILMOgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AgJuN8EQv6rRjqy29SOIhNiHi68FJirpNW75MILKwfmcnWFlNY+xvKmK8jyDcEM1tk5xzeGen7sjB72PlSb0Ntu87nLlcrldSjjJ+iA5h4dGi3IgAR9ZgMfCib2MI/WM4XQpSUXH6U0waAOIb0l1d/sMGdVPaVv2HUiEXYlRkfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MuBcp2xc; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=KsKSktR9z4IaipH//Fcs9aGpXoy1Q9k4VDQbn9MmWCA=; b=MuBcp2xc+qATwgUn+1cQE4xV9m
	vcRdI1O19xIcMExA8VQjvVbYIL0WaH70FVfYjd0naa6l9LBekcF4Jdd8FLi7CryU9ijZaTKxSyl5j
	5stJ7ihXpOhPzrggySR9wvBU62a46aconqamoZn2u2l7NP4JyOrdazbTjx2BJ33CUS3e3y9Iw4POn
	AHfEKDep/o3xs27FtVcdMDhU4z0+LBeVaHEN4aAxFlqn9vmBFFm15Ot8/q3EojbwYZoSddHYTSOmL
	BGfw/cZn1N2fxu+z/JhHjNGs6V+DCbMBtRvbm0ZwEwqluW6WQXDFajUdSlcOieoF4BVyAlaVEGlhb
	MOR2QcoQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbkyD-00000005MCC-2OvQ;
	Mon, 22 Jun 2026 20:10:13 +0000
Message-ID: <8359450b-6c9a-4867-94a2-f04f6f4f5812@infradead.org>
Date: Mon, 22 Jun 2026 13:10:12 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Docs/driver-api/uio-howto: document mmap_prepare callback
To: Doehyun Baek <doehyunbaek@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260622181821.1195257-1-doehyunbaek@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260622181821.1195257-1-doehyunbaek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-93137-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,lwn.net];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:doehyunbaek@gmail.com,m:gregkh@linuxfoundation.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:akpm@linux-foundation.org,m:vbabka@kernel.org,m:ljs@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 729DC6B237D



On 6/22/26 11:18 AM, Doehyun Baek wrote:
> The UIO howto still documents an mmap callback in struct uio_info.
> That field was replaced by mmap_prepare, which takes a struct
> vm_area_desc.
> 
> A UIO driver following the current howto no longer builds because
> struct uio_info has no mmap member. Update the documented callback
> signature and matching text to match the current API.
> 
> Fixes: 933f05f58ac6 ("uio: replace deprecated mmap hook with mmap_prepare in uio_info")
> Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/driver-api/uio-howto.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/driver-api/uio-howto.rst b/Documentation/driver-api/uio-howto.rst
> index 907ffa3b38f5..c08472dfbcfe 100644
> --- a/Documentation/driver-api/uio-howto.rst
> +++ b/Documentation/driver-api/uio-howto.rst
> @@ -246,10 +246,10 @@ the members are required, others are optional.
>     hardware interrupt number. The flags given here will be used in the
>     call to :c:func:`request_irq()`.
>  
> --  ``int (*mmap)(struct uio_info *info, struct vm_area_struct *vma)``:
> +-  ``int (*mmap_prepare)(struct uio_info *info, struct vm_area_desc *desc)``:
>     Optional. If you need a special :c:func:`mmap()`
>     function, you can set it here. If this pointer is not NULL, your
> -   :c:func:`mmap()` will be called instead of the built-in one.
> +   ``mmap_prepare`` will be called instead of the built-in one.
>  
>  -  ``int (*open)(struct uio_info *info, struct inode *inode)``:
>     Optional. You might want to have your own :c:func:`open()`,
> 
> base-commit: 1dc18801be29bc54709aa355b8acd80e183b03cd

-- 
~Randy

