Return-Path: <linux-doc+bounces-81242-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFkEKq47xGmMxgQAu9opvQ
	(envelope-from <linux-doc+bounces-81242-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 20:46:54 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D13732B75D
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 20:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C87133027040
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 19:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7963241325E;
	Wed, 25 Mar 2026 19:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ZPE3UUuC"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1965041C2FB;
	Wed, 25 Mar 2026 19:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774467994; cv=none; b=pxHzthyPVSyQocabvda4aYcjuz4BNkyakNTI9zsJcYpZUvDfMPiCNSHYm6yvKApja5YPVKbnTXMIiH8zWyLF/TyEP+NZoSHG1QNRUv0BkiWVNR5FcoMVE4Tv/+AuIfDxeSkDC+PNOBGBREpfh2km7QJxWX5raBa/reoRHzpfUDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774467994; c=relaxed/simple;
	bh=me69RyLXPFho3L2zifwuig9Y/wnZ5FYbacfOEGZYo/M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aoM8NfryfR5wIO9IV0qbtG7gTAKFaAX13VQwouSjNnw3th1b8+T5kRkiw7E8wRGj0ht9jPj/O0bIrtRcvn1gShXypyJj5RMzVAa24ObfBimfWHK2lY6Jkm5dLmgqazcm0u3rHyGrTmR/wt3js//18uyZGIhA7iXDNmO46jRYMU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ZPE3UUuC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 69C4840C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774467992; bh=QaYBr5fcHzzY/GG7iXPp/Ub5kSyz74NA0MwGgB0SfIg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZPE3UUuC8RA/6MC4gtTPalw5D5R5Y2oZytX5ThmCjC2//r4rh2rRXV6L5qrN4zKlf
	 GL89fJlFesRy6DSfOpNVYRnxQ0HW7gNS25R41DOzaNXxCEDyMH4efd/1wErI2VGXaa
	 GAReE3ray7ozTMe8bI0dFFHDlcfpMmbzNDtyEoVJqMKHQF4qVhnbbv1N6VCUHZYpL4
	 Egf0l0ccRMSR+RpDy8WISJoWHSeQFSijvBwnsHin72OxAHVJyK5YQ+3vzxAmeYJdcM
	 koGR3mRf9tzE2jBiLx0cDEE8MYPQZylfbMCWbMW4cR75rDMkmn35LoUBLsNuUxP+Nf
	 mdBqQ0SLVL8Jw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 69C4840C6F;
	Wed, 25 Mar 2026 19:46:32 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akiyoshi Kurita <weibu@redadmin.org>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, akiyks@gmail.com, weibu@redadmin.org
Subject: Re: [PATCH] docs: ja_JP: process: translate second half of
 'Describe your changes'
In-Reply-To: <20260309105015.309116-1-weibu@redadmin.org>
References: <20260309105015.309116-1-weibu@redadmin.org>
Date: Wed, 25 Mar 2026 13:46:31 -0600
Message-ID: <87v7ejelpk.fsf@trenco.lwn.net>
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
	TAGGED_FROM(0.00)[bounces-81242-lists,linux-doc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid,redadmin.org:email]
X-Rspamd-Queue-Id: 5D13732B75D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Akiyoshi Kurita <weibu@redadmin.org> writes:

> Translate the remaining part of the "Describe your changes" section in
> Documentation/translations/ja_JP/process/submitting-patches.rst.
>
> Follow review comments on wording and line wrapping, and cover guidance
> on self-contained patch descriptions, imperative mood, commit
> references, and Link:/Closes:/Fixes: tags.
>
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  .../ja_JP/process/submitting-patches.rst      | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)

Applied, thanks.

jon

