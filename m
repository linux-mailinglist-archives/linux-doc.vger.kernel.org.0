Return-Path: <linux-doc+bounces-81223-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HpfGt0txGmZwgQAu9opvQ
	(envelope-from <linux-doc+bounces-81223-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 19:47:57 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EC932AC77
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 19:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0C6F302A061
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 18:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCDD33372A;
	Wed, 25 Mar 2026 18:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="NnTORrN6"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E08D3242BA;
	Wed, 25 Mar 2026 18:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774464145; cv=none; b=RAbImsiTb9CzxE+YH3+Ph4zW5j7AYWrZdVtY0jLvJRBfrYoumBUvzap+DnGnm+mXt7BhUaKehfGpRTOmPcZnal0r0GCRJpvgORAFC0BLEPpuK2n160STCRR672xxDl//AOu/bC0r+KnWK+EzAFAmrlgHhYPw6VHQRvRlriZ6k0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774464145; c=relaxed/simple;
	bh=3yOvbTUZPdhMANcRSuGZozR73RkbjOg7cxJCWSYXS4Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eAmGP5mO6nDnARiOFbEL96mpTOX0S6iaAixhke3JXSF01/VHmWSHn10WjRykIypnTzZd0pUKL2Vbr0pP33jFnqz06Fls2IaaCU8l0aA9pWKaASTuCyV627IoPOSxtuLB0HXWj0cL0erWrIM8EVYBjc7CulCeMh5W+jPUXUZU/Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=NnTORrN6; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1080440C79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774463772; bh=HW5/gSvc6qkA7mSKJDyPN5d4gL8wnUU4sPhP6SOLjS4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NnTORrN6UtYqy0cdbZNVdomIaTT8O/bWTPr/nXoaRLAyAdU3S+yGYyxV8Hpmh3ej+
	 214C9mwZLf+DPsbSHb265FYbSh2MdnUF9pbpDMMS9yrWolvYCb/+mdyogdaomHBl8N
	 c9dtFHsnAwGCXkEyMe+0621066rXum7KdXEVFDbRcE9ikKxzDHvBgxF7tCSyBGyC7Q
	 y3yKHiGA6CPzQUWGYDQc9RjSmFsb+Iwd1YhVEpfV8XgJtpQvb3O43U7J7Dn+ZB1FEZ
	 Bo5FBY9xJ0pVq1h9tXmmH22uTRKQCrIXBYD8vmAazTkMEoEuUnSgb2zP+CPN64b6TX
	 8Q1lA5tpwBtLw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1080440C79;
	Wed, 25 Mar 2026 18:36:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?Q?Tom=C3=A1s?= Pando <tovictakamine@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?utf-8?Q?Tom=C3=A1s?= Pando
 <tovictakamine@gmail.com>, Randy
 Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3] docs: driver-api: fix 6 spelling typos in
 Documentation/driver-api
In-Reply-To: <20260324163604.5710-1-tovictakamine@gmail.com>
References: <20260324163604.5710-1-tovictakamine@gmail.com>
Date: Wed, 25 Mar 2026 12:36:11 -0600
Message-ID: <87pl4rg3j8.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-81223-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com,infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: B8EC932AC77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Tom=C3=A1s Pando <tovictakamine@gmail.com> writes:

> Fix minor spelling mistakes in the driver-api documentation. These
> changes improve readability in ACPI, CXL, DMA and PCI docs.
> v3: Added reviewed-by from Randy Dunlap.
> v2: Added full name as requested by Jon Corbet.
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Tom=C3=A1s Pando <tovictakamine@gmail.com>
> ---
>  Documentation/driver-api/acpi/acpi-drivers.rst         | 2 +-
>  Documentation/driver-api/cxl/platform/acpi/cedt.rst    | 2 +-
>  Documentation/driver-api/cxl/platform/bios-and-efi.rst | 2 +-
>  Documentation/driver-api/dmaengine/pxa_dma.rst         | 2 +-
>  Documentation/driver-api/libata.rst                    | 2 +-
>  Documentation/driver-api/pci/p2pdma.rst                | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

jon

