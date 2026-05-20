Return-Path: <linux-doc+bounces-88586-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB86F+h4DWqfxwUAu9opvQ
	(envelope-from <linux-doc+bounces-88586-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 11:03:36 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FA758A5AC
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 11:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0283B302410B
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 09:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F171D3B8D4F;
	Wed, 20 May 2026 09:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fcqBMRSm"
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1ED3B3C00;
	Wed, 20 May 2026 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779267764; cv=none; b=mLY3ugCjNkxnDFAfhM+TuShdyiR/bXBVPyKN8tVDwT0t3NYh3Zb56yRm5qhgFBNg1JyBv99PqrJPUuQexhTb8wxhZwnQLsROw46cjABEuM5WoosonFvSommUdGyGhNNSqzmzJNU5d2rBP3u8RBmgWt67U7DxsRkutYgThcLTXWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779267764; c=relaxed/simple;
	bh=Zx6Y0CSKfWg4W6fzoAK4sppujlOP/zqJnUnthLFeOBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NuIj11imHYDUZZrB8XrmI7A0a+4HwIK9HXmW4umnDojnyUJn0wlUekLSkAWIbY8pxSqqYu9w4Xjm0FYOVCfCnAmnrklKWhTBtMq5fVc+agTberIGJEbRXtsw9M3VUIq/3XIeq9mCso6jL85AdYJAD2F1K+EGCPJy0/wgysrXef4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fcqBMRSm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02228488F;
	Wed, 20 May 2026 02:02:31 -0700 (PDT)
Received: from [10.164.19.28] (unknown [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDA843F85F;
	Wed, 20 May 2026 02:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779267756; bh=Zx6Y0CSKfWg4W6fzoAK4sppujlOP/zqJnUnthLFeOBo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fcqBMRSm1Bs2PU9kCu9oZdM8JOImdHhC3IGKxecMdKBW+50CJ9bYpCpvuakaBI9tV
	 mF0HwUrzD5iSrX2OoZFkTKWuGU7RXRVDJzbSWGl/+r8iiLgTSNz5B94p7hVEfSYCV3
	 oVDfBkElQp3jhAbbumHqf9ptpsd34QAsU/J9PPaE=
Message-ID: <8eb07028-d6b2-411c-81ea-e009c8b3a4c8@arm.com>
Date: Wed, 20 May 2026 14:32:27 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] tools/mm: add a standalone GUP microbenchmark
To: Mike Rapoport <rppt@kernel.org>, Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
References: <20260519120506.184512-1-sarthak.sharma@arm.com>
 <20260519120506.184512-2-sarthak.sharma@arm.com>
 <ag13GbKcLMIoHOHj@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <ag13GbKcLMIoHOHj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-88586-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev.jain@arm.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[run_vmtests.sh:url,arm.com:email,arm.com:mid,arm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A5FA758A5AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 20/05/26 2:25 pm, Mike Rapoport wrote:
> (added broonie)
> 
> Hi,
> 
> On Tue, May 19, 2026 at 05:35:05PM +0530, Sarthak Sharma wrote:
>> Add a command-line tool for benchmarking get_user_pages fast-path
>> (GUP_FAST), pin_user_pages fast-path (PIN_FAST), and pin_user_pages
>> longterm (PIN_LONGTERM) via the CONFIG_GUP_TEST debugfs interface.
>>
>> When invoked without arguments, gup_bench runs the same matrix of
>> configurations as run_gup_matrix() in run_vmtests.sh: all three GUP
>> commands across read/write, private/shared mappings, and a range of
>> page counts, with THP on/off for regular mappings and hugetlb for huge
>> page mappings.
>>
>> This tool is a mix of reused and new logic. The mapping/setup path comes
>> from selftests/mm/gup_test.c, while the default benchmark matrix matches
>> run_gup_matrix() in run_vmtests.sh. The standalone CLI and tools/mm
>> integration are added here so tools/mm does not depend on kselftest.
>>
>> Add gup_bench to BUILD_TARGETS and INSTALL_TARGETS in tools/mm/Makefile,
>> and ignore the resulting binary in tools/mm/.gitignore. While here, also
>> add the missing thp_swap_allocator_test entry to .gitignore.
>>
>> Add tools/mm/gup_bench.c to the GUP entry in MAINTAINERS.
>>
>> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
>> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
>> ---
>>  MAINTAINERS          |   1 +
>>  tools/mm/.gitignore  |   2 +
>>  tools/mm/Makefile    |   6 +-
>>  tools/mm/gup_bench.c | 491 +++++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 497 insertions(+), 3 deletions(-)
>>  create mode 100644 tools/mm/gup_bench.c
> 
> ...
>  
>> +/*
>> + * Local HugeTLB setup helpers for gup_bench.
>> + *
>> + * These helpers were copied from tools/testing/selftests/mm/ and adjusted to
>> + * remove the ksft formatting. Keep this copy local so tools/mm does not
>> + * depend on ksft output behavior.
>> + */
> 
> It looks like self tests of at least 5 subsystems beside mm use hugetlb:
> 
> $ git grep -l "Hugepagesize:" tools/testing/selftests/ | grep -v "selftests/mm"
> tools/testing/selftests/arm64/mte/check_hugetlb_options.c
> tools/testing/selftests/cgroup/test_hugetlb_memcg.c
> tools/testing/selftests/kvm/lib/test_util.c
> tools/testing/selftests/memfd/common.c
> tools/testing/selftests/net/tcp_mmap.c
> 
> It seems that we need to better share the common code in
> tools/testing/selftest.
> 
> And adding another copy of the hugetlb detection and setup code does not
> seem like a great idea.


Does it sound too insane to just do some sort of #include "../testing/selftests/mm/..."
to use the common helpers?

> 
>> +
>> +static unsigned int psize(void)
>> +{
>> +	static unsigned int __page_size;
>> +
>> +	if (!__page_size)
>> +		__page_size = sysconf(_SC_PAGESIZE);
>> +	return __page_size;
>> +}
>> +
>> +static unsigned long default_huge_page_size(void)
>> +{
>> +	FILE *f = fopen("/proc/meminfo", "r");
>> +	unsigned long hpage_size = 0;
>> +	char buf[256];
>> +
>> +	if (!f)
>> +		return 0;
>> +	while (fgets(buf, sizeof(buf), f)) {
>> +		if (sscanf(buf, "Hugepagesize:       %lu kB", &hpage_size) == 1)
>> +			break;
>> +	}
>> +	fclose(f);
>> +	hpage_size <<= 10;
>> +	return hpage_size;
>> +}
> 


