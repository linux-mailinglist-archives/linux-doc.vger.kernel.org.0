Return-Path: <linux-doc+bounces-92177-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TYILLlJcLGqJPwQAu9opvQ
	(envelope-from <linux-doc+bounces-92177-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 21:21:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0734567BF5F
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 21:21:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=e65oY+5S;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92177-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-92177-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8DD0312DC07
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 19:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482C03793D0;
	Fri, 12 Jun 2026 19:21:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247303793A9
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 19:21:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292112; cv=none; b=e81CmjwX21h/iUTE1WcC380HFD5evCbFYgU3RZDglcj22Vju8YGxf6mPD3yebsU7nlTUXWf550MSyBnDDlYUu8v8Ee8cChpAEwOKBPn7wU5Nsu7zfOXs8hq2nNB6P+ueu/wTFXhYEYfKcypESb7AQxGjBKdq17PSskgfgt0sSq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292112; c=relaxed/simple;
	bh=rGxGeIlyQROGNdwC3iIogkKw2subYwsPutbMqa2IoQU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GSGoIWs7toacUiaYLtg5/qzq2F8VToqyFtlTcaA5nIf0Nqf7H4LVeL5i+QKBgoo0CDki2ChuHPaqw3k6mvZB/yGiIoPUMsxbQxviSY9rMMRQ9OTaJHyPbZayx+evmNBm+XfNJctAhW60N0ssFu0cIwxwA1lGKj900b3gFytiXhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=e65oY+5S; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7305440E4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781292110; bh=iBXUBw5EYTIyF/PB1MWw7I5XspGR6xCDiVEcV9Takoc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=e65oY+5SEzmXxkA0vvv6nGjtadvfzBGW6L70w0CtNvYlpcq2kVjO3yu6lUL6O63ub
	 BGhZVSEmlSA7TVF2IHLjsRK3aYZe+a0bXGHbzd4ci3qRsbhEuJN9NrfOCde1sigKsB
	 ILWyxu2NDxRqFO6VeYdLBJyXxGPejGmWgHZ0GABcGk8LV5+wn2+8OkwGVdfaRr3iHI
	 BHzKRbsPCK7NuUiaAIT7dlfccQaAKy3vCKBrghLvc9MGoojRW9RaOHDi6ENBbhZ8PL
	 xinEkV/f9lUkrqidxEf6mnjFAX4hSmX0XOrfO2HeVzcd81OA0mIBDAV/rCYQv8PBpj
	 XAFMTtM+ubxaw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7305440E4D;
	Fri, 12 Jun 2026 19:21:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Avadhut Naik <avadhut.naik@amd.com>,
 Dongliang Mu <dzm91@hust.edu.cn>, "GitAuthor: Ethan Nelson-Moore"
 <enelsonmoore@gmail.com>, linux-doc@vger.kernel.org
Cc: Federico Vaga <federico.vaga@vaga.pv.it>, Carlos Bilbao
 <carlos.bilbao@kernel.org>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>
Subject: Re: [PATCH] docs/{it_it,sp_SP,zh_CN,zh_TW}: update references to
 removed CONFIG_DEBUG_SLAB
In-Reply-To: <20260611010014.412841-1-enelsonmoore@gmail.com>
References: <20260611010014.412841-1-enelsonmoore@gmail.com>
Date: Fri, 12 Jun 2026 13:21:49 -0600
Message-ID: <87ecib7eeq.fsf@trenco.lwn.net>
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
	TAGGED_FROM(0.00)[bounces-92177-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:enelsonmoore@gmail.com,m:skhan@linuxfoundation.org,m:avadhut.naik@amd.com,m:dzm91@hust.edu.cn,m:linux-doc@vger.kernel.org,m:federico.vaga@vaga.pv.it,m:carlos.bilbao@kernel.org,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:2023002089@link.tyut.edu.cn,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,amd.com,hust.edu.cn,vger.kernel.org];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,trenco.lwn.net:mid,lwn.net:dkim,lwn.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0734567BF5F

Ethan Nelson-Moore <enelsonmoore@gmail.com> writes:

> CONFIG_DEBUG_SLAB was removed in commit 2a19be61a651 ("mm/slab: remove
> CONFIG_SLAB from all Kconfig and Makefile"), but references to it
> remained in documentation. The English documentation was updated to
> refer to CONFIG_SLUB_DEBUG in commit 5969fbf30274 ("docs:
> submit-checklist: structure by category"), but these translations were
> never similarly updated. Update them.
>
> Discovered while searching for CONFIG_* symbols referenced in the
> kernel but not defined in any Kconfig file.
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  Documentation/translations/it_IT/process/submit-checklist.rst | 2 +-
>  Documentation/translations/sp_SP/process/submit-checklist.rst | 2 +-
>  Documentation/translations/zh_CN/process/submit-checklist.rst | 2 +-
>  Documentation/translations/zh_TW/process/submit-checklist.rst | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

jon

