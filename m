Return-Path: <linux-doc+bounces-93199-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ujuRJb8+OmrN4gcAu9opvQ
	(envelope-from <linux-doc+bounces-93199-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 10:07:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A22BF6B5219
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 10:07:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UpPTKrrU;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93199-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-93199-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B86F13001FA2
	for <lists+linux-doc@lfdr.de>; Tue, 23 Jun 2026 08:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243493C9885;
	Tue, 23 Jun 2026 08:05:29 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2049E29ACF6;
	Tue, 23 Jun 2026 08:05:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201929; cv=none; b=cRm1IucduBDWQx/HjvP34yGZsWt+cK1xH3vSWk6dLgf1QEokuRPOMsDghF3aWna2/wOdOC7Q+XPRbYkHuhjwUFoWnnle9zIcpUjWHr2TddIXAvm2ziKrn2dZLlK3e3aOZcKxc5HnfIl68SZwkoN9EqRCivq6cKalXLG4/6E/k4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201929; c=relaxed/simple;
	bh=bU2+giOUB2sKQipDsJx4vuSshbOB3S4lFLv6QJlQLTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0ufodWTC/HwafsWhI9yOGjHOjMCJ83T3GkEL3Lg9eKKhhDhQ6YkFj8M//OAhOaGKJuLJMx5zvsPoVnIO25mYyyp+/cs1Bgx6VFV4tA+wA8eH1jkPUCzlW0a5PdhWyb7zcW01kPj9Mqh+CIXW4nMEM3i169rtbNcfPxR9nCAG94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpPTKrrU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A6D1F000E9;
	Tue, 23 Jun 2026 08:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782201927;
	bh=1aHtGofhHLMB8j7InSkqYYRn7GlNQy+IpF/+m73egvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UpPTKrrUW1rshvAn7yi8V2OoPID98lpOrMAsL+vXA8/m3fBcsYLSJUaFRhKdMj3BS
	 yrQ+N/zkwkx1TL9mJF59PUNwuIeGb6eQO832wNTCO9Ydik+Iqb++Y68khZ2fmZPSB3
	 8lx8UcdaQPcpOAj/iXTAE5LDcTgGdsRePdjpu/+8fh+9tWkmvOyuzFPMCH8bWgdVz1
	 u6rwIcHrAKjMLkOFQKCVhQJN574oBHShYVIAuaBQHfSDtysW8Q8OEHl1helhH8vvzw
	 Fz6QiM9vg6WEU80bozpJplfrkx0PNNqbdphZs13yExwrTj9kZ/p5mat2h5XHPcVHHY
	 IarHs2rY6eoSA==
Date: Tue, 23 Jun 2026 10:05:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, wim@linux-watchdog.org, 
	linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	openbmc@lists.ozlabs.org, linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, avifishman70@gmail.com, 
	tali.perry1@gmail.com, venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, joel@jms.id.au
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: npcm: add GCR syscon
 property
Message-ID: <20260623-ochre-spoonbill-of-security-a4bc42@quoll>
References: <20260622083046.3189603-1-tmaimon77@gmail.com>
 <20260622083046.3189603-2-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260622083046.3189603-2-tmaimon77@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tmaimon77@gmail.com,m:andrew@codeconstruct.com.au,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:openbmc@lists.ozlabs.org,m:linux-watchdog@vger.kernel.org,m:linux-doc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:avifishman70@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joel@jms.id.au,m:krzk@kernel.org,m:conor@kernel.org,m:taliperry1@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-93199-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[codeconstruct.com.au,linux-watchdog.org,roeck-us.net,kernel.org,lists.ozlabs.org,vger.kernel.org,gmail.com,google.com,lwn.net,linuxfoundation.org,jms.id.au];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A22BF6B5219

On Mon, Jun 22, 2026 at 11:30:44AM +0300, Tomer Maimon wrote:
> Describe syscon property that handles general control registers (GCR) in
> Nuvoton BMC NPCM watchdog driver.

Why? Well, you try to answer by saying something about driver, but we do
not add bindings for drivers. Instead hardware should be the reason.

Anyway, why is this needed now?

> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml   | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> index 7aa30f5b5c49..4f00f099b2d2 100644
> --- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> @@ -40,6 +40,12 @@ properties:
>    clock-frequency:
>      description: Frequency in Hz of the clock that drives the NPCM timer.
>  
> +  nuvoton,sysgcr:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      a phandle to access GCR registers on NPCM750 and NPCM845 watchdog
> +      instances.

Here you write also for what purpose.


Best regards,
Krzysztof


