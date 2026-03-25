Return-Path: <linux-doc+bounces-81231-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEmyN2E2xGkAxQQAu9opvQ
	(envelope-from <linux-doc+bounces-81231-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 20:24:17 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F93232B27C
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 20:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9AF63027122
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 19:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1139A34750D;
	Wed, 25 Mar 2026 19:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="AykulBIK"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D9C2459EA;
	Wed, 25 Mar 2026 19:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466616; cv=none; b=EpqzF2FVjOi1W++G2H0HGeRBdrd0y/l1M53QJGY6oulcv7mWGzFGLWfxwccym6jZOvxHsILvAMKD/f5WifGJuJP9YwCR4F2PpImTAyrKqPw8ssmlCH3bjSoveoJdNiuaCflVTSJmDhnT1PVAdpAO2vElfgrn7h2lL5lFP1GXWDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466616; c=relaxed/simple;
	bh=+L8wi6kyHthm4KaOrAYDops3HeciAMFCYqrPNjpJA+s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hG9w/xgaaOq1rhgi/i2MpMJV/NVMeiZesdk/QRKzHmeHIOVNZXGEyCCZNhryUX7LxZ6BJ1H6jfbM47Lja8tTazkd9ukeaebr+bMhWDsXU9xgcFhSnCTUUdX6w0Sf9Ayvvimm2ZjJGge8RNeCbEpGMvikLePjz2ResgP2OCyHnXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=AykulBIK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2FFF540C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774466614; bh=wieBmyn6zy83Upz01fxLFWq9zlqS4iXUVwJYPV21W3I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AykulBIKbNjUr1f/OH9ffsmp57nDta8YJsqT6QQ9AC17XQZHMt6V7pql2ZNshAxk4
	 F4ayDgBm+Zj84UKjMl5BtTG+rqtQTVuZw/dPHYqi4TNWx3Fol9x0fB+L1iG3FgEoAo
	 wpv87AARr/hexQWbEQEL8lpWipqp7M61FZ6oIzAJgRqyY0y73I7ESOqRJWJPyGJD9T
	 XQwZzHSFZZPGUJtEnywx2RPocYXq87F+UTEXr2hFECrk4557B6P30nnz3V8fv71i1b
	 8qV8nyHfvNaKBWz5zkUWtt/cn5Ri4Hf+U0u7MhPF+w/4HBFs1PlkW/qaLUE/KyrrUe
	 ZamQ7NiRrpImQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2FFF540C6F;
	Wed, 25 Mar 2026 19:23:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, Rito Rhymes <rito@ritovision.com>
Subject: Re: [PATCH v3] docs: allow inline literals in paragraphs to wrap to
 prevent overflow
In-Reply-To: <20260323151401.27415-1-rito@ritovision.com>
References: <20260321141118.23828-1-rito@ritovision.com>
 <20260323151401.27415-1-rito@ritovision.com>
Date: Wed, 25 Mar 2026 13:23:33 -0600
Message-ID: <87bjgbg1ca.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81231-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 3F93232B27C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rito Rhymes <rito@ritovision.com> writes:

> Some documentation pages contain long inline literals in paragraph
> text that can force page-wide horizontal scroll overflow and break
> layout on smaller screens.
>
> Override the default `span.pre` white-space behavior for inline
> literals and use `overflow-wrap: anywhere` so they can wrap when
> needed. For code used as part of a paragraph, wrapping is appropriate
> because it is stylistically part of the surrounding text. Code blocks,
> by contrast, are meant to preserve formatting fidelity and are better
> served by contained horizontal scrolling.
>
> Examples:
>   https://docs.kernel.org/6.15/userspace-api/futex2.html
>   https://docs.kernel.org/6.15/security/IMA-templates.html
>
> Signed-off-by: Rito Rhymes <rito@ritovision.com>
> Assisted-by: Codex:GPT-5.4
> ---
> v3: add latest public versioned URL examples to the patchlog
>
>  Documentation/sphinx-static/custom.css | 9 +++++++++
>  1 file changed, 9 insertions(+)

I have applied this one as well.

Thanks,

jon

