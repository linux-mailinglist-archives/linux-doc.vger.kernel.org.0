Return-Path: <linux-doc+bounces-84072-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMOzF9DT52kzBQIAu9opvQ
	(envelope-from <linux-doc+bounces-84072-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 21:45:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B779C43F13B
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 21:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C782A3076DE0
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 19:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4708C39BFEA;
	Tue, 21 Apr 2026 19:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5TqYloW"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AD126AC3;
	Tue, 21 Apr 2026 19:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776800465; cv=none; b=HydxrOEHEprh0jRTitq43B9RNTLJrrriWrfC7zgDRkeNlZuJg8eFwZrnlDnX0gtsmRoUsn1jwUXKsbZ56BV5fTv+gydgoYRBgdNGcT20KUmVNOAjjch1vi+6WU7Fqf3iSVFmWJGUSEokw4UXq9fnjQxS2AJ87IZUDUx+dDhTOGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776800465; c=relaxed/simple;
	bh=zrY+UXCrK21X3cDKN8E6BLKwNnq70b6p5TMkx/xbt1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDpni0hEJcPUEdclsk5ktdjzlvZ4Na3H4+iicB2ZDq294LYtcPgM9g/29BACO8PX5WxVlFguQAmNiUp7AteFfkUqbwLRlh2M6QS03nRqDdHFMTeCcOV9WtBcmZJZ9t2btrMPPOKoO19I9W9tybENuJAwi4pYVFhDLMmw1y6c0OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5TqYloW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DD5C2BCB0;
	Tue, 21 Apr 2026 19:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776800464;
	bh=zrY+UXCrK21X3cDKN8E6BLKwNnq70b6p5TMkx/xbt1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5TqYloWxwzTvRcn6rRtxlutPNzz7YSOYsTDUuJOO98Antqid4aDue4AMqAFmwVld
	 Dkzw+hQNroOWKyv1o4WpO51fq6Dgfzkxoav7W4PgMPQwZ2J3rFWUlRJj2aqhK26Lmf
	 0otHca39t6Br6ogTvaODNGmyVKWlTSY4ZS7AJu10FgBeQ9Ccd08dSzJF7QMYdE6vnr
	 yqm+yES6nXlwyZdNfftlheR3CRj+9Bhr6knBm9DXotpd7SPdYoTNQ9/L60pg/bmo9D
	 3JW1MuDw0uK9GOpsttejpDnWP/LLKNGouvdaUh/dNz/ldffFQDhbXma/B6OSjKqth4
	 k/pAO4IsPKcBw==
Date: Tue, 21 Apr 2026 14:41:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-iio@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: light: Document Avago
 APDS9900/9901 ALS/Proximity sensor
Message-ID: <177680045506.1530526.8545902085468752273.robh@kernel.org>
References: <20260419083125.35572-1-clamor95@gmail.com>
 <20260419083125.35572-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260419083125.35572-2-clamor95@gmail.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84072-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B779C43F13B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 19 Apr 2026 11:31:22 +0300, Svyatoslav Ryhel wrote:
> Document Avago APDS-9900/9901 combined ALS/IR-LED/Proximity sensor.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  Documentation/devicetree/bindings/iio/light/tsl2772.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


