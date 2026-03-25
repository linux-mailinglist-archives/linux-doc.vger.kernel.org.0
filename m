Return-Path: <linux-doc+bounces-81240-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCJyOFc7xGnkxQQAu9opvQ
	(envelope-from <linux-doc+bounces-81240-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 20:45:27 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 605FA32B722
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 20:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63F0530844C5
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 19:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340333FF882;
	Wed, 25 Mar 2026 19:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Xo1LD9H7"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A403FBEDC
	for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 19:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774467818; cv=none; b=QaZgP5TsusNIx34kuS4eoGy199/ZkLSxEgnmDZpTI4aUD3+56eYLJ/CBfd5TGX8XDzqtmRHKFsTN0ZM+Gm2YjZ7RKXw+80c25NGSU1ZYj7/GtWaKj0nUNHjfzYLPHv+TrCKONXhptyX7sD8SYAZ+XLSWd822L72fQQlpl0IsfMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774467818; c=relaxed/simple;
	bh=0FWytUlLZxdzmLAbn1u/KjJV7TjY5YNyggrdPd7IdfU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ho/RNsf+I/3IjV7tzSfhb1jwesFIM+BRv7+tRnygIoqqN12YpKcaW9vutPBqjFeTEC+GDXMlh2ZpLKdlXXU5Vj4I+fhOnyKR/ZBwmS3ZCUysTux6bdVATW7XvDLFMTbxRZRtxmgw5HpLfs1Q21JUAOkyIaDmHVLnGTQJZ0jaXi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Xo1LD9H7; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B599040C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774467815; bh=cn4JGNeZ6LqlNDfX6HXtV/V4yCbYO9MKnjlV4YW6BjM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Xo1LD9H78fsLrn0YDY1K45xBvFBjJOwdaisitqpxhYKErLt6YKpFQFgbJbwZ7nrSt
	 4CDDnSs3rYo9y4VaiYYehiBg8qPBy6SyUkJnhRI7MPiNi430xgSxoWRadBtpKli3nJ
	 biKfKIuMQXSKFIKTkmClIKpvLsWyw+IixQKoW4lbdS4QWTsnaomOVqwOIebAXehT6R
	 ndKcueNYTITmMIh9XG0BqVzLcSej5uirNw2A3d0pBa8vWPEGfQzscGyC+4/u+26GMh
	 2ItlzZGJqx4jku+sZ0zi+cSDc7okjFc/ZhJBtYS4hDNH95ZW/dO3sjc0Jpo9EjFeVc
	 z6nAku8eGnmeg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B599040C6F;
	Wed, 25 Mar 2026 19:43:35 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH 0/2] docs: pt_BR: Add translations for KVM x86 and Conclave
In-Reply-To: <20260323171133.88074-1-danielmaraboo@gmail.com>
References: <20260323171133.88074-1-danielmaraboo@gmail.com>
Date: Wed, 25 Mar 2026 13:43:34 -0600
Message-ID: <87y0jfeluh.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81240-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[trenco.lwn.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:dkim,checkpatch.pl:url]
X-Rspamd-Queue-Id: 605FA32B722
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Daniel Pereira <danielmaraboo@gmail.com> writes:

> This series adds Portuguese (pt_BR) translations for two documents in 
> the process and subsystem-specific documentation.
>
> The first patch translates the KVM x86 maintainer guidelines, and the 
> second one adds the translation for the conclave documentation, which 
> covers project continuity.
>
> Both files were validated with sphinx-build and checkpatch.pl.
>
> Daniel Pereira (2):
>   docs: pt_BR: Add translation for process/conclave.rst
>   docs: pt_BR: Add translation for KVM x86 maintainer guide
>
> Documentation/translations/pt_BR/index.rst             | 2 +
> Documentation/translations/pt_BR/process/conclave.rst  | (linhas)
> Documentation/translations/pt_BR/process/maintainer-kvm-x86.rst | (linhas)

I've applied the set, thanks.

jon

