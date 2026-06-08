Return-Path: <linux-doc+bounces-91283-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 19TeFZMrJmonTAIAu9opvQ
	(envelope-from <linux-doc+bounces-91283-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 04:40:19 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A567652491
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 04:40:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=PZONv3Sx;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91283-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-91283-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D1053006530
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 02:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0910B2772D;
	Mon,  8 Jun 2026 02:40:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5884026E165
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 02:40:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780886416; cv=none; b=ZaSk2/m1lMxuFfXFeBKh9qntWxJqFWiPA6sYoOAJXJVSqxLQVj+/CNCJV/ZVCrZAfoGri6Xdxo+apQallXLbmRVkK1iwgCXjBxi8NiQ+YbcMiHFdnmL+WHP6szJYD0w45skOtvtsFMsiSB4AJ1v3OBoWYRfV8wQ+BK1Tgr9zIjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780886416; c=relaxed/simple;
	bh=OWf9u89WWdQ28sTozWzL/FWm30ukRbSCunUQvKzJlGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bh28B+EkPCSXkN2hVtN2Qt9V1nCTd5fsFhpMU19PlaXE+vcS8M1Ds1DW8jqmpSZwylcZbX9pkS+4imXl4tiTDQMsjMCaeAFipJ+LROFaCWQ/LIJw5XftaKED5IPKJfbPgjUztJJtv7ZYoDXaRGQShSR/J5mpHearVkYcgiKcXfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PZONv3Sx; arc=none smtp.client-ip=91.218.175.186
Message-ID: <d22d73ab-c519-4a50-b564-5d7299a3c3bd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780886412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v0gpJDAKgCFuGUDHr03K+7t/mGqVQAiRsAIfHMMh5/E=;
	b=PZONv3SxcPf4VhOuIPPWT8godfsZtgOX655I5MPm5mRsFV81qLuS1wFRBcyCPtuM4ERIRn
	zC5CBIPlWDFgzHMu0CYUhE8UnXXghr+CPuSlDSHsagHJZZ1eRA9/oquoUQf+sOGeJnnmxC
	HtLjhmWlWIitWCYcQ3n4O/gwECegJQM=
Date: Mon, 8 Jun 2026 10:39:29 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/6] alloc_tag: add ioctl filters to /proc/allocinfo
To: Abhishek Bapat <abhishekbapat@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Sourav Panda <souravpanda@google.com>
References: <cover.1780701922.git.abhishekbapat@google.com>
 <6f3b4aa0aa294cd56a73854c631de3ab7c0c5e01.1780701922.git.abhishekbapat@google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <6f3b4aa0aa294cd56a73854c631de3ab7c0c5e01.1780701922.git.abhishekbapat@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91283-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.dev:mid,linux.dev:dkim,linux.dev:from_mime,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A567652491

Hi Abhishek


Thanks for the new version.


On 2026/6/6 07:36, Abhishek Bapat wrote:
> Extend the capability of the IOCTL mechanism to filter allocations based
> on tag's module name, function name, file name and line number.
>
> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>


Acked-by: Hao Ge <hao.ge@linux.dev>


