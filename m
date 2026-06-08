Return-Path: <linux-doc+bounces-91288-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ei2TG7NAJmrqTwIAu9opvQ
	(envelope-from <linux-doc+bounces-91288-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 06:10:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BC76528D4
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 06:10:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=PhJQmJ4C;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91288-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91288-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50F4F300FEFB
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 04:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E94223328;
	Mon,  8 Jun 2026 04:10:23 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9547918BBAE
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 04:10:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780891823; cv=none; b=ToofV1Xmkg9D0KNNTcEATBSc2HWyCCJHlT9dfLEPuCP/0xyBaP/1DbM1O+ppXUuoYGkem8zTic7KSOteQmGML9FWFSVGPdm2JdapnnPlVY05cDMs9YqpjUthIzDpyggms9fRfSIJzdHCTveGYjuDDtcVIQuO+yEmJnyQNY8NNc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780891823; c=relaxed/simple;
	bh=+esi5+wmEbzr0U6tFH3wrxjSlcekmUCxuh42Y1DjLXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZsSMDo9SdVsMjGXQ1gxZRBsZrfjwJRRmwMFn9fDDT6msM+G+AIFSpuPTWjaXFtTaNHZe3PyG2jHnUaPzeT/+9KhTtORYTQKaDfbetNtRz9d5VYPOsX/YJb1vqozbjDRGbN4bBnFejYcsr3lIAZJF5cKh1G3xQv+XLIRVXMY3Oto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PhJQmJ4C; arc=none smtp.client-ip=91.218.175.179
Message-ID: <5d77fadd-13a9-40ed-a8e8-2982ceb69af2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780891818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQr+FS5WTq4T7wFBMSLf3go6FakMkvtgbNGjQKWlmw8=;
	b=PhJQmJ4C/cVE3UbVc5wYGTEjz2tdfRoaX48ehWPeZGWP7Nl/U5dlWYmpKB1nM2j5tvtc1F
	TO+/1SxF/Rg2fTp6M1SiLweIkGXWaSsWgQCzz3tFTWcWSg8Oqo4qT8Zv9umC7GkENoV4QC
	MLD6Yv9D6n9IuOrQPo76T96avYRGiaA=
Date: Mon, 8 Jun 2026 12:09:37 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 3/6] alloc_tag: add size-based filtering to ioctl
To: Abhishek Bapat <abhishekbapat@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Sourav Panda <souravpanda@google.com>
References: <cover.1780701922.git.abhishekbapat@google.com>
 <ef88e52368463e312086a966f10287a29d0edeca.1780701922.git.abhishekbapat@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <ef88e52368463e312086a966f10287a29d0edeca.1780701922.git.abhishekbapat@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91288-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:abhishekbapat@google.com,m:surenb@google.com,m:akpm@linux-foundation.org,m:kent.overstreet@linux.dev,m:skhan@linuxfoundation.org,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:souravpanda@google.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hao.ge@linux.dev,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:from_mime,linux.dev:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92BC76528D4

Hi Abhishek


Thanks for the new version.


