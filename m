Return-Path: <linux-doc+bounces-94852-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uMNwJdTNR2o/fgAAu9opvQ
	(envelope-from <linux-doc+bounces-94852-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 16:57:24 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D1C703A80
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 16:57:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b="UDBNB8/0";
	dmarc=pass (policy=none) header.from=linux.dev;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94852-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94852-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5E773024A38
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 14:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE2B2367D3;
	Fri,  3 Jul 2026 14:51:01 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4759D375F69
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 14:51:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783090261; cv=none; b=ETfVT4wgAyfbFUqLNrNXPnLaMPigHUzRas+ZgoF+ZJT0as4gTXXlNANt/IpJN7xqFVkJJg+I7v7nE5erEbpqnhP5D5rRjnQj40LSvB7+Z5CVzNfCheg+QYWOsaqlKrrHGvn8/PNChwROffXv7OcHyBJ2y3bSYjpFN2rpJ7blPco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783090261; c=relaxed/simple;
	bh=D5ud8qWqRJ9MykIWJlRVr4bTYlYROne+B+OgA5icF38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C6GfpQ3TjKZoa6BjiPRBgTc9r0wK5IEi0cp8WCOZ00S47W4MN0S9WtbzfxM4NF1eriwvbkJfeo0FEaw76qfiigCdcswttp9F2hkTlg/UlRMF1IR2CmMRSWlC2JWGJp/BR9tAm16uP4AbyKXgBtATiK1Zusyx77lVvHVilX8kPlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UDBNB8/0; arc=none smtp.client-ip=91.218.175.185
Message-ID: <8f75dc18-dd4c-4989-a76c-eec6cc513ccf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783090246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CXlZY4gPG+zU33k3H0xm4g/0VaNA0tr7HNt5303WUBg=;
	b=UDBNB8/0B1x3/BrOa/t8tH6XYsteLhqIKb6sFPxo+8voiJoXwSGbGVTm7m2V2fKjxbZfG5
	wYXqGIpNv/UsD7//6L9xKs/IvOligQC3lhghGNicG75MZUNKdc91kSBysgQAuIKoLqiQ3k
	zeQenTliY3QJ+tbtFUjK7MHFfZ7WXFo=
Date: Fri, 3 Jul 2026 22:50:29 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
To: Pedro Falcato <pfalcato@suse.de>
Cc: linux-mm@kvack.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R . Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Alice Ryhl <aliceryhl@google.com>, Douglas Anderson <dianders@chromium.org>,
 Gary Guo <gary@garyguo.net>, Anand Moon <linux.amoon@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260703022507.187457-1-leon.hwang@linux.dev>
 <akeDk49-pPgUDek1@pedro-suse>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <akeDk49-pPgUDek1@pedro-suse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94852-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pfalcato@suse.de,m:linux-mm@kvack.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:akpm@linux-foundation.org,m:liam@infradead.org,m:ljs@kernel.org,m:vbabka@kernel.org,m:jannh@google.com,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:nathan@kernel.org,m:peterz@infradead.org,m:ojeda@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:thomas.weissschuh@linutronix.de,m:aliceryhl@google.com,m:dianders@chromium.org,m:gary@garyguo.net,m:linux.amoon@gmail.com,m:rdunlap@infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[leon.hwang@linux.dev,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kvack.org,lwn.net,linuxfoundation.org,linux-foundation.org,infradead.org,kernel.org,google.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linutronix.de,chromium.org,garyguo.net,gmail.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon.hwang@linux.dev,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linux.dev:from_mime,linux.dev:email,linux.dev:mid,linux.dev:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03D1C703A80

On 2026/7/3 17:44, Pedro Falcato wrote:
> On Fri, Jul 03, 2026 at 10:25:07AM +0800, Leon Hwang wrote:
>> mseal.o is built only for 64-bit kernels, so 32-bit kernels fall back
>> to sys_ni_syscall() and return -ENOSYS rather than -EPERM.
>>
>> Document the -EINTR return from mmap_write_lock_killable(), fix the
>> CONFIG_MSEAL_SYSTEM_MAPPINGS typo, and describe system mappings in
>> terms of VM_SEALED_SYSMAP.
>>
>> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
>> ---
>>  Documentation/userspace-api/mseal.rst | 18 ++++++++++--------
>>  init/Kconfig                          |  2 +-
>>  mm/mseal.c                            |  4 ++--
>>  3 files changed, 13 insertions(+), 11 deletions(-)
>>
>> diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/userspace-api/mseal.rst
>> index ea9b11a0bd89..1f1cf206670c 100644
>> --- a/Documentation/userspace-api/mseal.rst
>> +++ b/Documentation/userspace-api/mseal.rst
>> @@ -50,8 +50,10 @@ mseal syscall signature
>>           * The start address (``addr``) is not allocated.
>>           * The end address (``addr`` + ``len``) is not allocated.
>>           * A gap (unallocated memory) between start and end address.
>> -      - **-EPERM**:
>> -         * sealing is supported only on 64-bit CPUs, 32-bit is not supported.
>> +      - **-EINTR**:
>> +         * Interrupted while waiting for the mmap write lock.
>> +      - **-ENOSYS**:
>> +         * The kernel does not implement ``mseal()``.
>>  
>>     **Note about error return**:
>>        - For above error cases, users can expect the given memory range is
> 
> Honestly, this whole thing needs to be deleted. We need a proper manpage.

$ man mseal
No manual entry for mseal

When searching "mseal manual" using Google, this doc is the first entry.

So, this change is worthy.

> 
>> @@ -62,7 +64,8 @@ mseal syscall signature
>>          memory range could happen. However, those cases should be rare.
>>  
>>     **Architecture support**:
>> -      mseal only works on 64-bit CPUs, not 32-bit CPUs.
>> +      mseal is built only for 64-bit kernels. 32-bit kernels return
>> +      ``-ENOSYS``.
> 
> This LGTM.
> 
>>  
>>     **Idempotent**:
>>        users can call mseal multiple times. mseal on an already sealed memory
>> @@ -131,20 +134,19 @@ Use cases
>>  - Chrome browser: protect some security sensitive data structures.
>>  
>>  - System mappings:
>> -  The system mappings are created by the kernel and includes vdso, vvar,
>> +  The system mappings are created by the kernel and include vdso, vvar,
>>    vvar_vclock, vectors (arm compat-mode), sigpage (arm compat-mode), uprobes.
>>  
>>    Those system mappings are readonly only or execute only, memory sealing can
>> -  protect them from ever changing to writable or unmmap/remapped as different
>> +  protect them from ever changing to writable or unmapped/remapped as different
>>    attributes. This is useful to mitigate memory corruption issues where a
>>    corrupted pointer is passed to a memory management system.
> 
> Also LGTM.
> 
>>  
>>    If supported by an architecture (CONFIG_ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS),
>> -  the CONFIG_MSEAL_SYSTEM_MAPPINGS seals all system mappings of this
>> -  architecture.
>> +  CONFIG_MSEAL_SYSTEM_MAPPINGS seals mappings marked with VM_SEALED_SYSMAP.
> 
> VM_SEALED_SYSMAP isn't meaningful to userspace.


Got it. Will drop this change.

> 
>>  
>>    The following architectures currently support this feature: x86-64, arm64,
>> -  loongarch and s390.
>> +  loongarch, riscv, and s390.
> 
> This is also useless, every 64-bit architecture will support this.


Do you mean dropping this sentence, or this change?

> 
>>  
>>    WARNING: This feature breaks programs which rely on relocating
>>    or unmapping system mappings. Known broken software at the time
>> diff --git a/init/Kconfig b/init/Kconfig
>> index 5230d4879b1c..12bb39f637b1 100644
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -2112,7 +2112,7 @@ config ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
>>  	  from a kernel perspective.
>>  
>>  	  After the architecture enables this, a distribution can set
>> -	  CONFIG_MSEAL_SYSTEM_MAPPING to manage access to the feature.
>> +	  CONFIG_MSEAL_SYSTEM_MAPPINGS to manage access to the feature.
>>  
>>  	  For complete descriptions of memory sealing, please see
>>  	  Documentation/userspace-api/mseal.rst
>> diff --git a/mm/mseal.c b/mm/mseal.c
>> index 9781647483d1..0464c7b94ab9 100644
>> --- a/mm/mseal.c
>> +++ b/mm/mseal.c
>> @@ -132,8 +132,8 @@ static int mseal_apply(struct mm_struct *mm,
>>   *   addr is not a valid address (not allocated).
>>   *   end (start + len) is not a valid address.
>>   *   a gap (unallocated memory) between start and end.
>> - *  -EPERM:
>> - *  - In 32 bit architecture, sealing is not supported.
>> + *  -EINTR:
>> + *   interrupted while waiting for the mmap write lock.
>>   * Note:
>>   *  user can call mseal(2) multiple times, adding a seal on an
>>   *  already sealed memory is a no-action (no error).
> 
> And this whole header needs to be deleted as well. No one's looking at
> kernel code for documentation (and if they are, we did a horrendous job
> at actually documenting the thing).
> 


Just to confirm, do you mean removing the entire function comment above
do_mseal()?

Thanks,
Leon



