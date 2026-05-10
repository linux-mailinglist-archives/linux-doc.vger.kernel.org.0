Return-Path: <linux-doc+bounces-86711-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJYkHfTAAGppMQEAu9opvQ
	(envelope-from <linux-doc+bounces-86711-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2026 19:31:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1439D5056B7
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2026 19:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7FDA730022D6
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2026 17:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051D13B19A8;
	Sun, 10 May 2026 17:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="4vo4z0o7"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BD5128395;
	Sun, 10 May 2026 17:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778434289; cv=none; b=HKpAR8vtFNiXKGbJWLb7WiHc1VlE+eDhhkiFDS8FyYazsdTkJWTTCP2Fijn20zO7ZEIrKNacYDHMfHSnZ7tV1d1sO3urKAYhIdeBREmaypEGHgTDt7HxPIj4CRaFjOnOC38GPRDug1wIlRkojHfDHYuHfmy8C2B2jTzlZsWzCIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778434289; c=relaxed/simple;
	bh=EYz9iKA19s1NSbrUky05UN1WuZPSPxLRJGmlVtC/5mY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PFcbU2Y2NWkHzMv+bhiro27LwqagiF1N/xhy+uFirYP0JRHYdddvOkEubvKseZ+9kAkJv12Q4s753P7m1qXB+QVCh08U63r2JyqzKJWtLIQWHPszeT1AiVBXSEtRToB48l7+vDrX9OhNVyzlMNnGFn/kDR+HRY3JIJJ5GKuOuMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=4vo4z0o7; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=GHwWmnS4gJ6IenFgK6UMJNjjXs3ZUO5adKF9kTgEA7c=; b=4vo4z0o7dKQo4q9rJkD2kmumMn
	sQUXrmrARKVfDZmC9jEvmzIafgTo6doGevken9U+iFN7jeQBBT93kyCjEsMVdNn0rq7pelrdm6dik
	3tYlhOT8Cy80yjZEug5MR+8eZvqd+AIdyjZCe4xmayt+0etu/17ljzghNqEyJjxM6YvdgXUd4Np8o
	ecXzV+T0QiVvqtlOP+UaM0TCRGDJtIO+uaYiey/LPiFRElYZG1W8dzpnq33T9IAyjeh95EzfjsGQA
	LKNsn8lrc33KTV8HIncxGwXwK54RYk5DDxMudDFn/JKDaRiROCcd14jioD9tbDmyjw0R4E8BRsM9V
	7uBklMWw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM7zv-0000000BGXU-1Eju;
	Sun, 10 May 2026 17:31:23 +0000
Message-ID: <6fb79ab0-e367-4da2-8e3a-edd0359b0bc8@infradead.org>
Date: Sun, 10 May 2026 10:31:21 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] scripts: checkpatch.pl: add warning for strlcat()
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: andy.shevchenko@gmail.com, apw@canonical.com, corbet@lwn.net,
 dwaipayanray1@gmail.com, joe@perches.com, kees@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 lukas.bulwahn@gmail.com, skhan@linuxfoundation.org, workflows@vger.kernel.org
References: <20260510164907.57176-2-manuelebner@mailbox.org>
 <20260510165649.57880-2-manuelebner@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260510165649.57880-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1439D5056B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86711-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,canonical.com,lwn.net,perches.com,kernel.org,vger.kernel.org,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,infradead.org:mid,infradead.org:dkim]
X-Rspamd-Action: no action



On 5/10/26 9:56 AM, Manuel Ebner wrote:
> add a warning for strlcat()
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
>  scripts/checkpatch.pl | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 0492d6afc9a1..ca1a8e67d529 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -7085,6 +7085,12 @@ sub process {
>  			     "Prefer strscpy over strlcpy - see: https://github.com/KSPP/linux/issues/89\n" . $herecurr);
>  		}
>  
> +# strlcat uses that should likely be

should likely be what?

> +		if ($line =~ /\bstrlcat\s*\(/ && !is_userspace($realfile)) {
> +			WARN("STRLCAT",
> +			     "Prefer seq_buf_printf() over strlcat - see: https://github.com/KSPP/linux/issues/370\n" . $herecurr);
> +		}
> +
>  # strncpy uses that should likely be strscpy or strscpy_pad
>  		if ($line =~ /\bstrncpy\s*\(/ && !is_userspace($realfile)) {
>  			WARN("STRNCPY",

-- 
~Randy