On 2026/6/6 07:36, Abhishek Bapat wrote:
> Extend the allocinfo filtering mechanism to allow users to filter tags
> based on the total number of bytes allocated [min_size, max_size]. The
> size range is inclusive.
>
> Filtering by size involves retrieving allocinfo per-CPU counters, which
> is an expensive operation. Hence, the performance of size-based
> filtering will be worse than other filters.
>
> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> ---
>   include/uapi/linux/alloc_tag.h |  8 +++-
>   lib/alloc_tag.c                | 68 +++++++++++++++++++++++++++-------
>   2 files changed, 62 insertions(+), 14 deletions(-)
>
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
> index cffb0c46e0b1..0e648192df4d 100644
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -39,13 +39,17 @@ enum {
>   	ALLOCINFO_FILTER_FUNCTION,
>   	ALLOCINFO_FILTER_FILENAME,
>   	ALLOCINFO_FILTER_LINENO,
> -	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_LINENO
> +	ALLOCINFO_FILTER_MIN_SIZE,
> +	ALLOCINFO_FILTER_MAX_SIZE,
> +	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_MAX_SIZE
>   };
>   
>   #define ALLOCINFO_FILTER_MASK_MODNAME		(1 << ALLOCINFO_FILTER_MODNAME)
>   #define ALLOCINFO_FILTER_MASK_FUNCTION		(1 << ALLOCINFO_FILTER_FUNCTION)
>   #define ALLOCINFO_FILTER_MASK_FILENAME		(1 << ALLOCINFO_FILTER_FILENAME)
>   #define ALLOCINFO_FILTER_MASK_LINENO		(1 << ALLOCINFO_FILTER_LINENO)
> +#define ALLOCINFO_FILTER_MASK_MIN_SIZE		(1 << ALLOCINFO_FILTER_MIN_SIZE)
> +#define ALLOCINFO_FILTER_MASK_MAX_SIZE		(1 << ALLOCINFO_FILTER_MAX_SIZE)
>   
>   #define ALLOCINFO_FILTER_MASKS \
>   	((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> @@ -53,6 +57,8 @@ enum {
>   struct allocinfo_filter {
>   	__u64 mask; /* bitmask of the filter fields used */
>   	struct allocinfo_tag fields;
> +	__u64 min_size;
> +	__u64 max_size;
>   };
>   
>   struct allocinfo_get_at {
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index 93bc976ac505..ddc6946f56ab 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -191,15 +191,26 @@ static int allocinfo_cmp_str(const char *str, const char *template)
>   	return strncmp(allocinfo_str(str), template, ALLOCINFO_STR_SIZE);
>   }
>   
> +/* Fetch the per-CPU counters */
> +static inline struct alloc_tag_counters allocinfo_prefetch_counters(struct codetag *ct)
> +{
> +	return alloc_tag_read(ct_to_alloc_tag(ct));
> +}
> +
>   /*
>    * Populates the UAPI allocinfo_tag_data structure with active runtime
>    * profiling counters extracted from the given kernel codetag.
>    */
>   static void allocinfo_to_params(struct codetag *ct,
> -				struct allocinfo_tag_data *data)
> +				struct allocinfo_tag_data *data,
> +				struct alloc_tag_counters *counters)
>   {
> -	struct alloc_tag *tag = ct_to_alloc_tag(ct);
> -	struct alloc_tag_counters counter = alloc_tag_read(tag);
> +	struct alloc_tag_counters local_counters;
> +
> +	if (!counters) {
> +		local_counters = allocinfo_prefetch_counters(ct);
> +		counters = &local_counters;
> +	}
>   
>   	if (ct->modname)
>   		allocinfo_copy_str(data->tag.modname, ct->modname);
> @@ -208,9 +219,9 @@ static void allocinfo_to_params(struct codetag *ct,
>   	allocinfo_copy_str(data->tag.function, ct->function);
>   	allocinfo_copy_str(data->tag.filename, ct->filename);
>   	data->tag.lineno = ct->lineno;
> -	data->counter.bytes = counter.bytes;
> -	data->counter.calls = counter.calls;
> -	data->counter.accurate = !alloc_tag_is_inaccurate(tag);
> +	data->counter.bytes = counters->bytes;
> +	data->counter.calls = counters->calls;
> +	data->counter.accurate = !alloc_tag_is_inaccurate(ct_to_alloc_tag(ct));
>   }
>   
>   /*
> @@ -234,7 +245,9 @@ static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
>    * Verifies whether a given codetag satisfies the active filtering criteria by
>    * matching it's characteristics against the specified filter.
>    */
> -static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
> +static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
> +			   struct alloc_tag_counters *counters,
> +			   bool *fetched_counters)
>   {
>   	if (!filter || !filter->mask)
>   		return true;
> @@ -247,20 +260,34 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
>   				return false;
>   		} else if (allocinfo_cmp_str(ct->modname, filter->fields.modname))
>   			return false;
> +		}
It seems an extra } was accidentally added here
>   	}
>   
>   	if ((filter->mask & ALLOCINFO_FILTER_MASK_FUNCTION) &&
> -	    ct->function && (allocinfo_cmp_str(ct->function, filter->fields.function)))
> +	    ct->function && allocinfo_cmp_str(ct->function, filter->fields.function))
>   		return false;
>   
This should be fixed in the second patch; it's unrelated to current 
functionality.
>   	if ((filter->mask & ALLOCINFO_FILTER_MASK_FILENAME) &&
> -	    ct->filename && (allocinfo_cmp_str(ct->filename, filter->fields.filename)))
> +	    ct->filename && allocinfo_cmp_str(ct->filename, filter->fields.filename))
>   		return false;

