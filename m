Return-Path: <linux-doc+bounces-91740-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dnO+LiZ8KGpXFQMAu9opvQ
	(envelope-from <linux-doc+bounces-91740-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 22:48:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E667664227
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 22:48:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="d/e1dpTg";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91740-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91740-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82F4630AB784
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 20:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2550F2C3244;
	Tue,  9 Jun 2026 20:45:55 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BE438E8CA
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 20:45:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781037955; cv=none; b=ctsWwdxZB94irAgomQpxup1dmQaZfl0yJeFNiK7SKuPE85Id5gQ4l8OklZIFzkO5goKfGvGTwiI4sSMILkR6Kly53uTPDWt+n9EqExC9r64nUTd5+cOO8YpNn6a3N40tn0FEIDlYLKzoWiVNTo4wYH+xIXSZ+IXfXdkotlmHy/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781037955; c=relaxed/simple;
	bh=GVRhJxpS2Wh/rzGTU/68w0lcMcjHEaDn//6W0j8SNR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDxHKIZtckyWH+j2B6WzZ53pXSeurWSprKyh+67z042ZByngrayBFp7r3FI1nvYlnSfsglksN4QPA28lR6z0/HpGEuppl3nhrVo/ZB7fvlCyrsQb+1OsiocKZM4tGv/K8cdNyYDuopiwxwxC2q87oZhZYuWEYzf6AA8OU+uQdj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/e1dpTg; arc=none smtp.client-ip=209.85.216.47
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so4336119a91.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 13:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781037953; x=1781642753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3vk5Uf5DW+9gvMiSG3j8Uu6Rg4pKQMgUd73zg6c2+A=;
        b=d/e1dpTg9bDHCyYHOw1661XeGMxvZmKUIjmONhqoqismMhLr+z6fLUQD01O6Qg6hFd
         f0gsVOXxBn5ulo8gdtS5+o94r9WyWmAhFF7yuvDtUcjFmiNMwM3c6SgAKZj23hoOXisb
         TNVxjnkTCqlZNzqNumhJ8NxV6X7d4woUlgOz9MjhcnM3Rj5C2wQlezPmazeID/FyXRtT
         OgY1N93FrbMVL42LKibUZAJFnR7G4ftHwMCiP/oYcHusRABFPKXMo5AYTyqjfr8ifTjU
         Esai2Pyy0t5hhlbmzR+MeGXbGRnItsXfgiSXa/Mo6FIyFwP+pKo7bWqmHtf/aE9v0isY
         /92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781037953; x=1781642753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k3vk5Uf5DW+9gvMiSG3j8Uu6Rg4pKQMgUd73zg6c2+A=;
        b=jXSquBTS8KNL0xbyO7MR6rwotY8vpn88cVLwYIGtefOV8xDE21VjiHqpY9YyuzU6As
         Mg4CdknSfAUf8Ar6HFVIHf7N2G5F62zgZiJls/kJ3yaBi4AOFhKtmgLkOV4tG8mEq7Yd
         orefNxK9W41bXJnDeUB2m0zmbCeNjNHinpW5iR04MCLN8KzpTIEnshb3YZrUvzc3682H
         4hpsCD1tpHOwEVOJwsWbuF0d/qj5F35XOe/lcbWktseixwhG7y4uYjklmND296bSTlCm
         tULyLEmi+trDQ2+YbjiLVL01NX/j+Clk4u+cr49tE5CD3JWYAPL3Zp7VAm/1mWEbz22B
         DCYA==
X-Forwarded-Encrypted: i=1; AFNElJ8ypNfebXC499kR+zXOsRJVsszt5SY+wTYHSseYJx1zS60gcTxS86uzT+i7E4B0kPie2VMtn59y5yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBOtK/pozxuH4tyJjioUCK9Oxd4ocXyTS1eKnVX67A1zbwCKwS
	JX+9o4juToU8SBNqSR7lIwerPR1VOMJ17vpSIz49bivzA1D14LZdygKK
X-Gm-Gg: Acq92OEMs891HM5RwMtGt0ZhvS0/3J6AV5ZnADcZZq3WFdGVtHlXlTPHUMz9RvksGhn
	hVRUus9Xgc4JB7pMCMP/j1v4b0yEsD0yZfEtTsirtOxw4Y8HP9/iSnOd+xtl/7T4aNFs8krJQA8
	KNLF0suydn1Ab2I5ESTuIQVn/z7q3uYlLTm0BkuTkd1FC+ipsLIqhWGPaZxeA4INyc1XcUaFFhO
	05Pf8fB0Lko721e1J/RTXaHKbI8LXPWrhUCH+ngIxjV66HHNwbvZSL9eT1dFpiRg8VRsvM1Qf6/
	jTo51K4LkYmw4PCiDBuHmX0MCcHVtwdkFJUxSpO1SdEAI8r063/DqLTifsGJXFScijMyy/tIqAr
	FAzx7+6BIAF6nypEFiI7+b6cjNf7FNbFHAVls9MecSBhSNUlR757tlQcc6kQkKcAhPpZdmu7LAG
	b4QX9jsaForHBKSGHf5+SdJYcoV96A6z2C4cg/JnHM4i7Yv9A=
X-Received: by 2002:a17:90b:570f:b0:36b:877c:42e5 with SMTP id 98e67ed59e1d1-37133372f4emr16038330a91.17.1781037953245;
        Tue, 09 Jun 2026 13:45:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f710ee4f3sm21049503a91.13.2026.06.09.13.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:45:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 13:45:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	richard.leitner@linux.dev
Subject: Re: [PATCH v3 2/3] hwmon: Add update_interval_us chip attribute
Message-ID: <efe54376-aeb7-4f4f-b44a-6dd44a5200ce@roeck-us.net>
References: <20260609-hwmon-ina238-update-interval-us-v2-v3-0-016b55567950@advastore.com>
 <20260609-hwmon-ina238-update-interval-us-v2-v3-2-016b55567950@advastore.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-hwmon-ina238-update-interval-us-v2-v3-2-016b55567950@advastore.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-91740-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ferdinand.schwenk@advastore.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:richard.leitner@linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,advastore.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E667664227

On Tue, Jun 09, 2026 at 09:43:11PM +0200, Ferdinand Schwenk wrote:
> From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
> 
> Some hardware monitoring chips support update intervals below one
> millisecond. The existing update_interval attribute uses millisecond
> granularity, which causes sub-millisecond steps to round to the same
> value and become inaccessible from userspace.
> 
> Introduce update_interval_us, a companion chip-level attribute that
> expresses the same update interval in microseconds. Drivers
> implementing this attribute should also implement update_interval for
> compatibility with millisecond-based userspace interfaces.
> 
> Signed-off-by: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>

Applied.

Thanks,
Guenter

