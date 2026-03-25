Return-Path: <linux-doc+bounces-81232-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qP5wJGo3xGnkxQQAu9opvQ
	(envelope-from <linux-doc+bounces-81232-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 20:28:42 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 345FB32B409
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 20:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7633D3014FC4
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 19:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36AB8358364;
	Wed, 25 Mar 2026 19:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LEq1ZQ16"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136E93563EB;
	Wed, 25 Mar 2026 19:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466908; cv=none; b=VAV26XoKFKk9zC8w5xVyOM4YHkW1sAnlilZynGaOEmtKV+FW0lL7dUFBaUFRhlEpOaRitoDmNtJo6Cxzfxh4c/mDhiFtVR9zIDRO+FpRq5kik2yITrvtmHJUhbMBr58w8XB66yj06Ox8rwet7bA+wfIyG1kvyyCmSAmtLQdIoc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466908; c=relaxed/simple;
	bh=PzomcxIefy5eLh3Iy5AxyZ9qV6grwjsW2Hwl0wlx42g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rAjgu1lSXRvmmUlNZKmcTW+4thlwMc6etN4/ReMcE8mHUc7XoHhPDSecdfIro/VBl5IRaTukwOAKqrouMUecUnxGdPFLFHkdWVNNXKvOY2i8sXDVvyMD+8AJ8GivIdPWbdmKUZ7jdYseDuRTZtshTSp8ZK+ZF8IbPz/5adaglzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=LEq1ZQ16; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 598F840C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774466906; bh=xjA1oGVajNdXmFwuxKxYDw0YbuuPfDT5I/CYEO55Fv8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LEq1ZQ16LlvCOEDR6OTCnCv+K+TVYOnC+o8n8NlCtF6vOGf0a+JggbgvF5IbUzFUb
	 Q3/YygWoxdr2dBD49afu5JoAXgnZe1dAbki06fy7sPu5eZBRJdkBP/zrn1nGOzp83L
	 88y6q8IcAhXjWjzyQ54KlSeLJultSuAFTiI33mpbYKq94PWuXycMDuq/xSi0UhNLH+
	 ild/gcf1Vcvah7eVegOYbYGC19+0rLrfGgFbH6As5gEqZiBRcP7dzwXvrwN1KrXy4Z
	 v+tVU10thkRDe8bw/i9Jwt2gsIa4z6B5ToVQOMmmjYL+HyV/4ViIsWhTwVwZ1pXnRz
	 sNq/zs1Pv+P8g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 598F840C6F;
	Wed, 25 Mar 2026 19:28:26 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Rito Rhymes <rito@ritovision.com>
Subject: Re: [PATCH v2] docs: rework footer with semantic markup and
 responsive layout
In-Reply-To: <20260322182251.49484-1-rito@ritovision.com>
References: <20260321131857.14166-1-rito@ritovision.com>
 <20260322182251.49484-1-rito@ritovision.com>
Date: Wed, 25 Mar 2026 13:28:25 -0600
Message-ID: <877bqzg146.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81232-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 345FB32B409
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rito Rhymes <rito@ritovision.com> writes:

> The current Alabaster footer uses a generic `div` container, is
> hidden entirely at the theme's small-screen breakpoint, and does
> not provide a responsive layout for narrower viewports.
>
> Rework the Alabaster footer to use semantic markup while
> preserving its existing content, including the copyright notice,
> theme attribution, and Page source link. Structure it with a
> responsive flexbox so those items remain visible and orderly on
> smaller screens.
>
> Scope the change to Alabaster so other supported themes remain
> unaffected.
>
> Signed-off-by: Rito Rhymes <rito@ritovision.com>
> Assisted-by: Codex:GPT-5.4
> ---
> v2: add Assisted-by attribution
>
>  Documentation/conf.py                      |  6 ++++
>  Documentation/sphinx-static/custom.css     | 25 ++++++++++++++++
>  Documentation/sphinx/templates/layout.html | 33 ++++++++++++++++++++++
>  3 files changed, 64 insertions(+)
>  create mode 100644 Documentation/sphinx/templates/layout.html

So the footer disappears because there is an explicit display:none in
the Alabaster CSS.  That is indeed a bit weird, I wonder why they would
do that.  That said, why not just override the CSS rather than adding
all of this complexity?

Thanks,

jon