Ditto


Thanks

Best Regards

Hao

>   	if ((filter->mask & ALLOCINFO_FILTER_MASK_LINENO) &&
>   	    ct->lineno != filter->fields.lineno)
>   		return false;
>   
> +	if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
> +		if (!*fetched_counters) {
> +			*counters = allocinfo_prefetch_counters(ct);
> +			*fetched_counters = true;
> +		}
> +		if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
> +		    counters->bytes < filter->min_size)
> +			return false;
> +		if ((filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
> +		    counters->bytes > filter->max_size)
> +			return false;
> +	}
> +
>   	return true;
>   }
>   
> @@ -274,6 +301,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
>   	struct codetag *ct;
>   	struct allocinfo_get_at params = {0};
>   	__u64 skip_count;
> +	struct alloc_tag_counters counters;
> +	bool fetched_counters;
>   
>   	if (copy_from_user(&params, arg, sizeof(params)))
>   		return -EFAULT;
> @@ -281,6 +310,11 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
>   	if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
>   		return -EINVAL;
>   
> +	if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
> +	    (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
> +	    params.filter.min_size > params.filter.max_size)
> +		return -EINVAL;
> +
>   	priv = m->private;
>   
>   	mutex_lock(&priv->ioctl_lock);
> @@ -304,7 +338,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
>   	ct = codetag_next_ct(&priv->ioctl_iter);
>   
>   	while (ct) {
> -		if (matches_filter(ct, &priv->filter)) {
> +		fetched_counters = false;
> +		if (matches_filter(ct, &priv->filter, &counters, &fetched_counters)) {
>   			if (skip_count == 0)
>   				break;
>   			skip_count--;
> @@ -313,7 +348,7 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
>   	}
>   
>   	if (ct) {
> -		allocinfo_to_params(ct, &params.data);
> +		allocinfo_to_params(ct, &params.data, fetched_counters ? &counters : NULL);
>   		priv->positioned = true;
>   	}
>   
> @@ -339,6 +374,8 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
>   	struct codetag *ct;
>   	struct allocinfo_tag_data params;
>   	int ret = 0;
> +	struct alloc_tag_counters counters;
> +	bool fetched_counters;
>   
>   	memset(&params, 0, sizeof(params));
>   	priv = m->private;
> @@ -352,10 +389,15 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
>   	}
>   
>   	ct = codetag_next_ct(&priv->ioctl_iter);
> -	while (ct && !matches_filter(ct, &priv->filter))
> +	while (ct) {
> +		fetched_counters = false;
> +		if (matches_filter(ct, &priv->filter, &counters, &fetched_counters))
> +			break;
>   		ct = codetag_next_ct(&priv->ioctl_iter);
> +	}
> +
>   	if (ct)
> -		allocinfo_to_params(ct, &params);
> +		allocinfo_to_params(ct, &params, fetched_counters ? &counters : NULL);
>   
>   	if (!ct) {
>   		priv->positioned = false;

