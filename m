Return-Path: <linux-doc+bounces-81783-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBwDL7Cqymkx/AUAu9opvQ
	(envelope-from <linux-doc+bounces-81783-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 18:54:08 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C14635F18B
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 18:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C224E3014FFA
	for <lists+linux-doc@lfdr.de>; Mon, 30 Mar 2026 16:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563803DA5AE;
	Mon, 30 Mar 2026 16:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ohqEfcYT"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4DA33FE0A;
	Mon, 30 Mar 2026 16:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889638; cv=none; b=h/WrJGdmeL09Fd9H5+w9Df1ghP7kU9TqFtb1CrkwBc+fbnbHBvtCsb1E7jLmistd1QP/yrrfJFez2RfPW32xWBWoE+aMnBtw6VHe1ZrNoZRa/lTRVhwl9TXYMLyUn137+anwlt294D/B636ZFqPouMhmKBWvrhof9eGmbJdOwuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889638; c=relaxed/simple;
	bh=2cOYBHn2kmfAIiNxePey5UpFg/GNt+E9b3CP01F1QGA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tHpgWi1jA+xaxd0uILJvw9UiOmKtEhnrRtszWvOiW9w45rbTKaMDyNntNPKIS2zjIpkwxRUKeGK7//SUe6ciLOtE1BSZUR4yjBghZWyAAuJgTgmfL/Jsj2IhXdFBHI3LH98kvGgS4R+LuzQYlWxQldnHe/S1igW9nMNFvArLvkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ohqEfcYT; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 85A39411C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774889636; bh=T99KaSNXcaiHtwDowAaMWJ1WB4iapdC+e1FZRJwp3Nk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ohqEfcYTGyiTn2S9tEO0fiBKFIPp9uXEKBTCGz27zwBMrq3vzJH8MERIu/fHqtn57
	 sB0lbJP/Rf+eo2x9VyPSyJYmr0oBEMv8AmBp5nZ91D/rHqUozoUtXIfRnz/mNA4zG7
	 CFZ10+M9pc1AzwL/a2dVobhCoyallCuVgzSUGOub9x8XAsLKEAd8RXIm11S1rja8bb
	 nDEQxxfPVsGse9ePUc51y25OVI9bEemZb40m6A2rqWwLE3CoRKyTIVXkxxmqUP10XP
	 euv9BlH4ciU177OYsWNiH2RD2ign1n+t9vC2893ERc2lNkkAWW8DK7vmW+ABFxudTr
	 FXisdrjSU5Vzw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 85A39411C2;
	Mon, 30 Mar 2026 16:53:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] Doc: process: Added two important books for Linux
 Kernel programming and development
In-Reply-To: <20260328074745.2309736-1-unixbhaskar@gmail.com>
References: <20260328074745.2309736-1-unixbhaskar@gmail.com>
Date: Mon, 30 Mar 2026 10:53:55 -0600
Message-ID: <87341hntr0.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81783-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5C14635F18B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Bhaskar Chowdhury <unixbhaskar@gmail.com> writes:

> These books are very well written and enhance the understanding of the process.
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  Documentation/process/howto.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
> index 9438e03d6f50..c5164a27fc1a 100644
> --- a/Documentation/process/howto.rst
> +++ b/Documentation/process/howto.rst
> @@ -34,7 +34,8 @@ experience, the following books are good for, if anything, reference:
>   - "The C Programming Language" by Kernighan and Ritchie [Prentice Hall]
>   - "Practical C Programming" by Steve Oualline [O'Reilly]
>   - "C:  A Reference Manual" by Harbison and Steele [Prentice Hall]
> -
> + - "Linux System Programming" by Robert Love [O'Reilly]
> + - "Linux Kernel Development" By Robert Love [Pearson]
>  The kernel is written using GNU C and the GNU toolchain.  While it

Adding mention of those books might well be a good thing to do, but
you're adding them in the middle of a section that is talking about C
programming specifically.  It doesn't make much sense to put them there.

Thanks,

jon

