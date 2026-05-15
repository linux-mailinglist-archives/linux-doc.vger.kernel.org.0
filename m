Return-Path: <linux-doc+bounces-87668-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFF8FmMsB2oLsgIAu9opvQ
	(envelope-from <linux-doc+bounces-87668-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 16:23:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5E35514F5
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 16:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F9783033D34
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 14:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A049337A4B7;
	Fri, 15 May 2026 14:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="gLawDrjR"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA7C379C2F;
	Fri, 15 May 2026 14:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778854803; cv=none; b=dicetUHgVnm3e7wko7g9ILMhseQHMiCl2Ye3ye/lvhH2Wyf+BmuuGeHREIVVNwSJs6zxTIyGEjOmQnZZg12buTw6vGw0cSI0Knt+BCPbFruIoXWWusZ7R+nlSSsbJ5mKkaH9r0lux6CASE7oCu6nXMLMHZbgfx6O5MEx9iudels=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778854803; c=relaxed/simple;
	bh=uMceqlqzXRfw43iICLsAETRTDVV2kZXA7tfSMDH1QEA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jhF+oIJt6CXSUKrK5HxOoQSD7ygzT/RCAgwzI3ia+5uLDLrZV6HbUX/a8uG35HkNS+gooCXjhsqFq0ZsAPakcUX/y9SDhMedhLwxjYNXrAz7jQLxB5Apc00+yGJUydnQ5+BMwQAJBhsviBalz/xLsTVgs02CKQnuAx+TC4GICIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=gLawDrjR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BF075410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778854801; bh=6EG6To5SzJcuaqVMx4a5b0561ufDvBSm2WycfWGusZM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gLawDrjRV7iKcTJpIiethGPjFQrqd1mKGp70oXutFxyaDQNaMDlkk9x3zg2VAY75O
	 DBVM6OU1awoHTl/YVovW7W1siq9WL4KdAuPT4yiDBSv67rJy6Dfeg0k4UUn1WFSaPF
	 wENNcJoRHc07/5Bmbbm8HH2djVOYCLgA4sZQ00AoQQa4674OT94JkVaWuvqMrFZAwH
	 Cm3Uw35Wz6hawf18WUZIMn7h/51gQ6T6885em8wrW38w+DwjQwKt+wi0mpDDD0SdYO
	 3Muf/HKMyQBf4BZmH8onUBJkpcVASTDrY6M/rLal5Hy36vg5UIiiS87OCk6Z6ch0t1
	 NvKbMHjVLeGXw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BF075410B5;
	Fri, 15 May 2026 14:20:01 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, Mauro Carvalho
 Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] kdoc: xforms: move context attrs to function_xforms list
In-Reply-To: <20260505221548.163751-1-rdunlap@infradead.org>
References: <20260505221548.163751-1-rdunlap@infradead.org>
Date: Fri, 15 May 2026 08:20:00 -0600
Message-ID: <87mry0rbzj.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: BF5E35514F5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87668-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lwn.net:email,lwn.net:dkim,trenco.lwn.net:mid,infradead.org:email,linuxfoundation.org:email]
X-Rspamd-Action: no action

Randy Dunlap <rdunlap@infradead.org> writes:

> The context analysis macros are function attributes that should be
> in the function_xforms list. Somewhere along the way they were
> inserted into the struct_xforms list instead. This causes docs build
> warnings to continue to be emitted for context macros.
>
> Move the context analysis macros to the function_xforms list where
> they should be to eliminate these warnings.
>
> Documentation/core-api/kref:328: ../include/linux/kref.h:72: WARNING: Invalid C declaration: Expected end of definition. [error at 96]
>   int kref_put_mutex (struct kref *kref, void (*release)(struct kref *kref), struct mutex *mutex) __cond_acquires(true# mutex)
> Documentation/core-api/kref:328: ../include/linux/kref.h:94: WARNING: Invalid C declaration: Expected end of definition. [error at 92]
>   int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref), spinlock_t *lock) __cond_acquires(true# lock)
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>
>  tools/lib/python/kdoc/xforms_lists.py |   20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Applied, thanks.

jon

