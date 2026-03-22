Return-Path: <linux-doc+bounces-80547-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOGHCXYewGmoDwQAu9opvQ
	(envelope-from <linux-doc+bounces-80547-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 17:53:10 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E072EA123
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 17:53:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E3CF300DDF7
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 16:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7368369980;
	Sun, 22 Mar 2026 16:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKTpF6SZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19311D86DC;
	Sun, 22 Mar 2026 16:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774198385; cv=none; b=EhV+TASuY7i+CPcxVXLiitzJ2rGqDaafD1m6aOQvKm641OUtoH6PJfgYnx3hAAiPhwGY5N6xgIbRUf5sc30eI2RT13rewxbFTKCP4U+Z7f6wYj/z0o5XMRQxaLxLGTyuzXLgYot2BbvB4vOn4NoTrJqnZ+Y79VUWVYuezNQWTXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774198385; c=relaxed/simple;
	bh=6uFgRQK3htx5s9x552LsldfqICu02lfafBPLNW3diBE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kd3S9LNsZTcZXSNM27dc7szVlgZL+bSlMUufpCzfyYCHkxlWy+uoxoR9JD1Dmoe6JhRUbEFVoBzfXUHiwkbBYbNZA/shzpN5pwipJjXh6LQQsR/vB6OVtVy3FlB5CdWW2DfAHUo2LLtzLWKa968kn6BiIRsyGHkvx/0HHCchlrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKTpF6SZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871CAC19424;
	Sun, 22 Mar 2026 16:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774198385;
	bh=6uFgRQK3htx5s9x552LsldfqICu02lfafBPLNW3diBE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cKTpF6SZxL6mlaqynT2XAz4tBtqqBoObe+Vk6rxSs6iIKTMF7RPzOH0puZVKBE2Ir
	 FVPLM5fNZH9heHwR5NSTSokrliDeDwmBkBXyi9GiVeg8Fp2GFpcv3V2rRmh1Gh4KfY
	 dwpGeNyb29xuaItZkJB0lED0MAgzYDj1Jo903gIAel8sgc1R8NX4zBS/G/IH1pikv5
	 lkEYkeCxznuNnEcmDheh/MH4OaSBv7/fju/5hVLAtpCJXwxB64PascAdMmCruIs8hK
	 rmg+hamtZEsXb1bJoKUCLRbORINwSB4FariloSgG0zf1pY/GSxZhQkTpdL8NMSrVR4
	 ZyKc1Dv4ADOxg==
Date: Sun, 22 Mar 2026 16:52:53 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Michael
 Hennerich <Michael.Hennerich@analog.com>, David Lechner
 <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH RFC v2 3/9] iio: frequency: ad9910: add simple parallel
 port mode support
Message-ID: <20260322165253.56172dd9@jic23-huawei>
In-Reply-To: <abru0mNtpJSPSJux@ashevche-desk.local>
References: <20260318-ad9910-iio-driver-v2-0-e79f93becf11@analog.com>
	<20260318-ad9910-iio-driver-v2-3-e79f93becf11@analog.com>
	<abru0mNtpJSPSJux@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-80547-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 73E072EA123
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 18 Mar 2026 20:28:34 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Mar 18, 2026 at 05:56:03PM +0000, Rodrigo Alencar via B4 Relay wrote:
> 
> > Add parallel port channel with frequency scale, frequency offset, phase
> > offset, and amplitude offset extended attributes for configuring the
> > parallel data path.  
> 
> ...
> 
> > +	ret = iio_str_to_fixpoint(buf, MICRO / 10, &val, &val2);  
> 
> I think here we just use 100000 as it's in so many drivers de facto use.
> ideally this should be fixed on API level.

I wouldn't mind a series tidying this up, but if anyone proposes to do
that we'll want to not use the same naming so it is obvious if any
new drivers assume the old scaling.

I can't really remember why we ended up with the odd interface :(

Jonathan

