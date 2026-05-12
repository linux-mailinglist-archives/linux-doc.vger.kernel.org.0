Return-Path: <linux-doc+bounces-87188-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLk0Lb1hA2o55gEAu9opvQ
	(envelope-from <linux-doc+bounces-87188-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 19:22:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 295C7525BE8
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 19:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 695E1304C8BB
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 17:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C160F17557E;
	Tue, 12 May 2026 17:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="TmnR212Q"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FD7385D95;
	Tue, 12 May 2026 17:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778606080; cv=none; b=NPGDFDyUfl5d9yufk9Oq4HdNPR5XbuK4GuhDBSHNW3v0FlVdZkAh4LczRBGJYr+EyD+9rE2KF51G5mAY8lsW27r7Ud+6RbU7e5WeB6T6MeXw/6VGoMJ2+ANXSdIK8KmPmUddmvzj8B7gMFJDn8AoK0i9yeSRojZ8llAda0l/syM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778606080; c=relaxed/simple;
	bh=CxCtrBKKTRwjYyddIT3xIXWPrK5Mkl6rteQ00CDBDJE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cc1s/CdkNzPUBTb4sc1qCmenJEVXOUB3aJwC+JnW36dghMQSUuyLt4pmjJBFZay34C2YHGty/XvaRMBSwNwCeE4M2jt4Co8aMEnDySpMhSa8uBNXM98+17Q6NOer99v28GhTOKVzvfO8MITEWIrxgJYc1n4zm9kOonq6aca1/HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=TmnR212Q; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9C2E3410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778606078; bh=zZT2Gr7FzYWJ/OMZRRAd/nVaMuoIgfl6eufwoozZjto=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TmnR212QKyjDOYBZ+yeMp6JXJJpBrRPQMSIG4KAqvNw0O/XJTsv3V1vDhOtv7jVsi
	 8QbAMztabL13YKX6dw/swu7cP9LGvQAhkg5AKeCD5zHmxykHo5ELuva2LbZbz+6BVt
	 RKtnDAdK0vnMIP7iA18Yucw7rK6E94HtjmnwGc5KkciCh0ptEc+NCmDCYhmWfU/Yxd
	 0aDmW3evHL7EtOjUWP4RscINTaB589dhw9vtQN8X7R0lrHe8emn7srj2hXfY5y/WU0
	 X6FfxfMtvfH88/gO4tUyZ95VMy6XShHOzJvxxZ+DMVhXlDfRZGsjAha1XFjnAJzsNj
	 t+kzmBZCCkQPA==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9C2E3410B5;
	Tue, 12 May 2026 17:14:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Willy Tarreau <w@1wt.eu>, greg@kroah.com
Cc: Leon Romanovsky <leon@kernel.org>, skhan@linuxfoundation.org,
 security@kernel.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH v3 0/3] Documentation: security-bugs: new updates
 covering triage and AI
In-Reply-To: <20260509094755.2838-1-w@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
Date: Tue, 12 May 2026 11:14:37 -0600
Message-ID: <871pfgpn2a.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 295C7525BE8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87188-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1wt.eu:email,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Action: no action

Willy Tarreau <w@1wt.eu> writes:

> This series tries to translate recent discussions on the security list
> on how to better handle reports. It details:
>   - when not to Cc: the security list
>   - what classes of bugs do not need to be handled privately
>   - minimum requirements for AI-assisted reports
>
> As usual, this is probably perfectible but can already help in the short
> term as we can point it to reporters, so barring any strong disagreement,
> better continue to proceed in small incremental improvements and observe
> the effects.

OK, I've applied the series to docs-fixes; after a short exposure in
linux-next I'll ship it Linusward.

I have a couple of comments on the individual changes that might merit
an eventual add-on patch.

Thanks,

jon

