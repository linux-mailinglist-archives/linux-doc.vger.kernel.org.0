Return-Path: <linux-doc+bounces-76638-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPDiFNPAnGmgKAQAu9opvQ
	(envelope-from <linux-doc+bounces-76638-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 22:04:19 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 888FB17D578
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 22:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10D30307870F
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 21:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8993534AB1F;
	Mon, 23 Feb 2026 21:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="La+XCWba"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0A5218EB1
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 21:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771880656; cv=none; b=mwfIkmb174lJu76mpQjmnTfIw9ald3guZxFBQsE45bU/P0bVULir77mhleQApcFxOwN63hMYcvFlIsFiyiDkCMZdRj0EWlpHYyRrf5/NE+urWy/XGI88MSleXrSFu3FI3FjMJzM0j7g/Z2UBnylTDvcUkYZXQwzW/i2w2pruA7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771880656; c=relaxed/simple;
	bh=6YBH8OE9DRsruLPs6f99FMDuJzAdDl+C2WoSRtLNg4s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LQkWfQh7kgiJJyEJdIvlu1Ao6LJacaQaUrVPpFuTOBiAUlO+QsuhnJfSGbDIWU9rJD0zOWyt5pXFQL2A+Xu3kFalhbQk5zrbH48h5+D0wIZkOllRfMGMLjadgUth5hAR3VxNNwJIusfkUjKlEuOABHlUnR/EejC8uNXvdM8CHJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=La+XCWba; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6FD2740423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771880654; bh=Fs2I54uGA/zDgP3cN4yypdYPyVLzQdOZXD6BNpokcHA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=La+XCWbaK0K2Alh/SsiuiyuaGsWfEUwlX+sVtazT1j5FiC3uiN+4OQlbk7QODSOME
	 xkS46AbrnIIZaM395GwrTgsGrxhTcNjpq3Kl6pfSoc+HmjsZ+olwftKNMsGPBI5D7w
	 xX35y/qipOlQD7TnD759BbBruJvjWEx8wF92RK9AbHZ902x0P5KnFHq3ScW8W9Pgni
	 G619p878gkHSyooGbAZjfiiwB3hfFPBhVdEp2t9PbBEGMEQr71Te1b/WZJ0jw94Rr6
	 +VQ7Rqs1uR+m3EvOsX6qa3yPtej3ybx4qEjGxAf2SPHdLOTZ3d3C11F6zuk2xnMUPj
	 Szlo9zD3QcfHg==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6FD2740423;
	Mon, 23 Feb 2026 21:04:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH v5] docs: pt_BR: Add initial Portuguese translation
In-Reply-To: <20260204113210.185221-1-danielmaraboo@gmail.com>
References: <20260204113210.185221-1-danielmaraboo@gmail.com>
Date: Mon, 23 Feb 2026 14:04:13 -0700
Message-ID: <87a4wz5fzm.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-76638-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lwn.net:dkim]
X-Rspamd-Queue-Id: 888FB17D578
X-Rspamd-Action: no action

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Introduce the initial Portuguese (Brazilian) translation
> for the Linux kernel documentation (HOWTO document). It establishes
> the directory structure for the pt_BR locale and adds the official
> entry for the pt_BR maintainer in the MAINTAINERS file.
>
> Additionally, this version adds pt_BR support to the documentation
> build script (Documentation/sphinx/translations.py) to ensure proper
> rendering and fixes the documentation hierarchy to avoid orphan file
> warnings.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>

The merge window has passed, the floodgates are opened, and I have
applied this as the first 7.1-destined docs patch.  All looks good,
thanks for your patience; I'm sorry that the timing worked out so
poorly.

jon

