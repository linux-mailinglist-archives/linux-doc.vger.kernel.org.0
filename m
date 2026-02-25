Return-Path: <linux-doc+bounces-77043-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIdlEzEzn2lXZQQAu9opvQ
	(envelope-from <linux-doc+bounces-77043-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Feb 2026 18:36:49 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0005719BA3C
	for <lists+linux-doc@lfdr.de>; Wed, 25 Feb 2026 18:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 46DAD300C379
	for <lists+linux-doc@lfdr.de>; Wed, 25 Feb 2026 17:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA3C3D3326;
	Wed, 25 Feb 2026 17:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="VlGTo6A1"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E58A33B940;
	Wed, 25 Feb 2026 17:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772041000; cv=none; b=iYWwJ1frEEXWA51uudPQRtHvsSCBKIYW0QF3GMaMRPk3RtUVjNRzNWzX8ymPZvRmXKGb55OYq5d5K8UY34TsVe+Lo8k62YPLyBuSrUy3RIc9dhrLT4OmUia8mOEzH+Al1kML5IVvPMQIqbj7Z/bIN4h0mI9Pt4UZ9AhA+VRIEmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772041000; c=relaxed/simple;
	bh=tzvU2hplnHKqEzrtXJFfcaY0DBMBY8zU8gbtMoFuapo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZT9zQh68dQZ+LDAt9H4NPY4PkR1tNTUCi0Xc1lX/yRxbeiYkQ9h8qLZY/gd5IooLhGWUYEuWULnWkmFiwzBYwpvR4hD1RWGESC4To6x/gMXHzV7BcivCW5TVJnLcdZVYHjk/DREaAzCmzOd1yTjaxd8RejIkzINiRhqV8bKR+O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=VlGTo6A1; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6DBEC40C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772040993; bh=/EM2TFGMuIIoNPs5dQjJaMwMllqnqHbMJd5CVWZX4d8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VlGTo6A1sh0PUbjqomgV1FOv5gRPmyETeGCvk2IqEOzIJw0Qs3SZC+ZSp4QmEhi9j
	 U+F3/hNmGaiOHf/jJGZtzU43e/FGLUHkGEbOqd5AW9Q0UYn82viBQJewQ42KjNF9bv
	 XETImz5v6EWydGd4ffM7wRR3MPiJwYjzcZFiPCqX3OdnQ4v8lnEHlGjWh1BHtGfRAS
	 9fE5/O6JWN8PotLgrG80+RtagfHVuuTQPunY3fqjMv0mGX8u0g+A2S/MVneCFegWov
	 c3vA5UWprei6QZD48lVLhkqGpkqV5e7x2ibLrKJqhCtFMi+t8Nk9jzkN0FDoekozEW
	 QO2GJhHk0EFVw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6DBEC40C7C;
	Wed, 25 Feb 2026 17:36:33 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Pranav Kharche <pranavkharche7@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Pranav Kharche
 <pranavkharche7@gmail.com>
Subject: Re: [PATCH v2] docs: kernel-parameters: Fix repeated word in
 initramfs_options entry
In-Reply-To: <20260225132951.36624-1-pranavkharche7@gmail.com>
References: <20260225132951.36624-1-pranavkharche7@gmail.com>
Date: Wed, 25 Feb 2026 10:36:32 -0700
Message-ID: <87v7fkybbz.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-77043-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0005719BA3C
X-Rspamd-Action: no action

Pranav Kharche <pranavkharche7@gmail.com> writes:

> Remove the duplicate word 'for' in the initramfs_options description.
>
> Signed-off-by: Pranav Kharche <pranavkharche7@gmail.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index cb850e5290c2..c3460c920f84 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6733,7 +6733,7 @@ Kernel parameters
>  			Default is 'on'.
>  
>  	initramfs_options= [KNL]
> -                        Specify mount options for for the initramfs mount.
> +			Specify mount options for the initramfs mount.
>  

Applied, thanks.

For future reference, when sending an updated version of a patch, it is
helpful to say what changed below the "---" line.

jon

