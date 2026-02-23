Return-Path: <linux-doc+bounces-76648-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELyaOU7JnGkwKQQAu9opvQ
	(envelope-from <linux-doc+bounces-76648-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 22:40:30 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4517517DA78
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 22:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5A14305ED12
	for <lists+linux-doc@lfdr.de>; Mon, 23 Feb 2026 21:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE8A378D97;
	Mon, 23 Feb 2026 21:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="pC4lcGvk"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED3C361654;
	Mon, 23 Feb 2026 21:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771882764; cv=none; b=j888BS6eTRxM9VYtWuK6dtsoRW20qIcOdmyBMYQHxWHT76kwR8Ps05KzOOCSV6fUHlU3LtJN29Fwf8gp31h6R+su4STvmqXSiAXKYs40aOxUa/g5baJ0bp9lEzPtWDx2WJu9VQM4zBg0XrLK2D6ozrElS9f50g17tdI9PvjJm2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771882764; c=relaxed/simple;
	bh=u6iSmwVJjbvDsIwFxM//DvZovPuY/+XMuBxT+UXYmtQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DngH31j8zKE/H85y8OyGiDnj/5zPuKevMJgRAIxsl1SH27KJZfsC/WbFF6YLYvMnVH1EUNlyN0lVeUczZkNoPEZTcYR+BpNB7YlAlZ61p9qUUxOoToSi6CfXTOEHGMCq0sPzqa9xTJ6bJbWHvyxSJl5u1Ly0fJR3glQgzlOkJHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=pC4lcGvk; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E2076411D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771882763; bh=WtYjESTOFpLrg3W9EHpTqINftt/5rxy7Bd4AWomb8kc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pC4lcGvkb3H6m1aLC8QVOErAxEtGsGoGpX9zCZXrRD37UEmuZOWsE/cSZWw0PRRSq
	 ZUZqvECghp6RXjjJA4gtWbHOIaNBl40q+evGn9e5firPcMb9f7OOw+S+z0vORc2gq0
	 RLIPtzE6aCRFIQvTWZQzPR19skAlbz7xTXCxeQexdWWbNklaNxRBDq2fdDaFnZrUfS
	 kp7vhli+iU5GKp3JSmtSH2uHQricGLoyyQPBPjNiQhVkozVvbT820mEs07OGfH9Oc1
	 cFqNdxRVFx4VOk7jdMEuCaLMKGRTP0sbKMWBR4sKbqH8PhIeD2lHl29O5jx5EdbhSL
	 0dhBcDTFl6YuQ==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E2076411D3;
	Mon, 23 Feb 2026 21:39:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Pranav Kharche <pranavkharche7@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Pranav Kharche
 <pranavkharche7@gmail.com>
Subject: Re: [PATCH] docs: kernel-parameters: fix double word typo in
 initramfs_options
In-Reply-To: <20260218103157.110404-1-pranavkharche7@gmail.com>
References: <20260218103157.110404-1-pranavkharche7@gmail.com>
Date: Mon, 23 Feb 2026 14:39:22 -0700
Message-ID: <87ikbn3zsl.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-76648-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: 4517517DA78
X-Rspamd-Action: no action

Pranav Kharche <pranavkharche7@gmail.com> writes:

> Remove the repeated word for at line 6485 in the initramfs_options
> entry.
>
> Signed-off-by: Pranav Kharche <pranavkharche7@gmail.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 6c42061ca..38fa10e92 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6483,7 +6483,7 @@
>  	rootflags=	[KNL] Set root filesystem mount option string
>  
>  	initramfs_options= [KNL]
> -                        Specify mount options for for the initramfs mount.
> +                        Specify mount options for the initramfs mount.

This doesn't apply to docs-next; can I get you to respin (against
7.0-rc1 would be fine)?

Thanks,

jon

