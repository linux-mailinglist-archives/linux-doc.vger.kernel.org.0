Return-Path: <linux-doc+bounces-64590-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA91C0AE0F
	for <lists+linux-doc@lfdr.de>; Sun, 26 Oct 2025 17:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1517A3B3A3F
	for <lists+linux-doc@lfdr.de>; Sun, 26 Oct 2025 16:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DEE262FCB;
	Sun, 26 Oct 2025 16:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WO7InBdG"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B4E246798
	for <linux-doc@vger.kernel.org>; Sun, 26 Oct 2025 16:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761497020; cv=none; b=bsZrcG4m6HvmF9UHxe5EM9Nl1PgQIPKgAXRY5nMgn0JlPWsSwN5QHl1ZVdbo1K80iv9dGdq9f5EzIFpMrsCps207luCUotMrTTQDstyTWjXlRWZicMOn8o44NnbxKxrQeWFh4Tp1X8cgGKfqLbixiNuKxQxVuasfeC39sA9+974=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761497020; c=relaxed/simple;
	bh=S7l9pmdXezrNoONzBo7VKhQ787eN1v3dPSRTEBW4R8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QuxNGgwDbpgmottyzUeLZv5P486ELa7Baj4yhc+MJ4TAJg1/kVhrtmkGGHG1UhM0nqm/jXNNo9Tl4Sban0sDqev2/8NJQCkKbMFXHfeD6xerN3gpxbeqksDh0Gv8TIxU4VJ4jsDEZoi2qh1PDsHjnPN0dsPwle/srmzYDBbrJVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WO7InBdG; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=xx1eSXOBFyIQ6PX/QX/246YAxPJMyIW4I2svMLjGYxo=; b=WO7InBdGwUd1oRraTA8bh2emD9
	Ta5DYSNamYT+ZZvF1wspNrXcrWb68sx/k0LB//vdANCUCa94YP92bib2pRd8EZ5nVP+9ZwsWviuUY
	VLNhgsSbGhpXZuewGegkk+Brn80K0S1F04NuIclxjTprpox/8rHt/nZrdQhuiKi9KoVQBWJ1lP9Ld
	gsDppss1FfGVUoqEEHy4Wp2waajB+KGQodzSU1CmEmWzpje1aqiONWwt7bLJuJzrM3ezDYvkoKv66
	hZ4zZQmTwYP1MyKymM80zweo9hIaWgk5x+NXPL2ns/1SOfSzmzKVikh4WQGWSHx4QBC5Uk+O6IDIC
	AbsjosIQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD3qB-0000000CY2L-44iU;
	Sun, 26 Oct 2025 16:43:36 +0000
Message-ID: <af5d13a3-54ae-443b-bcc4-0b7de2f29ff0@infradead.org>
Date: Sun, 26 Oct 2025 09:43:34 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: about make mandocs warnings
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <efbccba7-7377-409d-9d0a-4e99b464e2ab@infradead.org>
 <20251026085906.2d7e1d70@sal.lan>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251026085906.2d7e1d70@sal.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

On 10/26/25 4:59 AM, Mauro Carvalho Chehab wrote:
> Em Sat, 25 Oct 2025 16:49:21 -0700
> Randy Dunlap <rdunlap@infradead.org> escreveu:
> 
>> Hi Mauro,
>>
>>
>> 'make mandocs' on the full kernel tree generates a little over 10,000
>> lines of Warning:s.  Then it says:
>>   Warning: kernel-doc returned 138 warnings
>>
>> What does that number mean?
> 
> Basically, at kdoc_files, we have:
> 
>     def warning(self, msg):
>         """Ancillary routine to output a warning and increment error count"""
> 
>         self.config.log.warning(msg)
>         self.errors += 1
> 
>     def error(self, msg):
>         """Ancillary routine to output an error and increment error count"""
> 
>         self.config.log.error(msg)
>         self.errors += 1
> 
> And kernel-doc itself exits with:
> 
> 	error_count = kfiles.errors
> 	sys.exit(error_count)

Oh, the warnings message comes from sphinx-build-wrapper.

> I guess the problem here is that POSIX exit codes are 8 bits only, so
> it ends reporting a wrong number of errors. Not sure what would be the
> best way to fix it.

and it's modulo 256, so exiting with 256 looks like exiting with 0.
Maybe just limit the number of warnings reported to 255 if it is > 255,
with a note in the source code.

