Return-Path: <linux-doc+bounces-89404-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPDTJ3+xFGrRPQcAu9opvQ
	(envelope-from <linux-doc+bounces-89404-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 22:30:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA6E5CE6FB
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 22:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F2B7300E014
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 20:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005C439A04B;
	Mon, 25 May 2026 20:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="A4DMzf+D"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFE833F8BE
	for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 20:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741024; cv=none; b=cxhjX/5yfHGZ49RF8Aav9tCBiu/RIl/CPjgnAFynvw+yWRKQZlmBtB0SeBj5WYT+G6Vju+jwT/yXdTfWa6tRWAVahHGynjC2CWpHHK327lRMnSOzw53nCmTuUYnmssxCxuzNECNDD89DfWJ9jTausvpnlNgeO245GlPl2Y//8Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741024; c=relaxed/simple;
	bh=v4j9bY/kMiAtO2nDdNwx+6gBc1BAFW7j6HFZ+YEgTr0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KOe3r+d6c/35c2Gwu1eIV49kn8KtDFMW/lfpxnw4Bg+Rki66aZIm71ENEZC7HuiESs8vtPg0HArd4iWBwJAiGfxQuB4rk7rcl/80nLSs94VK5Y6C3UaK4iijk6i22H812q/S4F1kkBAcMJK0u/t76eNJxZVwmO4zRjLstKl39b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=A4DMzf+D; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0EA7640E36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779741023; bh=RI22rL46qxxVBJF6GrglodTaqHnl/WjRmCsdJfrWeCA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=A4DMzf+DiHzv72dIwdZ5lAtAZsC4Sqg5UoNnIwzmn4hCRYV2MIYo4syR6QQqqz2dX
	 EELlgFjA9GUBSatBTAWKrXyUJQHf39woJ2KUdpITIgOPoQOP1L5bbBohaWMNcWUjN3
	 Azsx+j0bMQVNsMgmcZe4o34g1vjaoWnTV1qb4PfnCsjxicR1ljymKNK5JnNjsXlADf
	 GqKYFtV0K0cPZA6Y3GJPaAsaE0UZgvYM2chL5hIY0tbB1gS+xFwbls0SWyChxvifPf
	 YmkLh9iyUbkTxgYI9wiL3de8UkUamcrJaEphTvJmb2SqnLy5m1o8K5NeTUQH21v2x5
	 fYVun51jc0Dig==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0EA7640E36;
	Mon, 25 May 2026 20:30:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: update minimal software requirements in
 changes.rst
In-Reply-To: <20260515182200.654324-1-danielmaraboo@gmail.com>
References: <20260515182200.654324-1-danielmaraboo@gmail.com>
Date: Mon, 25 May 2026 14:30:22 -0600
Message-ID: <87ik8bz0yp.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89404-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[trenco.lwn.net:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,lwn.net:dkim]
X-Rspamd-Queue-Id: 4DA6E5CE6FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Update the Brazilian Portuguese translation of changes.rst to align with
> the latest English version.
>
> Key changes include:
> - Updated minimum versions for Rust (1.85.0), bindgen (0.71.1), and
>   pahole (1.22).
> - Fixed ReST syntax for internal references (:ref:) and external links.
> - Corrected formatting for tool names and config options using inline
>   code backticks.
> - Synchronized technical descriptions for udev, kmod, and NFS-utils.
>
> v2:
> - Fix alignment in the minimal software requirements table that broke the build.
> - Fix Sphinx footnote syntax.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>  .../translations/pt_BR/process/changes.rst    | 56 +++++++++----------
>  1 file changed, 28 insertions(+), 28 deletions(-)

Applied, thanks.

jon

