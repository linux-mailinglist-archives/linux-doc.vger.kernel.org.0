Return-Path: <linux-doc+bounces-85562-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHiyEUll92n6gwIAu9opvQ
	(envelope-from <linux-doc+bounces-85562-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 17:10:01 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A286F4B62D1
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 17:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65AD53008778
	for <lists+linux-doc@lfdr.de>; Sun,  3 May 2026 15:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E202BEFF6;
	Sun,  3 May 2026 15:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="NpIWO23S"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64601F5821;
	Sun,  3 May 2026 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777820998; cv=none; b=bOuRoPRcMY16j0kQPLG2M2FUIA8uauXUCQkpDqZhohgCHYlJWuiNP8F7E2QC/0lXSICtp/HUQFsdUqhhTznvQi7KJjwnVNAPTh7PGxsFNVTxZA5D7uhazpQsin1yXtLk+6mW6sBNZDSkjtMOFNBOucC1XbHPQ3VTmy58v+HzKsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777820998; c=relaxed/simple;
	bh=S9MOWDoWCQphaT/a8FrJsXB9PhKD6OAuD2KdbEgV6aM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QkO4+3d8BVzBAyUB+b/I5he4BxY6JuZBM8a5d+FjzSaVyH7/wCr3dzN/VPYw9wuTGHGF8Qb9SMqLQxj0mdq7TrGeQDXvmd43Fxo+rHeI+QuW6yASr6q3z1YKkdIa3/ehLt+iHEmsvPry2/CSnRqdrVz2ZUsEjXT0vjuDiveNOU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=NpIWO23S; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7665841084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777820997; bh=x7eqm5Mt1/Zb1tlAKWtIPd71ktYeeQ5egMGjvXRoLns=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NpIWO23SPW2i8NHmJIawk5mPhg/NriiQctLVAqQhIggg1dRGVuYRManmEv7n6Vxfx
	 hEfunuNnky4emPN0jSxVyX6VioWTbT2d/VP5s3ZUJJ+BLTT3XPAsLrWf5rAr4GzVof
	 2hRAejx0XYo/QDX1OTAn00I3p9ZhLI93rAlsECG8G/WylSO1ZUkRmztZTi1ma9Ci+f
	 XI+4FHJX4Uj1RnHohQAKnmUqf7YwgvCtR3jEWLIKEEZm2xNIb/Ao+nJ0Y+1ghkLYAZ
	 w7u9okrXD/RaLRxuOzjdE50Nl+oRhSCyELWZZgO9ytjTsvv3rHurBvGnFf6G55VzMT
	 fayf9ZCXoXlSQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7665841084;
	Sun,  3 May 2026 15:09:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Frederic Weisbecker
 <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Gabriele Monaco
 <gmonaco@redhat.com>, Ingo Molnar <mingo@kernel.org>, Marcelo Tosatti
 <mtosatti@redhat.com>, Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@kernel.org>, "Paul E . McKenney"
 <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Phil Auld
 <pauld@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner
 <tglx@linutronix.de>, Valentin Schneider <vschneid@redhat.com>, Vlastimil
 Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
 linux-doc@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Shuah
 Khan <skhan@linuxfoundation.org>, John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH] Documentation/kernel-parameters: Remove "Deprecated"
 from isolcpus=
In-Reply-To: <20260427150739.bwVmmkj2@linutronix.de>
References: <20260427150739.bwVmmkj2@linutronix.de>
Date: Sun, 03 May 2026 09:09:54 -0600
Message-ID: <87bjewcywt.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: A286F4B62D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,redhat.com,kernel.org,suse.com,infradead.org,goodmis.org,linutronix.de,suse.cz,gmail.com,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85562-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[trenco.lwn.net:mid,lwn.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Sebastian Andrzej Siewior <bigeasy@linutronix.de> writes:

> The isolcpus= option has been marked as deprecated in 2017. Back then it
> was desired for the domain sub option to be configured dynamically at
> runtime instead using this boot command line which provides a static
> configuration. In the meantime this option was extended by other sub
> options which don't have runtime counterpart or it does not make sense
> to provide one.
>
> The deprecated part always referred to the default `domain' sub option
> but it was not obvious. Also the reasoning behind the deprecation is
> sort of dubious: There is nothing wrong with a static configuration if
> there is no desired to reconfigure. This is useful on systems which
> have one purpose and the CPU partition configuration is not changed for
> the entire lifetime.
>
> Remove the "Deprecated" note. Remove the part of the description which
> suggest to use cpuset.sched_load_balance and instead point to the
> documentation file which explains how to use cpusets to configure this
> at runtime.
>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Applied, thanks.

jon

