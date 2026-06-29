Return-Path: <linux-doc+bounces-94086-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id asklGcv4QmpZKwoAu9opvQ
	(envelope-from <linux-doc+bounces-94086-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 00:59:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A92E36DF1F6
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 00:59:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cMdtrwuJ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94086-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94086-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C0DE3012256
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 22:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA653CB911;
	Mon, 29 Jun 2026 22:58:57 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A728D3C9EEB;
	Mon, 29 Jun 2026 22:58:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782773937; cv=none; b=jFC+dGUvMKs3B8oS2mbK/N9I7QTAV+skyuQHOlFyHscgIv56D0g+AX/TrgLkmgxK6ekbDnj5WCrufheIV+nJ1d5wf1d3zvT+fkdnosazNXExBAmVhlovJBY0h51XOSf6aZVGNQM2bRaJOeAXvNnHwMpjQWnZh1hwJJc0HY0MyvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782773937; c=relaxed/simple;
	bh=XdWTfwRf4PJkIEpOkgS63moPOaB3fnfbEzfDXhnoVFo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DT50TnIR/jQY3yKZTXtSeoGPvH0sGcogS6ATiz1p2gM7hdoxKbAKONXAQ4H+N4AUFgqBCjgDiReb7LpnYaYfHwVivLuItzJe4CcdjLG0kxR0bZb37x2rjkfoob1Lo9OIXDhi/VVNYP1zZ0rI2snUb5uj7GbjOx2gZ1mSOdWYamA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMdtrwuJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2A21F000E9;
	Mon, 29 Jun 2026 22:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782773936;
	bh=d284qO0S3tT/hd+6emkfjjOTDZvCOJZbSdaVEisrumY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=cMdtrwuJp4sl8seFFGa8r5y71CYauYOGAIxIfKJtWFN1HX8VRA+euej4iECaIYAwh
	 ge/9zhZtbw8PCgNOMT0QccFYaiWtokz/R+dH/JfMFzkBheYcYE++pfcDacmpE+Fo8H
	 4Cg2rHeCmNJA2U32iPc4PgRHm/T11AqWKdlP/dq73tTEOgx5cCZ96g8otPwo4kd0f5
	 HyNVbSP7/MbG9qKEoD2lQH0blT5KbOJbVWeysPAUf1pHMVzqNab2QId/5J7eCGkmqu
	 YLJEruEJqmZD33Gi+3aWD9czWgXmrYQL9CJXtMhRrLGL7vrezc3OzRksiXe3esjU7b
	 SKtp1oLxGGfXw==
Date: Mon, 29 Jun 2026 23:58:51 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Jinseob Kim <kimjinseob88@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v6 0/5] iio: add Open Sensor Fusion IIO driver
Message-ID: <20260629235851.09b51d22@jic23-huawei>
In-Reply-To: <9b179166-3057-4867-be04-b071a809f70f@baylibre.com>
References: <20260628191337.937-1-kimjinseob88@gmail.com>
	<9b179166-3057-4867-be04-b071a809f70f@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-94086-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dlechner@baylibre.com,m:kimjinseob88@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nuno.sa@analog.com,m:andy@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	URIBL_MULTI_FAIL(0.00)[baylibre.com:server fail,sea.lore.kernel.org:server fail,jic23-huawei:server fail,vger.kernel.org:server fail];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,analog.com,lwn.net,linuxfoundation.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jic23-huawei:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A92E36DF1F6

On Mon, 29 Jun 2026 10:25:38 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 6/28/26 2:13 PM, Jinseob Kim wrote:
> > Open Sensor Fusion (OSF) devices expose a UART/serdev host interface
> > for a sensor aggregation hub.  This RFC adds a Linux IIO driver that
> > parses OSF frames and creates IIO devices at runtime from capability
> > reports provided by the device firmware.
> > 
> > When the corresponding capabilities are reported, the driver exposes
> > accelerometer, gyroscope, magnetometer, and temperature data as IIO
> > devices named osf-accel, osf-gyro, osf-magn, and osf-temp.
> > 
> > This remains RFC while the binding, protocol subset, runtime discovery
> > model, and driver-facing ABI are reviewed.  
> 
> If you are just looking for review and don't have specific questions,
> then it is time to drop the RFC.
> 
It isn't uncommon to keep RFC tags when there is a related spec
that isn't finalised yet.  Basically they act as a 'don't merge this'
marker.  However I can keep track of this one without it given we
don't have that happen a lot in IIO.  Please do make sure that you
keep that bit of the cover letter, Jinseob!


Jonathan