> ---
>   include/uapi/linux/alloc_tag.h | 26 ++++++++++++-
>   lib/alloc_tag.c                | 68 ++++++++++++++++++++++++++++++++--
>   2 files changed, 89 insertions(+), 5 deletions(-)
>
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
> index 901199bad514..cffb0c46e0b1 100644
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -34,8 +34,32 @@ struct allocinfo_tag_data {
>   	struct allocinfo_counter counter;
>   };
>   
> +enum {
> +	ALLOCINFO_FILTER_MODNAME,
> +	ALLOCINFO_FILTER_FUNCTION,
> +	ALLOCINFO_FILTER_FILENAME,
> +	ALLOCINFO_FILTER_LINENO,
> +	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_LINENO
> +};
> +
> +#define ALLOCINFO_FILTER_MASK_MODNAME		(1 << ALLOCINFO_FILTER_MODNAME)
> +#define ALLOCINFO_FILTER_MASK_FUNCTION		(1 << ALLOCINFO_FILTER_FUNCTION)
> +#define ALLOCINFO_FILTER_MASK_FILENAME		(1 << ALLOCINFO_FILTER_FILENAME)
> +#define ALLOCINFO_FILTER_MASK_LINENO		(1 << ALLOCINFO_FILTER_LINENO)
> +
> +#define ALLOCINFO_FILTER_MASKS \
> +	((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> +
> +struct allocinfo_filter {
> +	__u64 mask; /* bitmask of the filter fields used */
> +	struct allocinfo_tag fields;
> +};
> +
>   struct allocinfo_get_at {
> -	__u64 pos;	/* input */
> +	/* inputs */
> +	__u64 pos;
> +	struct allocinfo_filter filter;
> +	/* output */
>   	struct allocinfo_tag_data data;
>   };
>   
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index a0577215eb3d..93bc976ac505 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -49,6 +49,7 @@ struct allocinfo_private {
>   	struct codetag_iterator iter;
>   	struct codetag_iterator reported_iter;
>   	bool print_header;
> +	struct allocinfo_filter filter;
>   	/* ioctl uses a separate iterator not to interfere with reads */
>   	struct codetag_iterator ioctl_iter;
>   	bool positioned; /* seq_open_private() sets to 0 */
> @@ -184,6 +185,12 @@ static void allocinfo_copy_str(char *dest, const char *src)
>   	strscpy_pad(dest, allocinfo_str(src), ALLOCINFO_STR_SIZE);
>   }
>   
> +/* Compare two strings and only consider the trimmed suffix if s1 is too long */
> +static int allocinfo_cmp_str(const char *str, const char *template)
> +{
> +	return strncmp(allocinfo_str(str), template, ALLOCINFO_STR_SIZE);
> +}
> +
>   /*
>    * Populates the UAPI allocinfo_tag_data structure with active runtime
>    * profiling counters extracted from the given kernel codetag.
> @@ -223,6 +230,40 @@ static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
>   	return 0;
>   }
>   
> +/*
> + * Verifies whether a given codetag satisfies the active filtering criteria by
> + * matching it's characteristics against the specified filter.


nit: s/it's/its/


> + */
> +static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
> +{
> +	if (!filter || !filter->mask)
> +		return true;
> +
> +	if (filter->mask & ALLOCINFO_FILTER_MASK_MODNAME) {
> +		/* user wants to filter by modname but ct->modname is NULL */
> +		if (!ct->modname) {
> +			/* validate if user was attempting to filter for built-in allocations */
> +			if (filter->fields.modname[0] != '\0')
> +				return false;
> +		} else if (allocinfo_cmp_str(ct->modname, filter->fields.modname))
> +			return false;
> +	}
> +
> +	if ((filter->mask & ALLOCINFO_FILTER_MASK_FUNCTION) &&
> +	    ct->function && (allocinfo_cmp_str(ct->function, filter->fields.function)))
> +		return false;
> +
> +	if ((filter->mask & ALLOCINFO_FILTER_MASK_FILENAME) &&
> +	    ct->filename && (allocinfo_cmp_str(ct->filename, filter->fields.filename)))
> +		return false;
> +
> +	if ((filter->mask & ALLOCINFO_FILTER_MASK_LINENO) &&
> +	    ct->lineno != filter->fields.lineno)
> +		return false;
> +
> +	return true;
> +}
> +
>   /*
>    * Seeks the ioctl iterator to the specified 0-indexed tag position, reads its
>    * profiling data and returns it to userspace.
> @@ -231,29 +272,46 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
>   {
>   	struct allocinfo_private *priv;
>   	struct codetag *ct;
> -	__u64 pos;
>   	struct allocinfo_get_at params = {0};
> +	__u64 skip_count;
>   
>   	if (copy_from_user(&params, arg, sizeof(params)))
>   		return -EFAULT;
>   
> +	if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
> +		return -EINVAL;
> +
>   	priv = m->private;
> -	pos = params.pos;
>   
>   	mutex_lock(&priv->ioctl_lock);
>   	codetag_lock_module_list(alloc_tag_cttype);
>   
> -	if (pos >= codetag_get_count(alloc_tag_cttype)) {
> +	if (params.pos >= codetag_get_count(alloc_tag_cttype)) {
>   		codetag_unlock_module_list(alloc_tag_cttype);
>   		mutex_unlock(&priv->ioctl_lock);
>   		return -ENOENT;
>   	}
>   
> +	skip_count = params.pos;
> +
> +	if (params.filter.mask)
> +		priv->filter = params.filter;
> +	else
> +		priv->filter.mask = 0;
> +
>   	/* Find the codetag */
>   	priv->ioctl_iter = codetag_get_ct_iter(alloc_tag_cttype);
>   	ct = codetag_next_ct(&priv->ioctl_iter);
> -	while (ct && pos--)
> +
> +	while (ct) {
> +		if (matches_filter(ct, &priv->filter)) {
> +			if (skip_count == 0)
> +				break;
> +			skip_count--;
> +		}
>   		ct = codetag_next_ct(&priv->ioctl_iter);
> +	}
> +
>   	if (ct) {
>   		allocinfo_to_params(ct, &params.data);
>   		priv->positioned = true;
> @@ -294,6 +352,8 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
>   	}
>   
>   	ct = codetag_next_ct(&priv->ioctl_iter);
> +	while (ct && !matches_filter(ct, &priv->filter))
> +		ct = codetag_next_ct(&priv->ioctl_iter);
>   	if (ct)
>   		allocinfo_to_params(ct, &params);
>   

