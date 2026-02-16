Return-Path: <linux-doc+bounces-76112-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM96MY83k2mV2gEAu9opvQ
	(envelope-from <linux-doc+bounces-76112-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 16 Feb 2026 16:28:15 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E9182145935
	for <lists+linux-doc@lfdr.de>; Mon, 16 Feb 2026 16:28:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 025003010744
	for <lists+linux-doc@lfdr.de>; Mon, 16 Feb 2026 15:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF3D3148C1;
	Mon, 16 Feb 2026 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="f/CyazEh"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6900F3148D2;
	Mon, 16 Feb 2026 15:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771255556; cv=none; b=UgPoQu9TfpTdykg9zRnHR8odFNcQ4LBZQi6NaCXjnJib73U0pwNRHKK22Y/gRLgPCosDFCT7mq9nPhMZZEiPncorEjyOQa5175yYxzUMERSUbuhxLpNcbNwv3Wpw8rXZ1jHgmb02b31UlJ+Iyd53gCy5qRse9hUja84RCXhpVh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771255556; c=relaxed/simple;
	bh=/jv0/KkEmylnEm0e+QrOFiMquh9C6sMKGZkWvGy87iE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XXH0Wnc6fXZdL20Q3WdrrXcaVrc9vLD0sYgE4O5TUTsTkIseKavOTTk8c+AghbMBMiXvRP2Pr3W8yU/GoPsi/9pkiwsxwemkXyj3xrk1r9tuFLaGOWBRLjbr80cGvJEcQujIFGXgmZfKXSllIhjQNG0ZOscinKWkKYP+DNJuTBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=f/CyazEh; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 963AD411D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771255553; bh=5+0sPWZDnlquJNIPzGS8jPB2HMfsY+CEzL9R9347QeA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=f/CyazEhOrmOHU3lZWaHS5RT0SZ3jJexpAkt3O41981frjkOKRSzNS1QchWNbJatm
	 rtFgkdlWDi924fKGuolA0R7ueFFdh7stmM0PjwEufG4DjY3FGpDoVKzgCi1T1xGQTL
	 sdHMLANoRfaARr3ZuGJ1fVmkM31zcdt6YRFj3M5pzUd3sneKCN5EEUzv1LJ26Ur8Ad
	 dgWrWnd0W579VrEUvlw4PL2nGgbBRXBXyhRhz/zZFHrbm6puhypaqckJoIWsMtVPKv
	 yVR7i/PooTaUSYkmmlvdw8+e7+WxVViA4ouEeZ5gxcfHIzSaj4STBVDRUcL6iGTL0v
	 wd+isGZMrIBJw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 963AD411D4;
	Mon, 16 Feb 2026 15:25:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Hans Anda <hansa@airmail.cc>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Anda
 <hansa@airmail.cc>
Subject: Re: [PATCH] Documentation: Text referrals -> Links
In-Reply-To: <20260215173858.53653-2-hansa@airmail.cc>
References: <20260215173858.53653-2-hansa@airmail.cc>
Date: Mon, 16 Feb 2026 08:25:52 -0700
Message-ID: <87bjhopv5r.fsf@trenco.lwn.net>
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
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-76112-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DM_SURBL(0.00)[airmail.cc:email];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,airmail.cc:email,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: E9182145935
X-Rspamd-Action: no action

Hans Anda <hansa@airmail.cc> writes:

> Replace text files with the content "This file has moved to *"
> with links pointing there. The file /Documentation/Changes serves
> as a model for this patch.
>
> Signed-off-by: Hans Anda <hansa@airmail.cc>
> ---
>  Documentation/CodingStyle       | 2 +-
>  Documentation/SubmittingPatches | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  mode change 100644 => 120000 Documentation/CodingStyle
>  mode change 100644 => 120000 Documentation/SubmittingPatches

Honestly, it has been long enough now since those names were in use
that, I suspect, we could just remove them altogether.

Thanks,

jon

