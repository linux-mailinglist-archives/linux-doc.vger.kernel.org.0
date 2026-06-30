Return-Path: <linux-doc+bounces-94241-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XdFSLBUgRGpsowoAu9opvQ
	(envelope-from <linux-doc+bounces-94241-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 21:59:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2006E7AF9
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 21:59:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=JjMrdQKn;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94241-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94241-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC5D83006453
	for <lists+linux-doc@lfdr.de>; Tue, 30 Jun 2026 19:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B3433EB10;
	Tue, 30 Jun 2026 19:59:14 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689633DBD53;
	Tue, 30 Jun 2026 19:59:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782849554; cv=none; b=N9nVTuPNbEMwpSocT/UUmjk+OtaoglShgeUvou5bXoL6sDoN+FBVC8esxyHp3H2DVTFXZR1Bl3mLrwrODg3p1Am2DHWl6PrpG6K/Bqvgb9TaHlrjVFU5eDXc81RPYd3BxLv8SoYMO/k8lrYkLbu+iJWtbJ3IZkBpcZdBWBi5luY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782849554; c=relaxed/simple;
	bh=ujTY/dOS0R33Y3kklLCXUgKsj+SnQTbD2638nQVRoxk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BhwcXX7w++Xgjaj64vRkFwn/KZsaKy3SKDVBvMENlDJ3OKDCHn7HIzfvSuIS24VOAx2sLcvJlgEzPSTnObzfNiEoacDeni6o7ugoGTMB2lSNIGtJT0Wc5ywmPF8SENts2kHf/bSR3awHbcCjeH+JxNk/5zJ6Us55wlGAX132NuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=JjMrdQKn; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A504C40E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782849552; bh=DIAuhwtA41AkfazriW3++q7S9yDekaSqKiyko/NSMBY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JjMrdQKn5dQcbeYaIboEDZieXDglKqerDrSEZi0sVFEuFoHoic6sidOq9WFUHHFib
	 IBA+LxnDE+7h70H81WPWrQ1SmtoXaw2Wd0pXPu7uxZD6JwRLnpq15k0+iNFDqGen/a
	 Xglx3f1DYkKOsPOz/hj5H9jReZjJvnKb593ShS3V1ic2ULIvb54NFPu9VGC/Ksm5IO
	 MOV+4GECthVV1tZarHOdEevOe0ZdRK1Z8rNtHx5A+sSPS1CHtk1nBaqLqCUkbty21W
	 8d4wCtTRlk40wsZDkTeVRNrTkPEDoj41VXSaO1fVJKLUK1n46RND4JZRG6TAfXur6z
	 E3Z843vf+HVUw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A504C40E27;
	Tue, 30 Jun 2026 19:59:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Amanda =?utf-8?Q?Corr=C3=AAa?= <amandacorreasilvax@gmail.com>, Daniel
 Pereira
 <danielmaraboo@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amanda =?utf-8?Q?Corr=C3=AAa?=
 <amandacorreasilvax@gmail.com>
Subject: Re: [PATCH] docs: pt_BR: update minimal software requirement for
 pahole in changes.rst
In-Reply-To: <20260614234320.8199-1-amandacorreasilvax@gmail.com>
References: <20260614234320.8199-1-amandacorreasilvax@gmail.com>
Date: Tue, 30 Jun 2026 13:59:11 -0600
Message-ID: <877bnfre9c.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94241-lists,linux-doc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,lwn.net:dkim,lwn.net:from_mime,trenco.lwn.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F2006E7AF9

Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com> writes:

> Update the Brazilian Portuguese translation of changes.rst to align with
> the latest English version.
>
>     Key changes include:
>     - Updated minimum version for pahole (1.26)
>     - Added note about kfuncs annotated with KF_IMPLICIT_ARGS
>     requiring pahole v1.26 or later
>     - Changed "optional" to "opcional" in the software requirements
>     table
>
> Signed-off-by: Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com>
> ---
>  .../translations/pt_BR/process/changes.rst        | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

This patch doesn't apply.  There have been others fixing up the
changes.rst files; please have another look and see if there are things
still in need of attention.

Thanks,

jon

