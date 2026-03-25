Return-Path: <linux-doc+bounces-81264-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HAWBmpqxGlEzAQAu9opvQ
	(envelope-from <linux-doc+bounces-81264-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2026 00:06:18 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC6732D3C2
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2026 00:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D93283010692
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 23:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B860B3947B6;
	Wed, 25 Mar 2026 23:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rdYzV0U/"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617FF38F941;
	Wed, 25 Mar 2026 23:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774479970; cv=none; b=jbkgJkEZuxFRv8Ma5Zmzf8FOfoNh6FYqHxn1knlwCuXAWonlr2oRLeMtBMY4qay1vmnFq83f5o0pN3fkxsCvEu2i4h4EoS/zJjgabRb23X7ulu5ruOARrA3fIeZ2L9iYZeOsdsdVwWXq8qUn120w+pFpbWGbJMNqeFWB+I0g4JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774479970; c=relaxed/simple;
	bh=eicldxdUl1w0e0JJzsUvACttb4/YjmTCaYoatoJB34U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ds68Q8iu7yaFKi065gU5UZiz3fvOw7Wt69AKJVjnY8y2wpNLEOi13jS0orvBjcUc4XCLAhKoStyrudJY6csvupn4dvinqh7Qqnd4O7Qeq0Km7pSczNcpIkn+58CbN0B0kwjAgT1XgBInjgkk/PRPNmOwmFw5u60EIKgJbxquc+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rdYzV0U/; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 69599411D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774479968; bh=CuPgvrDLxhFcaWohabELHo/hOHuD2A3FhQ2uX/Ya0Fw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rdYzV0U/Ucro84OcxqJV0BCipeOKlR5EbIn9hecKwSwcfn9WWgpBkrRXV557GqG7A
	 zHE5M4BDdLdRZCzK98ASFMKLZCgNrjkEbrQCeDdd5xXTnFcmGQ3NCEfcUcjIOblt2J
	 aysQq5MahYde2G30gdthoUMDZWP4fRQngBAJhTIc8VapXOoE2IFsAp6+PtYAofRPAb
	 kjt/AgJbT4afMHEzzTskF0dKvGX66iKlCawuTmp2F0UCtRfmfoDDX9YnndDgt/u6pF
	 BmszyFLZFg+Hu0lYI+TxgqdVBVPTZ5xJqkxQ8cquqOZXf0No9HvDw3bKZ5AsV1Ryx3
	 dtCCrmzJ11PsA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 69599411D3;
	Wed, 25 Mar 2026 23:06:08 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, Rito Rhymes <rito@ritovision.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: rework footer with semantic markup and
 responsive layout
In-Reply-To: <DHC7Y88CXPP8.1AXPXN8YUPK1D@ritovision.com>
References: <20260321131857.14166-1-rito@ritovision.com>
 <20260322182251.49484-1-rito@ritovision.com>
 <877bqzg146.fsf@trenco.lwn.net>
 <DHC7Y88CXPP8.1AXPXN8YUPK1D@ritovision.com>
Date: Wed, 25 Mar 2026 17:06:07 -0600
Message-ID: <87bjgbecgw.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81264-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[trenco.lwn.net:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ritovision.com:email]
X-Rspamd-Queue-Id: 0BC6732D3C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

"Rito Rhymes" <rito@ritovision.com> writes:

> We could use a CSS override if the goal were only to change how
> the footer looks. But CSS cannot change the footer's semantics for
> accessibility, and that's where a fundamental issue lies.
>
> The default theme renders the footer as a generic `div`, and
> `class="footer"` does not give it any semantic meaning. Screen
> readers and other accessibility tools do not treat that the same as
> a real `<footer>` landmark.
>
> To fix that properly, we need to change the markup, either by
> rendering a native `<footer>` element or by adding
> `role="contentinfo"` to the existing container. That requires
> replacing the footer template/component, not just overriding its CSS.
>
> Since the footer appears on every page, I think it's important to
> ensure its a11y-friendly, so it makes sense to fix it at the markup
> level rather than just overriding the CSS to be mobile-friendly.

Please, include the context you are replying to so people can follow the
discussion.

We are not going to fix Sphinx accessibility piecemeal in this way.  If
that is really the objective, I think the right thing is to work with
the Sphinx project directly and come up with a proper plan for all of
their major elements.  Tweaking the footer - the contents of which will
be read by the screen reader and understood just fine - doesn't really
address that problem.

Thanks,

jon

