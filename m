Return-Path: <linux-doc+bounces-78485-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILLoHO7yrmnZKgIAu9opvQ
	(envelope-from <linux-doc+bounces-78485-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 09 Mar 2026 17:18:54 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D68223C98E
	for <lists+linux-doc@lfdr.de>; Mon, 09 Mar 2026 17:18:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 203E23008C1A
	for <lists+linux-doc@lfdr.de>; Mon,  9 Mar 2026 16:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBDF38BF8A;
	Mon,  9 Mar 2026 16:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="UwegcjZZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781502BE02A;
	Mon,  9 Mar 2026 16:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773073131; cv=none; b=TurPH8bi+WMoKzinWB0cVzd+B1Ebh75nxHQsLJ6f6HLwSc8ZrNaXLbbIXHYqCTlM5Lo/FHJNxVNAE22xSbe2gE7uCkRgUFjfkB8fxwPCRsCzn63RK6Qv4Cw5mWHhcFvhLck3EP8THwljrx38cT5I3vLMLm5RCvlT5PQCg4Jh9c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773073131; c=relaxed/simple;
	bh=OkbIuS8lEwKcMbdZtfRAPvLwW2pAih8/HvXRbMbCjv8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n5zrcKoIf5GVxlOhSzjseV/53lUjRMMq+ES8veY9wABQtnPWfchOTOsv76iXR9HIvu8O9g8XG8eNbjrF1kH89cRn1qRMWCkxSM97r9cM0M1db06c2gAzFjuTfXOvpqgeuGKu6aHYtAtzmnSj36eXayZQEZIOM0FTZezFb8qj4zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=UwegcjZZ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CB2A840429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773073129; bh=BTjmvAKZfUGYEgR5deKdJDqtgEVOD/sg4uLrkBEWPnA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UwegcjZZhMciA4vP1tsUYrMCD6Vco72KlzFBxJGkcjdKPaMIQRJj2B0OczZin/Nqa
	 Qyfwrq/3ArfMWo+kTXMOwIVPn8K6hPTL4dQIb3sfmfOUVx+eQLW3fd07TaccO3ZVrs
	 t93Xo++pf5EejWYOKpDZxMzucw/81Oh4jWxEu+FA4+Ba72jOR/BTjJ5dcc/uFG2Jvr
	 CRjMVsm5XdMoJKi8iYZNeLbUpKSRKiAvqLuBRhxj/rcnOxTACoX7+ISsJtfSNTfakN
	 LNwnYsQb2OkT7jYiSrnZlLjeb3NTEqGh2+gxKRjFB6qRPgO7SeanCxFJIb48okpVwO
	 SQTAfbGvzbHJQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CB2A840429;
	Mon,  9 Mar 2026 16:18:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Tang <danielzgtg.opensource@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Fox Chen
 <foxhlchen@gmail.com>
Cc: NeilBrown <neilb@suse.de>, vegard.nossum@oracle.com,
 viro@zeniv.linux.org.uk, rdunlap@infradead.org, grandmaster@al2klimov.de
Subject: Re: [PATCH v2] docs: path-lookup: fix unrenamed WALK_GET
In-Reply-To: <5332975.31r3eYUQgx@daniel-desktop3>
References: <13098721.O9o76ZdvQC@daniel-desktop3>
 <5332975.31r3eYUQgx@daniel-desktop3>
Date: Mon, 09 Mar 2026 10:18:48 -0600
Message-ID: <87ecltvuvr.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 1D68223C98E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-78485-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Action: no action

Daniel Tang <danielzgtg.opensource@gmail.com> writes:

> Fixes: de9414adafe4 ("docs: path-lookup: update WALK_GET, WALK_PUT desc")
> Signed-off-by: Daniel Tang <danielzgtg.opensource@gmail.com>
> ---
>  Documentation/filesystems/path-lookup.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/filesystems/path-lookup.rst b/Documentation/filesystems/path-lookup.rst
> index 9ced1135608e..6957c70f18db 100644
> --- a/Documentation/filesystems/path-lookup.rst
> +++ b/Documentation/filesystems/path-lookup.rst
> @@ -1364,7 +1364,7 @@ it sets ``LOOKUP_AUTOMOUNT``, as does "``quotactl()``" and the handling of
>  symlinks.  Some system calls set or clear it implicitly, while
>  others have API flags such as ``AT_SYMLINK_FOLLOW`` and
>  ``UMOUNT_NOFOLLOW`` to control it.  Its effect is similar to
> -``WALK_GET`` that we already met, but it is used in a different way.
> +``WALK_TRAILING`` that we already met, but it is used in a different way.

I'm sorry, but this change really needs a changelog text.  The reader
can make a guess as to what is going on, but why make them guess?

Thanks,

jon

