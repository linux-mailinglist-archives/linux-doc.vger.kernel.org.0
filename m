Return-Path: <linux-doc+bounces-87089-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAy5FkMkA2oF1AEAu9opvQ
	(envelope-from <linux-doc+bounces-87089-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 14:59:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 490FD52091F
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 14:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2FED3011130
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 12:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F7A39060D;
	Tue, 12 May 2026 12:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Pdv8mc9i"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19B63A71B1;
	Tue, 12 May 2026 12:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589358; cv=none; b=MoKejCVNEYTCBsme42AZhRKmGAHpJlxxWnDqiIU7AbbwpQvw0OP2q1qbEOxY13vg/fReeLB3KA7GBNN5FLX/hYB0nh3EONqTJqDkX8DCLW1Pq6DhnQg3TlWiF+o6bOj64oiOQi4oVSZiSxF0P6oKOxiMpGsQUWsMCk4LAvFADIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589358; c=relaxed/simple;
	bh=BmGVZItobAjgJyPYiVCdUrAyC6N4OuGTopNkz3FiWTE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iaBWTPlpEEzvsaeWS2DzgdxVXGKUcYfrmjgbK+n+tYmH6DKHp9+rAjXse31q9BqrwqgBKioK+RAHkKcmF0I+Ts69RDwn3BlS64VNY+U6Gw/k68npanUQV5c+zg2MwpY+xL2p8yx1rnM//gVS+ZUybGGJ0pMwzt1RVBBs48hP4EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Pdv8mc9i; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D7103410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778589340; bh=EWyclGFz8pzIOxZnmO3PLCb093L3qCVV0LGewMBfVts=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Pdv8mc9i7zmb9MBPfvcutWFzqKWDRicRjjImHqG43s8qPICWHPVBDf44LLT85PFoF
	 mIryf+pwEmwtvEmaFwHxiCIRgW9KV8N7Ic0YVCENqKdO4hyEF2pTnAqiKnxgFTqHqo
	 BSCFZT1y6pOqIVDnLjsHzj/am/RIWUzWEDU5VynNO1p4HhEk67g2E+eTqE0h27F5lK
	 9+5pwzf5HSM7sokPEsoH8GbEooY63G1PFmpj0QW2z2j5LVYkq/p5uZRWEpWcVi0Cn6
	 Ancqc7sq+EghglQWe9SUP0s1sUROzNGnKzYCttnKI+pwUSoD6U5MyNgPvG+EjDF+oC
	 AfNWIhIK8uWJQ==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D7103410B5;
	Tue, 12 May 2026 12:35:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>, Chen-Shi-Hong
 <eric039eric@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: reporting-issues: fix advice wording
In-Reply-To: <1e7f2b9c-7c04-45d7-83e4-dd13267ae910@leemhuis.info>
References: <20260512015146.4081-1-eric039eric@gmail.com>
 <1e7f2b9c-7c04-45d7-83e4-dd13267ae910@leemhuis.info>
Date: Tue, 12 May 2026 06:35:38 -0600
Message-ID: <87wlx8st45.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 490FD52091F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87089-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[leemhuis.info,gmail.com];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Action: no action

Thorsten Leemhuis <linux@leemhuis.info> writes:

> On 5/12/26 03:51, Chen-Shi-Hong wrote:
>> Replace "these advices" with "this advice" in
>> Documentation/admin-guide/reporting-issues.rst.
>
> Thx for this, fixing this is a good idea. It nevertheless makes me go
> "hmmm...", as the wrongly executed and maybe not obvious enough original
> intention of the author (disclaimer: me) was to make it a bit clearer
> that "this advice" does not only mean the one advice right before it,
> but all the pieces of advice in the paragraph. It would be great to
> cover that while fixing it. "pieces of advice" maybe? Not sure. Maybe
> somebody has a better idea. And maybe just ignore my nitpicking, guess
> "this advice" just feels too easy to misinterpret from my point of view
> as someone to whom English is a second language.

"Advice" is an uncountable thing, so the suggested fix certainly
encompasses the meaning you want.  It could be "all of this advice" or
some such if you want to make its coverage explicitly larger.

jon

