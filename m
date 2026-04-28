Return-Path: <linux-doc+bounces-84964-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNihIsCu8GkfXQEAu9opvQ
	(envelope-from <linux-doc+bounces-84964-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 14:57:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E75FA485684
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 14:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D6F73038797
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 12:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C323343DA2C;
	Tue, 28 Apr 2026 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="SCuPAtLy"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B148E43C04C;
	Tue, 28 Apr 2026 12:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380559; cv=none; b=WXS8jn4rD5SH8Tt1xWuGLnZbzr22TVGXhp9GIG2TsYmyBXdHnhQDp//UBtf9WFYKL83I/4toomLbxeh5QZMiaCrZ7yY56a5nK5R6x6lih0yZE4miadnDOB3DsvqtTFDcjl0OjNOBHsxPWOXnRSUBujte89UL9aEr4YqueBLaFhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380559; c=relaxed/simple;
	bh=esFms435sKlkmTEVmm83GmsYyuEDoHCFscGxQMUg9Mo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dY5J5EHZvOHg+KlcuiJ7xghVQxfXuSqT4a6sHK6HsjvMDrdR5OhewH2653/8hY1TkkSn7ysbxhTgUkZSqwmAJP4W/sS9hneQ/T5swerfVHc0r8ZbwSbVYFX10+iX7IahkvggRm+OQBw9WwiPf25082n2Ptdkx1jZ5oL4q1TWEaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=SCuPAtLy; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A668841098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777380548; bh=esFms435sKlkmTEVmm83GmsYyuEDoHCFscGxQMUg9Mo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SCuPAtLyWtakiKJj1N8Mme8yndnsWdtlXa3oPb+X8ojXup5KEtMGEWVIwzqk4qYoG
	 ntfTH3PRTyr8N7WS+oiiMGQyymw4Pf+SRI3z81pibKfm+oUaAAD5tSTaNKK47M9dck
	 TcTrBAVg7AUzIOCHd5wTJuKkMrlnyNuhZaKVMbAJSe4SCi4KtEAEuwjlr3hHDpaHKs
	 6h5D2e1l0d5mo6gL0wE9H4U7hjgEWniic/iVKAsrY4+bg1u7d4BKA7Vskc4cDL58jr
	 GWk4uit70/iaDGkB89fqrZocUB5+pKnAfz6fCQ3MGnu88ke7yzRh6jfyLAPZs9463H
	 etRTelECfqdTg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A668841098;
	Tue, 28 Apr 2026 12:49:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Myro <mirademche@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Myro <myro@myromyro.com>
Subject: Re: [PATCH] docs: proc: fix minor grammar and formatting issues
In-Reply-To: <20260428122653.3550-1-myro@myromyro.com>
References: <20260428122653.3550-1-myro@myromyro.com>
Date: Tue, 28 Apr 2026 06:49:04 -0600
Message-ID: <875x5bmerj.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: E75FA485684
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84964-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:dkim,myromyro.com:email,trenco.lwn.net:mid]

Myro <mirademche@gmail.com> writes:

> Fix missing "from" in "prevent <pid> being reused" and
> add spacing in vm_area_struct range notation for readability.
>
> No functional changes.
>
> Signed-off-by: Myro <myro@myromyro.com>

Is that your full name; that's what's required for the signoff.

Thanks,

jon

