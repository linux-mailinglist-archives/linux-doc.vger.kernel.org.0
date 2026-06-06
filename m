Return-Path: <linux-doc+bounces-91221-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ozh+DgB3JGpz6wEAu9opvQ
	(envelope-from <linux-doc+bounces-91221-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 21:37:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9E264E244
	for <lists+linux-doc@lfdr.de>; Sat, 06 Jun 2026 21:37:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=qDIoFcav;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91221-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91221-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D393D301BC0E
	for <lists+linux-doc@lfdr.de>; Sat,  6 Jun 2026 19:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C093B14BD;
	Sat,  6 Jun 2026 19:36:31 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6017D78C9C;
	Sat,  6 Jun 2026 19:36:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780774591; cv=none; b=bLycfzTti6QQQ/DJU5MLBs1GqTa3QetIH057EtRLQsat3xOpuPfEq9TxbN7VGAav+dZDXhTQvmfmVRPvl5YFHPZRQyR8EJOgXkJnEdaG9B9oFA++/F1IPAQiBB/1iPWWe6fZ9UE85mZGmxcUCOHlfpJ222FyN0Yb0cYUkyr53Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780774591; c=relaxed/simple;
	bh=7fbbCNfM8QB0F2+KJw49ucJeet+q95TfB3QJq47jJao=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X9tjWlgTsjnMrkgaDgyq2Q531qyKBSBJgcPcPOhwLDz1U1fi8D3dfZuFlUuIC+82d2WmpdjUb6B9/MrM1z9G0ZrUn3C6n27W//JH+7D9BWcpUycQhOeW8QK9vSkX8uiF4x7+RNaWuqzpMhQkZjQyUpyWirCMS97ROdT5QQpGFvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=qDIoFcav; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9103240E33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1780774583; bh=7fbbCNfM8QB0F2+KJw49ucJeet+q95TfB3QJq47jJao=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qDIoFcavkomeO718/o6FLB4OChv9WwAgx7i7tBWbQ6MmmpQ9fXCbo/2qI4LRIAI3P
	 ATLQlrx2OFpFC3oKaXSfF/hsU4UchJSfbCdSgPBJDzwm+auIIvdFsSXc6ISj6Ao3M2
	 CiYpizcz20MSSt9r5J5LuDP/sevLvZOHUkR1sZDIqGNdzQeUIClBr2cPjeXMEWrfiG
	 BZIK0mHS7+TW0HaFLCuvyNiN9eCa/SJXaaVrpdl8KuiG2b1fdFo8r4R0FmOz8FGElQ
	 zC9G31y4thvT6ptNpIfyp8mgtC58TnCjJ2VrANZd+0avTLB2po8k9Iw4Ndin7hZ9nG
	 s+/uUePPlOZ7w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9103240E33;
	Sat,  6 Jun 2026 19:36:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka
 <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Kees Cook <kees@kernel.org>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/mm: document slab cache isolation with SLAB_NO_MERGE
In-Reply-To: <20260606174412.4843-1-med08elkadiri@gmail.com>
References: <20260606155856.15548-1-med08elkadiri@gmail.com>
 <874ijfvec2.fsf@trenco.lwn.net>
 <20260606174412.4843-1-med08elkadiri@gmail.com>
Date: Sat, 06 Jun 2026 13:36:22 -0600
Message-ID: <87v7bvtqa1.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91221-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:med08elkadiri@gmail.com,m:akpm@linux-foundation.org,m:vbabka@suse.cz,m:david@redhat.com,m:lorenzo.stoakes@oracle.com,m:kees@kernel.org,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,lwn.net:from_mime,lwn.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E9E264E244

Mohammed EL Kadiri <med08elkadiri@gmail.com> writes:

> Hi Jonathan,
>
> Thank you for the review.
>
> Yes, I used AI assistance in writing this document.

Please see Documentation/process/coding-assistants.rst for information
on how to document that use.

I would also consider starting to fill out Documentation/mm/slab.rst
rather than creating a new standalone file.

Thanks,

jon