>> kernel-doc is doing a very good job at finding issues in kernel-doc
>> notation, but there are a few cases of erroneous reporting. These are not
>> numerous and may not be worth much effort to fix them, although
>> some of them should not take much effort (I think). But I am just
>> reporting these in case someone wants to fix them.
>>
>>
>> Examples:
>>
>> Warning: drivers/misc/vmw_balloon.c:259 struct member '5' not described in 'vmballoon_batch_entry'
>> "5" is part of an expression "PAGE_SHIFT - 5" for number of bits in a bitfield:
>> struct vmballoon_batch_entry {
>> 	u64 status : 5;
>> 	u64 reserved : PAGE_SHIFT - 5;
>> 	u64 pfn : 52;
>> } __packed;
> 
> Fixing this one could be tricky, if we want to allow math expressions 
> at the regex, but sounds doable.
> 
>>
>> Warning: net/netfilter/nft_set_pipapo.h:102 union member '32' not described in 'nft_pipapo_map_bucket'
>> "32" is part of a static_assert() expression. Probably just
>> ignore the entire static_assert() [any number of lines].
> 
> Yeah.
> 
>> Warning: include/linux/hrtimer_types.h:47 Invalid param: enum hrtimer_restart            (*__private function)(struct hrtimer *)
>> Warning: include/linux/hrtimer_types.h:47 struct member 'enum hrtimer_restart            (*__private function' not described in 'hrtimer'
>> "__private" is an attribute from <linux/compiler_types.h> and the
>> struct member here should be "function", which is described.
>>
>>
>> Warning: include/linux/rethook.h:38 Invalid param: void (__rcu *handler) (struct rethook_node *, void *, unsigned long, struct pt_regs *)
>> Warning: include/linux/rethook.h:38 struct member 'void (__rcu *handler' not described in 'rethook'
>> "__rcu" is an attribute from <linux/compiler_types.h> and the
>> struct member here is "handler", which is described.
>>
>> Warning: security/ipe/hooks.c:54 function parameter '__always_unused' not described in 'ipe_mmap_file'
>> Warning: security/ipe/hooks.c:82 function parameter '__always_unused' not described in 'ipe_file_mprotect'
>> "__always_unused" is an attribute from <linux/compiler_attributes.h>.
>>
> 
> Probably all we need for the above is to add one line for each,
> to ignore the above macros.
> 
>>
>> Warning: security/landlock/fs.c:765 Invalid param: layer_mask_t (*const layer_masks_parent1)[LANDLOCK_NUM_ACCESS_FS]
>> Warning: security/landlock/fs.c:765 function parameter 'layer_mask_t (*const layer_masks_parent1' not described in 'is_access_to_paths_allowed'
>> Warning: security/landlock/fs.c:765 Invalid param: layer_mask_t (*const layer_masks_parent2)[LANDLOCK_NUM_ACCESS_FS]
>> Warning: security/landlock/fs.c:765 function parameter 'layer_mask_t (*const layer_masks_parent2' not described in 'is_access_to_paths_allowed'
>> @layer_masks_parent1 and @layer_masks_parent2 are described in kernel-doc.
>>
>> Warning: security/landlock/fs.c:1142 Invalid param: layer_mask_t (*const layer_masks_dom)[LANDLOCK_NUM_ACCESS_FS]
>> Warning: security/landlock/fs.c:1142 function parameter 'layer_mask_t (*const layer_masks_dom' not described in 'collect_domain_accesses'
>> @layer_masks_dom is described in kernel-doc.
>>
>>
>> Warning: security/landlock/ruleset.c:210 Invalid param: const struct landlock_layer (*const layers)[]
>> Warning: security/landlock/ruleset.c:210 function parameter 'const struct landlock_layer (*const layers' not described in 'insert_rule'
>> @layers is described in kernel-doc.
>>
>> Warning: security/landlock/ruleset.c:693 Invalid param: layer_mask_t (*const layer_masks)[]
>> Warning: security/landlock/ruleset.c:693 function parameter 'layer_mask_t (*const layer_masks' not described in 'landlock_init_layer_masks'
>> @layer_masks is described in kernel-doc.
> 
> These would require some extra logic - or a fix at an existing one - to 
> better handle parenthesis on arguments.
> 
>> Note: hundreds (probably thousands) of the mandocs warnings would disappear
>> if kernel-doc accepted '-' in addition to ':' as a function parameter
>> or struct/union/enum member separator (like it does for
>> function/struct/union/enum short description).
> 
> This is easy to fix, and QEMU has a patch mentioning what is needed
> at:
> 	9cbe72b868b7 ("scripts/kernel-doc: tweak for QEMU coding standards")
> 
> on its description: basically two regexes from Perl code would need changes:
> 
>         -       if (/\s*([\w\s]+?)(\(\))?\s*-/) {
>         +       if (/\s*([\w\s]+?)(\s*-|:)/) {
> 
> and:
>         -       if (/-(.*)/) {
>         +       if (/[-:](.*)/) {
> 
> If I'm not mistaken, I got rid of the second regex during rewrite,
> but I might be wrong. If I recall correctly, with Python code, the
> change would be aon a single place at scripts/lib/kdoc/kdoc_parser.py:
> 
> 	doc_sect = doc_com + \
> -	    KernRe(r'\s*(@[.\w]+|@\.\.\.|' + known_section_names + r')\s*:([^:].*)?$',
> +	    KernRe(r'\s*(@[.\w]+|@\.\.\.|' + known_section_names + r')\s*[:-]([^:].*)?$',
> 	           flags=re.I, cache=False)
> 
> btw, the [^:] pattern there seems to be trying to avoid catching
> "::". With the new proposed regex, and if "::" is something that we
> need to avoid, if one uses "-:", it would miss the description. 
> I guess that's ok.
> 
> From my side, I'm OK with the new regex, but one has to verify if
> this won't cause unwanted side-effects.

Yes, for sure. I'm willing to do some testing on a patch.
Should I begin with the KernRe() change above?Thanks for your comments.
-- 
~Randy


