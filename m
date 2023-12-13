Return-Path: <linux-doc+bounces-4273-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A203F8073C3
	for <lists+linux-doc@lfdr.de>; Wed,  6 Dec 2023 16:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3303FB20DBE
	for <lists+linux-doc@lfdr.de>; Wed,  6 Dec 2023 15:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5773FE58;
	Wed,  6 Dec 2023 15:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="m1YhFPmr";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="7YW5jA8T"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E89678F;
	Wed,  6 Dec 2023 07:35:55 -0800 (PST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D1D3621EDC;
	Wed,  6 Dec 2023 15:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1701876952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MPLvnW7ZSTaItCwPS0Rs0fycg4VzNS6jtgADrntBHWI=;
	b=m1YhFPmrGb8yFFE0iGNJBVb49mN07g3GoS9QrTSI+9aCnMODpfldcMFZVYHd5R9FnPzg+A
	FiXc/XRICrwbYE96Vu1thfM3obSDopxGJ2XOFK9Pb3cqCBgh6UTmsEeOrBDUhTMJwpkeVt
	hXP61Idu7b1V9Qoby/CiVaZ83T9R+KU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1701876952;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MPLvnW7ZSTaItCwPS0Rs0fycg4VzNS6jtgADrntBHWI=;
	b=7YW5jA8TGWCdGZ7MTAAbhhKby0KvmhhWE3KYFWDFfebmyxPT7OdzX/8p1fREU9TGfePOOB
	P5v2eDmY/8Efb9CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC7BD13408;
	Wed,  6 Dec 2023 15:35:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7BszKdiUcGUMUAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 06 Dec 2023 15:35:52 +0000
Message-ID: <8c140ae5-50ad-5a02-0e1c-eae33c13f47c@suse.cz>
Date: Wed, 6 Dec 2023 16:35:52 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/3] Documentation: kernel-parameters: remove
 noaliencache
Content-Language: en-US
To: sxwjean@me.com, 42.hyeyoo@gmail.com, cl@linux.com, linux-mm@kvack.org
Cc: penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com,
 roman.gushchin@linux.dev, corbet@lwn.net, keescook@chromium.org,
 arnd@arndb.de, akpm@linux-foundation.org, gregkh@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xiongwei Song <xiongwei.song@windriver.com>
References: <20231203001501.126339-1-sxwjean@me.com>
 <20231203001501.126339-2-sxwjean@me.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20231203001501.126339-2-sxwjean@me.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Score: 1.20
X-Spamd-Result: default: False [1.20 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FREEMAIL_TO(0.00)[me.com,gmail.com,linux.com,kvack.org];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_MATCH_FROM(0.00)[];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,me.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[16];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]

On 12/3/23 01:14, sxwjean@me.com wrote:
> From: Xiongwei Song <xiongwei.song@windriver.com>
> 
> Since slab allocator has already been removed. There is no users about

"There are no users of the noaliencache parameter" ...

> noaliencache, so let's remove it.
> 
> Suggested-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Xiongwei Song <xiongwei.song@windriver.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

> ---
> Hi Hyeonggon & Christoph,
> 
> I didn't pick your Acked-by tags because I removed the changes for 
> slab_max_order. Would you like to allow me to add them in this patch?
> 
> Regards,
> Xiongwei
> 
> v4: Collect Reviewed-by tag.
> v3: Remove the changes for slab_max_order.
> v2: Add changes for removing "noaliencache".
>     https://lore.kernel.org/linux-mm/20231122143603.85297-1-sxwjean@me.com/
> v1: Remove slab_max_order.
>     https://lore.kernel.org/linux-mm/20231120091214.150502-2-sxwjean@me.com/
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 65731b060e3f..9f94baeb2f82 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3740,10 +3740,6 @@
>  	no5lvl		[X86-64,RISCV] Disable 5-level paging mode. Forces
>  			kernel to use 4-level paging instead.
>  
> -	noaliencache	[MM, NUMA, SLAB] Disables the allocation of alien
> -			caches in the slab allocator.  Saves per-node memory,
> -			but will impact performance.
> -
>  	noalign		[KNL,ARM]
>  
>  	noaltinstr	[S390] Disables alternative instructions patching


