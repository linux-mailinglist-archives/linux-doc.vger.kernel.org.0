Return-Path: <linux-doc+bounces-56641-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52304B2ADD8
	for <lists+linux-doc@lfdr.de>; Mon, 18 Aug 2025 18:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F4F37AECCD
	for <lists+linux-doc@lfdr.de>; Mon, 18 Aug 2025 16:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518A9322A03;
	Mon, 18 Aug 2025 16:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="AdJr6Hp4"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7F124EAB1
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 16:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755533490; cv=none; b=mNVGXeocbfjshkmtENQBTam1wcf6ej8LJVFuIpNUNOLZ4k6AdR2pOMbAWLGisjhv9KXYdMMAiHTLAdWx6htcw33as4/FMFF9UaggEwhWFMW+Rt/6jbALI/gQ9u7DqqVTwvY6vjDg49IqSmKgUAAiij7JDQcaTFOADX0pEwJ9Ric=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755533490; c=relaxed/simple;
	bh=78KIoVRhK2iNOIQXHwkoKCA4SvaQtvhUuy63orh2FMk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eGkLo90/t8fMgGGMtTzTmc8+6rEFHZnhTHizJqTucVknTb2mg8bFpF8WrSCX2g50wQdAHThBd9ANwMhdOjPD8ZgPlfEeXfI1LWZ6cvM2NJJTlNWuyRItV/XLLSR5pID2CmQdzTJ5c/WIkzfZvRY+2hEZPbDKLBDwXLIAc1hisqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=AdJr6Hp4; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 146C340AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1755533488; bh=tQDyK6nHE53T/n3wXnrBsriTw/Bt+l3u2fOSaqwokB4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AdJr6Hp4zmRMtzrLoAxJBAhnkFQQNeLyjRZFcKjTyj2mqkF4YiQwWk2GW+VNhC7cd
	 OYBuvHDVN3P5jYjFa+buDPpTIlFcXr63hKDGjDa6xtI6iP1736j8VGVGV57LDpXpJ9
	 N3lEJRx7p1G7a2WnzBr+jacYckgq2D7ATntoY04GsvG4JbYDfXv+ysGvDzps5QucXc
	 SzMO4nbhRhMNFW6tv4N/punb/3VfhsTwuOh+ZJW0KitdRbYhDn0JV2cI1zYgUFVxRa
	 MdPSmT9Bzxr+VwFrRXg06s9tFyBuH6CtS3eY0ePoOnigf2mmNbtSDxkuw6O7V8DhQX
	 vbloUj5bpeq+Q==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 146C340AB4;
	Mon, 18 Aug 2025 16:11:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: vivekyadav1207731111@gmail.com
Cc: rdunlap@infradead.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-doc@vger.kernel.org,
 Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: Re: [PATCH v3] kernel-parameters: fix kernel-doc warning
In-Reply-To: <20250816082452.219009-1-vivekyadav1207731111@gmail.com>
References: <20250816082452.219009-1-vivekyadav1207731111@gmail.com>
Date: Mon, 18 Aug 2025 10:11:27 -0600
Message-ID: <87wm708v9s.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

vivekyadav1207731111@gmail.com writes:

> From: Vivek Yadav <vivekyadav1207731111@gmail.com>
>
> Fix kernel-doc warning in kernel-parameters.txt
>
> WARNING: Possible repeated word: 'is'
>
> ```
> [command]
> ./scripts/checkpatch.pl --strict -f Documentation/admin-guide/kernel-parameters.txt
>
> [output]
> WARNING: Possible repeated word: 'is'
> +            The format is is "trace_trigger=<event>.<trigger>[ if <filter>],..."
>
> total: 0 errors, 1 warnings, 0 checks, 8339 lines checked
> ```
>
> Signed-off-by: Vivek Yadav <vivekyadav1207731111@gmail.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 747a55abf..302145870 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -7506,7 +7506,7 @@
>  			Set a trigger on top of a specific event, with an optional
>  			filter.
>  
> -			The format is is "trace_trigger=<event>.<trigger>[ if <filter>],..."
> +			The format is "trace_trigger=<event>.<trigger>[ if <filter>],..."

I have applied this, thanks.

For future reference, "fix a warning" is seldom a good subject-line
choice.  Warnings are not problems, errors are.  In this case, a proper
subject would be "docs: remove a duplicated word from
kernel-parameters.txt".

Thanks,

jon

