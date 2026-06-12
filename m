Return-Path: <linux-doc+bounces-92206-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id It5oD+NgLGqrQAQAu9opvQ
	(envelope-from <linux-doc+bounces-92206-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 21:41:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 841A967C1DB
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 21:41:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=pfQIrC9E;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92206-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92206-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 390EC304D5EB
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 19:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813843537EE;
	Fri, 12 Jun 2026 19:40:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6671731DD97
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 19:40:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293249; cv=none; b=Ob/mDV/F0/lQ2YCCTBsaREgOSDjp1wJ9WGlMz4WG5NKWIjfuGo+/ZA3L9T1fEd4uKqJb0MLflT8nXrvohsVwZM4CpHAqFuMnQaOP6jQgTkSs5orhT9F2um95zujBHl87GRZitM25RPino8/79PKtWcSOcm47kM80+WnLzTklgzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293249; c=relaxed/simple;
	bh=0u5g3j+HkmvFyueECLrr1iMhH6hWrZ/x3FsvsT4/C7M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pq3iSnHWLwS1iPhUusfYHHHOB3jxQrsN/xSGITq1UeLAJP4aGQmwMf9ni7jWrEOhMyScoq7lNIVW1DD/DhH+mVGN8WtHqjK8GkY1WKPVZrbjD0NiaE1kq6O2UULxdyJ1NJ2/TgKJhhxTYHdLc3ME61nikiZ+EAKzUsP0UXhwFtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=pfQIrC9E; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B957B40430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781293247; bh=80i5qExKaxmXDxpYh30y3UPKF8vHdibCNPDd8QnPdwE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pfQIrC9EQzvfGZz7iLJ35w44X4UFzqCT4+XzDxho3bEYgFclayWk6hMDMoFOlyt16
	 8AYjtIAVk31RmkaXcyz4uJgn6sIj75tcM5nGF6FMs1LwG8QDRRWuviyY2PgvzrcPgF
	 T/MPJKJkRxHGaHLBOGOOHc8ybim6MNSUnWAiUG4jvPSCoB73ol1llLo1/bImrmmCXL
	 nbQYRO0Cp3Bm+aHUKrmtLMBzlFbj5C3pABhdHI3/m7UDgIpLCXNHZ0gvW0AebPNcMl
	 6312ajXvRn9z4OjVNvr7yuArxo56Y77tgQLUW94Aigx0fPq56C3oa5ATm5FBcHUJ4e
	 6PuAkaOdjHr0w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B957B40430;
	Fri, 12 Jun 2026 19:40:47 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH] docs: pt_BR: Translate 3.Early-stage.rst into Portuguese
In-Reply-To: <20260601192346.192752-1-danielmaraboo@gmail.com>
References: <20260601192346.192752-1-danielmaraboo@gmail.com>
Date: Fri, 12 Jun 2026 13:40:46 -0600
Message-ID: <87cxxv5yyp.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92206-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:danielmaraboo@gmail.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,trenco.lwn.net:mid,lwn.net:dkim,lwn.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 841A967C1DB

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Translate the documentation file '3.Early-stage.rst' into Portuguese.
>
> This section addresses corporate kernel development constraints,
> the balance between company secrecy and the open-loop approach,
> and the use of NDAs or Linux Foundation programs to avoid
> integration issues.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>  .../pt_BR/process/3.Early-stage.rst           | 233 ++++++++++++++++++
>  .../pt_BR/process/development-process.rst     |   1 +
>  2 files changed, 234 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/3.Early-stage.rst
>
Applied, thanks.

jon

