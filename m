Return-Path: <linux-doc+bounces-81785-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOoWD+arymkx/AUAu9opvQ
	(envelope-from <linux-doc+bounces-81785-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 18:59:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 895D335F22A
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 18:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18DA830177AB
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 16:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C90387591;
	Mon, 30 Mar 2026 16:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="QIljCes7"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9B037417D;
	Mon, 30 Mar 2026 16:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889901; cv=none; b=unrnyBxse7N26lZBuiJ7Q2lEiXX9LHhrZP52bSzkGvfe6WjCxRZahuLpyTTbysfdDGFCeE9hIu3HSltopqugV2St7o7OX4H67bjVtempLL9BSaOCxNTzIJA0J2+KFGC0UILfqCCpeyFHNf6KNKJE5tGxiN8Zm2yvbWjqOOVL7gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889901; c=relaxed/simple;
	bh=YNyVExhvXvOIumcQd28g8Kb7NclDlHOifW6Kn52f6C8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FRcYXvW0f/kIR/424+vXoARBgTh8hUQLjoEeG4L2bLgacemVMOJvQv6LEqX6z6PNxHMRBnZGNJDSzRMaMl4m50fiUn6SPZr68ytL8rqwUvCRrtqtO8V07aEV2MChD9evFEYVEBwK0lKKFxaSlZJTOQzkXGJdxqADF0i0Gw8IDoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=QIljCes7; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8ADCF411C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774889899; bh=CpGubG4zNuFlQ67QHp4c4dkGq9/gVSV2aPeAQDaEMsQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QIljCes7BUce+rmT6RmmSzTwdR82ma+FvxI2ucrk9F4UTkwitTVtVFsC0w77iaUP3
	 v8cZ4tHVqS30jf8kinrh0zgzsgjnKMY4ud79Reb9zGx3d8BVWPfP0FAUYeQQtW56Ht
	 5fusq3RI0f6HHVdYydogdFzAX+CpBax2HWu3XITnPedmwBdrbLRCsNHqW/UKwpLvGg
	 taAy40Y3HsJCQqjntTkg297kuZ5g0VPZ5MVsOlgVil/BtfI3KBKz3SFIFtQOE8nN6r
	 sV86CYeqCcWpTSo2L/w/qsmdLd5TCpbNZ0V23Q2Ywr1MzVGQdCDtjDX3fPdbhGuyRN
	 oWSLakkkgHTsA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8ADCF411C2;
	Mon, 30 Mar 2026 16:58:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, Akiyoshi Kurita <weibu@redadmin.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs/ja_JP: submitting-patches: Amend "Describe your
 changes"
In-Reply-To: <20260326114637.144601-1-akiyks@gmail.com>
References: <20260326114637.144601-1-akiyks@gmail.com>
Date: Mon, 30 Mar 2026 10:58:18 -0600
Message-ID: <87tstxmez9.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-81785-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,redadmin.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 895D335F22A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Akira Yokosawa <akiyks@gmail.com> writes:

> To make the translation of "Describe your changes" (into
> "=E5=A4=89=E6=9B=B4=E5=86=85=E5=AE=B9=E3=82=92=E8=A8=98=E8=BF=B0=E3=81=99=
=E3=82=8B") easier to follow, do some rewording and
> rephrasing, as well as fixing a couple of mistranslations.
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> .../ja_JP/process/submitting-patches.rst      | 107 +++++++++---------
>  1 file changed, 53 insertions(+), 54 deletions(-)

Applied, thanks.

jon

