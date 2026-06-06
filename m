Return-Path: <linux-doc+bounces-91216-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +x3DEbVGJGod4wEAu9opvQ
	(envelope-from <linux-doc+bounces-91216-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 18:11:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3635964DE6E
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 18:11:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=Zdl3qL0m;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91216-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-91216-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FC183010BAB
	for <lists+linux-doc@lfdr.de>; Sat,  6 Jun 2026 16:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA522DF153;
	Sat,  6 Jun 2026 16:11:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2902E2DECDE;
	Sat,  6 Jun 2026 16:11:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780762288; cv=none; b=sg1Jg+sigccLJq+oRetqsqxooHMW6XFQjH+Fqk/pyT3iKhgm3IgHqYYkBF70FgyuU1Cp1QyjG9zC369slsd7Je9S/g0Ofl8KlXD6EZKpFePEyp6zcI2HolFWMfGrpfuOuFpa1g+W4bAZQPSimqw6+ZU0XrYZA19qt4Z84YrWN1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780762288; c=relaxed/simple;
	bh=mb1PpEG8RYFB4Ga6Mdj4igPZk2VoQ3jfb68mA/FlnKw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GWRE3W5re6BC9hmHIUyeXsHhCa+RqzcTXvQMDWC8j+1UFJCE5ctalvRrl/A0WAPyWYT6I3KvRXxvXN43j2OIpkAsEhxniXIAmIb+zzDSPkzpiq3coZqWxYzSnpHQhDpBj3e3KKVCWqeNLlphi4qSiJMy4wXQdDtWpUZA6HanGNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Zdl3qL0m; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4EBC040E33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1780762286; bh=DqGXeDqpKIvvW3QQbyRaGwc6KekIm0MprRWgRPkr2tU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Zdl3qL0mTPsA6dWXrgZkxtue29RQ67FMWdoCbH7C1EURLFFPmbcbJZu3qW9J1lYYO
	 xPfdGc3JATslC7hfgaVGhOLRgNZEtQxW/kfDlAWKh2f1wfxYzbHnb/pJZYxcsvDFGA
	 9p8smW9WhagTrBFUl12X65Fq4Rwwz/K5X6xpJcJMHY0+uMNE6qZqKsCYgHV4Aodc9d
	 /JzuvNwAWkaobPXh4Qodlx0Yg7qhPqq0/Ob+yBMnECyWV/hbgToKIy/oIpeJUJjw2i
	 2Hgt/qtdbF95eGHxShpp//CGCUHOR1WOBvcT9u2FfLDo9jVlFnMLnO4bRI8513W69L
	 HNABuMEWjFvTQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4EBC040E33;
	Sat,  6 Jun 2026 16:11:26 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Cc: David Hildenbrand <david@redhat.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Kees Cook <kees@kernel.org>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, Mohammed EL
 Kadiri <med08elkadiri@gmail.com>
Subject: Re: [PATCH] docs/mm: document slab cache isolation with SLAB_NO_MERGE
In-Reply-To: <20260606155856.15548-1-med08elkadiri@gmail.com>
References: <20260606155856.15548-1-med08elkadiri@gmail.com>
Date: Sat, 06 Jun 2026 10:11:25 -0600
Message-ID: <874ijfvec2.fsf@trenco.lwn.net>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[redhat.com,oracle.com,kernel.org,kvack.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91216-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linux-foundation.org,suse.cz];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:med08elkadiri@gmail.com,m:akpm@linux-foundation.org,m:vbabka@suse.cz,m:david@redhat.com,m:lorenzo.stoakes@oracle.com,m:kees@kernel.org,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:from_mime,lwn.net:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3635964DE6E

Mohammed EL Kadiri <med08elkadiri@gmail.com> writes:

> Add documentation explaining when and how to use SLAB_NO_MERGE to
> protect security-critical slab caches from cross-cache heap
> exploitation.
>
> The document covers:
> - Criteria for identifying caches that need isolation
> - How the SLUB merge mechanism works and what prevents merging
> - How to verify merge status on a running system
> - The cross-cache attack class with CVE reference
> - Tradeoffs (memory cost vs security benefit)
> - Relationship to CONFIG_RANDOM_KMALLOC_CACHES, SLAB_TYPESAFE_BY_RCU,
>   and the slab_nomerge boot parameter
>
> This information was previously undocumented, requiring developers to
> read mm/slab_common.c to understand when SLAB_NO_MERGE is appropriate.
>
> Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>
> ---
>  Documentation/mm/index.rst          |   1 +
>  Documentation/mm/slab-isolation.rst | 113 ++++++++++++++++++++++++++++
>  2 files changed, 114 insertions(+)
>  create mode 100644 Documentation/mm/slab-isolation.rst

Thank you for working to improve our documentation.

Did you write this with machine assistance?

Please review our documentation and adhere to our markup conventions.
For example, function names should just be function(), with no
additional markup.

Thanks,

jon

