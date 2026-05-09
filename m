Return-Path: <linux-doc+bounces-86630-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IapFluj/2nz8gAAu9opvQ
	(envelope-from <linux-doc+bounces-86630-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 23:12:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4974350170C
	for <lists+linux-doc@lfdr.de>; Sat, 09 May 2026 23:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C1A33001A6E
	for <lists+linux-doc@lfdr.de>; Sat,  9 May 2026 21:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B4238757B;
	Sat,  9 May 2026 21:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Mjt5OQkl"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EA234CFD0;
	Sat,  9 May 2026 21:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778361173; cv=none; b=KBIbpgDFFFUsmt8lb8Mq++p1k8lKAV+8xETLUkCn9JEXesCIQj9r+pF53qiznBqP6Ij6o0C97z0oFQdyamMGFlbO4xDc+3bB8LbN/eHvH8S6e2dQrBtgp6GxfYdFwmvrIfZbmEOPYSaNtC/GqZInHdG4c8kNE/7b5Y7Hnvtr3IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778361173; c=relaxed/simple;
	bh=uBUThkzPq3bIh8exkMvvIMZ3xi0qvfWeGRDf4xCY3bA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Qz5NRseyG+dm9jXcSjsbU3PrJAV8900mTDI+oEYfD44ImMYVoEZr6RGcoGrxzjk4hfOK1cxyepTrnHRaUFH8OKshdwEKZ9wzQL45W05cNjYXQiw/ReQDkRCHQRQGstFVAiVZH60vcI4tZw1G6g2UyBp1QrAj0JII0eK6Z2r36jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Mjt5OQkl; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3DF4041084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778361166; bh=YBtbi7A9YrkmaUhKGVC2kX+uo3qrOmV8imEJ0JVJ4g4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Mjt5OQklw/q0tOxGnFv39kDSqfDkjS6mig9GI1AWkdAPa4cvTRNrNmfpymjESUFi6
	 H/5FakCtFplnTQnl9nZRo/fnegO8vkIXQvGFIZm2hHkOPBIHdefRa3KJ4X+KSry3p0
	 8dZISKSFgyrQYN/1LKrpJRLd7dka+/NZCfofGK1GocxfGMQTNvP92mAU6eWMM37PaK
	 wHbR3WasqikofHbBUvC+f9BEkcUp3ZE5H0hzMpvzxk4qnLfaNcYFlnYQCX2XR46ys8
	 5zJT8dwRorNdXw6bqCfO4cVxjbEkC8tbwufzeeduIu6LLSPsH2YJM0iOI7YEbkIEgh
	 y7top2NlvevUw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3DF4041084;
	Sat,  9 May 2026 21:12:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Adrien Reynard <reynard.adrien.08@gmail.com>, paulmck@kernel.org,
 gregkh@linuxfoundation.org, dhowells@redhat.com, mhiramat@kernel.org
Cc: frederic@kernel.org, neeraj.upadhyay@kernel.org, joelagnelf@nvidia.com,
 josh@joshtriplett.org, boqun@kernel.org, urezki@gmail.com,
 rostedt@goodmis.org, skhan@linuxfoundation.org, rafael@kernel.org,
 dakr@kernel.org, pc@manguebit.org, rcu@vger.kernel.org,
 linux-doc@vger.kernel.org, driver-core@lists.linux.dev,
 netfs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, Adrien
 Reynard <reynard.adrien.08@gmail.com>
Subject: Re: [PATCH v2 2/4] docs: fix repeated word 'that' across documentation
In-Reply-To: <20260509143050.16458-1-reynard.adrien.08@gmail.com>
References: <20260508163759.16231-1-reynard.adrien.08@gmail.com>
 <20260509143050.16458-1-reynard.adrien.08@gmail.com>
Date: Sat, 09 May 2026 15:12:45 -0600
Message-ID: <87wlxcz3qq.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 4974350170C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-86630-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,linuxfoundation.org,manguebit.org,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org,redhat.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Adrien Reynard <reynard.adrien.08@gmail.com> writes:

> Remove duplicated word 'that' found in RCU/rcu.rst,
> driver-api/driver-model/overview.rst,
> filesystems/netfs_library.rst, trace/histogram-design.rst
> and trace/histogram.rst.
>
> Signed-off-by: Adrien Reynard <reynard.adrien.08@gmail.com>
> ---
>  Documentation/RCU/rcu.rst                          | 2 +-
>  Documentation/driver-api/driver-model/overview.rst | 2 +-
>  Documentation/filesystems/netfs_library.rst        | 2 +-
>  Documentation/trace/histogram-design.rst           | 2 +-
>  Documentation/trace/histogram.rst                  | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)

When you send an updated version of a patch, please:

- Post it as its own thread, rather than as a response to a previous
  version

- Include a note after the "---" line explaining the changes from the
  previous version.

Thanks,

jon

