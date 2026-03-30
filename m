Return-Path: <linux-doc+bounces-81772-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP30OfKbymmg+QUAu9opvQ
	(envelope-from <linux-doc+bounces-81772-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 17:51:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5050835E2C0
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 17:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02E903045C21
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 15:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869F736A014;
	Mon, 30 Mar 2026 15:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="L5Q8fnEj"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B19344DAB;
	Mon, 30 Mar 2026 15:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774885215; cv=none; b=kA0/We9+q9IviKH+0fTMupoEy+HfDnnLlAMda7PUzU+/stL3kJL1Vxtwv4EK2OPem/Nez813l1Oi8w2OPCuL4qDXEOfjNWRM6kxYB5AZOTQJvCeOb1Etu+bq8OP6aBvAX+6aSVHqgyjRVX1+4lDUxw/aHO8UHr8uWAUbxIek8Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774885215; c=relaxed/simple;
	bh=bdsgzQtV41Zs+VPpdv60be1H9wzXuIDkfzZYg5/0H9U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sPX0Fa2Rf365LErjgcV4mzF8xo8VMgEqifMs6x2/GTb0+PjYsB3x5ssX1HZiB6E9jDxyWQBE+ude4bMl/RNQZEvfdEfp1nuhBOuB23M7Yoxqn7QdVpnYvSzKXc8aASMT81QBIxJYrq2xcrVeJAFP18n6qRJwkNDhDXq3KooGShU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=L5Q8fnEj; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DF7CC411C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774885207; bh=sUy2YmTM17zVDMYrxPXXQ25jeIeeRTgVwXb4rNLD1Bo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=L5Q8fnEjrgCC1EpHUTuMo18B0VjqQcuFv8KSBfa+JVCHx13cU8UFRGaFFxnDwTL0S
	 6LqrdzMfEu9a3VHhD8o+7Wa/2u2rKrVtUI9yzt9oqygReXgjT62eqfGlC7NSrBygeH
	 1SkFRsvoG1x9056cPN2JHcp1d9yTWoZMfV7QXe/ki12WjZtMs3d3C+TNBu7dQlDJuz
	 Up3zO7cJDu0MFqI7IuIMHq9Lz/Kt9PkkcK/zFTaqj0xK8OlEW+8J6W1CDhTTO+P87D
	 cWTP+a2DBmpLUsIvncHvqRONtxT5N47ZnCRue9jMKS3Fzrxzk1HmfBM56zroFDR8Ym
	 MYPnwVBZURpbQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DF7CC411C2;
	Mon, 30 Mar 2026 15:40:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rito Rhymes
 <rito@ritovision.com>
Subject: Re: [PATCH] docs: add copy buttons for code blocks
In-Reply-To: <20260329214816.10553-1-rito@ritovision.com>
References: <20260329214816.10553-1-rito@ritovision.com>
Date: Mon, 30 Mar 2026 09:40:05 -0600
Message-ID: <874ilxpbqi.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81772-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: 5050835E2C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rito Rhymes <rito@ritovision.com> writes:

> Add a copy button to highlighted code blocks in the documentation
> that copies the full contents of the code block to the clipboard.
>
> This is faster and less error-prone than manually selecting and
> copying code from the page, especially for longer examples where
> part of the block can be accidentally missed.
>
> Keep the control hidden until the user interacts with the block so
> it stays out of the way during normal reading. Reveal it on hover,
> focus, and touch interaction, then copy the block contents to the
> clipboard with a small success or failure state.
>
> Signed-off-by: Rito Rhymes <rito@ritovision.com>
> Assisted-by: Codex:GPT-5.4
> Assisted-by: Claude Opus 4.6
> ---
> Live demo:
> https://kernel-docs-cp.ritovision.com/accounting/delay-accounting.html

Honestly, I don't think so.

Rito, who is asking for this feature?  What is the use case?  Does it
really justify adding a blob of JavaScript code to every view of the
kernel documentation - JavaScript that we will have to maintain going
forward?

Our goal here is to make the kernel documentation better, not to shovel
lots of code into the repository.

If you can get some acks from established kernel developers saying that
they want this change, I will reconsider - but only after the merge
window.  But I really think that, again, this is something you might
want to discuss with the Sphinx developers, then turn it into something
without hard-coded colors that will work with whatever theme people
might choose to build their docs with.

jon

