Return-Path: <linux-doc+bounces-82370-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOr2Kmzhz2kS1gYAu9opvQ
	(envelope-from <linux-doc+bounces-82370-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Apr 2026 17:49:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 20544395F34
	for <lists+linux-doc@lfdr.de>; Fri, 03 Apr 2026 17:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16CA6300E256
	for <lists+linux-doc@lfdr.de>; Fri,  3 Apr 2026 15:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0AD3C73CC;
	Fri,  3 Apr 2026 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OV9CkXO8"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0DF3BC680;
	Fri,  3 Apr 2026 15:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775231337; cv=none; b=tP35TsmBbKlBbP6z38j38hciPZ/5L7L9BrwDW/DNTVt0rL3L/pF2KWl2dO+bF4dwHPApHZMqSvo+0L3G1Wzl0i5StPFgP1IQp8qbfHcUrDjJaHitbhwl1Nry5zXwN5eq7lXhO1s4Bl3V07tSRTRGT3Pb2vhWFyuC5Z+zyJK+BMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775231337; c=relaxed/simple;
	bh=N8TMgXnvpbtnCOxudV0bO85sTcr2ZAfzb0BA4MpXD8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4HqrpHDKBXXxyKveJ8n5no0StvxucqRaF+jliBYqFR7HROphGxoWakWtBjGmlV47XAp+qGpVx5pyonrTc5hEg2YrHmbY/0AbTITLfe7HQpCl6qBz76diBpp9xgbP8tsgxBA3cRMf5XuJEfZny6brcWCL3VRG9wylceQQI1in44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OV9CkXO8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F852C4CEF7;
	Fri,  3 Apr 2026 15:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775231336;
	bh=N8TMgXnvpbtnCOxudV0bO85sTcr2ZAfzb0BA4MpXD8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OV9CkXO8BhoU67JWYgc52McyYb4iJNGjdEcX2CrYgGbUCwdLhzQ7GZQwKcz7/5eGZ
	 MV56BF/Max+WTy6ee7DBc5nNzNiZbjiSDMIDcA2+2v6VwvIjoaWZwnyMmZhZFTrNrr
	 scGvsZMcrJONe9VdhqijEMtT5R9UR0vfIZbs30qL986b1NLBbRe8LEr48JkxV0hQ4h
	 gFgR/2PmXiR76bvEoTBA1luYWwXa0I0bDbMomIX/E9tlLel4bfwaHoabesK+agbgv9
	 +iAhti2485eB00SBWgavLBU8WOeygm3P0yUPutvYl3ZRsIi7OWUEAE95Vm8fMZ0Ix2
	 hb6z9U2IeFZdw==
Date: Fri, 3 Apr 2026 08:48:56 -0700
From: Kees Cook <kees@kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: greg@kroah.com, edumazet@google.com, rdunlap@infradead.org,
	Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Documentation: explain how to find maintainers
 addresses for security reports
Message-ID: <202604030845.9DBD539AB@keescook>
References: <20260403062018.31080-1-w@1wt.eu>
 <20260403062018.31080-3-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403062018.31080-3-w@1wt.eu>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-82370-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 20544395F34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 08:20:17AM +0200, Willy Tarreau wrote:
> [...]
> +One difficulty for most first-time reporters is to figure the right list of
> +recipients to send a report to.  In the Linux kernel, all official maintainers
> +are trusted, so the consequences of accidentally including the wrong maintainer
> +are essentially a bit more noise for that person, i.e. nothing dramatic.  As

Yeah, this is the central point: we already trust maintainers; there is
nothing "special" about security@kernel.org.

> [...]
> +single line suitable for use in the To: field of a mailer like this::
> +
> +  $ ./scripts/get_maintainer.pl --no-tree --no-l --no-r --no-n --m \
> +    --no-git-fallback --no-substatus --no-rolestats --no-multiline \
> +    --pattern-depth 1 drivers/example.c
> +  dev1@example.com, dev2@example.org

To echo Greg, yeah, this is great, and has been an implicit action we've
done for years, so there's every reason to delegate it to the reporter
to avoid the round-trip.

Though I guess we'll see if these new instructions actually change
anything -- we still have people asking for CVE assignments. :P

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

