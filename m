Return-Path: <linux-doc+bounces-85555-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YL0oBQRe92ljggIAu9opvQ
	(envelope-from <linux-doc+bounces-85555-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 16:39:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 603404B61A0
	for <lists+linux-doc@lfdr.de>; Sun, 03 May 2026 16:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7947B3008A7E
	for <lists+linux-doc@lfdr.de>; Sun,  3 May 2026 14:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EBB245020;
	Sun,  3 May 2026 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="HLsafCB3"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E791531C8;
	Sun,  3 May 2026 14:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777819136; cv=none; b=gdk228kv3EmJxs9BKQLaNAzP4MsZgPDZknC2/B8snFBvTFiKTpROHJ8tPyxmUK3W7K6ukdfmr3I+uiqG1S/7pI59PqbFlyoLwWu9AwzQVFXG7Sjw1FH+E+GqD3JzukIQwNzXxKJz7DiwDvplc9iO4eEt5Ao89iRZMbtfprrFQVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777819136; c=relaxed/simple;
	bh=74mImMZC9zl3+OZ5N9gSA+bGIATh++m6MWZ3mqN3TjU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O/Ux6u/MryiuNyuLXDX2+GKZgA6ZY2kJXkRDOt3v2eE1vhCzTdr7uVA379+LMzqxwa7KbWwE9498IPMpT5phUmrYBp2B6Rn1pVSB4/Xr8VwzH5Ur1bNHCPK/Fo38/Bmka5DI9Ipaaii8WVRsOtYUEnAs5K8uZaC56XeqZjgE32M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=HLsafCB3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 84BCB41084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777819134; bh=swj/uN+/Q8j8cwSABxHosmppR/kvpnKH4OT5u2tsqxU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HLsafCB3UZTBjNHcNFLpbCYRR3ePadhpmall9G57wee6xb+kDEHTTaGkNGPwfezcz
	 mVVUbgCS/ccR/Yy8H562deUNWYoZquGPfzTFDnYeqsPDMRnPclA7NzaiuzShAzqcCp
	 b06iW/JQ1aAbdLD2NXp+CVdPR1KhMvx3Gp8CxUk6nCnMiN9yhnDk902FYmdoHUIEYS
	 GpJWjtumtixJUicJRP16URPxrEMsBcpC8zMVQiZ3HgScTcATNILBKCjsjGZv7ukSRg
	 bJqPicgho462qlCg9bwTvhTZqmxs3vSjmlZ5fF+vJwPucO+6iEXN9LgD2d6G0rTrAq
	 HMJAeEzWdziYw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 84BCB41084;
	Sun,  3 May 2026 14:38:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akiyoshi Kurita <weibu@redadmin.org>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, akiyks@gmail.com, Akiyoshi Kurita
 <weibu@redadmin.org>
Subject: Re: [PATCH v4] docs/ja_JP: translate more of submitting-patches.rst
In-Reply-To: <20260502070143.1015416-1-weibu@redadmin.org>
References: <20260502070143.1015416-1-weibu@redadmin.org>
Date: Sun, 03 May 2026 08:38:49 -0600
Message-ID: <875x54eex2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 603404B61A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,redadmin.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85555-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[trenco.lwn.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lwn.net:dkim,redadmin.org:email]

Akiyoshi Kurita <weibu@redadmin.org> writes:

> Translate the "Separate your changes", "Style-check your changes",
> and "Select the recipients for your patch" sections in
> Documentation/translations/ja_JP/process/submitting-patches.rst.
>
> Keep the wording close to the English text and wrap lines to match
> the style used in the surrounding Japanese translation.
>
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> v4:
> - Rebase onto docs-next
>
>  .../ja_JP/process/submitting-patches.rst      | 127 +++++++++++++++++-
>  1 file changed, 120 insertions(+), 7 deletions(-)

Applied, thanks.

jon

