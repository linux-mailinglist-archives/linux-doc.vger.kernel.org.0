Return-Path: <linux-doc+bounces-82547-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP9nEAg+02nbgAcAu9opvQ
	(envelope-from <linux-doc+bounces-82547-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Apr 2026 07:00:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB3A3A1846
	for <lists+linux-doc@lfdr.de>; Mon, 06 Apr 2026 07:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D73130057A1
	for <lists+linux-doc@lfdr.de>; Mon,  6 Apr 2026 05:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACAF23EAA4;
	Mon,  6 Apr 2026 05:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SUqLOhOz"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC2A20C477
	for <linux-doc@vger.kernel.org>; Mon,  6 Apr 2026 05:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775451653; cv=none; b=FPUp9qIjDfwPsuVLAEUYjioafAtPchJdZg7QymPQuMSTnEw8wuhNVQDAnYIGC2GBEOxCvWqIeJWPbdNFCNQ6zFQYKS7+pE8lOd32ZZAo9VtMFEiBw2oB8hEXf5Jo2Gni/aK1aERUsXtLuxAXJEH5vsRDff/4neh1Kn0Ix5Yy9XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775451653; c=relaxed/simple;
	bh=oDzAIJwmIhB1KkTOc3DsKNrcCf6Gj+FfVDPz+1IBaoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nVXiSkTcSvN9v/ZxAGVhpTLk9/BJgfDzGdaK8ggxRQY/M/j8wIovd4LLFNbstY98Ok711KfQ/gltou6bqXUF0DcV3SjAu5AouJ98q1sJEfr14oFNgYviEGbY08+x071VpANdG7xUqM1rpUXhUhYDU/vXpJag2kiCQCbs4dDT0qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SUqLOhOz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=TVSjU4ePQPKJN9gViKHDhukrPT4dmldWLc3Ak2MKyAU=; b=SUqLOhOztatnGfGhrPK4ZGu2w3
	Cy9DIEZ1uMEC2kyAl9MOTve4ui1uIUEs0+tF3Hg6VL8A1LQv+ChRwIrlqAAtfAuUlXtnX5A3KNRop
	cGXLegf6U3aN4lt5n2hKftUAgDoIymrLUQHIGtOOlTtHGezEEtRghDlNEUbi9Iv2SKcE/n6uS1pGx
	y6dYPl6Wmj+W2A3E52My4H6YthwXX9qzBYSopgOWxmTuQkEAvyw/u/odvJ3+fqLXwTSpvFPexG1z7
	2vZznrx8smZfb/+zw89lRkSzHtWORTFr95ZHLCRNvnJXAjG+ZRbJPHOX2xTtl7AMU6T6aNopnf+vH
	KPyiP8LA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9c4q-00000004mti-2rVv;
	Mon, 06 Apr 2026 05:00:44 +0000
Message-ID: <80333272-a303-4b8a-adc2-41d7d0855028@infradead.org>
Date: Sun, 5 Apr 2026 22:00:43 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: fix typos and duplicated words across
 documentation
To: Manuel Cortez <mdjesuscv@gmail.com>, linux-doc@vger.kernel.org,
 corbet@lwn.net
References: <20260405030359.7392-1-mdjesuscv@gmail.com>
 <20260406030323.1196-1-mdjesuscv@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260406030323.1196-1-mdjesuscv@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-82547-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,lwn.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,infradead.org:email,infradead.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8CB3A3A1846
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/5/26 8:03 PM, Manuel Cortez wrote:
> Fix the following typos and duplicated words:
> 
> - admin-guide/pm/intel-speed-select.rst: "weather" -> "whether"
> - core-api/real-time/differences.rst: "the the" -> "the"
> - admin-guide/bcache.rst: "to to" -> "to"
> 
> Signed-off-by: Manuel Cortez <mdjesuscv@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> Changes in v2:
> - Dropped the networking/switchdev.rst change as "is in in" is correct
>   per Randy Dunlap's review.
> 
>  Documentation/admin-guide/bcache.rst                | 2 +-
>  Documentation/admin-guide/pm/intel-speed-select.rst | 2 +-
>  Documentation/core-api/real-time/differences.rst    | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/bcache.rst b/Documentation/admin-guide/bcache.rst
> index f71f349553e4..325816edbdab 100644
> --- a/Documentation/admin-guide/bcache.rst
> +++ b/Documentation/admin-guide/bcache.rst
> @@ -618,7 +618,7 @@ cache_replacement_policy
>    One of either lru, fifo or random.
>  
>  freelist_percent
> -  Size of the freelist as a percentage of nbuckets. Can be written to to
> +  Size of the freelist as a percentage of nbuckets. Can be written to
>    increase the number of buckets kept on the freelist, which lets you
>    artificially reduce the size of the cache at runtime. Mostly for testing
>    purposes (i.e. testing how different size caches affect your hit rate).
> diff --git a/Documentation/admin-guide/pm/intel-speed-select.rst b/Documentation/admin-guide/pm/intel-speed-select.rst
> index a2bfb971654f..dec2a25f10bc 100644
> --- a/Documentation/admin-guide/pm/intel-speed-select.rst
> +++ b/Documentation/admin-guide/pm/intel-speed-select.rst
> @@ -287,7 +287,7 @@ level.
>  Check presence of other Intel(R) SST features
>  ---------------------------------------------
>  
> -Each of the performance profiles also specifies weather there is support of
> +Each of the performance profiles also specifies whether there is support of
>  other two Intel(R) SST features (Intel(R) Speed Select Technology - Base Frequency
>  (Intel(R) SST-BF) and Intel(R) Speed Select Technology - Turbo Frequency (Intel
>  SST-TF)).
> diff --git a/Documentation/core-api/real-time/differences.rst b/Documentation/core-api/real-time/differences.rst
> index 83ec9aa1c61a..a129570dab5a 100644
> --- a/Documentation/core-api/real-time/differences.rst
> +++ b/Documentation/core-api/real-time/differences.rst
> @@ -213,7 +213,7 @@ to suspend until the callback completes, ensuring forward progress without
>  risking livelock.
>  
>  In order to solve the problem at the API level, the sequence locks were extended
> -to allow a proper handover between the the spinning reader and the maybe
> +to allow a proper handover between the spinning reader and the maybe
>  blocked writer.
>  
>  Sequence locks

-- 
~Randy

