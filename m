Return-Path: <linux-doc+bounces-83807-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGKaOcnZ5GlDbAEAu9opvQ
	(envelope-from <linux-doc+bounces-83807-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 19 Apr 2026 15:34:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4704242C8
	for <lists+linux-doc@lfdr.de>; Sun, 19 Apr 2026 15:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAC7D3002A08
	for <lists+linux-doc@lfdr.de>; Sun, 19 Apr 2026 13:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5E4350D58;
	Sun, 19 Apr 2026 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fz5J/ILx"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980538834;
	Sun, 19 Apr 2026 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776605637; cv=none; b=bKFmRkPer4kqsgOg2itRRhHkKn4CJ8k2WcaUXIgkv+pUyNXu6xEouK/dFCzLisRubw1yPVroBUQ3nEUwRZpKeiIWo850QfzvpDCWKkkmS55zaAfSkpT+hN0gCgES1NKvf1xKLZTK0Fz8N/KyC+sd9g966X6bFAoHPGTFE7VLIHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776605637; c=relaxed/simple;
	bh=PN0KWt9UBkV0/n988jdngDmSjDH7FRRxV8CnMr1y2M4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bfy+63HgjI7rwHDHdMSQhmCjo9eBGUUzBKMwtbtJ3vnLAvecEWoxJi6+p8SOKarkgv2GoEegKNxtMNDVeLd9djGWUAtu4tF/aIsJ/nfTvyaRFv/Xxqr3NzBsTGM+U5LdV44xcgdOIP/brtdsrz95O+PsyqXKVOoiBc0xjx7FJ70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fz5J/ILx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3ACC2BCAF;
	Sun, 19 Apr 2026 13:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776605637;
	bh=PN0KWt9UBkV0/n988jdngDmSjDH7FRRxV8CnMr1y2M4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Fz5J/ILxpY7243N/yp4TIQIb3TSI04aTmab6+fS/DMEyW/6A09NubwZKXFCbgnSGf
	 b60HmkbVGSTTV1EVwF9IayrJrw+qT3058CQlrb3ti2KnkWymyqcVJ3a7q+CXuxoB+k
	 pTjID+rJvoU0UPvOC6bXzwq7p641KD4uTXjGVqQ+z+8XLbnUimi0KOdCz2IZOrW6VI
	 9svlhO9k63UQyuaPICLWp7entRxw54ioTyfqMEDslnW+uBX2dB1zZe08/oanBGnmhJ
	 AakfHLN+SNe9+cCnE74luUXeX5DL+1D6Xc+/XFqXxvEHIoma974i/nLR5ojeol6KP+
	 qapnIKY4k/Ysg==
Date: Sun, 19 Apr 2026 14:33:46 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] misc: Remove old APDS990x driver
Message-ID: <20260419143346.45ed78c2@jic23-huawei>
In-Reply-To: <20260419083125.35572-4-clamor95@gmail.com>
References: <20260419083125.35572-1-clamor95@gmail.com>
	<20260419083125.35572-4-clamor95@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83807-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4B4704242C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 19 Apr 2026 11:31:24 +0300
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> The Avago APDS9900/9901 ALS/Proximity sensor is now supported by tsl2772
> IIO driver so there is no need to keep this old implementation. Remove it.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  Documentation/misc-devices/apds990x.rst |  128 ---
Sashiko AI reviewing is now running on anything that hits linux-iio@vger.kernel.org

I'm slowly getting into the habit of checking out what it finds though
I'm 500+ emails behind so it might not be that thorough today :*

Anyhow, it caught an easy one here.

This file is referenced from Documentation/misc-devices/index.rst
so that needs an update as well.
 
There is the obvious point of ABI compatibility raised as well, but given
we don't seem to be getting much push back on that maybe that's not a significant
concern.

Jonathan

>  drivers/misc/Kconfig                    |   10 -
>  drivers/misc/Makefile                   |    1 -
>  drivers/misc/apds990x.c                 | 1284 -----------------------
>  include/linux/platform_data/apds990x.h  |   65 --
>  5 files changed, 1488 deletions(-)
>  delete mode 100644 Documentation/misc-devices/apds990x.rst
>  delete mode 100644 drivers/misc/apds990x.c
>  delete mode 100644 include/linux/platform_data/apds990x.h

