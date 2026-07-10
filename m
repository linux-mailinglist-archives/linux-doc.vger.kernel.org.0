Return-Path: <linux-doc+bounces-96271-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6fHmM6cCUWqe9wIAu9opvQ
	(envelope-from <linux-doc+bounces-96271-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 16:33:11 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFA773BC3C
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 16:33:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Hvve1BE2;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96271-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96271-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91C8A30530E1
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 14:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0906A346798;
	Fri, 10 Jul 2026 14:24:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6095349CC2;
	Fri, 10 Jul 2026 14:24:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693460; cv=none; b=VTjBG8IOUBtFPG+vvU8uYAPXRqdQkrx/SAYWRQRQk58+XnKXfKLyv67HTuhDD6LLw+LmlWGMOSEEwvzmFP56VMFtAPSra7m2OJFsmRbOwBAJdTv40DjLmHDkL33/LprbcEE2k+wQuFHOUQ2rJ3LXK9k86p7k6gTfCy/2P2FNaq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693460; c=relaxed/simple;
	bh=6YPEtHJOZCEvusTNSoax2/IAA8+bMY9rEEYpRYeAL78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TrOnQjuTtBlXUuwHcGZzMiEmZ0LxnKRS5SQqjsBr8JH+z5DktW5xuUti/ZiE7LdLHTKsqrPus1w9er0oMNH/dLz/EbzG1FZ8sgix0MjwBpfQTwXW+NZbpOyhQRTqyILgV9C75PC8v2mIiHwYHRFs/74hsv5UeMUgQBnS3bMVJ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hvve1BE2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466B51F000E9;
	Fri, 10 Jul 2026 14:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783693459;
	bh=3rUDxcBxSTvUCkBAHloVtxdehX9iYZCWsP8zEYUkkqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hvve1BE2sLwGuVY56H2t3YRIg4JB6/lGKUEcaHRfIRmslgZQM1dWvquBGhjH8LPNG
	 7MAh73cA/ZThpxDisFOVLqJma1hCTpoEQr7x0p3pXY72M4CIrGZE0/nOMElLE42gjB
	 PhQs8w872asSL4tvX2dIqASl+Nh3j8hWlXNHecXaY7KilPkY5UFeIDVTZqhSHTAFeZ
	 wSOb6BLr/KOuXCiZf/0ChdtvZm/TbPEdoCwCzhkLCSH2WNra5AHzdb0AOS/JkyCTj+
	 jwuj34JJwC0SaRmMbRcyqiR51x6NVGF30d0i94LCcjzEu/TMMhilGa1W0iNgbVk+NU
	 QBQaZkEOtekxA==
From: SJ Park <sj@kernel.org>
To: Song Hu <husong@kylinos.cn>
Cc: SJ Park <sj@kernel.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/4] Docs/ABI/damon: document update_tuned_intervals state command
Date: Fri, 10 Jul 2026 07:24:15 -0700
Message-ID: <20260710142416.25073-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710044737.561102-4-husong@kylinos.cn>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96271-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:husong@kylinos.cn,m:sj@kernel.org,m:damon@lists.linux.dev,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sj@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,kylinos.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1DFA773BC3C

On Fri, 10 Jul 2026 12:47:36 +0800 Song Hu <husong@kylinos.cn> wrote:

> The 'update_tuned_intervals' command of the 'state' file, added in
> commit 1077605396b4 ("mm/damon/sysfs: implement a command to update
> auto-tuned monitoring intervals"), is described in usage.rst but
> missing from the canonical ABI document.  Add it.

I initially thought this information is better to be only in usage document.
But, ABI doc is already describing all the inputs.  So, this looks good to me
now.

> 
> Signed-off-by: Song Hu <husong@kylinos.cn>

Reviewed-by: SJ Park <sj@kernel.org>

> ---
>  Documentation/ABI/testing/sysfs-kernel-mm-damon | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-kernel-mm-damon b/Documentation/ABI/testing/sysfs-kernel-mm-damon
> index 03aecc07a5bd..7e8192527191 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-mm-damon
> +++ b/Documentation/ABI/testing/sysfs-kernel-mm-damon
> @@ -36,7 +36,10 @@ Description:	Writing 'on' or 'off' to this file makes the kdamond starts or
>  		kdamond.  Writing 'clear_schemes_tried_regions' to the file
>  		removes contents of the 'tried_regions' directory.  Writing
>  		'update_schemes_effective_quotas' to the file updates
> -		'.../quotas/effective_bytes' files of this kdamond.
> +		'.../quotas/effective_bytes' files of this kdamond.  Writing
> +		'update_tuned_intervals' to the file updates 'sample_us' and
> +		'aggr_us' files under 'monitoring_attrs/intervals' with the
> +		auto-tuned sampling and aggregation intervals.
>  
>  What:		/sys/kernel/mm/damon/admin/kdamonds/<K>/pid
>  Date:		Mar 2022
> -- 
> 2.43.0


Thanks,
SJ

