Return-Path: <linux-doc+bounces-96325-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HKzDHjdIUWpOBwMAu9opvQ
	(envelope-from <linux-doc+bounces-96325-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 21:29:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD7673DC70
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 21:29:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=MV48Qayo;
	dmarc=pass (policy=none) header.from=lwn.net;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96325-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-96325-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A19A3006136
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 19:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90EB2E5429;
	Fri, 10 Jul 2026 19:29:55 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB98037B409
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 19:29:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711795; cv=none; b=nG513dEz2CvEVJ4Yvtvv2NDWpvvR/KZU5V1WZt4NaCs2llPkHoU70ejkRcjjXCl9KF77UBoOro9nNGHLk/g/CuQZkM63aZb83DjMEf9kWXoxTQ4/KHHtemLmMusiCZsTcvuKpY5lhC+PMKuZcXhAuX9nM3gOpvXprJOSWdlop9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711795; c=relaxed/simple;
	bh=F6IBQkRlrw/FRdW6ziPGDfQ1pthyORdpojJmIpV2H8s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mGU7h8YQkbFOe4B69BIKYn3kGb8V52tZLD7RoWsrkcYonpjkq9YMfHkaG+Pb65UIoX7ozu3XjikffKAiWqqWmNxVS/5imw6JCtnVxHZXmBIS1aaIZrEDApSjkEizOw9vGzZjxnGMNwo5TpqKyWzq+08ZWZ4o2IkybsLHAT6/oYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=MV48Qayo; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 12B7D4108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783711794; bh=KOUsuVdwJIdsYPK8LUtVCEGiQM2rfwb8Ct4A2YbiJCc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MV48QayoHX9VRI3KqhHiav4TJMfG6+SE7qPBQ5cjvF8RFLUHyN4rDBBI8+Rg9tkHV
	 k/NH9+IqjFtZ0QOGteN6X2J0jwgDy0/d6nxHHIqgIUcetdQcRWjHYr9juwVD9Oq6hH
	 vqrojTMhoWuXm/NZEIEahmniIg65Ec1PCxwk4C5Fihgl4PDDfjoGlcMPDY2KoY3PZ9
	 j2RfCHVy4M/JR8Co+RBduNJG275+AcXM3Y65puf/oGps7BHd20TO3sFT8pqtql6v3o
	 UrxI5LhqL+6Dxt6OMntJv6uwKCjJrXscKeJNROOGf7T1zH9Ft7liTWj1UpBNBd/OAH
	 rEYqzRB8eKVbQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 12B7D4108A;
	Fri, 10 Jul 2026 19:29:54 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH v2 0/7] docs: pt_BR: process: translation updates and
 additions
In-Reply-To: <20260703170552.174764-1-danielmaraboo@gmail.com>
References: <20260703170552.174764-1-danielmaraboo@gmail.com>
Date: Fri, 10 Jul 2026 13:29:53 -0600
Message-ID: <874ii6lk26.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96325-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:danielmaraboo@gmail.com,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[trenco.lwn.net:mid,lwn.net:from_mime,lwn.net:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DD7673DC70

Daniel Pereira <danielmaraboo@gmail.com> writes:

> This patch series updates the Brazilian Portuguese (pt_BR) translation
> for the core Linux kernel development process documentation.
>
> The goal is to expand accessibility for Portuguese-speaking developers,
> bringing over crucial guides ranging from subsystem-specific rules to
> organizational maturity frameworks.
>
> All documents have been strictly formatted to adhere to the 80-column
> line length limit to ensure proper Sphinx HTML rendering and consistency
> with the existing pt_BR infrastructure.
>
> Changes in v2:
> - Patch 7: Added adding-syscalls.rst to the index.rst toctree to resolve a Sphinx 
>   build warning.

Series applied, thanks.

jon

