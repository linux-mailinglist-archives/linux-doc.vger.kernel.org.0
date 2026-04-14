Return-Path: <linux-doc+bounces-83355-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIMRBiE53mkxpgkAu9opvQ
	(envelope-from <linux-doc+bounces-83355-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2026 14:54:57 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0823FA319
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2026 14:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 939B7303076D
	for <lists+linux-doc@lfdr.de>; Tue, 14 Apr 2026 12:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499813D649C;
	Tue, 14 Apr 2026 12:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="nE0nCPIF"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECEA20DE3
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 12:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776171264; cv=none; b=nnxkjUadX+If3BXSS1dXuOAr6TWZ6jnwkdI99GJci5fz4Cr6i6dgoTCjzrYtk/xXeK1L3nyis8llAt+UsFkvrhs6C97rfHJEjXkc7zgvBBmjvr3HzCacHS4n4jaiCHPg3UumRqILfGz/rzwyVVg5drgFfU5YAIVN3mKne5xqeyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776171264; c=relaxed/simple;
	bh=jwmALpdJodUctFkNcSf4hMNOoLibb1eVU7jXG0Q3gr4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IxuPy58delvoWWspwPh90SR4xiAq+9AKT7DQumgoljOxO4puGevT/dALXVdHymXspQXBJlcjckFzWMG454VVOa/fMtvxNobGhm99M6Y2hpXfYLJVuI2npzY8Ft92SEPsdCaauhF2zyUXcc2A8ktUz6eniF09YuUrBbE9NETpclQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=nE0nCPIF; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 16D6240C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1776171256; bh=EntzKUcc9CnIfW/1mfvHH2tkciPHseR0z70RRtZrfUA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nE0nCPIF6uKsWo3AAaep8TaEZHVKFhXHMIgGgiLOqtOE6T/iQt9CWpG7+wJnk7iqq
	 YZzc3+VwyRVfJ6nIfIryB+ugu1aliBOSvQJGzQWdZNKC6Y9f/wNNttuXkwELo4Tnjb
	 hHvV78qRgDtJ48mrlf51V6t1ZOlB4VL5S5Ro2Q1yuDv7cO1gSkC18Ak4GKbCH38tZ1
	 9DuIUbYCF6xnkOSnH/nVXrqZWLwNx4eqM1nt4IifPJaXdf8iuBMYhyNC53YoAsBXcK
	 DWlQa3YW3jytXIKtjd4ZYQ3HRVAI5zLooTiBg2y+sUs2LrMHX8LQs7NCyfbBgjkJHS
	 DtNup+FbzQclQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 16D6240C6F;
	Tue, 14 Apr 2026 12:54:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: fru1tworld <fruitworld.planet@gmail.com>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org, fru1tworld
 <fruitworld.planet@gmail.com>
Subject: Re: [PATCH] docs: fix typos in kernel documentation
In-Reply-To: <20260414084553.22762-1-fruitworld.planet@gmail.com>
References: <20260414084553.22762-1-fruitworld.planet@gmail.com>
Date: Tue, 14 Apr 2026 06:54:15 -0600
Message-ID: <87o6jlvh1k.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83355-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.963];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: 1D0823FA319
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for working to improve our documentation.

fru1tworld <fruitworld.planet@gmail.com> writes:

> reinitalizes => reinitializes
> unpriviledged => unprivileged
> the the => the (duplicated word)
> sub-struture => sub-structure

These changes generally look OK, but...

> Signed-off-by: fru1tworld <fruitworld.planet@gmail.com>

We need a proper signoff with your real name, please.

> ---
>  Documentation/block/data-integrity.rst           | 2 +-
>  Documentation/core-api/list.rst                  | 2 +-
>  Documentation/core-api/real-time/differences.rst | 2 +-

This one has already been fixed; it's always best to prepare your
patches against docs-next or linux-next.

>  Documentation/gpu/drm-uapi.rst                   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Thanks,

jon

