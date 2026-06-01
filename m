Return-Path: <linux-doc+bounces-90385-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AB5LnjWHWq6fAkAu9opvQ
	(envelope-from <linux-doc+bounces-90385-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 20:59:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E79D6245A8
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 20:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1ECF306A62C
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jun 2026 18:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3CA37756E;
	Mon,  1 Jun 2026 18:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="X+UiVRB6"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED7036493C;
	Mon,  1 Jun 2026 18:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780340288; cv=none; b=bySbDER8kyCYB/v5cwTbZWTZYlIzxzBi4I+KIZg44Wv/AXLzZufQe/7HhuB/eDF9KkNvcxfJeZzE8SojXHbJMEShIhCnAVzNn/ICaLs2BQQoMSe+HLVGEL4RNj2VyXAW+vAelvmu8+kGqqo/oOPpeS63uXsIxrogbHpy0jihgYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780340288; c=relaxed/simple;
	bh=++xLtCDf89nPJ/s5TrtIhgz0rWYhWvRTLVztIWEprUM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HfFYz0ctVIBiE0NXVfXR7aBr1j4byo70zEYo9/RZbF2K2ZE9Pp7jB4sKOTg3ORK4neCzul2isXqJZnGgvj6inLD/ppGwcXSdwNMeVyM9442Mvo42c5i9gE9/jBPUjuadVPwbWJZwrRVyRVhwUSsIdS4hx7cz7/jTE4+dJgT0TBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=X+UiVRB6; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2A5A540E49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1780340287; bh=++xLtCDf89nPJ/s5TrtIhgz0rWYhWvRTLVztIWEprUM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=X+UiVRB6tY+zXvmCd3R9imOzcLcIVpfzZ3NcUC34+5hOxMnzhD0fG3itlqoAFCbFR
	 QzrAowMcASFO4opS2fG8RQgeUODPJQnZCd5jTvRew8XmUFHTtwKPzzi85OcI0xxBe5
	 ynlF3tQRVIEJFHZjEedHhfhYsUmJ4FvdzzKN+UaAKYCwMr2eQmkRTsbRlRCzNkFWRI
	 nyooOGln6L1+wyAONHgXBVoyHDpmIRutG7tNcu62ostJ2AmwVe4RZ6SUaWgEZsbn34
	 vZOuR0Pz1bnrZiW5oJFggG0KHJ2a9dAw/5o/skVISC2N2/uh7Tfzk/mFnCnVNyww0D
	 kSuDvYvzz/pGA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2A5A540E49;
	Mon,  1 Jun 2026 18:58:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, Joerg Roedel
 <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, iommu@lists.linux.dev, Borislav Petkov
 <bp@alien8.de>
Subject: Re: [PATCH] iommu: Documentation: rearrange, update kernel-parameters
In-Reply-To: <20260528054611.1524937-1-rdunlap@infradead.org>
References: <20260528054611.1524937-1-rdunlap@infradead.org>
Date: Mon, 01 Jun 2026 12:58:06 -0600
Message-ID: <8733z69jgh.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90385-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,trenco.lwn.net:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,infradead.org:email]
X-Rspamd-Queue-Id: 3E79D6245A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Randy Dunlap <rdunlap@infradead.org> writes:

> Add text for some undescribed iommu= parameters (merge, nomerge,
> biomerge, panic, nopanic, pt, nopt). Add "usedac" and its description.
> Add that iommu=pt is equivalent to iommu.passthrough=1
> and that iommu=nopt is equivalent to iommu.passthrough=0.
>
> Move the PPC/POWERNV heading & its option "nobypass" to a separate
> area since the current "iommu=" applies only to X86 (according to
> its heading).
>
> Unindent the AMD GART IOMMU options heading to make it stand out.
> Also add its kconfig symbol name to be explicit about what these
> options apply to.
>
> Make sure that the IOMMU options that are listed under AMD Gart
> HW IOMMU-specific options are only for that product; i.e., add "force"
> there and move "merge", "nomerge", and "panic" to the general IOMMU
> options area.

Applied, thanks.

jon

