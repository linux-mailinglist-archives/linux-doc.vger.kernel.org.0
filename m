Return-Path: <linux-doc+bounces-91781-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JPExDKPDKGr6JAMAu9opvQ
	(envelope-from <linux-doc+bounces-91781-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 03:53:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C34EC665556
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 03:53:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b="bbsvwp/d";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91781-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-91781-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 291573005582
	for <lists+linux-doc@lfdr.de>; Wed, 10 Jun 2026 01:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F492EC086;
	Wed, 10 Jun 2026 01:53:36 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF252EEE60
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 01:53:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056416; cv=none; b=tKPCgi0GLiPRrW1+4xOgF9BnDjZNiGjRY9CkzQe+0hKpfExsjePzvD2HCVvFwkMytBmYLGkSrYD9aAdn/PEVoffRzAem2y28hhfa7PCCcuKYmAZ/9vrWEzqElJC8cfU4iFoigIE8HoVkwi03YNsBZfFX14dXMcvFC/rJiqqmIWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056416; c=relaxed/simple;
	bh=Aniz0i7zS31nm6ZpK5d4LZjgaKVO86jYotANxdvO/Q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pi7a0I5Cl8evjQwPJ3LTdX3oW68gKCuYClAxgaMAOujK/bmyoGqkXW0yMEzfQorwo5+iq4Yse4SQyqo/e503Q2Ca92ZcwcKQk7877S8/wnctpIfj/oZZG0wwWfjU0L01emi+Ol6uSqz3AdqWT68bRqOC5THCwqxmiijhUp59TDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bbsvwp/d; arc=none smtp.client-ip=91.218.175.172
Message-ID: <c7a83b2f-ee5e-4de1-807c-311db839b4d5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781056410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FrmWqzviIqBB3IDNdu15PDEAaOUICtqvo3B9Gs8vRaM=;
	b=bbsvwp/dxTTGFU3RSHnkuoHl/y+d0uyW4xm7CWNpqBW1pML/tXksWqhJhsHBKFqph+sFH1
	VUw2Jhbbk3xza8B43C6LX8sOiyplrt59k6ZZYcMcrt9rkM/VF+k1vNX9igbWdCfqr9KFh/
	KJAYQiN60SoRDXVMnxifP1B3OyY5p0c=
Date: Wed, 10 Jun 2026 09:52:52 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 4/6] alloc_tag: add accuracy based filtering to ioctl
To: Abhishek Bapat <abhishekbapat@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Sourav Panda <souravpanda@google.com>
References: <cover.1781042698.git.abhishekbapat@google.com>
 <7f3a4ddb3f132464f17716eaae657a6367d6dd05.1781042698.git.abhishekbapat@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <7f3a4ddb3f132464f17716eaae657a6367d6dd05.1781042698.git.abhishekbapat@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91781-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[hao.ge@linux.dev,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:abhishekbapat@google.com,m:surenb@google.com,m:akpm@linux-foundation.org,m:kent.overstreet@linux.dev,m:skhan@linuxfoundation.org,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:souravpanda@google.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hao.ge@linux.dev,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C34EC665556


On 2026/6/10 08:12, Abhishek Bapat wrote:
> Extend the allocinfo filtering mechanism to allow users to filter tags
> based on their accuracy.
>
> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>


Acked-by: Hao Ge <hao.ge@linux.dev>


> ---
>   include/uapi/linux/alloc_tag.h | 4 ++++
>   lib/alloc_tag.c                | 8 ++++++++
>   2 files changed, 12 insertions(+)
>
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
> index 7f5acbb44c14..6ea39c4869fe 100644
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -26,6 +26,8 @@ struct allocinfo_tag {
>   	char function[ALLOCINFO_STR_SIZE];
>   	char filename[ALLOCINFO_STR_SIZE];
>   	__u64 lineno;
> +	/* filter criteria only; see allocinfo_counter.accurate for actual accuracy */
> +	__u64 inaccurate;
>   };
>   
>   /* The alignment ensures 32-bit compatible interfaces are not broken */
> @@ -45,6 +47,7 @@ enum {
>   	ALLOCINFO_FILTER_FUNCTION,
>   	ALLOCINFO_FILTER_FILENAME,
>   	ALLOCINFO_FILTER_LINENO,
> +	ALLOCINFO_FILTER_INACCURATE,
>   	ALLOCINFO_FILTER_MIN_SIZE,
>   	ALLOCINFO_FILTER_MAX_SIZE,
>   	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_MAX_SIZE
> @@ -54,6 +57,7 @@ enum {
>   #define ALLOCINFO_FILTER_MASK_FUNCTION		(1 << ALLOCINFO_FILTER_FUNCTION)
>   #define ALLOCINFO_FILTER_MASK_FILENAME		(1 << ALLOCINFO_FILTER_FILENAME)
>   #define ALLOCINFO_FILTER_MASK_LINENO		(1 << ALLOCINFO_FILTER_LINENO)
> +#define ALLOCINFO_FILTER_MASK_INACCURATE	(1 << ALLOCINFO_FILTER_INACCURATE)
>   #define ALLOCINFO_FILTER_MASK_MIN_SIZE		(1 << ALLOCINFO_FILTER_MIN_SIZE)
>   #define ALLOCINFO_FILTER_MASK_MAX_SIZE		(1 << ALLOCINFO_FILTER_MAX_SIZE)
>   
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index a936cf18611a..73fb3d0ab821 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -249,6 +249,8 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
>   			   struct alloc_tag_counters *counters,
>   			   bool *fetched_counters)
>   {
> +	bool inaccurate;
> +
>   	if (!filter || !filter->mask)
>   		return true;
>   
> @@ -274,6 +276,12 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
>   	    ct->lineno != filter->fields.lineno)
>   		return false;
>   
> +	if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
> +		inaccurate = !!(ct->flags & CODETAG_FLAG_INACCURATE);
> +		if (inaccurate != !!(filter->fields.inaccurate))
> +			return false;
> +	}
> +
>   	if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
>   		if (!*fetched_counters) {
>   			*counters = allocinfo_prefetch_counters(ct);

