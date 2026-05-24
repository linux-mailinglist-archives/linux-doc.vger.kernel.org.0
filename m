Return-Path: <linux-doc+bounces-89269-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDk+IU+AE2rqCQcAu9opvQ
	(envelope-from <linux-doc+bounces-89269-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 00:48:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D646C5C4AD4
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 00:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B817630028A0
	for <lists+linux-doc@lfdr.de>; Sun, 24 May 2026 22:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1EE31F9BD;
	Sun, 24 May 2026 22:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LZ8bqUP3"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801152F531B
	for <linux-doc@vger.kernel.org>; Sun, 24 May 2026 22:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779662922; cv=none; b=ffEnjLoBlglOpfiYIKKL8ypTjzfwIukkPypSIfM4lSaf/d6kxrHE5Cthtd3Nri+RgG/JW15VpYANUjIl2xbfMzG34K2nZ3iYii6HDXLafRUBPgMgqNH/Nl9UJ5b05GHLStiqAuhZVip5J3szgRa5iSNHARXL7nfDCqwoQDdirUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779662922; c=relaxed/simple;
	bh=8Dywp8qieHnOll/eyXaZorlygUaejtk0PcmrJribK/U=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gEybu76gqZBCcBz6QWYyhPN+x9niImOsKIy8luZojRDe1xhyoA3itvhvPO3uv0r29Wi8yxoTa1qQQQ6e+HxZPaBtF/qtBf+qVyDwfd7+s8A/J639x52ozcfU364unXg1IN8ogYIhzrM4ISuy32HrYtsCdMA941ims6TijgBS4xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=LZ8bqUP3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7F07740B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779662915; bh=/MDquMr5QEzzkeO7gsAwcecZe+y5ZD9+kJH2naCzgHE=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=LZ8bqUP38wjXtbWFF1PCoh9L1nlJSFj2f1WRTf+TS4YfVI5Fa/PaYRiPzI7qTaaLv
	 /Qa4svc3Z9nak6Li0SvaQxDTaCQlAgLAkfEt1hascd/ZgIWyD23qTzqlLGLR96Wvcw
	 u+RXVhnzG1DU3ZI5ldJoscCiZG5g2qST5Pjatp/2m6d+MJzaOly2awiqSelG0WlVyl
	 wGqByUHKCq6xjuLhZTvH73KtVCbGjwyjVJSLA5Tldy30ghiY4OuVbqoR7F0iHzpErI
	 CLyKRKW0KkIxGLZbTmdh1XMurKVjcjefLKtTdIHBNpV+zwZjDFifcGtmGjjIh+aPus
	 seh/rShbbTMwQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7F07740B0C;
	Sun, 24 May 2026 22:48:35 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: pt_BR: Translate process/kernel-docs.rst into
 Portuguese
In-Reply-To: <CAMAsx6fBZTSvtNcWKKQvWTXZAvh9W3GuA5ZES0RdY6gLwH8n0A@mail.gmail.com>
References: <20260519163434.1045462-1-danielmaraboo@gmail.com>
 <CAMAsx6fBZTSvtNcWKKQvWTXZAvh9W3GuA5ZES0RdY6gLwH8n0A@mail.gmail.com>
Date: Sun, 24 May 2026 16:48:34 -0600
Message-ID: <8733zg2zlp.fsf@trenco.lwn.net>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-89269-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D646C5C4AD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Daniel Pereira <danielmaraboo@gmail.com> writes:

> I=E2=80=99m just checking in to see if you had a chance to look at my pat=
ch,
> "docs: pt_BR: Translate process/kernel-docs.rst into Portuguese",
> which I sent on May 19.
> 1

Five days is a bit quick to be sending pings.  You must have seen by now
that I always get there in the end :)

jon

