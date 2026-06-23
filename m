Return-Path: <linux-doc+bounces-93265-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9/PUEBq6OmqVFAgAu9opvQ
	(envelope-from <linux-doc+bounces-93265-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 18:53:46 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AAE6B8E1D
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 18:53:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=C2u+Fhqw;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93265-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93265-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD5C5309355D
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 16:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AAC131A572;
	Tue, 23 Jun 2026 16:48:48 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EB12853FD;
	Tue, 23 Jun 2026 16:48:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782233328; cv=none; b=jfk0ada1p6z+P0ozMxfOTtWM8iL4ecsTDTEgOTRP3h9lV1s5JVN0As89UkuBlyxUl4TlALp71E6woG03qr4jwDBCqb5GQbbJ1IiRW7/A/P5cAkFRy085zg1xFYo0i5qmc06M5SwkNQhmbMC9ORz9vh1UvkE5NZq8iMREvCUzryg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782233328; c=relaxed/simple;
	bh=HFMzxosMl1/xGkXPZiHLOcNmrmrJnXq0t97WucFjIQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aov8NILcVrmQE3zh5zeSgGcVvE7ITvCJyzK+yNLgzbnCWj2CqiLZSrLU3MM9WP/V2vMUzvO88cfLVp1PsjRYuEA5IBUCgTCAXgLO662XFGG0IWVx4jdu6e4uqlYnSPPnzLvlYYl1y5UDPUQwI6IoNgWzi+7DGMNpx033lWQW2hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C2u+Fhqw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16DC1F00A3A;
	Tue, 23 Jun 2026 16:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782233326;
	bh=XTd1oYODO+jyORH1hmyxw1qqhri337OZ0PP2Sxmio/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C2u+Fhqwz7Cw+nG0Li32TbRDfsxJvV5b1kiPDDWcSbRWVJ6qexPT0xX/t+G9vEfJ5
	 qzSuL1+J8scs6pSvQ7ud3krhjIE9euW9oQRv/94kspletZGCM2FKvgg/nyC7wOykdy
	 tAx0320EAIfuCrPdhTCM5CIESaeoVwGnFuHQSaC0wEXPM9qCEo7wCxghkOo96G+bbL
	 vKysd+1zVx97+I42xfGkjT4eVmAX/RQDpBvGkh4RO0HBWk4IKo17eBopMS2CX5TL1u
	 zjREuVs5C6rcVZxQoSyEYg0IndkNKt+2TpDo+Omu/aCj26alcdreew4eIR1+d6B5GX
	 axX2d1+Ds+Gwg==
Date: Tue, 23 Jun 2026 17:48:40 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Doehyun Baek <doehyunbaek@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Docs/driver-api/uio-howto: document mmap_prepare callback
Message-ID: <ajq4yGBq0Jag_UGX@lucifer>
References: <20260622181821.1195257-1-doehyunbaek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622181821.1195257-1-doehyunbaek@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:doehyunbaek@gmail.com,m:gregkh@linuxfoundation.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:akpm@linux-foundation.org,m:vbabka@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-93265-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lucifer:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5AAE6B8E1D

On Mon, Jun 22, 2026 at 06:18:21PM +0000, Doehyun Baek wrote:
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

Ah thanks apologies for missing this! LGTM so:

Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

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
> --
> 2.43.0
>

Cheers, Lorenzo

