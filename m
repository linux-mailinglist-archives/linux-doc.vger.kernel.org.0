Return-Path: <linux-doc+bounces-82786-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELeYNucH1mnbAQgAu9opvQ
	(envelope-from <linux-doc+bounces-82786-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Apr 2026 09:46:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 508DE3B884C
	for <lists+linux-doc@lfdr.de>; Wed, 08 Apr 2026 09:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C536300A138
	for <lists+linux-doc@lfdr.de>; Wed,  8 Apr 2026 07:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C7833F370;
	Wed,  8 Apr 2026 07:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Jjp6b3l9"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FAD352C5B
	for <linux-doc@vger.kernel.org>; Wed,  8 Apr 2026 07:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775634148; cv=none; b=V5vg3vPS2Wsba9egfY3n+ND5hwXFO5AWq+gfQ8XucnEreDx0pnhBm1vhJ6NpSS8lCUMmkGdkdgomyP/wwJ3XEIsAXiXILQ3Ww+1RnTWYuV47ogQzXlJV1FkWyfY/lzmv5hdFk9oCKvOgIIXe43GWlN1mba+IFqSHlmESqQkATzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775634148; c=relaxed/simple;
	bh=VXeE/V3Nt5epWexqPhW1PLxXVXncYLeglqZfNNzfTyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=in0u1LLDPsM7w+NwosZM4CqDsZf2/74WhX1UChZZnKL/ajwFzIaNWehrGQweHpQSgL5SnkeHyLDTB8aGxy6tCc2l8w+LqwRTmUkrI3dRWQeWwwdBnqbLpHvxdbuK8FDnFoFCcc4N2xIIM1wmR5wEHqvtcRP8n+FDhVzQQgAlEHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Jjp6b3l9; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <01e47f44-c22b-42f3-afe1-4a39d9c1fd18@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775634134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Q0lOeA9WbCpE9UviUVIyO2kcWKjArwzD9MSExnBDGA=;
	b=Jjp6b3l982HOh7i+JXlUQ5b/V4DNbhtZMZqAcnngbf3w/AobWWV6n2e2nywmj5FKTGA9ri
	e60uGuZLu4rl7MZNmdXTSuDsVoEOye4ccSVYIIXrKHBK6bZMKPFoMfTmpVna3KyaChOSuM
	LBDvdYZk6+QThUS9JBwlI5AZbG7bT30=
Date: Wed, 8 Apr 2026 15:41:14 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] crash: Support high memory reservation for range syntax
To: Sourabh Jain <sourabhjain@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>
References: <20260404074103.506793-1-youling.tang@linux.dev>
 <d584d383-1862-417d-9251-153d9bcf5626@linux.ibm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Youling Tang <youling.tang@linux.dev>
