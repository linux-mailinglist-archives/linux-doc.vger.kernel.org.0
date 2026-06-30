Return-Path: <linux-doc+bounces-94240-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pDxGAs0fRGpWowoAu9opvQ
	(envelope-from <linux-doc+bounces-94240-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 21:58:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 885B26E7AD6
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 21:58:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b="k78PDh/Z";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94240-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94240-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F3CAA300824B
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 19:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDB43DDDC4;
	Tue, 30 Jun 2026 19:58:00 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6001F3C5832;
	Tue, 30 Jun 2026 19:57:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782849480; cv=none; b=kTREEaWr4Pw9XcBvoTbjav6cuSfhC1ZYyvG7S9x9/GtMrkJ5VLp8orTPQxgeyBIbR52bXMB+eRrOLqh4ULF+Wn+7pcUgJ5v/uktep2APWfeM9pVWsTaBYGn9zxzjlluvYm2o9qhJCP0BMyp2+LpK9dZjWIX1UbwW0QoomtyEIZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782849480; c=relaxed/simple;
	bh=7rv8FeQjkiSoY806ZjJZqCFwhSktFgEEADUnmuLBJ1g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VePKp8CGkOH7jRBoBMNNLanFK8Q5LBoqacsTyS4LH9Sps64+4iqhyS2Nfk9hrB4je12bCuGqSTShbsxNx3uj0G/fx/SKgmgg20qxO4KEJn9JWyNCnJeUcPurdG/LqW3hB5PgZ1zjnl25pzeKTeoWk+J36rp7QHaLTpoR4OM2+TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=k78PDh/Z; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9262040E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782849478; bh=v+bGW5ja90L0MgONlATGSBFz21k7wxiBqV4tjlYo6Ew=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=k78PDh/ZSfp+exbeoD95VsDseZP1ISUgfikl+xWRdvw5q9JqInoFEr9HsVbj0B1Ge
	 kWLY39tX6egFdgcBWEzi4eFcLXJc2wkfJqk2sMuQDEVWt3trNzFFXdhcM17I4TOlD/
	 FgdOGQ5IYQTYNDbCqNLKqwCv5zfmtgFl5RTuCzUOoGmb7kg0DKEN4yu5miA1/5NfJo
	 vU9UBGwqtHuHv+eG1KDzRm/rmx+F6k13Q27LHB7fAXUrEJz/pS/QdUpKTso3EphxAu
	 t2Z2c0W63Zo0CV/Emm5qeFQQ60NlC/rabk8RYD8A29gGn2WYT5hYqsF8hOuRMj1Tsd
	 lcDoP89WGJjVg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9262040E27;
	Tue, 30 Jun 2026 19:57:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Amanda =?utf-8?Q?Corr=C3=AAa?= <amandacorreasilvax@gmail.com>,
 danielmaraboo@gmail.com
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amanda =?utf-8?Q?Corr=C3=AAa?=
 <amandacorreasilvax@gmail.com>
Subject: Re: [PATCH] docs: pt_BR: update netdevsim section in
 maintainer-netdev.rst
In-Reply-To: <20260616005234.11036-1-amandacorreasilvax@gmail.com>
References: <20260616005234.11036-1-amandacorreasilvax@gmail.com>
Date: Tue, 30 Jun 2026 13:57:57 -0600
Message-ID: <87bjcrrebe.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94240-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:amandacorreasilvax@gmail.com,m:danielmaraboo@gmail.com,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,lwn.net:dkim,lwn.net:from_mime,trenco.lwn.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 885B26E7AD6

Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com> writes:

> Update the Brazilian Portuguese translation of maintainer-netdev.rst
> to align with the latest English version.
>
>     Key changes include:
>     - Updated the netdevsim section to reflect upstream changes
>     - Added guidance on netdevsim-based API testing
>     - Fixed minor spacing and formatting issues
>
> Signed-off-by: Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com>
> ---
>  .../pt_BR/process/maintainer-netdev.rst       | 23 +++++++++++++------
>  1 file changed, 16 insertions(+), 7 deletions(-)

Applied, thanks.

jon

