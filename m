Return-Path: <linux-doc+bounces-92582-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GY5VHwgiMmpyvQUAu9opvQ
	(envelope-from <linux-doc+bounces-92582-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 06:26:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E705D69667D
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 06:26:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=RWy+6Acq;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92582-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-92582-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E95A2303EB8D
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 04:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D9E311C1D;
	Wed, 17 Jun 2026 04:26:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAA3306743
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 04:26:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781670406; cv=none; b=TkikSr7rQNki7fo3fWRU4Xtoh4Voeq15PAly39a6CNRsrLm5m+B6zexJt2CoYKkz+x8Mh0zcOqsPWC/bBAs6gyArr0+j8HyogzCQ6z/o18GIBiP0QXZmL1O2lNxKghXfeL3vmzuyC52hv3CBeuA3RNDctXvIT6K13fcUwZeotDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781670406; c=relaxed/simple;
	bh=2g6s2gKzAUBwN0rExxu5x29/yuU0A7TpIhem5kAZ9os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kssAkpHH2WPI5h/VCfhYHX+t28y45EbmEy/57Qz9m6VdMGv5t08PraQdP8TBXVBZPixr9x5g/TBqxfM8n5w3XvcZsY42dPXVSV/BipbjOZicRr7VNDJ+qvTEAeYnLY9isWURmHPm2QZfAwVsczIe6VCF+osajlRbqly+6WvIXu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RWy+6Acq; arc=none smtp.client-ip=95.215.58.189
Date: Wed, 17 Jun 2026 12:26:08 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781670392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uq70pVdz6YKZLfbdKy0h09bc+19np/RW+u0WBUf03HQ=;
	b=RWy+6AcqD5IlFQWwjNyPnNYdTylEhmJ5KcGETwljXFmsDV4A8L8IBz1Jcua0G8m8z5zWQ3
	BEM032kvw/+DlUkUqeg6Opylm1/MnXc2jybmBKCatOPuMaof1XLczC05vgcdPMUv+pddb1
	E5lhp18VT5/D42mrY0DYLOQKE8NngJk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Li <hao.li@linux.dev>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, Harry Yoo <harry@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, liam@infradead.org, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] mm/slub: factor user tracking metadata size
 calculation
Message-ID: <ajIg4JCDhz_yAnOX@fedora>
References: <20260616141410.52117-1-pengpeng@iscas.ac.cn>
 <20260616141410.52117-2-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616141410.52117-2-pengpeng@iscas.ac.cn>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:vbabka@kernel.org,m:akpm@linux-foundation.org,m:linux-mm@kvack.org,m:harry@kernel.org,m:cl@gentwo.org,m:rientjes@google.com,m:roman.gushchin@linux.dev,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hao.li@linux.dev,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-92582-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hao.li@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,iscas.ac.cn:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E705D69667D

On Tue, Jun 16, 2026 at 10:14:07PM +0800, Pengpeng Hou wrote:
> SLAB_STORE_USER currently stores two struct track records in the per-object
> debug metadata.  The size is open-coded as 2 * sizeof(struct track) in
> several layout and offset calculations.
> 
> Add TRACK_NR and a small helper for the user-tracking metadata size.  This
> keeps all offset calculations tied to the number of track records and makes
> the following extension less error-prone.
> 
> No functional change.

Do we really need a user_tracking_size helper? This seems introducing some
redundant checking for SLAB_STORE_USER.

For example in set_orig_size(), obj_exts_offset_in_object() and
check_pad_bytes()

redundant checking may be confused...

> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  mm/slub.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index f87e693aca5d..43d4febd5bf2 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -327,7 +327,15 @@ struct track {
>  	unsigned long when;	/* When did the operation occur */
>  };
>  
> -enum track_item { TRACK_ALLOC, TRACK_FREE };
> +enum track_item { TRACK_ALLOC, TRACK_FREE, TRACK_NR };
> +
> +static inline unsigned int user_tracking_size(slab_flags_t flags)
> +{
> +	if (flags & SLAB_STORE_USER)
> +		return TRACK_NR * sizeof(struct track);
> +
> +	return 0;
> +}
>  
>  #ifdef SLAB_SUPPORTS_SYSFS
>  static int sysfs_slab_add(struct kmem_cache *);
> @@ -751,7 +759,7 @@ static inline void set_orig_size(struct kmem_cache *s,
>  		return;
>  
>  	p += get_info_end(s);
> -	p += sizeof(struct track) * 2;
> +	p += user_tracking_size(s->flags);
>  
>  	*(unsigned long *)p = orig_size;
>  }
> @@ -767,7 +775,7 @@ static inline unsigned long get_orig_size(struct kmem_cache *s, void *object)
>  		return s->object_size;
>  
>  	p += get_info_end(s);
> -	p += sizeof(struct track) * 2;
> +	p += user_tracking_size(s->flags);
>  
>  	return *(unsigned long *)p;
>  }
> @@ -885,7 +893,7 @@ static unsigned int obj_exts_offset_in_object(struct kmem_cache *s)
>  	unsigned int offset = get_info_end(s);
>  
>  	if (kmem_cache_debug_flags(s, SLAB_STORE_USER))
> -		offset += sizeof(struct track) * 2;
> +		offset += user_tracking_size(s->flags);
>  
>  	if (slub_debug_orig_size(s))
>  		offset += sizeof(unsigned long);
> @@ -1088,7 +1096,7 @@ static void init_tracking(struct kmem_cache *s, void *object)
>  		return;
>  
>  	p = get_track(s, object, TRACK_ALLOC);
> -	memset(p, 0, 2*sizeof(struct track));
> +	memset(p, 0, user_tracking_size(s->flags));
>  }
>  
>  static void print_track(const char *s, struct track *t, unsigned long pr_time)
> @@ -1196,8 +1204,7 @@ static void print_trailer(struct kmem_cache *s, struct slab *slab, u8 *p)
>  
>  	off = get_info_end(s);
>  
> -	if (s->flags & SLAB_STORE_USER)
> -		off += 2 * sizeof(struct track);
> +	off += user_tracking_size(s->flags);
>  
>  	if (slub_debug_orig_size(s))
>  		off += sizeof(unsigned long);
> @@ -1401,7 +1408,7 @@ static int check_pad_bytes(struct kmem_cache *s, struct slab *slab, u8 *p)
>  
>  	if (s->flags & SLAB_STORE_USER) {
>  		/* We also have user information there */
> -		off += 2 * sizeof(struct track);
> +		off += user_tracking_size(s->flags);
>  
>  		if (s->flags & SLAB_KMALLOC)
>  			off += sizeof(unsigned long);
> @@ -7820,7 +7827,7 @@ static int calculate_sizes(struct kmem_cache_args *args, struct kmem_cache *s)
>  		 * Need to store information about allocs and frees after
>  		 * the object.
>  		 */
> -		size += 2 * sizeof(struct track);
> +		size += user_tracking_size(flags);
>  
>  		/* Save the original kmalloc request size */
>  		if (flags & SLAB_KMALLOC)
> -- 
> 2.43.0
> 

-- 
Thanks,
Hao

