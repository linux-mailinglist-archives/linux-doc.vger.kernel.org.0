Return-Path: <linux-doc+bounces-26955-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 601C4997131
	for <lists+linux-doc@lfdr.de>; Wed,  9 Oct 2024 18:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 146472869A7
	for <lists+linux-doc@lfdr.de>; Wed,  9 Oct 2024 16:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BB21EF935;
	Wed,  9 Oct 2024 16:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="JRmBRPPy";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="UpCUCcPH";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="JRmBRPPy";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="UpCUCcPH"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B221EF926
	for <linux-doc@vger.kernel.org>; Wed,  9 Oct 2024 16:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728490279; cv=none; b=lIwR5yUL8SH52cCDOkcx1j3eGzk4cOeYv2z+/SJRsyP1LTcyYsxCQXxihYCcwzjtyNwi0fnAGsAV7KcTui8jmfDhgC1gazkIBijKaEmLUHfu0l76LXR3Eu+0kKDpD8fbqp63ISaDV+QrKnWBWYf+A2dZapynpLOD6D27B0+Wnos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728490279; c=relaxed/simple;
	bh=eK4LEvg2h+HFu6Ww8R4DOChipPjAq27JyN4fFRiOdMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KcU3rEuMRan/oSOXbVKDwQTQcil5FShACtbg+HIo5bgJ8DN5WGArZH+RyJSEv4me7sFeN80ZSmAiiM+l7vIdrBv3e89nMtC1VrXlo4B5+cSJiB0YXx4EshlPGbNo69y17gg3tW3KWuwB5Ej/3yKccXzSNuVTINgwuemjTSO8rgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=JRmBRPPy; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=UpCUCcPH; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=JRmBRPPy; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=UpCUCcPH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 97C641FB5A;
	Wed,  9 Oct 2024 16:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1728490275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=G4f8OY+mny5OIX5EQKRFIm7qlUVDzM4gfsFI3tA7AMc=;
	b=JRmBRPPybtviL8RYVdRfjoLbFe1rN5A9LUDsbPOAoRsfmYm6uaBfjNMctPh4i3Mn2bOaNP
	jtYhGeJu+hlqCpCdShO1bABJIvrrK55v/5zgF3P7AQNxC0LBQr/+rDm/xdwbXLkSOCIaxk
	8b1ZPdj1tSbM7cZmg/KyxkOulG4yfPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1728490275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=G4f8OY+mny5OIX5EQKRFIm7qlUVDzM4gfsFI3tA7AMc=;
	b=UpCUCcPHElRoSE9l9ChI3bbdlAMZHP2Rvwj79ky8pEZ0h5BRYaj+Z/xnnui8JWqZl+GWuI
	HcskvsDjlD3mR8AQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=JRmBRPPy;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=UpCUCcPH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1728490275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=G4f8OY+mny5OIX5EQKRFIm7qlUVDzM4gfsFI3tA7AMc=;
	b=JRmBRPPybtviL8RYVdRfjoLbFe1rN5A9LUDsbPOAoRsfmYm6uaBfjNMctPh4i3Mn2bOaNP
	jtYhGeJu+hlqCpCdShO1bABJIvrrK55v/5zgF3P7AQNxC0LBQr/+rDm/xdwbXLkSOCIaxk
	8b1ZPdj1tSbM7cZmg/KyxkOulG4yfPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1728490275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=G4f8OY+mny5OIX5EQKRFIm7qlUVDzM4gfsFI3tA7AMc=;
	b=UpCUCcPHElRoSE9l9ChI3bbdlAMZHP2Rvwj79ky8pEZ0h5BRYaj+Z/xnnui8JWqZl+GWuI
	HcskvsDjlD3mR8AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 805E113A58;
	Wed,  9 Oct 2024 16:11:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aiD6HiOrBmfYZQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 09 Oct 2024 16:11:15 +0000
