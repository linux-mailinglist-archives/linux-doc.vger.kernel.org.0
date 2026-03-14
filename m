Return-Path: <linux-doc+bounces-79372-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GM9mOQCDtWkr1QAAu9opvQ
	(envelope-from <linux-doc+bounces-79372-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 14 Mar 2026 16:47:12 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DB728DBE0
	for <lists+linux-doc@lfdr.de>; Sat, 14 Mar 2026 16:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C112E300C6EB
	for <lists+linux-doc@lfdr.de>; Sat, 14 Mar 2026 15:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D218239E76;
	Sat, 14 Mar 2026 15:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="SLE3gcWQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170171C5D59
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773503227; cv=none; b=DEH96aOJTSPCMMchGfWHhPpnSmC9KIRUMg9ezHGlllkCkh+72ufN3IgvNLdRvyXokY4/kCvJCMJF/yBCTsfwUaMxOJImw1y/kyCkJf38z8lfyakYzNxzUZeZW9UKGY3hXHzIDEV8IleqBtWpWzC3zDW6pzy1ioUyeVTX+ohCBB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773503227; c=relaxed/simple;
	bh=JRGX4h+1dcIq3Qo41/c8czEuOPaBXN1o6cBiG6Sna24=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s695eDdajqPkGh1AQNp44qYLCRQ2GJye7l0shbN48gJyZf1qp2oOALs5f8GWGIJnLuuj+LlnyYgSIum4c2OAmObOxk3O/cjxEbw0v6BdPRENFWri6LDn4ndWsvFBPhH4tKyEiO8gbVdeHuJTBR6dE0TczJIMx6NpuN+/TL390MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=SLE3gcWQ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CA90540C63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773503219; bh=IcE3J2FqcFfyGlSpJqjrgTPcmLQfS23VafUSp6RS4SI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SLE3gcWQ+vlnWqX5Q+kIlKgT9eqkXbZ6JtxKSpP7PmPKW53EGYvQM8nZijpjnhI7Y
	 7Ij6cwpCTWaTsAKDFjExRJmJkvf2ncbCUZyi46vbCV/Sz6MoV/SxOBd/MlxVZaO1sc
	 gALKy3YVrttKoOncNeIQ2PC6BXWdQgwBuNPIOlFLjpQzi7hi1xgMraQYaeP74bhh3L
	 P5ngaxEEXW0dBesp2iQQKIQjuztFgNU9LUF7vMXRLh8rHT+Zz5T7+vZuHAqehHNO0S
	 ysh8713nc1hFhkOl0tOwd568RDQjdU8r5J4yAfK3pLgn3Q99GmC/sRgR64Ss+ZeJPX
	 6qkw6iTDyWZ1A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CA90540C63;
	Sat, 14 Mar 2026 15:46:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Kit Dallege <xaum.io@gmail.com>, akpm@linux-foundation.org,
 david@kernel.org
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, Kit Dallege
 <xaum.io@gmail.com>
Subject: Re: [PATCH] Docs/mm: document Shared Memory Filesystem
In-Reply-To: <20260314152538.100593-1-xaum.io@gmail.com>
References: <20260314152538.100593-1-xaum.io@gmail.com>
Date: Sat, 14 Mar 2026 09:46:57 -0600
Message-ID: <87ms0ajtvy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-79372-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kvack.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-foundation.org,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A2DB728DBE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Kit Dallege <xaum.io@gmail.com> writes:

> Fill in the shmfs.rst stub created in commit 481cc97349d6
> ("mm,doc: Add new documentation structure") as part of
> the structured memory management documentation following
> Mel Gorman's book outline.
>
> Signed-off-by: Kit Dallege <xaum.io@gmail.com>
> ---
>  Documentation/mm/shmfs.rst | 114 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 114 insertions(+)

So we definitely appreciate an effort to improve our documentation, but
I have to ask...where did all of this material come from?  Did you write
it yourself?

(Haven't had a chance to read it in depth yet).

Thanks,

jon

