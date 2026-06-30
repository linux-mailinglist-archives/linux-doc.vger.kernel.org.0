Return-Path: <linux-doc+bounces-94141-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 59WSEwNzQ2pjYgoAu9opvQ
	(envelope-from <linux-doc+bounces-94141-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 09:40:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D18C76E1457
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 09:40:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=m9GlXdXv;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94141-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94141-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CDE2301BBA7
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 07:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A483E5EE1;
	Tue, 30 Jun 2026 07:39:25 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D265D3E3DA6;
	Tue, 30 Jun 2026 07:39:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805165; cv=none; b=WHE+gl4Li41SjI7c+rSWINgFeIRZEagDh2kjSYK6EVQ3o8dOsIrSW8ig875FIOYTA754A0aXk+IT2Q7xqU1V7SxOu4szkiA8v6Z5Gq5JA60pzqMMA4culQLsn8/H/LNMeEsmvPpNXmOtJVaz0BSDp5wlt1QYG5WG1TkiLBFlnAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805165; c=relaxed/simple;
	bh=Xhy0uu78lhmM7NviQoKUzP5DJzdFxjJ1LFNi60RVbrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ry8FMNWt6qmcUaNGsfnA1Ow7Dw1q2DsjggKtpIn00XtZ/wU02YrIwa2VN7+Ksg/9ww/nnHIt4bOpklFqQrros9/eMBXMrhkgBC0wVmK+T/uqS5eRVlTbmPzbUpPe1V8l/FJKjNLhIpI59/z5iTGbpwjcTpUIIJXdeorhwFuVsRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9GlXdXv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965481F000E9;
	Tue, 30 Jun 2026 07:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782805160;
	bh=dxmiixmh96EWTcLSCCT3E784wyYP9sv/nBNB+zmpCmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m9GlXdXvrZNfWTqO4jxWEjiBQWotPgNIdmvza04JqZkEOhqb82PWCij97KQFQ2ld0
	 /rCM4eyEDsbYKsU5MPO6X8KsZyB6nXsNYavT01OFAELLE+EYl9Ymr2a12eeyOnI3iN
	 2qL3E0caca+n54ZU2vSEr+kYIjAAuNjRIv/23Lr487m5f+GtnyhFqEujq/zAw1hZyn
	 Aw6rk5dSlQhF1C6v63H2hN3C9VpHJGpxuG0LXf94RW4+yZ5icBXwkDJ2j5EyO5ijM4
	 ceUTfTdZaJQjX4GWLjhjdAUGJ/HXpxBGPS/yl8NWufNeEBitjFNiB/hP9pvKLpb14f
	 pWeZU2PZpGX2w==
Date: Tue, 30 Jun 2026 09:39:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: hwmon: (pmbus/max20830): add VOUT
 feedback resistor properties
Message-ID: <20260630-tuscan-fennec-of-sympathy-29428c@quoll>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-3-a02786bde470@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630-dev-max20830c-v1-3-a02786bde470@analog.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94141-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alexisczezar.torreno@analog.com,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,quoll:mid,analog.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D18C76E1457

On Tue, Jun 30, 2026 at 10:46:45AM +0800, Alexis Czezar Torreno wrote:
> Add adi,vout-rfb1-ohms and adi,vout-rfb2-ohms properties to support
> external voltage divider configuration for VOUT sensing. When the
> desired output voltage is higher than VREF, a resistor divider (RFB1
> and RFB2) is required to reach the intended value.
> 
> The properties use a dependency constraint to ensure both resistors
> are specified together, or neither. This prevents misconfiguration
> where only one resistor value is provided.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
>  .../devicetree/bindings/hwmon/pmbus/adi,max20830.yaml   | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


