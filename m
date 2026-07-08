Return-Path: <linux-doc+bounces-95579-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A6r7J8HPTWrD+QEAu9opvQ
	(envelope-from <linux-doc+bounces-95579-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 06:19:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 987C0721902
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 06:19:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=mvz5J5tM;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95579-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95579-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE5DD300A58F
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 04:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9AB3803C8;
	Wed,  8 Jul 2026 04:19:06 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECAF3403FE;
	Wed,  8 Jul 2026 04:19:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783484346; cv=none; b=NFwfdWwT3y/+5d31/288KrS5ba2gE89l6jD1utA0KwicAVCpY83HEZKuIMYTJeeIkYxIrji2WJ5ItjFA3Y/KgMjGSpWLwqMsZZexUjKWT+LrtLqUwpjZj75/xJvDx3SCtKHoZXfsCuEelexU52nWytz7V20D5/AdZfCUj1eGWbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783484346; c=relaxed/simple;
	bh=t9xbrvVv0BC+qXtaFOE/1qrhUeY+oiX8UVKiIi5zZ30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jrp0Eab+E7Id1+TpZ6c6xtSND6BNUiNfn09yk3IZy1FkJ/WrXDQ+54s7555ddS//UYC0YXOhwo7cPZsHRsTj45NKO9VSaaWqwprOnzh+r5WpmbdoW9YY8DK2keoVmOSTK8wpO9y4HiesX2GAvsoEoVGYHd7sgVPQThg3j9yKa9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mvz5J5tM; arc=none smtp.client-ip=198.137.202.133
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=qaxuoTtZwBt3Y13D9JDbs1NZnlcQC4SHVLf6/R9Bl3M=; b=mvz5J5tMiH2fYZDlgS05S4LwcM
	6bmVhNRd9jZpt1VqOcu2jhi7wy+Ibs8AMobnfS6tNSyqeJeHw8I+kuHtz/dNn0AD4t8fNjSNGDsFU
	TYL1/gLd9BTFw6B6HIZEX63opbaUC2fpnctNUC9+JF28evpeZk3T4mk84P0nNBwI/SxFLyG+a9Hmh
	+Ey+7rQyfboYjEcp6XtHV8qJaQahGCWCQhQQWwbBw3a8rtMMe2shg+1HT/3E1+sptpEqwD3PGt3Ay
	DHHbfA0X9OLCDlWmaLqEM6Tbo9q0vtYcaOCa1OjNEX5YA1ct0tEDvUYXw/B/k01KAB5iTAyiy3MxG
	zaNZ9hFw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJkS-0000000GJU8-1sPC;
	Wed, 08 Jul 2026 04:19:00 +0000
Message-ID: <ff4de85e-e21c-482b-b758-d2b43d786763@infradead.org>
Date: Tue, 7 Jul 2026 21:18:59 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/kernel-parameters: fix brackets
To: Manuel Ebner <manuelebner@mailbox.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703080806.223782-2-manuelebner@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260703080806.223782-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kernel-janitors@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-95579-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,infradead.org:from_mime,infradead.org:email,infradead.org:mid,infradead.org:dkim,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 987C0721902



On 7/3/26 1:08 AM, Manuel Ebner wrote:
> Add a few missing ']'s and a ')'.
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/admin-guide/kernel-parameters.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index b5493a7f8f22..60777968a063 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6413,9 +6413,9 @@ Kernel parameters
>  	reboot=		[KNL]
>  			Format (x86 or x86_64):
>  				[w[arm] | c[old] | h[ard] | s[oft] | g[pio]] | d[efault] \
> -				[[,]s[mp]#### \
> +				[[,]s[mp]]#### \
>  				[[,]b[ios] | a[cpi] | k[bd] | t[riple] | e[fi] | p[ci]] \
> -				[[,]f[orce]
> +				[[,]f[orce]]
>  			Where reboot_mode is one of warm (soft) or cold (hard) or gpio
>  					(prefix with 'panic_' to set mode for panic
>  					reboot only),
> @@ -6875,7 +6875,7 @@ Kernel parameters
>  			xtime_lock contention on larger systems, and/or RCU lock
>  			contention on all systems with CONFIG_MAXSMP set.
>  			Format: { "0" | "1" }
> -			0 -- disable. (may be 1 via CONFIG_CMDLINE="skew_tick=1"
> +			0 -- disable. (may be 1 via CONFIG_CMDLINE="skew_tick=1")
>  			1 -- enable.
>  			Note: increases power consumption, thus should only be
>  			enabled if running jitter sensitive (HPC/RT) workloads.
> @@ -6916,7 +6916,7 @@ Kernel parameters
>  			apic=verbose is specified.
>  			Example: apic=debug show_lapic=all
>  
> -	slab_debug[=options[,slabs][;[options[,slabs]]...]	[MM]
> +	slab_debug[=options[,slabs][;[options[,slabs]]...]]	[MM]
>  			Enabling slab_debug allows one to determine the
>  			culprit if slab objects become corrupted. Enabling
>  			slab_debug can create guard zones around objects and

-- 
~Randy