Message-ID: <f6fa720b-e8af-4afa-906f-29019aefe49a@suse.cz>
Date: Wed, 9 Oct 2024 18:11:15 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm, slab: add kerneldocs for common SLAB_ flags
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, David Rientjes <rientjes@google.com>,
 Christoph Lameter <cl@linux.com>, Randy Dunlap <rdunlap@infradead.org>
Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org
References: <20241009142936.56092-2-vbabka@suse.cz>
 <878quxe2kw.fsf@trenco.lwn.net>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <878quxe2kw.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 97C641FB5A
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux-foundation.org,kvack.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:mid,suse.cz:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 10/9/24 17:08, Jonathan Corbet wrote:
> Vlastimil Babka <vbabka@suse.cz> writes:
> 
>> We have many SLAB_ flags but many are used only internally, by kunit
>> tests or debugging subsystems cooperating with slab, or are set
>> according to slab_debug boot parameter.
>>
>> Create kerneldocs for the commonly used flags that may be passed to
>> kmem_cache_create(). SLAB_TYPESAFE_BY_RCU already had a detailed
>> description, so turn it to a kerneldoc. Add some details for
>> SLAB_ACCOUNT, SLAB_RECLAIM_ACCOUNT and SLAB_HWCACHE_ALIGN. Reference
>> them from the __kmem_cache_create_args() kerneldoc.
>>
>> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
>> ---
>> I plan to take this in the slab tree, but a question for Jon/linux-doc:
>>
>> I think I'm doing properly the "Object-like macro documentation" for
>> parameter-less macros from the doc-guide. Yet I can see in the htmldocs
>> things like "SLAB_TYPESAFE_BY_RCU ()" and "Parameters". Is there a bug
>> in the sphinx machinery? Thanks.
> 
> No, it's totally bug-free and any appearance to the contrary is entirely
> in your imagination :)

:)

> I don't think anybody has tried to do kerneldoc for macros that don't
> look like functions; it doesn't surprise me that it doesn't work right. 

I tried to follow the Documentation/doc-guide/kernel-doc.rst section
"Object-like macro documentation" here. Looks like it's been added only in
January this year via commit 91a3d6be99e63 by Randy and references commit
cbb4d3e6510b implementing the support for that from 2014 (was it even sphinx
based back then?)

The DRM_GEM_VRAM_PLANE_HELPER_FUNCS from the example there still exists
(include/drm/drm_gem_vram_helper.h) and seems to have the same rendering
issue here. Somewhat weirdly it doesn't use the "define" keyword that the
example does. DRM_GEM_VRAM_DRIVER in the same file does have the "define"
keyword and with the same result.

>>  include/linux/slab.h | 60 ++++++++++++++++++++++++++++++--------------
>>  mm/slab_common.c     | 14 ++++++++++-
>>  2 files changed, 54 insertions(+), 20 deletions(-)
>>
>> diff --git a/include/linux/slab.h b/include/linux/slab.h
>> index b35e2db7eb0e..49e9fb93e864 100644
>> --- a/include/linux/slab.h
>> +++ b/include/linux/slab.h
>> @@ -77,7 +77,17 @@ enum _slab_flag_bits {
>>  #define SLAB_POISON		__SLAB_FLAG_BIT(_SLAB_POISON)
>>  /* Indicate a kmalloc slab */
>>  #define SLAB_KMALLOC		__SLAB_FLAG_BIT(_SLAB_KMALLOC)
>> -/* Align objs on cache lines */
>> +/**
>> + * define SLAB_HWCACHE_ALIGN - Align objects on cache line boundaries.
>> + *
>> + * Sufficiently large objects are aligned on cache line boundary. For object
>> + * size smaller than a half of cache line size, the alignment is on the half of
>> + * cache line size. In general, if object size is smaller than 1/2^n of cache
>> + * line size, the alignment is adjusted to 1/2^n.
> 
> I'm kind of surprised that kernel-doc doesn't complain about that; it's
> definitely not something that was ever envisioned, as far as I know.
> 
> Making it work properly probably requires somebody to wander into Perl
> regex hell.  In the short term, if you want to get this text into the
> rendered docs, the usual approach is to make a DOC: block out of it and
> include it explicitly.

Thanks for the hints. I hope if we can agree that documenting the macros was
intended to be supported, doesn't break the build (there are users already)
and has only those minor rendering issues, it can be used?

> Thanks,
> 
> jon


