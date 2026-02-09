Return-Path: <linux-doc+bounces-75691-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBbgIWwzimkPIQAAu9opvQ
	(envelope-from <linux-doc+bounces-75691-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 09 Feb 2026 20:20:12 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D05D2114097
	for <lists+linux-doc@lfdr.de>; Mon, 09 Feb 2026 20:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 123533005767
	for <lists+linux-doc@lfdr.de>; Mon,  9 Feb 2026 19:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28EC43816F6;
	Mon,  9 Feb 2026 19:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="G0u8MAXp"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88322DCC08
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 19:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770664809; cv=none; b=Uj9TIOSAIJlFKkBJMLROx9dJXf5zxFVYfnfFdmthIef6vXYTlrtFUFUVpgw6MWD+F72/2PqC/kHJrptPg/mczcASuX5afSH6yiyeG8hcGUqaBiHOOlouH7Bvr8QeEWAXGiuJNUToz4b5nWrO2r2XKjYjldWEm4Y+bNVnE2xQTxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770664809; c=relaxed/simple;
	bh=Tw4eoyiANJFYTtvAxYt+OK4hp43UztStt+6GGu5LduQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cnsY7NFOkFsnX746rNu0y+YLD5+15FwbvZTeTYHm8tifC05Yk0ez8Fb+ubRU/s6anOajSMuA+Z6CrwiCkWXrzLPv4iRza8bxVWecT1kHO1nq/iDzHlAUOsg6brsz8k9/AI0eh00loEWWojlLx5PZ2ZORqTHP1e83zDOBW/dFiCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=G0u8MAXp; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 08FA040C3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770664808; bh=HU8neydPbB3+FO6S59YV7AGea2tVM6ilCI4vezBStFI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=G0u8MAXpxaYNqkiGtkxgIqoYOTYTlj3XyTDmWrvJDP4kRLPEn/RykUuWRoiHGqEM4
	 emWiRE3HlM4YsZw1AKYtiWdUxrSPr0bgS5FEKh/AR//40BxHO+yLw7GFwlVEDc1C30
	 uUhptfxBcn+UYkh2vWey/NBU0AntAaVNINlmc6Q31xDALIu8Je1klmIULkUpYpG6MD
	 ambRxroaRKPcnlC/y1g1v+7yH2AUWszH6AVsIl4bjEBCLAzz6pbi0nDn/1OfWHa++7
	 UKzgGJgQIJIR0kIYqaanWwJ2UsA7z8YXTsMNOXFDr3GIxX1nioAMfBZ6UhxafBx7qS
	 b/H966AG0wPrA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 08FA040C3E;
	Mon,  9 Feb 2026 19:20:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: translate process/changes.rst
In-Reply-To: <20260209184343.15191-1-danielmaraboo@gmail.com>
References: <20260209184343.15191-1-danielmaraboo@gmail.com>
Date: Mon, 09 Feb 2026 12:20:07 -0700
Message-ID: <87o6lx9120.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75691-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lwn.net:dkim]
X-Rspamd-Queue-Id: D05D2114097
X-Rspamd-Action: no action

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Translate the Documentation/process/changes.rst file into Portuguese.
> This document provides the list of minimum software requirements
> necessary to compile and run the Linux kernel.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
> Note: This patch depends on the previous work:
> "[PATCH v5] docs: pt_BR: Add initial Portuguese translation"
> if the pt_BR translation directory is not yet present in the tree.
>
> v3:
>  - Removed the ".. _changes:" label to avoid global namespace collisions.
>  - Updated reference in howto.rst to use :doc: syntax.

Received.

Please slow down a little; sending multiple versions minutes apart is
just a way to overwhelm reviewers and maintainers.

Thanks,

jon

