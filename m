Return-Path: <linux-doc+bounces-82904-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGkTO/K612l0SAgAu9opvQ
	(envelope-from <linux-doc+bounces-82904-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Apr 2026 16:42:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A22D3CC258
	for <lists+linux-doc@lfdr.de>; Thu, 09 Apr 2026 16:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44B86300721C
	for <lists+linux-doc@lfdr.de>; Thu,  9 Apr 2026 14:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BE53DE421;
	Thu,  9 Apr 2026 14:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="lEQy9nUn"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F38F3DE447;
	Thu,  9 Apr 2026 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745771; cv=none; b=HN4Nij5khj/Cd1QLTRCJ+Zr3X/I2OLj+7DyQVEKRxw2O3YQgUNE85O/43fiyo+YlV58c/GaZYg0x1sG7gZ3IzDoL3b2S6etMaUU/s8LlB+9jXH8JbgA+E2OCXyyBQP8gyDv7FzCgV9kk37EEpaKTuW7b/d2Bj4mAO6Oos+ghRYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745771; c=relaxed/simple;
	bh=dh1VmwNw5RKLhZDFPTzQiLei3vrKaAEXjGuDijtpGzI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Nc6HvqCdiYExvFsGHttQy2aMSQ4r91hVeNcP19+VK+g0bgwVFdxZeJvR7iohnF8KzqJT/c6iYx1pMzr5EwXl3VyDr5QJa3a8PjOqCav3bCalLeQLbAEMfz/o7HzfxFHOJ7y8GYuEuxNAV9p/gWLYf85BY4zXIXDK1H7ZKMNK86w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=lEQy9nUn; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DE09940B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1775745765; bh=LEYAMT+rPpWjNOIp1YpEbnzwcqEOCHHliFZsSLYG2y0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lEQy9nUnC6x5tqu/A+GbNCOFNKT25vVwGJ3WDps3a4AdgmM3AKlYS/GYJIAP4NUnb
	 lUy8TUTiqBwCZ6nWmhsW4qcaLyT5E9+GS00TvgCIxNAu2JY70ty5QswM1VrkzpMUtk
	 ProQ1kC0luQtEbfc/BHOJa6s+tZmDap1Y2BhwaOh0HHIcfiFlZp3DWtihqoauqsK8g
	 26aUHKOEez0w+TfIMSN4RD0Dr5m/P9RttfZEtvHwRuFqkyrFzPWEfBM6bDZLSyBWHv
	 hs04Ngp5uMCwVvbYpYgzwEA+XkQHEqLfUbR9dzkSPAePTqOc8+7y53DX6NpxOtVdUJ
	 BwEjD0yt5aTqg==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DE09940B2D;
	Thu,  9 Apr 2026 14:42:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, linux-input@vger.kernel.org, Shuah
 Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Docs: hid: intel-ish-hid: make long URL usable
In-Reply-To: <20260321230934.435020-1-rdunlap@infradead.org>
References: <20260321230934.435020-1-rdunlap@infradead.org>
Date: Thu, 09 Apr 2026 08:42:44 -0600
Message-ID: <87jyugb3ff.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-82904-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,trenco.lwn.net:mid,intel.com:email,intel.com:url,linuxfoundation.org:email,lwn.net:dkim,lwn.net:email]
X-Rspamd-Queue-Id: 3A22D3CC258
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Randy Dunlap <rdunlap@infradead.org> writes:

> The '\' line continuation character in this long URL
> doesn't help anything. There is no documentation tooling that
> handles the line continuation character to join the 2 lines
> to make a usable URL. Web browsers terminate the URL just
> before the '\' character so that the second line of the URL
> is lost. See:
>   https://docs.kernel.org/hid/intel-ish-hid.html
>
> Join the 2 lines together so that the URL is usable.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <bentiss@kernel.org>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: linux-input@vger.kernel.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
>
>  Documentation/hid/intel-ish-hid.rst |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> --- linux-next-20260320.orig/Documentation/hid/intel-ish-hid.rst
> +++ linux-next-20260320/Documentation/hid/intel-ish-hid.rst
> @@ -163,8 +163,8 @@ The transport layer is a bi-directional
>  - A flow control mechanism to avoid buffer overflows
>  
>  This protocol resembles bus messages described in the following document:
> -http://www.intel.com/content/dam/www/public/us/en/documents/technical-\
> -specifications/dcmi-hi-1-0-spec.pdf "Chapter 7: Bus Message Layer"
> +http://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/dcmi-hi-1-0-spec.pdf
> +"Chapter 7: Bus Message Layer".

Applied, thanks.

jon

