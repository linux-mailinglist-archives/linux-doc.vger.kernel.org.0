Return-Path: <linux-doc+bounces-92180-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nG6GJfhcLGqtPwQAu9opvQ
	(envelope-from <linux-doc+bounces-92180-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 21:24:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E44D667BF84
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 21:24:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lwn.net header.s=20201203 header.b=EPSAibUQ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92180-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92180-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=lwn.net;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE56B311C31F
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 19:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD36338B7B1;
	Fri, 12 Jun 2026 19:24:35 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBA13793A9;
	Fri, 12 Jun 2026 19:24:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292275; cv=none; b=F8ImUfRTbrThmG26zZfXE6uYU7ajjo/Cjv//gl41HzSQJHqee+BTyK+W9XwuHyCC1ZNtJEFdn8cWz+NoR4L2+VAVkkmG/NXRr9Ml8Tlsaq4erPL6RoU6ZejSan3rb/Xe306H+Vm+NcyR7szj5S82cfjRO+Ysxr514jKTrQAs+3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292275; c=relaxed/simple;
	bh=bROSqV3TMApAupD6IHuX4UEzK6o7OAIIUQ3bqTshy8A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HfzfZzaTptkygDNccw8qcJGveKRXON3uQRZnjadSIGDWgXrOR/jjoG7QyNYWQBUo6Zcfipiktbb0GCgFrf2cTaMTFCLazZay/d0qNk/bOpMKIzRNlikj6NlAY4K/TZiP3XnVATuHhimFej95STJ+U6c3S1ItA6Ckbxc146Ekffo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=EPSAibUQ; arc=none smtp.client-ip=45.79.88.28
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2DD3340E4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781292274; bh=XiDH0YWgv6JyQDjAQR39mWCnvtc8vvQROoCXChhCMcQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EPSAibUQp+HMhZAT3uvpEEV2hVpZt491NxLeQ8PZ9bmqqXy/99CUiuDNQLBYWQl35
	 6+S9fOwAFArgQcQENvZvO3YfKT5ch00yi1nRY9T67gfBriQfXKMJA/CCfbTcW++c4s
	 krrtZJjaKp8jibuH41ebiufcE8TE2mYYYHnXoQt+NxrmLRd/CzcI7QFgFXP2YRpBXu
	 6490jU5zr6ZkxmVMuktMt8aD60t8NCKxEqY6QaCI/iSfnNVTg2vLBviTynjZPUt89N
	 6oNbZeqffI8g84PwAfYnKePur7Soyqllei8C9b56u6SRzPThKcV27ziklEbTfOk4+N
	 wEkZpc2sSncFg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2DD3340E4D;
	Fri, 12 Jun 2026 19:24:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: Re: [PATCH v2] Documentation: bug-hunting.rst: fix grammar
In-Reply-To: <20260605190055.15921-2-manuelebner@mailbox.org>
References: <20260605190055.15921-2-manuelebner@mailbox.org>
Date: Fri, 12 Jun 2026 13:24:33 -0600
Message-ID: <871peb7ea6.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92180-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mailbox.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,lwn.net:dkim,lwn.net:from_mime,trenco.lwn.net:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E44D667BF84

Manuel Ebner <manuelebner@mailbox.org> writes:

> Fix a grammar issue to improve readability
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  Documentation/admin-guide/bug-hunting.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/bug-hunting.rst b/Documentation/admin-guide/bug-hunting.rst
> index 3901b43c96df..642bf8474726 100644
> --- a/Documentation/admin-guide/bug-hunting.rst
> +++ b/Documentation/admin-guide/bug-hunting.rst
> @@ -63,8 +63,8 @@ Documentation/admin-guide/tainted-kernels.rst, "being loaded" is
>  annotated with "+", and "being unloaded" is annotated with "-".
>  
>  
> -Where is the Oops message is located?
> --------------------------------------
> +Where is the Oops message located?
> +----------------------------------

Applied, thanks.

jon

