Return-Path: <linux-doc+bounces-80577-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDHMLq1VwGlSGgQAu9opvQ
	(envelope-from <linux-doc+bounces-80577-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 21:48:45 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 185A32EAC3F
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 21:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16A963007E23
	for <lists+linux-doc@lfdr.de>; Sun, 22 Mar 2026 20:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B28427FD44;
	Sun, 22 Mar 2026 20:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="mzmwnE2H"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E1F24BBEE;
	Sun, 22 Mar 2026 20:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774212522; cv=none; b=Hn6bKkV8+36fXpHFrcwHIfM8T7/qVDIjO9FJNDBbG6YVtaS2r+goi6TlAs4/Wct5KV7jvk0pMwh/DJsAfO7puZ6tj1aPRxFKZz0fKRNHHZRKdIbTochDhbCxS26kXLuhzEK+FC1KNkNJvgDg8XkTWI2yflSb5/MTvPDQ4XoJMCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774212522; c=relaxed/simple;
	bh=dwutdTttgxaW4X2GU21RV2Ljl2yTL2dIdLHh+R/HZps=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uyEpD1xPJRAK2ZD5F/5MrKWHeFKAR553PJEHYMpMfRhhUeMUJqAOlnWJ+d9Jg+iUehHNbId916z/Zq/VqOsDWKv8O8J627HpNxfvZ8VyP6L5/IaLPIFL6mQPg3DzUq3nrQ5dVo6b0KY5RjThppNr0oEzHObGHBpWL3FkSS80Qs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=mzmwnE2H; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 90172411E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774212520; bh=dwutdTttgxaW4X2GU21RV2Ljl2yTL2dIdLHh+R/HZps=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mzmwnE2HOF/SyaspMF/NUPgPAMGUtxSgUJBJEu8xdz+Om/GNItpooqQqjLpieKOCZ
	 YB2bETyYBJm2lXKLUQFcN+JZTai4v1PNHMr7jsg+urkyb9oGQLexky3GZGJPOOJip4
	 2UGqqWP5Xsnkf8G3KGcZ3bhXhjUCi7ef+9TwNdtrD4EEvtWsVLjFsnqVpodgtWd6Go
	 6L5/4H7SXcEdNDKTlnu0X9d/fJinP5GjhIcnEsdJl+7QqtolRsqssaLiqgexgTBz9+
	 H7a4jisWC5vIxgUWg6Bu20kouwpHMC0wPfIyU1DbGRxe1UdGtGzBCWSfF9JATj5TnA
	 UkVIX+UFgdCgQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 90172411E2;
	Sun, 22 Mar 2026 20:48:40 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: linux-doc@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] docs: reporting-issues: tweak a few areas and
 rewrite the ending
In-Reply-To: <87pl529y01.fsf@trenco.lwn.net>
References: <cover.1773750701.git.linux@leemhuis.info>
 <87pl529y01.fsf@trenco.lwn.net>
Date: Sun, 22 Mar 2026 14:48:39 -0600
Message-ID: <87mrzzd1zs.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-80577-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,lwn.net:email,trenco.lwn.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 185A32EAC3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Jonathan Corbet <corbet@lwn.net> writes:

> Thorsten Leemhuis <linux@leemhuis.info> writes:
>
>> This patch-set tweaks a few parts in the fringes of our text on bug
>> reporting while replacing two sections at the end with a new text as
>> proper appendix that hopefully better fits the purpose and covers more
>> aspects.
>>
>> This is the first versions of this patch-set, but it starts as v2, as it
>> contains three patches and a few bits that were part of an earlier and
>> bigger patch-set. This incorporates review feedback given there. The
>> last patch in this series is mostly new, but includes a few bits from
>> patch 4 and 5 of the earlier series.
>
> I don't see anything to complain about here ... if nobody screams, I'll
> apply them in a few days or so.

...and I have now done that, thanks.

jon

