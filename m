Return-Path: <linux-doc+bounces-77725-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOutF80Zp2m+dgAAu9opvQ
	(envelope-from <linux-doc+bounces-77725-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 18:26:37 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B46461F49A9
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 18:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B26D93081050
	for <lists+linux-doc@lfdr.de>; Tue,  3 Mar 2026 17:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1988B35F60D;
	Tue,  3 Mar 2026 17:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="McCXGWUs"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1087C35F603
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772558686; cv=none; b=K08ZaxLcNFbjN7oYBLXyf4MTVNMMRTro8UdKWX0qE/LMIbWKGlOx/KhGYuI6/Zw8yacv4lLbaxtVH1gRSGWMsjxMvTSRu9ow9MimbljVeGViX+x5o4I+K0f38qgYCXBd2GqtoY2hFXubXnjwbPaDpfNk1t9Z5RpU+dHCMlZdT0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772558686; c=relaxed/simple;
	bh=RsTrgQyFiH3tt5HYLreC1CrQr8QWgQdBAAIhGSYOWY4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k1hroMgGm/7CWN3kSiWqF9HENQbTU3XShp75Ox+hG7jcnxEubz8sIUDn7JwE+Sg7Ppq3PR9ZydSE4UG0CRe06u9eR+JOw6okyQ2kYfwHbrKqQ4boQnGflkNahVIY2ta5GcqWn5zpemJQ5TOgcaX/qdKJhMOXL1fBlCp+ls37y4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=McCXGWUs; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5AE3840429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772558684; bh=y4QBrGk/np5sSYhZGUeMwuesE6tv3mdYPROINYMBgtE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=McCXGWUsDCriltJejQrD27oX+o4q20SajO/p7B8rA2L/JUROcM2+BZWE9hvlKI58g
	 tzNTBXivbUd/BWzLW6VQoYQo8qHVQ/Zta4sU/qsd/IKngjBWEVKndj7sdIlyfOJoB5
	 8iW1nGscRCori5N5BkJ6/naCDjty5102wUaHrzMK1vravGH/DT53u+tTL6j2tsjUDn
	 KvJAOfWHTE4CrkrUTH0ABJsLOEItP9z7aKo0sSvu92kR42jNYaVTuRglbpHPQAy4X1
	 SuDexxFVwulhRHOQsCJlFxaQUmMKWPf7m/h4D79pSskGNSOVCNV52cWJhcKxkozfOY
	 CwfT5QlZj434g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5AE3840429;
	Tue,  3 Mar 2026 17:24:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>,
 linux-doc@vger.kernel.org
Cc: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
Subject: Re: [PATCH] Documentation: process: backporting: fix missing subject
In-Reply-To: <20260226120129.18610-1-islamarifulshoikat@gmail.com>
References: <20260226120129.18610-1-islamarifulshoikat@gmail.com>
Date: Tue, 03 Mar 2026 10:24:43 -0700
Message-ID: <871pi0ddwk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: B46461F49A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-77725-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lwn.net:dkim]
X-Rspamd-Action: no action

Ariful Islam Shoikot <islamarifulshoikat@gmail.com> writes:

> Add the missing "it" in the sentence:
> "even though it could have been changed by other patches."
>
> This is a grammatical error in the Error handling section.
>
> Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
> ---
>  Documentation/process/backporting.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/process/backporting.rst b/Documentation/process/backporting.rst
> index c42779fbcd33..0de9eacd46a7 100644
> --- a/Documentation/process/backporting.rst
> +++ b/Documentation/process/backporting.rst
> @@ -432,7 +432,7 @@ The same goes for added ``return``, ``break``, and ``continue``
>  statements.
>  
>  Error handling is typically located at the bottom of the function, so it
> -may not be part of the conflict even though could have been changed by
> +may not be part of the conflict even though it could have been changed by
>  other patches.

Applied, thanks.

jon

