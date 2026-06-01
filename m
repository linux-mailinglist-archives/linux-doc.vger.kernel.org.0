Return-Path: <linux-doc+bounces-90390-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCDJEiLaHWr6fQkAu9opvQ
	(envelope-from <linux-doc+bounces-90390-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 21:14:42 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BEECB624829
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 21:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BDC130439A5
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jun 2026 19:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBCF363C61;
	Mon,  1 Jun 2026 19:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jwV/Dvmi"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5F3360EE1;
	Mon,  1 Jun 2026 19:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780340919; cv=none; b=PM6YfpiOaye3I70RJBBHvjYnaUblMwbYgHzXBsmP6EtWsKBhy/7cyjxT17Akq05UHyrI6IQMu5RiCpLTf4zqHN1PWh0LX5qUCMVUn24L0JnMwA8G+MsrOdo7qiStt7lf1yeKr2gL9BCkI2sCpQ3s9Kr3QcrbC526AgfS7yWjkYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780340919; c=relaxed/simple;
	bh=eb7084sSUNMCJAClyTtIWei4A5dlaWhLaHbga7K/oq8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rkjWCz8/8mhzk/gwYVGi9G9B49Zl/ThyjSYpNUJgx83VuYg/XwXv5m3DZPzEsl83cPMoBKOEkZd+O+qspSxO4DzI0YA/AkxHdK3LS7ZlFMxiyFJjtYhWm/nQIdLN9jNrKZmXNNq/JXb64KiLM3wcScKz4IJYBb6DS3OaVeihT9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jwV/Dvmi; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 205C340E50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1780340918; bh=2mpCoTKfC5sXglQufo/V1Q/cgV/pJRUGqSV59ulBvdI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jwV/DvmiFgsdp+aMe/GN35jBovFDVXRtvTL6T3CqOq3VaJNpMTKGTolyVy30FEaKq
	 lgk2DVw4hvkl8W5OQI+4x2ozDm6EIL616a0/2jKrmaxxnWCEserloKtio0FxJX4wBW
	 zkfL005yFIaKSj0WwH0Ye3jhehVHIG+tdHYK+P350eTxKrC2sd7f7LI3N798FlMFP1
	 Kn7VkXHfw3nrIka88k5HSfsapKYZ4jDVnSsFHyW9yxuhQpK6Koy3a+DZtlxixOaH/X
	 euBUrfiPukNJmwv98ONxJmJe6tjNah/H6/6N0uT06VtlWyEJLsLqDzrYuy0h/WJBJY
	 RFvlHjaVhZsMg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 205C340E50;
	Mon,  1 Jun 2026 19:08:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Costa Shulyupin <costa.shul@redhat.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: Re: [PATCH v1] docs: kernel-parameters: Fix stale sticore file paths
In-Reply-To: <20260531140541.4115641-1-costa.shul@redhat.com>
References: <20260531140541.4115641-1-costa.shul@redhat.com>
Date: Mon, 01 Jun 2026 13:08:37 -0600
Message-ID: <87h5nm84ei.fsf@trenco.lwn.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90390-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: BEECB624829
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Costa Shulyupin <costa.shul@redhat.com> writes:

> Update file paths for sticore references that
> became stale when drivers were reorganized:
> - drivers/video/console/sticore.c -> drivers/video/
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 459ed0d72aeb..f94ec9f3a75c 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -7381,10 +7381,10 @@ Kernel parameters
>  			Set the STI (builtin display/keyboard on the HP-PARISC
>  			machines) console (graphic card) which should be used
>  			as the initial boot-console.
> -			See also comment in drivers/video/console/sticore.c.
> +			See also comment in drivers/video/sticore.c.
>  

Applied, thanks.

jon

