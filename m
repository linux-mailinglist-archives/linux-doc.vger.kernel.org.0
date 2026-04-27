Return-Path: <linux-doc+bounces-84709-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4A2RCJo272kw+AAAu9opvQ
	(envelope-from <linux-doc+bounces-84709-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 12:12:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE93470AE4
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 12:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6538B3037787
	for <lists+linux-doc@lfdr.de>; Mon, 27 Apr 2026 10:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B683B4E85;
	Mon, 27 Apr 2026 10:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="M7Ht9uuR"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5EA3B27CE;
	Mon, 27 Apr 2026 10:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284452; cv=none; b=LNYd+q8JQ3X7yw4tOYG3/Eaqmh50esvwAdbNUVRf+XI6w+/Mcbv1Z7aDNAmYUyIhEbXkVfDw6O1OcclT4nTc3LTkDhOgCMrA7dfRGFVeGK9DoPuMN/hTyCefv1tOUS4YJNs5/DawYZCDe4k1rcuCUapvTfbQAPHn84GLad5PJ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284452; c=relaxed/simple;
	bh=VsJYSBsEJwtq3iSHacKLUqkeUHY96hSYjZ5ldp+kAK4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rdFBSkM2j4OePmIcCSc/FGUX6EnRjGFOs+buDerQv566R5POD96dDNNFVlDJ27yYFcnpQyXc3zKE7Aa+HKZ5U6bOz6LU6HHOm3NqXg+5xW8FV7QmMDmoG6GkHBa18DGmB9NlowFra8+A0+XPUDszGnR9b6K1owvuQtQUBEgwQJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=M7Ht9uuR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 263AE41098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777284450; bh=N3lrxGQLjDcCiAEwGQU0tUUpjT1qzBS5oH03zByesoU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=M7Ht9uuR6WzDnlUXwj+p3MBR71ekY+OjVFlu40wwm3gxR1Vby20tHhPW+3mEafFTP
	 NbbJ6qpu4SXCqzVTbc3bgqzZFGXqtAulMullliDO5RaUXlR1t9Q05DFXyUrnI8BCco
	 KArKJL02y7nvozsgHa6aUvY5bUjXM+y+aWwY8aRA124/9bEizThkIr+rc/cAxRwD2b
	 6YH5r4pHRY099sSGvfm1cLw505E5xjh5ZECSiqRPs1pHLX2POY9hy14iNBa9CFWQI7
	 i3B3ugSfahqle7HwAJRR6IRkmRDwOfPS/jJSxntN1hdbgmeabZpcZJry705fdnxipK
	 zkCpFyr7Dx4kg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 263AE41098;
	Mon, 27 Apr 2026 10:07:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>,
 Bart Van Assche <bvanassche@acm.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, Mauro Carvalho
 Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] docs: xforms_lists: allow __maybe_unused in func
 parameters
In-Reply-To: <20260411233526.3909303-1-rdunlap@infradead.org>
References: <20260411233526.3909303-1-rdunlap@infradead.org>
Date: Mon, 27 Apr 2026 04:07:26 -0600
Message-ID: <877bpspvhd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 8AE93470AE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-84709-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,lwn.net:email,linuxfoundation.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,trenco.lwn.net:mid,infradead.org:email]

Randy Dunlap <rdunlap@infradead.org> writes:

> Bart has a patch (not yet merged) that causes kernel-doc warnings:
>
> WARNING: ./include/linux/highmem.h:235 function parameter '__maybe_unused' not described in 'clear_user_pages'
> Documentation/mm/highmem:211: ./include/linux/highmem.h:222: WARNING: Error in declarator or parameters
>
> Handle this by adding "__maybe_unused" to the list of known function
> parameter modifiers.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604120025.jtlnpWff-lkp@intel.com/
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Bart Van Assche <bvanassche@acm.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>
>  tools/lib/python/kdoc/xforms_lists.py |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linext-2026-0410.orig/tools/lib/python/kdoc/xforms_lists.py
> +++ linext-2026-0410/tools/lib/python/kdoc/xforms_lists.py
> @@ -93,6 +93,7 @@ class CTransforms:
>          (CMatch("__weak"), ""),
>          (CMatch("__sched"), ""),
>          (CMatch("__always_unused"), ""),
> +        (CMatch("__maybe_unused"), ""),
>          (CMatch("__printf"), ""),

Applied, thanks.

jon

