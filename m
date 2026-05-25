Return-Path: <linux-doc+bounces-89403-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFoiCC6xFGrRPQcAu9opvQ
	(envelope-from <linux-doc+bounces-89403-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 22:29:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF055CE606
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 22:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D3E53005A96
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 20:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35EB43955E8;
	Mon, 25 May 2026 20:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Hr9L6ztk"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA1D3955F4;
	Mon, 25 May 2026 20:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740971; cv=none; b=baSIt7mTvfoD7FyMleUI46NwwnFVCtBXTlf4emmwnF35+YjGwZdp//GmJeqB8xmxCIF/39vzZWxVHer9GB3MnpPzH5U6uiJrdAC1UKOE3ug8eI9EgJgf3KXS5dPfUjnPunlaLJkD1KT+sbOzu6hqkyJ3C8LKIwxkWM/o/VrMAos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740971; c=relaxed/simple;
	bh=YAKVAi8jgfHNtJFNpwfMBz7XDBOUNtPbXJW/AxxbZdo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gwZLcSD6tU10ckwtfOGz0bqHBDdPfdrCLs+efKOPBF02pf02ahl0vt+xdWTJRNn0GzIFO/aJCmyVNJA1QjPHE8kTdNJ/lL/TjwvywKsbL9SXr2MH318UTkZO0aPwStAverqQLwKtqcSEDX6kaDnp3T+BBUYwYaXVgolFQ+Lt444=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Hr9L6ztk; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D6D8140E36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779740969; bh=KAh7PuOmI94XOwvaSI3CeIU3E0pZZQ+04OPeNBf3Cy0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Hr9L6ztkgpXdStaMM0LnCdlomGKskqo2Bh5kEJioBYhIIlcBsKhIXDwZF/1Vjs0ZN
	 pscvut3JiGCvtqUV/Wf0fpTddMY1tq0FqekP3zJTGas9L6HKf8RTd4HrbwWpZ9TBIz
	 1HoPzjrZUdhsOV5+4OLoxpQIp3J2tzdTnhapNgmkvp6lo9ehNsNHbT4BIQuwfv1Aj1
	 UQNmUXJJ9lLI90WciaOD7n0dG5j7l7JgAoPWfrq4ZlCLdIJ4GT3xu3lFEEZn042kpv
	 BnvNTRFjdJD/4+O9G7Gke9bUakVb14akf3k2bJA9mJ7HdH/NSSSZiQAzg4lUtHIx50
	 xO5iNDzHk45Fg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D6D8140E36;
	Mon, 25 May 2026 20:29:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akiyoshi Kurita <weibu@redadmin.org>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, akiyks@gmail.com, Akiyoshi Kurita
 <weibu@redadmin.org>
Subject: Re: [PATCH v2] docs/ja_JP: translate more of submitting-patches.rst
 (no-mime)
In-Reply-To: <20260513131111.432772-1-weibu@redadmin.org>
References: <20260513131111.432772-1-weibu@redadmin.org>
Date: Mon, 25 May 2026 14:29:28 -0600
Message-ID: <87mrxnz107.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,redadmin.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89403-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,trenco.lwn.net:mid,lwn.net:dkim,redadmin.org:email]
X-Rspamd-Queue-Id: BCF055CE606
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Akiyoshi Kurita <weibu@redadmin.org> writes:

> Translate the "No MIME, no links, no compression, no attachments.
> Just plain text" and "Respond to review comments" sections in
> Documentation/translations/ja_JP/process/submitting-patches.rst.
>
> Keep the wording close to the English text and wrap lines to match
> the style used in the surrounding Japanese translation.
>
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> v2:
> - Make the subject unique.
> - Reword the no-MIME section title.
> - Refer to the untranslated "The canonical patch format" section by name with a TODO.
>
>  .../ja_JP/process/submitting-patches.rst      | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)

Applied, thanks.

jon

