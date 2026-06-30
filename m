Return-Path: <linux-doc+bounces-94236-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k12wHJ4cRGqBogoAu9opvQ
	(envelope-from <linux-doc+bounces-94236-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 21:44:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3086E7A16
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 21:44:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=jYjmeuCa;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94236-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94236-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF8B6301A17D
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 19:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E8F3D1AB3;
	Tue, 30 Jun 2026 19:44:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA683D171B;
	Tue, 30 Jun 2026 19:44:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782848666; cv=none; b=l956qf5TiLKpq1w/LcjRxSy6yhCj2t5CghtpEQRQ1ZBo5knNfeqzyoFjimeX6yYhJ/BIK6zbNrrRrtsL4mSfgAp0cUs2j3Z+MbNDdisEbJGp8jbFA1+5fSw1LUYN2kkkfgYlDTUAE/NXgztvkq3xXtDAsZISeTyKNGbtpy+EfbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782848666; c=relaxed/simple;
	bh=S4bQ5oB3FYqOo0il1Tq3otYqu+DjSIcENJSyTwn3yW0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A1YG9nJU6YpAMUWUCKY1Twmrj+nFszufvjyyvIRxLCjBChtzR7FQHMz8Xcrtd3Mm/tkMpsuU4uXus9PgVZT1pNJjfuJlj3dwiI5QWYJg2oGSzomHEivUZdJtTP3GqWXrVSiwH2bPQ88yjNAHjvTWZXyEruCvCBWxn8qjIlxoE64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jYjmeuCa; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 27E8040E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782848664; bh=7uFqC5xhgw4sKw8sqaWYA+AQq1bYc/FIBWG7fBx2FnA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jYjmeuCaISFrLjnnWS5KGnJWVOQ4feQgDwfSQfpJ+whIcKBkB/Rro5cv1XRSHFfPI
	 k6CUE5RNn5KJHC2rJNUbDGuRK/gutrhKjKAVdJ2KJ7PShFskFzZChO63olaNYJiW4j
	 SIeZZDrMukDklDhHbts3lF0W283qQ4tQT3VWUuRi9I60MpLNE+KA+0cfLv3t6LK6YW
	 k1HASv7lXLnA6nRgGuvnE1WnjqW7LnQ3xThGE96TShqXOeOUqh4d5TsAbvAU+jxzvT
	 WrlDNge1YskdU4feKrQ+HawtRPZBXuFDIU//bl8ZwRn9+Qs7MnGIAsieKhJ4BwQLSD
	 piXW8uFkODBzg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 27E8040E27;
	Tue, 30 Jun 2026 19:44:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, Thomas Gleixner
 <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH] Docs: SMP: add an SMP docbook chapter
In-Reply-To: <20260625210331.1050915-1-rdunlap@infradead.org>
References: <20260625210331.1050915-1-rdunlap@infradead.org>
Date: Tue, 30 Jun 2026 13:44:23 -0600
Message-ID: <87se63rey0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94236-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:rdunlap@infradead.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:tglx@kernel.org,m:peterz@infradead.org,m:akpm@linux-foundation.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,trenco.lwn.net:mid,infradead.org:email,lwn.net:dkim,lwn.net:email,lwn.net:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux-foundation.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD3086E7A16

Randy Dunlap <rdunlap@infradead.org> writes:

> Add SMP primitives to the core-api documentation.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
>
>  Documentation/core-api/SMP.rst   |   11 +++++++++++
>  Documentation/core-api/index.rst |    1 +
>  2 files changed, 12 insertions(+)

Applied, thanks.

jon

