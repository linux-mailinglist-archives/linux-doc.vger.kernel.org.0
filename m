Return-Path: <linux-doc+bounces-91689-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v5FWJpo3KGpjAQMAu9opvQ
	(envelope-from <linux-doc+bounces-91689-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 17:56:10 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B566620C7
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 17:56:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="N/B8GZwo";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91689-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91689-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2FB4302D10A
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 15:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6094336607C;
	Tue,  9 Jun 2026 15:24:38 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510723914E4
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 15:24:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018678; cv=none; b=CJfOweDFQGJ3yuLweIoZtK3rfEpAnIzPtNQSEnXZby7dc2uuxViyeVdxyFV++S85MtPbtwxgpurl/p46aeNzD1WzQp9Qpwifw68iY8y3naWgZNGO00N4ptiQqn1iXSaeptBLaTB3rOTdC+OWBd8S9FF718BiVJyk+v6L1PeigA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018678; c=relaxed/simple;
	bh=c2Vbonmpp6rj3qr2dbpWFFSKJcegr05XEkNbAiBencM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWkesy1YZaOrW1PX3M9ij9w4f0qkOwD479UiMHnl+Lqe3GjWiZGuflNaYGI02IQxDkcrjawLbnfxDmPbmwlG0O8SlBdyDIMxZ6PSj7ZWzh9ClXyNKb4WtwiubP8JooOoLn0Dvro4cOCfirEKlPJTwql/3pJ9ljTvhvL52NMr+2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/B8GZwo; arc=none smtp.client-ip=209.85.216.50
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36d8b644473so5494682a91.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 08:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018675; x=1781623475; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0vW+Nyui5MKXVym3LRo+LsqfSdC82w8mTHoHWGRMoys=;
        b=N/B8GZwoiBj1SpZa2J5/qobIi1bgbAXBG9y9VkzlN6n5GKZWggq3pMyEKxokotlPCr
         Tu3ixANhxKZqDRd6e6fQjwBAS+KfpeIV0oGKi8dnjS7GcDHwvClNj2VtV1XqRKzNIa90
         Xs0CUjrW8GRAmczJwyJQ25tMJ7OwpN9slFtjtWOB0WJfqffnXxI9EF8Eo8CepPL4Jmad
         WOey9PgIUJzF2PYEOSuV0fKpFe0RJeqW/2unNprjwza/N9rkTYKfFe1KBXppfalbsaG7
         b5zqFDp/qyoPvBKLO0/TL2orzqxG0HkzH8MDE3pr3RGHn0sXLvd6SXeNrbjP1eF2mwLz
         dwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018675; x=1781623475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0vW+Nyui5MKXVym3LRo+LsqfSdC82w8mTHoHWGRMoys=;
        b=e8V5o5H1IcPIK5qQhJEa51IIu5iC0cEydiPqRIDxQ04ZE62MXYsz0264L0kCyVgqbk
         O2RwngJYLaM4Jr8RzI8Fc7c4Gs9RpxsXkozTE0SiDN1OOzDkf81Kum3r1CYdnIGiLzno
         CslMflR5WuKZWPTXmUs4JUB10NqXWw7Ixx0yhy9BVhP73pJ3WtCNVzsAMjaE6DkSzk3t
         vZcKWcFPb8HynUgu2oWcZA0/dija7qNWvUzgrcqQXdMbL7rzY4d19VARuguOMIEKClrh
         EWtCz1kWLpfMawhZaJPvyWuK17oWtgHrNLP150wSc5mqCTTnzNKznJVwmBE4D47DYMKW
         avog==
X-Forwarded-Encrypted: i=1; AFNElJ9FfXmvw8afoLbtcGLwb7LSgcmtXN8dBd3w2SC1noNO7CWRPslSNSxYLEAyevfz30k+nOkUV6eOraA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6m2kyAnliHs96/2+kHqMyDqy11Od43Bg1G8FOvIhl+fD6hoia
	l9Q1aHnOGI9kclxmHYqRWGayjJTLF6hpwxzkLQ1ITSuawq+mSRf8497J
X-Gm-Gg: Acq92OH01UX4eGG/IPUsuKLzAdeZMw7vqRiJDhlP3YrEYPOuzi4vM6Nwx7327al1otF
	pOcfpRmVUOwZKTDxro605mnRvUHDVv4rqPhArrgqg0pPTc3D6GO6H2rGcfuw4GpyAXgGchzaFl3
	bw37kaE8BlObTeSMBEc7lVcKZJnKGNNW7is5mcVCXQBX/BWVhlifR/m5l3Sf87hQPgrCTnCwYad
	bILTTFP4I/XYFmc41iWbKzzxxmedEfcseFYaPgWUk1a7lAGKwTAWY3nNKOa7bZtskLjdd1UNf1P
	9mU1AKhC4enpdDSkoVOmHo/v8sQ2PI2u19Y9kFdP1g/59dr9yLAJXn8QuWY9H8jYtHjeDl49i6g
	RWPUFb/k0HI3Z6cH4XD9MNVmU4riOzHYxw22fEg3j/Ef7W5ERuCt1UdE2+V0/y4ZMDodYT4fuba
	N1E/zXleGtydmEfsC9auRA6PtHZ0ZUdA1Opu+XnUTpXJMQBqY=
X-Received: by 2002:a17:90b:3512:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-370ee82fa3cmr20984064a91.1.1781018675521;
        Tue, 09 Jun 2026 08:24:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a28c0esm20097402a91.12.2026.06.09.08.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:24:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 08:24:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v13 1/3] dt-bindings: hwmon: Document the LTC4283 Swap
 Controller
Message-ID: <6a9c2204-fab7-49fd-9918-2b0f7237b4ce@roeck-us.net>
References: <20260502-ltc4283-support-v13-0-1c206542e652@analog.com>
 <20260502-ltc4283-support-v13-1-1c206542e652@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260502-ltc4283-support-v13-1-1c206542e652@analog.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91689-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nuno.sa@analog.com,m:linux-gpio@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-doc@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:linusw@kernel.org,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,roeck-us.net:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,analog.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17B566620C7

On Sat, May 02, 2026 at 10:56:52AM +0100, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> The LTC4283 is a negative voltage hot swap controller that drives an
> external N-channel MOSFET to allow a board to be safely inserted and
> removed from a live backplane.
> 
> Special note for the "adi,vpower-drns-enable" property. It allows to choose
> between the attenuated MOSFET drain voltage or the attenuated input
> voltage at the RTNS pin (effectively choosing between input or output
> power). This is a system level decision not really intended to change at
> runtime and hence is being added as a Firmware property.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter

