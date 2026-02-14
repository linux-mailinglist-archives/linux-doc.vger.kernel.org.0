Return-Path: <linux-doc+bounces-76026-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKaLCVivkGnacAEAu9opvQ
	(envelope-from <linux-doc+bounces-76026-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 14 Feb 2026 18:22:32 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A5913C9A6
	for <lists+linux-doc@lfdr.de>; Sat, 14 Feb 2026 18:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5C87302F39A
	for <lists+linux-doc@lfdr.de>; Sat, 14 Feb 2026 17:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EED4299950;
	Sat, 14 Feb 2026 17:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="l6y8isUx"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27444285C8E;
	Sat, 14 Feb 2026 17:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771089720; cv=none; b=DD/q3sWMsrUCu3iNb8952SELuqw0UA6BT3GccHE8aZLCqnZA611p4kdFfOlY9nW7ozHDD0h1PMrBExCrtidHpYsVQgQ2qhkp2RfR+DyPu4wJV1BF6jfKIjlxTzBhS8suL4HBRjk/hAb68IfZaONBMa90uP76tczxNU2VsppiVGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771089720; c=relaxed/simple;
	bh=N9T+zbfHzgyrLOaI3vjQtkbfWeMqDJoJqnWEiaDWMng=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qrg3Expi27UOFuDa1rXE+9nP/lLF6OX4HOB8MxO8gVFI9FJN0QCyiaV8CycUrfq/JEgST1cxF1Nyhffwk0DuWlfRT4KOD5B7JK7InBSdm0qacstFeVMFp/F7EYWGqiW5jziKRoOJTWYFjJavbYIJq8fnnDsgFp9OxMzezr+3egE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=l6y8isUx; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 72684411EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771089718; bh=gKdDdhNDbgEsDA959WLUu16pu3nunc7c4LJArrBSIP4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l6y8isUxADjohqVpW37+rcdflG9eNxzcL6Wp8v0jaZo5yhRLkaSjrZbHm0lyK+CgE
	 bpX6BFvaqxP0F2p3ckvHM+jZMNkZbO1s9W8/E3qqFqfRVu/6OFZc1G0f4NzPDVGpZt
	 TZ5ljbX/g83tVRWPlc9W2VtTIXFNDXexKqvs0lRBYpYEktpUggVGTjNai/DGsEqHyP
	 mLs4/YqQsYznnbx5Qgww7u8zyNwz56KIy/1vNO3aMKW2zprV3D6c6d0WA8ZXUTgB0X
	 6GE2CxfWwWvQO4peZM4YRiUatfYhZoeYD3ftDjy1yz1z31lBAL+xk28oRfmk1LWSgC
	 2U151JZICHV7Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 72684411EC;
	Sat, 14 Feb 2026 17:21:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Wojciech <wojciech.develop@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: scheduler: remove extra whitespace in
 sched-debug.rst and sched-deadline.rst
In-Reply-To: <CALGt97_8_oYByt5-Eghz8FR9x0v90OEvVr9t8Dz2U9wOt0N=jQ@mail.gmail.com>
References: <CALGt97_8_oYByt5-Eghz8FR9x0v90OEvVr9t8Dz2U9wOt0N=jQ@mail.gmail.com>
Date: Sat, 14 Feb 2026 10:21:57 -0700
Message-ID: <875x7zqlze.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-76026-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[trenco.lwn.net:mid,lwn.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 80A5913C9A6
X-Rspamd-Action: no action

Wojciech <wojciech.develop@gmail.com> writes:

> From 8c49fd00f04b0a4281d40cc69071b2182cd36498 Mon Sep 17 00:00:00 2001
> From: "Wojciech S." <wojciech.develop@gmail.com>
> Date: Sat, 14 Feb 2026 17:48:16 +0100
> Subject: [PATCH] docs: scheduler: remove extra whitespace in
> sched-debug.rst and sched-deadline.rst
>
> Signed-off-by: Wojciech S. <wojciech.develop@gmail.com>

This patch has the same problems as the previous one I replied to:

- The above header information should not be in the changelog.  Please
  try sending patches just to yourself until you can verify that the
  formatting is correct.

- Two spaces after a period is not an error in need of correction.
  Since that is the only thing this patch is changing, I have to say
  that it really is not needed at all.

Thanks,

jon

