Return-Path: <linux-doc+bounces-96840-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IzSsCWuvVmprAAEAu9opvQ
	(envelope-from <linux-doc+bounces-96840-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 23:51:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC897590F2
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 23:51:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96840-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96840-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=goodmis.org (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F12ED301CCF3
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 21:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8BB377A97;
	Tue, 14 Jul 2026 21:51:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A7137E5D0;
	Tue, 14 Jul 2026 21:51:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784065896; cv=none; b=pJ00ciVcQ7/gheGrQ1rFdAaBtRY14hDKMR1vxztcdLFZBywHuGzZv7MSmdeDsZ2dYcwCNHKVnTZKyvn6QKTO7cob0h/npthPpPJsqwBHJhAmfa5MUZVFb7ThAsmaSOcMzMO2HIVMKeaR8hpFzgCFt0NqpzqXtuqKcWePdlls9rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784065896; c=relaxed/simple;
	bh=bXaz2qZoLuJcWKSqSMD6L56EptgMfeC1fMDylZ7aMcs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y4gcTSQdlYLTGV7Y8X9yKGKDXTb4hQjxBOF/BKX+PbfdUs3i5fauYkPyaUvkxRCNP+3hDhvKmNzjL3fzbWp/NEL1NZHy+Hs5S9/QHFebE8rmrU5OB5EdCQvPBfoJPKWk1bcgcWuLTg+KeyCljuVl1nolGXqvONesh57UhM7JOh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Received: from omf01.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 892F3804B0;
	Tue, 14 Jul 2026 21:51:31 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf01.hostedemail.com (Postfix) with ESMTPA id A1A506000C;
	Tue, 14 Jul 2026 21:51:27 +0000 (UTC)
Date: Tue, 14 Jul 2026 17:51:31 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Russell King
 <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>, Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 6/6] Documentation/kernel-parameters: add/update
 printk_delay/boot_delay
Message-ID: <20260714175131.1edfc880@gandalf.local.home>
In-Reply-To: <20260712-printkcleanup-v3-6-574547b8f71b@thegoodpenguin.co.uk>
References: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
	<20260712-printkcleanup-v3-6-574547b8f71b@thegoodpenguin.co.uk>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 7zy31kt8rbwtcxpe5riua91mpmyq316o
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18CNmWd2YhLXQvEn1XaHEtwP0wzcKYWfXE=
X-HE-Tag: 1784065887-653010
X-HE-Meta: U2FsdGVkX18t0ruRrD4DDDo0OZ1UA5N76Mf6Lk9oRwOylkSPIbsZWq73qoTz/bkApRB0oxXicLVMDXuK/ZC8dSH77knGTVCpJAZxUxtyvEH/UImu4r3aD8mxRcA5JsRDxTK2N0nO/Q3xgVVpTuV+t1StncIDm3pwv3kYfoeMs8Jg0EJem2UEWPdzi9oJndMRunIH/kS0lPHLDnjK39PoWXSlEiQYG7RJMAz69lnU0kl6Sb7Keuvboe2QUYC4iTAc0pSUneUfPyg9zXOkZ7TN5xPibPrdNOnPExVT/RiRYqicpYieJo2Af3W1FtfKy6YFNnYkT1kxOd8XliV8F5iK8P87+FxnmpA29LqdXki/3Q9gI9m/b6mxPiufh8MKnRsU
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96840-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:amurray@thegoodpenguin.co.uk,m:pmladek@suse.com,m:john.ogness@linutronix.de,m:senozhatsky@chromium.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@armlinux.org.uk,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:akpm@linux-foundation.org,m:gregkh@linuxfoundation.org,m:bigeasy@linutronix.de,m:clrkwllms@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-rt-devel@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rostedt@goodmis.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,thegoodpenguin.co.uk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gandalf.local.home:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DC897590F2

On Sun, 12 Jul 2026 11:20:37 +0100
Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:

> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 2884103b93bca7b76cd3a93946276074cf62d0a1..1118feda87b1b04543b1da0bd52c090b1fddaeac 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -650,11 +650,19 @@ Kernel parameters
>  			See Documentation/block/cmdline-partition.rst
>  
>  	boot_delay=	[KNL,EARLY]
> -			Milliseconds to delay each printk during boot.
> -			Only works if GENERIC_CALIBRATE_DELAY is enabled,
> -			and you may also have to specify "lpj=".  Boot_delay
> -			values larger than 10 seconds (10000) are assumed
> -			erroneous and ignored.
> +			Milliseconds to delay each printk during and post boot.
> +			Boot time delays only work if GENERIC_CALIBRATE_DELAY
> +			is enabled.
> +
> +			Once booted the delay can be removed or adjusted via
> +			the printk_delay sysctl.
> +
> +			Please note that you may also have to specify "lpj=".
> +			Boot_delay values larger than 10 seconds (10000) are
> +			assumed erroneous and ignored.
> +
> +			This will soon be deprecated, please use printk_delay
> +			instead.
>  			Format: integer
>  
>  	bootconfig	[KNL,EARLY]
> @@ -5468,6 +5476,19 @@ Kernel parameters
>  	printk.time=	Show timing data prefixed to each printk message line
>  			Format: <bool>  (1/Y/y=enable, 0/N/n=disable)
>  
> +	printk_delay=	[KNL,EARLY]
> +			Milliseconds to delay each printk during and post boot.
> +			Boot time delays only work if GENERIC_CALIBRATE_DELAY
> +			is enabled.
> +
> +			Once booted the delay can be removed or adjusted via
> +			the printk_delay sysctl.
> +
> +			Please note that you may also have to specify "lpj=".
> +			printk_delay values larger than 10 seconds (10000) are
> +			assumed erroneous and ignored.
> +			Format: integer
> +

The two parameters descriptions are identical. They should show something
different. Is it just that the "boot_delay" name is getting deprecated?

-- Steve

