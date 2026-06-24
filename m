Return-Path: <linux-doc+bounces-93370-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sp//Jhe0O2pQbggAu9opvQ
	(envelope-from <linux-doc+bounces-93370-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 12:40:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 305906BD6EA
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 12:40:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=I2r5Ztky;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93370-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93370-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFD703047D59
	for <lists+linux-doc@lfdr.de>; Wed, 24 Jun 2026 10:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CD82C028F;
	Wed, 24 Jun 2026 10:40:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ABA29ACDD;
	Wed, 24 Jun 2026 10:40:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297617; cv=none; b=BMVjDHTfM3SzCEMdh2c5fZcU1vPorXGKnvkpPuYdINJkjR88cOWllnWpBEB4qQKXjsFfvBdAoyJNvV/k+3snqMN+JbLiAha01Uqd0pOUIIWlleDvN3IJ/qe3ET+voYwoEZXgk6atDo1kny0giDpEDkLFtC3KVweUhFP5fKK2FVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297617; c=relaxed/simple;
	bh=IzrxJ4YfTsSZNbE/QBIL1rZ/4phBH7xBojVl3zxKMJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pH4ZrMMXCMxneDWRe9U8F1Ii6dxq0hQ1hTGEolRROm9qwD3JhsAx16haMaLNXNKd+Q1cfLCDqXK+wmef/WejHamRedEKwZ8Xmd4Gda5Zc1TrAppqANYBUlnyfb4tWL0hXp28a5J2sgDiS/NONMvGr02lfNz33G87b8VSQ8yzxrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2r5Ztky; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571B61F00A3D;
	Wed, 24 Jun 2026 10:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297615;
	bh=IzrxJ4YfTsSZNbE/QBIL1rZ/4phBH7xBojVl3zxKMJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I2r5ZtkyylAb0aCngjytNKMgs7UNdFQycrMiDt2yRHPWtpxIqUCNxHb/2WN7zpQFO
	 u9nBId26z9oKHbp34pV0RecOxQjDNiPCdgaOIPfP4JGK5hYF870BouKuMr+Wt7Y/Cr
	 AVNyDp3u4Ll4kpeP7Lu1SEUxeRyUgPZJjqL/Kwqw0FTI5eWsX7aETn23bRvnZWiqXR
	 73ubiRAtZfHgrDVJ3eQA59Jah/Sm3Hvc4s5gvTo9U9pe04r3qwz835Hvuz6+L8kqNN
	 I53+IbSSTl8g6ZXM5ZTRRXlEHJuYetd6lqaDgTtfFeCBlwiNqJh9gYyFt7uhnJhpK7
	 nMiCes9pdm+mA==
Date: Wed, 24 Jun 2026 11:40:10 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: kgdb-bugreport@lists.sourceforge.net, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	jason.wessel@windriver.com, dianders@chromium.org, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org
Subject: Re: [PATCH] docs: kgdb: Fix path of driver options
Message-ID: <aju0CgyXwsbBB9O7@aspen.lan>
References: <20260620234035.9917-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260620234035.9917-1-zenghui.yu@linux.dev>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93370-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:zenghui.yu@linux.dev,m:kgdb-bugreport@lists.sourceforge.net,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jason.wessel@windriver.com,m:dianders@chromium.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:rdunlap@infradead.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[danielt@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.dev:email,aspen.lan:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 305906BD6EA

On Sun, Jun 21, 2026 at 07:40:35AM +0800, Zenghui Yu wrote:
> The correct path of driver options should be
> /sys/module/<driver>/parameters/<option>. Fix it.
>
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>

Acked-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

