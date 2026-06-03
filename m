Return-Path: <linux-doc+bounces-90728-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CzvvBNMaIGrOvwAAu9opvQ
	(envelope-from <linux-doc+bounces-90728-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 14:15:15 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6363C637655
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 14:15:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="NwnnLw/I";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90728-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-90728-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5A883080117
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 12:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90687477E32;
	Wed,  3 Jun 2026 12:03:08 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897724779A4;
	Wed,  3 Jun 2026 12:03:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488188; cv=none; b=o5iK1UBwmVfHrU9e+xfPzrUp6XMGrbgAZtKR9iQEaJEv4jf7fbccMltGT5zjcxDFeOFUN+vZ7GoD1SFuDSMmciqzoF/WmN5v3OEBWwOTYadxfiA2Qct0pGDOK80kkMEbwcOeb/guB6Gdb72e3jnsv0U/E8q14L+0BQFTNYq5WDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488188; c=relaxed/simple;
	bh=iws0Tqy7tnfDb1/y0VXTMhiMiNB5jVzESMdnPftZQL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAUZVoe56pZBmjwu3kZ/It45GoBRKTH+xYgkNc0xJjqzsmkI+XUjo6EElSYRUQZ8FEgDoGhITWFYwlpDj9Rr3UP//++INnSMdCBI6WAPytXmoPecAIMiFMd/v7bpjLHS/mxR/BE+q+I1ZIFnMdPjEX/HY0YRW4ZdiMjoB7V2qh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwnnLw/I; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996911F00893;
	Wed,  3 Jun 2026 12:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780488187;
	bh=IDHgSHa5uXJ+5Hto9fEJThy5rAbEZ0SR6ey5biY1EW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NwnnLw/Id0sHKsjiKaS8e4ppA2aD9LcPMTcTIPRFSYWL7yOAwo+azmXyFJB9euTCq
	 PtjT0r283OzRwfwqQzwW0Q61xedncBSgVLwQiMk4zPGOcq5VGRINV55mJXJmWUL98Q
	 Ye0XW2PTKkw2NbjwguZT6ACC91Vd+LBufHEHsbBdqsmxlP/h00qyIE4QmiPzV5yJCa
	 1J8dsKBHHYbQ7JU73wzCbOoJUQD5qs2DyMaA1hfNDLlmQEqEHu98h7m3kDE/FePb3o
	 KaE5QwbmnWgXlALze/3rs/VzhE6hqc9nIhLQmtwBk5wwJN/aqsUBlfJbS8luLI4Xmc
	 0zyIIHCMUywTg==
Date: Wed, 3 Jun 2026 14:03:01 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	"Daniel J. Ogorchock" <djogorchock@gmail.com>, Petr Mladek <pmladek@suse.com>, 
	Tamir Duberstein <tamird@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 2/2] HID: nintendo: Use %pM format specifier for MAC
 addresses
Message-ID: <aiAXraQh-IrbAe0C@beelink>
References: <20260603104351.152085-1-andriy.shevchenko@linux.intel.com>
 <20260603104351.152085-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603104351.152085-3-andriy.shevchenko@linux.intel.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-90728-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:jikos@kernel.org,m:djogorchock@gmail.com,m:pmladek@suse.com,m:tamird@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-input@vger.kernel.org,m:rostedt@goodmis.org,m:linux@rasmusvillemoes.dk,m:senozhatsky@chromium.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:akpm@linux-foundation.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[bentiss@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,suse.com,vger.kernel.org,goodmis.org,rasmusvillemoes.dk,chromium.org,lwn.net,linuxfoundation.org,linux-foundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bentiss@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[beelink:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6363C637655

On Jun 03 2026, Andy Shevchenko wrote:
> Convert to %pM instead of using custom code.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Not sure where the first patch should land, so in case someone prefers
having the full series through their tree:
Acked-by: Benjamin Tissoires <bentiss@kernel.org>

Cheers,
Benjamin

> ---
>  drivers/hid/hid-nintendo.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index 29008c2cc530..05c50f2530ef 100644
> --- a/drivers/hid/hid-nintendo.c
> +++ b/drivers/hid/hid-nintendo.c
> @@ -2431,14 +2431,8 @@ static int joycon_read_info(struct joycon_ctlr *ctlr)
>  	for (i = 4, j = 0; j < 6; i++, j++)
>  		ctlr->mac_addr[j] = report->subcmd_reply.data[i];
>  
> -	ctlr->mac_addr_str = devm_kasprintf(&ctlr->hdev->dev, GFP_KERNEL,
> -					    "%02X:%02X:%02X:%02X:%02X:%02X",
> -					    ctlr->mac_addr[0],
> -					    ctlr->mac_addr[1],
> -					    ctlr->mac_addr[2],
> -					    ctlr->mac_addr[3],
> -					    ctlr->mac_addr[4],
> -					    ctlr->mac_addr[5]);
> +	ctlr->mac_addr_str = devm_kasprintf(&ctlr->hdev->dev, GFP_KERNEL, "%pMU",
> +					    ctlr->mac_addr);
>  	if (!ctlr->mac_addr_str)
>  		return -ENOMEM;
>  	hid_info(ctlr->hdev, "controller MAC = %s\n", ctlr->mac_addr_str);
> -- 
> 2.50.1
> 
> 