In-Reply-To: <d584d383-1862-417d-9251-153d9bcf5626@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-82786-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linux.dev:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[youling.tang@linux.dev,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 508DE3B884C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, Sourabh

On 4/8/26 12:31, Sourabh Jain wrote:
> Hello Youling,
>
> On 04/04/26 13:11, Youling Tang wrote:
>> From: Youling Tang <tangyouling@kylinos.cn>
>>
>> The crashkernel range syntax (range1:size1[,range2:size2,...]) allows
>> automatic size selection based on system RAM, but it always reserves
>> from low memory. When a large crashkernel is selected, this can
>> consume most of the low memory, causing subsequent hardware
>> hotplug or drivers requiring low memory to fail due to allocation
>> failures.
>
>
> Support for high crashkernel reservation has been added to
> address the above problem.
>
> However, high crashkernel reservation is not supported with
> range-based crashkernel kernel command-line arguments.
> For example: crashkernel=0M-1G:100M,1G-4G:160M,4G-8G:192M
>
> Many users, including some distributions, use range-based
> crashkernel configuration. So, adding support for high crashkernel
> reservation with range-based configuration would be useful.
>
>>
>> Add a new optional conditional suffix ",>boundary" to the crashkernel
>> range syntax. When the selected crashkernel size exceeds the specified
>> boundary, the kernel will automatically apply the same reservation
>> policy as "crashkernel=size,high" - preferring high memory first
>> and reserving the default low memory area.
>
> I think the approach to enable high crashkernel reservation
> with range-based configuration makes the crashkernel kernel
> argument more complex.
>
> If the goal is to support high crashkernel reservation with
> range-based kernel command-line arguments, how about:
>
> crashkernel=<range1>:<size1>[,<range2>:<size2>,...][@offset],high
>
> instead of using >boundary?

This approach defaults all reservations to high memory. For example,
0M-2G:100M on a 1GB machine reserves 100M + DEFAULT_CRASH_KERNEL_LOW_SIZE,
which wastes memory on small systems.

I prefer small reservations defaulting to low memory, while large
reservations start from high memory (with a default-sized segment
reserved in low memory). This provides better flexibility for
distributions to handle diverse system configurations.

Thanks,
Youling.
>
>>
>> Syntax:
>> crashkernel=<range1>:<size1>[,<range2>:<size2>,...][@offset],>boundary
>>
>> Example:
>>      crashkernel=2G-16G:512M,16G-:1G,>512M
>>
>> This means:
>>    - For 2G-16G RAM: reserve 512M normally
>>    - For >16G RAM: reserve 1G with high memory preference (since 1G > 
>> 512M)
>>
>> For systems with >16G RAM, 1G is selected which exceeds 512M, so it
>> will be reserved from high memory instead of consuming 1G of
>> precious low memory.
>>
>> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
>> ---
>>   Documentation/admin-guide/kdump/kdump.rst     | 25 ++++++++-
>>   .../admin-guide/kernel-parameters.txt         |  2 +-
>>   kernel/crash_reserve.c                        | 56 ++++++++++++++++---
>>   3 files changed, 73 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kdump/kdump.rst 
>> b/Documentation/admin-guide/kdump/kdump.rst
>> index 7587caadbae1..b5ae4556e9ca 100644
>> --- a/Documentation/admin-guide/kdump/kdump.rst
>> +++ b/Documentation/admin-guide/kdump/kdump.rst
>> @@ -293,7 +293,28 @@ crashkernel syntax
>>          2) if the RAM size is between 512M and 2G (exclusive), then 
>> reserve 64M
>>          3) if the RAM size is larger than 2G, then reserve 128M
>>   -3) crashkernel=size,high and crashkernel=size,low
>> +3) range1:size1[,range2:size2,...][@offset],>boundary
>> +   Optionally, the range list can be followed by a conditional suffix
>> +   `,>boundary`. When the selected crashkernel size matches the
>> +   condition, the kernel will reserve memory using the same policy as
>> +   `crashkernel=size,high` (i.e. prefer high memory first and 
>> reserve the
>> +   default low memory area).
>> +
>> +   The syntax is::
>> +
>> + crashkernel=<range1>:<size1>[,<range2>:<size2>,...][@offset],>boundary
>> +        range=start-[end]
>> +
>> +   For example::
>> +
>> +        crashkernel=2G-16G:512M,16G-:1G,>512M
>> +
>> +   This would mean:
>> +       1) if the RAM size is between 2G and 16G (exclusive), then 
>> reserve 512M.
>> +       2) if the RAM size is larger than 16G, allocation will behave 
>> like
>> +          `crashkernel=1G,high`.
>> +
>> +4) crashkernel=size,high and crashkernel=size,low
>>        If memory above 4G is preferred, crashkernel=size,high can be 
>> used to
>>      fulfill that. With it, physical memory is allowed to be 
>> allocated from top,
>> @@ -311,7 +332,7 @@ crashkernel syntax
>>                 crashkernel=0,low
>>   -4) crashkernel=size,cma
>> +5) crashkernel=size,cma
>>         Reserve additional crash kernel memory from CMA. This 
>> reservation is
>>       usable by the first system's userspace memory and kernel movable
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt 
>> b/Documentation/admin-guide/kernel-parameters.txt
>> index 03a550630644..b2e1892ab4d8 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -1087,7 +1087,7 @@ Kernel parameters
>>               4G when '@offset' hasn't been specified.
>>               See Documentation/admin-guide/kdump/kdump.rst for 
>> further details.
>>   -    crashkernel=range1:size1[,range2:size2,...][@offset]
>> + crashkernel=range1:size1[,range2:size2,...][@offset][,>boundary]
>>               [KNL] Same as above, but depends on the memory
>>               in the running system. The syntax of range is
>>               start-[end] where start and end are both
>> diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
>> index 62e60e0223cf..917738412390 100644
>> --- a/kernel/crash_reserve.c
>> +++ b/kernel/crash_reserve.c
>> @@ -254,15 +254,47 @@ static __init char *get_last_crashkernel(char 
>> *cmdline,
>>       return ck_cmdline;
>>   }
>>   +/*
>> + * This function parses command lines in the format
>> + *
>> + *   crashkernel=ramsize-range:size[,...][@offset],>boundary
>> + */
>> +static void __init parse_crashkernel_boundary(char *ck_cmdline,
>> +                    unsigned long long *boundary)
>> +{
>> +    char *cur = ck_cmdline, *next;
>> +    char *first_gt = false;
>> +
>> +    first_gt = strchr(cur, '>');
>> +    if (!first_gt)
>> +        return;
>> +
>> +    cur = first_gt + 1;
>> +    if (*cur == '\0' || *cur == ' ' || *cur == ',') {
>> +        pr_warn("crashkernel: '>' specified without boundary size, 
>> ignoring\n");
>> +        return;
>> +    }
>> +
>> +    *boundary = memparse(cur, &next);
>> +    if (cur == next) {
>> +        pr_warn("crashkernel: invalid boundary size after '>'\n");
>> +        return;
>> +    }
>> +}
>> +
>>   static int __init __parse_crashkernel(char *cmdline,
>>                    unsigned long long system_ram,
>>                    unsigned long long *crash_size,
>>                    unsigned long long *crash_base,
>> -                 const char *suffix)
>> +                 const char *suffix,
>> +                 bool *high,
>> +                 unsigned long long *low_size)
>>   {
>>       char *first_colon, *first_space;
>>       char *ck_cmdline;
>>       char *name = "crashkernel=";
>> +    unsigned long long boundary = 0;
>> +    int ret;
>>         BUG_ON(!crash_size || !crash_base);
>>       *crash_size = 0;
>> @@ -283,10 +315,20 @@ static int __init __parse_crashkernel(char 
>> *cmdline,
>>        */
>>       first_colon = strchr(ck_cmdline, ':');
>>       first_space = strchr(ck_cmdline, ' ');
>> -    if (first_colon && (!first_space || first_colon < first_space))
>> -        return parse_crashkernel_mem(ck_cmdline, system_ram,
>> +    if (first_colon && (!first_space || first_colon < first_space)) {
>> +        ret = parse_crashkernel_mem(ck_cmdline, system_ram,
>>                   crash_size, crash_base);
>>   +        /* Handle optional ',>boundary' condition for range ':' 
>> syntax only. */
>> +        parse_crashkernel_boundary(ck_cmdline, &boundary);
>> +        if (!ret && *crash_size > boundary) {
>> +            *high = true;
>> +            *low_size = DEFAULT_CRASH_KERNEL_LOW_SIZE;
>> +        }
>> +
>> +        return ret;
>> +    }
>> +
>>       return parse_crashkernel_simple(ck_cmdline, crash_size, 
>> crash_base);
>>   }
>>   @@ -310,7 +352,7 @@ int __init parse_crashkernel(char *cmdline,
>>         /* crashkernel=X[@offset] */
>>       ret = __parse_crashkernel(cmdline, system_ram, crash_size,
>> -                crash_base, NULL);
>> +                crash_base, NULL, high, low_size);
>>   #ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
>>       /*
>>        * If non-NULL 'high' passed in and no normal crashkernel
>> @@ -318,7 +360,7 @@ int __init parse_crashkernel(char *cmdline,
>>        */
>>       if (high && ret == -ENOENT) {
>>           ret = __parse_crashkernel(cmdline, 0, crash_size,
>> -                crash_base, suffix_tbl[SUFFIX_HIGH]);
>> +                crash_base, suffix_tbl[SUFFIX_HIGH], high, low_size);
>>           if (ret || !*crash_size)
>>               return -EINVAL;
>>   @@ -327,7 +369,7 @@ int __init parse_crashkernel(char *cmdline,
>>            * is not allowed.
>>            */
>>           ret = __parse_crashkernel(cmdline, 0, low_size,
>> -                crash_base, suffix_tbl[SUFFIX_LOW]);
>> +                crash_base, suffix_tbl[SUFFIX_LOW], high, low_size);
>>           if (ret == -ENOENT) {
>>               *low_size = DEFAULT_CRASH_KERNEL_LOW_SIZE;
>>               ret = 0;
>> @@ -344,7 +386,7 @@ int __init parse_crashkernel(char *cmdline,
>>        */
>>       if (cma_size)
>>           __parse_crashkernel(cmdline, 0, cma_size,
>> -            &cma_base, suffix_tbl[SUFFIX_CMA]);
>> +            &cma_base, suffix_tbl[SUFFIX_CMA], high, low_size);
>>   #endif
>>       if (!*crash_size)
>>           ret = -EINVAL;
>

