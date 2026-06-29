Return-Path: <linux-doc+bounces-94003-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AwfmA3V7Qmod8QkAu9opvQ
	(envelope-from <linux-doc+bounces-94003-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 16:04:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0876DBB65
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 16:04:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=XeVkzgxW;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94003-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94003-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE1E932689CD
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 13:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B09D2222C5;
	Mon, 29 Jun 2026 13:42:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF5C222565;
	Mon, 29 Jun 2026 13:42:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740537; cv=none; b=Go5mpSuwJPff1DRUezU3pWEEYyjP4DzqZZ39zXLRfqlnHBEwyBrL3qS2F0ns9a4HerdKNUCTmcxCqw8JPAWBzarVNDrvYH1rwt26PUjmdOlZoDrSLzpJTpGMbrN5OPWpXI2PGcW9ZDXNowj9yDkKD7wC0I0unj5m2ho2sEpikpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740537; c=relaxed/simple;
	bh=mmtf0A7xzBvicHiaR8k96ma20BoqByKAARUwYePhH8M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l6/kfZa0SplP6EnV50V0LILuxPdnQAt/GItZHNcnlVt3ZQ2T2TrlxVjYQxNRtApVi1zrQZzquzEZPU8F6J23nBxE48t4luAmEXoksH5JL4vA59fzTJi2IGwi4qRLhRSR23WIiFVF3VHuh+O+ua11w/nOdv3qA1czko7A9ly+qks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=XeVkzgxW; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B305840E59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782740528; bh=9UDS1rBClB2zraXdgOpykIMV5rwaSbg+XI7SiZ1Ajtk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XeVkzgxW0tNo0IDORLSuyWoeetBly8YWq0OSdcSsBZ/cH9oEuW3tl1Cz0++MASDq9
	 z+h7cy7LjEuuxKOMcyd7Xxy7/2n4tJQPmvmXl2AdOvPPYplPvxfHEpJ+ak+m0UTeBk
	 J8FVt39RBjDQrR2Jkv5ByUS1glWZnnMmZQlIyuVFmk1CKXd51G7zNX2uNTNfCKftgc
	 +z1sSqFoPYJF8yDedntl2fccaQ2tcdQY+pxS3d2MEQOdBpfIquhP1Qdnjumo30Psrt
	 l7u3dMPaW2InoiUjYC5gYNhu6h1USP8G4UcF7ql0UUxhuwHz2JZkAVt+Ev0hRRkZNz
	 6U2MYITxNtHFQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B305840E59;
	Mon, 29 Jun 2026 13:42:08 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, rdunlap@infradead.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux@roeck-us.net,
 manuelebner@mailbox.org, skhan@linuxfoundation.org, wim@linux-watchdog.org
Subject: Re: [PATCH] docs: watchdog: Fix brackets
In-Reply-To: <14d8a272b4d57b9e316a1351b38867417a2a6603.camel@mailbox.org>
References: <14d8a272b4d57b9e316a1351b38867417a2a6603.camel@mailbox.org>
Date: Mon, 29 Jun 2026 07:42:07 -0600
Message-ID: <87pl19xy34.fsf@trenco.lwn.net>
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
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94003-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:rdunlap@infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:linux@roeck-us.net,m:skhan@linuxfoundation.org,m:wim@linux-watchdog.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mailbox.org:email,lwn.net:dkim,lwn.net:from_mime,vger.kernel.org:from_smtp,trenco.lwn.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F0876DBB65

Manuel Ebner <manuelebner@mailbox.org> writes:

> Hi,
>
> is this patch on it's way?

On its way where?

You posted it two days ago, during the merge window.  Surely you do not
expect action on it that quickly?

jon

