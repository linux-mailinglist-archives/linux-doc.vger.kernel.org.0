Return-Path: <linux-doc+bounces-94230-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YdJZDTgZRGryoQoAu9opvQ
	(envelope-from <linux-doc+bounces-94230-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 21:30:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDF36E7935
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 21:29:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=cj9mcY+P;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94230-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94230-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A9393065A1C
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 19:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4804044102B;
	Tue, 30 Jun 2026 19:29:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA18421886;
	Tue, 30 Jun 2026 19:29:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782847789; cv=none; b=dkHgYz6+ge2VFCXRR2wsKiTDR6lcfHAXCBYFyzHcIb8JW3922AUpVadcujn5noV4sobid/c93NUpRe19faH2jRPcjJedM5fvpBzctORiZ/G4pzKdfokf/DkL4cI7Br8PMHePvsSsY9LodlFUyKyxHw/ipEVtm/ZB44WhuA9otGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782847789; c=relaxed/simple;
	bh=a2Afo2Kq3BLxRSERZhU1N9kO3lg9OQZPATHAImSZYos=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KA9I0xhZXtcz8p2pfDb50RpYdtxDF1ylsPQfx8AV6IvAw4zk30XkRj/JoXLT5eoP+37znOfGKMhTe5dx6TpBGrLTrnkl4kmY5+XFEphhOtCZyv7pl+BRUJNGY49lyXzspe+XWdcecrYHYjcBM68LekvpJjS8K71Id9XkxVQ8Wis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cj9mcY+P; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F05C840E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782847781; bh=XkR0fSWSSaU0xZIqLdBJQyReg3okUNCxMQMxES/4kok=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cj9mcY+P4vWZlMA+rt1tZSZAmV6OQCV6n8YU8VaGpDOo10os4x3Lwj0Q4WA59dvlh
	 R5pVPatfnwj2PgjtHy99nl34sJy75FaIDLryS2eHm9n1eGl//SC1XMwLno5pYxHQKs
	 4LYWbysw17acNoAUqVK5zDsgEYq+MmE8r4iht6HfnaHFt/xcVXR+YP4Px6NlCtcYN+
	 CxgdGz96i9+FpujjUAssTV2V8m62MR9+4GALAXwGwvPaTRoBojtyeuLuK8+hQlPQGW
	 CsK6Gll43/LN32f7SEoKgtybPIa6o5eeU3UwCP2r4y/xuPvH+Ziws1NEH94dGtS4BO
	 mDzvTX2C+gBFg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F05C840E27;
	Tue, 30 Jun 2026 19:29:40 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Shakeel Butt
 <shakeel.butt@linux.dev>
Cc: Manuel Ebner <manuelebner@mailbox.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/mm: Fix braces
In-Reply-To: <20260629161156.90213-2-manuelebner@mailbox.org>
References: <20260629161156.90213-2-manuelebner@mailbox.org>
Date: Tue, 30 Jun 2026 13:29:40 -0600
Message-ID: <87ldbvsu6z.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-94230-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:jgg@ziepe.ca,m:leon@kernel.org,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:skhan@linuxfoundation.org,m:shakeel.butt@linux.dev,m:rdunlap@infradead.org,m:linux-mm@kvack.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mailbox.org:email,infradead.org:email,lwn.net:dkim,lwn.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FDF36E7935

Manuel Ebner <manuelebner@mailbox.org> writes:

> Correct typos in mm documentation by balancing parentheses.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
> ---
> [v2]
>  fix commit message
>  add tags
> ---
>  Documentation/mm/hmm.rst           | 4 ++--
>  Documentation/mm/process_addrs.rst | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon

