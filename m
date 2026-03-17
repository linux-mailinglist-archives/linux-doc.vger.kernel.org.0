Return-Path: <linux-doc+bounces-79767-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EjQBJduuWm8EgIAu9opvQ
	(envelope-from <linux-doc+bounces-79767-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 16:09:11 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8067E2ACB40
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 16:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B55A8306A80C
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 14:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04173E95B0;
	Tue, 17 Mar 2026 14:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="htY/6Iaa"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F523E95AD
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759345; cv=none; b=HnBhR66/DSt1l5jNUx9B7nuOsZdMeXJyHcsh6nx7gHNSI8gFrFHGTl9TLoQbUi0CJZCliQp5qULXKJy82Xof4f7fUCr4iwuN+JxVSCzUIXiBE6UfbVc9MkGeCmpZzOwwki4Jjd5AFk7fDxw5r+3DD+IUtFtr6SBvPMsU9yOVjoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759345; c=relaxed/simple;
	bh=dT3w6w+uqIXrhFVZ0qMtiuph97vhxEsAZrig8VkGsLI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UyF/mFvVnjAde3EJL0SOvfkwT2/aVL1Ui1+LA7KwXZyLatYX6S1j+0n9aMz6uG80tKf0y/N2Tnz0joLQg7M2f0LJ87wfq9/t42iIz1mOyv2cz9ziobxBw+P9zuPBRnV/TwOCJuMsEvfa/pCUHVXdZTdVzMKfyiG+9OrzYDFDZY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=htY/6Iaa; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 58382411CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773759343; bh=wBhph5h9c0Sbh77fkQoKj3CFmonwUrbf0XXKvUBWzNM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=htY/6Iaaup9oOkCRdKncq3L6ZgLEJocBpCrR8cAzW2o01VPvisPAwvF34j4kpVHHv
	 ZM2l1tzJ4Gn2eqnFvY4cwrWUN3bkpD1d/wVL34A2cxtfE+8suq8oOoHUVtYnXZiCbO
	 3DrJT8/wM4o/RIwz4xgbNktPPQhez41dQBFWLq43KjkR1ypWQMGNdCSDVi5TL4HzuN
	 d/0PgiaJBoUb4SMw1OZ8raMtwTZXkZcf4jwuTkLVA9srRtds7TKkqGsoKbMy9Qk6bp
	 oV/T5U8XcOlpa47eXVczBz3efd25P750JOqE41bC5gc7jb++uBEm7bVXLBDJD74LYD
	 BsCt3lzYu5hSw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 58382411CF;
	Tue, 17 Mar 2026 14:55:43 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH docs-next v3] docs: pt_BR: add netdev and maintainer
 handbook translations
In-Reply-To: <20260312122425.19577-1-danielmaraboo@gmail.com>
References: <20260312122425.19577-1-danielmaraboo@gmail.com>
Date: Tue, 17 Mar 2026 08:55:42 -0600
Message-ID: <87o6kmcxox.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79767-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[trenco.lwn.net:mid,lwn.net:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8067E2ACB40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Add the Brazilian Portuguese translation for the netdev subsystem
> process and update the maintainer handbook to include it.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
> v3:
> - Added maintainer-netdev.rst translation.
> - Updated maintainer-handbooks.rst to include the netdev link.
> - Fixed Sphinx indentation (3 spaces) in maintainer-handbooks.rst.
> - Ensured final newline in all files as requested by Jonathan Corbet.
>
> v2:
> - Fixed "Title level inconsistent" error in maintainer-netdev.rst.
> - Cleaned up formatting to pass checkpatch.pl.
>
> v1:
> - Initial submission

For future reference, including lore links for the previous submissions
can be helpful for reviewers and maintainers.

> ---
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../pt_BR/process/maintainer-handbooks.rst    |  11 +-
>  .../pt_BR/process/maintainer-netdev.rst       | 596 ++++++++++++++++++
>  3 files changed, 607 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/pt_BR/process/maintainer-netdev.rst

Applied, thanks.

jon

