Return-Path: <linux-doc+bounces-90380-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMYVALDTHWq6fAkAu9opvQ
	(envelope-from <linux-doc+bounces-90380-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 20:47:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C196243B4
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 20:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0FBD9301D000
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jun 2026 18:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C40334DB74;
	Mon,  1 Jun 2026 18:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="gFU5DFuC"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAC43783C4
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 18:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780339600; cv=none; b=PqUoayZ+K4G1yZjiszQbVLKefEpncDmAcbgHKxoTdG5v+o3GzvX4ZxpxYnqKOHgyN12vOkmX5HL72TV0QFwukdHksGyhRzGFO7V8/6o265mFyt3BFML66QTj5huaFWsFZwQVQngf8IXWeidJdyi0yYjPTsDhby9guNh9uNMabuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780339600; c=relaxed/simple;
	bh=AEfG7VhDFRCpaZ45ycfOinyK/XHW/OT2mfiMK8jtbc4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=M3aKPrTT1r+0ZVJ7IJBYu8TR+z64so3IlYsi55yAyKNlL9kKre9k8SYAy9jFfKtwfANI8ppZpiaJ7AZJ8Gtj8WnCmaz606h/siEmt4atgcpWH0ClKHu/Oz8OzO+HEnWuNCirDZPZSCakk1zzt1TDKMfbZNArBHpvuWS1JfFMzwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=gFU5DFuC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A226840E50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1780339595; bh=JobLmw64lz8umYjg3LsmSKrJGw2We/nBf1/Yt5d3hR0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gFU5DFuCYmMQkssBllyOHEDeXMh/fDRjbR8yFXRAWmq5dTSiM5/tPiZ7GorpMELEF
	 3Us8XJ04dmH1PGMiIKXqHNRXR9Uq1ZG7fMNHBSGFBlYkFCZvPp/h/3ljk1edJ3Qcpq
	 hPo0gB92Nv+kx5eHaB3gZtFa/NosNgJgcFdSUnpCJO1xcfZDrpj1EWHyMxGMgh6QW1
	 EizNfF41fTB9BcCw9wQZe9wPSLxGvS9J+G8D+uz4bavM6IOBXqd6/6nMOCeHNjlK2G
	 tEmHrnrKntCEmmZGE/idcaJXKfmoqbDpUxLry+PZYKF0apsfveSoCaA4dl3POnQWVh
	 pnkm52+T7EGMw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A226840E50;
	Mon,  1 Jun 2026 18:46:35 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Amanda =?utf-8?Q?Corr=C3=AAa?= <amandacorreasilvax@gmail.com>, Daniel
 Pereira
 <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Amanda =?utf-8?Q?Corr=C3=AAa?=
 <amandacorreasilvax@gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: update maintainer-handbooks
In-Reply-To: <20260528041958.57231-1-amandacorreasilvax@gmail.com>
References: <20260528041958.57231-1-amandacorreasilvax@gmail.com>
Date: Mon, 01 Jun 2026 12:46:34 -0600
Message-ID: <87jysi9jzp.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90380-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: 58C196243B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com> writes:

> Update the content of the maintainer-handbooks documentation
> to Brazilian Portuguese.
>
> v2: Update maintainer-handbooks documentation based on the actual latest =
version of the English
> documentation. Prior version was based on an older version of the English=
 documentation, which caused
> some inconsistencies between the two versions.
> This update ensures that the Brazilian Portuguese documentation is in syn=
c with the latest English
> version, providing accurate and up-to-date information.
>
> Signed-off-by: Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com>
> ---
>  .../pt_BR/process/maintainer-handbooks.rst    | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)

I have applied this, thanks.

For future reference:

- It is good to say what changed in a new version of the patch, but
  please put that information after the "---" line so that the
  maintainer does not have to edit it out.

- New versions of a patch should be posted standalone, rather than as a
  response to a previous version.

Thanks for working to improve our documentation!

jn

