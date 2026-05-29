Return-Path: <linux-doc+bounces-89947-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC7ANBgtGWogrwgAu9opvQ
	(envelope-from <linux-doc+bounces-89947-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 08:07:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 853FD5FDBF4
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 08:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8A5B83042E57
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 06:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3694F38B7AA;
	Fri, 29 May 2026 06:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SkU6pnDJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8235B21E097;
	Fri, 29 May 2026 06:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780034827; cv=none; b=CMhbrdoGCWs4zwbeeK4xaMBfqujR0WEJYDfiJTTjx21a+wGxe6W4x4hO7pQpBS3LmC6RHnlfzMFodTLYAQ6pfH+phpyHf0W3DBMZsWezff0ebyOab5kxsZ0etNiyLse+zqmq5zA6TxncFQC6RYPebdHLUQmmOKhCJH/SB/U8TIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780034827; c=relaxed/simple;
	bh=j1QJ/JmF3RS+ozhNYH5F0EegwZ0H7PPlXq/gF5R0ts8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=As11Y6PTcRrd0oV/cYilv9FgLx81MinZRqDcpUchiT0iv+wduyUJzgWUWhfbhyR83gWwdQVyDx41VD9M+ewoAg5QW9prLJON7CfMalYduyHzTcXG98W1n6woFhwuKokX5534wGxfsdzTgpWciiBZRqLg3zFpMQj2JPA+5J8+2eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SkU6pnDJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F4D42103;
	Thu, 28 May 2026 23:06:59 -0700 (PDT)
Received: from [10.164.19.8] (unknown [10.164.19.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64EFC3F632;
	Thu, 28 May 2026 23:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780034824; bh=j1QJ/JmF3RS+ozhNYH5F0EegwZ0H7PPlXq/gF5R0ts8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SkU6pnDJjmyiq7jNIHs/4qjwq4joS6Tv4B4sKtWqsFNbqhAWZOAr7vvM6LdOyv2pu
	 G6IotSJ1X+DveHH0bhwTU6BC6wRX4wLL1CdEZI/7Ieq+SVSSeqEYZGJElKJAC72i3I
	 DeY2Ugfk/8/NJ+9Tyfsn3yfkI6UhlMMozIVbzpeE=
Message-ID: <403181bc-eab0-4f4a-b986-dab1d8c49bf3@arm.com>
Date: Fri, 29 May 2026 11:36:53 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] selftests/mm: separate GUP microbenchmarking from
 functional testing
To: Sarthak Sharma <sarthak.sharma@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Mark Brown <broonie@kernel.org>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260527142432.230127-1-sarthak.sharma@arm.com>
 <20260527114752.cf4dd3e1bda93fb8ebab5a76@linux-foundation.org>
 <3b4176f4-e099-490c-a5e2-6a36d00b1207@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <3b4176f4-e099-490c-a5e2-6a36d00b1207@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	TAGGED_FROM(0.00)[bounces-89947-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev.jain@arm.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sashiko.dev:url,run_vmtests.sh:url,arm.com:email,arm.com:mid,arm.com:dkim]
X-Rspamd-Queue-Id: 853FD5FDBF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 29/05/26 11:27 am, Sarthak Sharma wrote:
> Hi Andrew!
> 
> On 5/28/26 12:17 AM, Andrew Morton wrote:
>> On Wed, 27 May 2026 19:54:27 +0530 Sarthak Sharma <sarthak.sharma@arm.com> wrote:
>>
>>> gup_test.c currently serves two distinct purposes: microbenchmarking
>>> (GUP_FAST_BENCHMARK, PIN_FAST_BENCHMARK, PIN_LONGTERM_BENCHMARK) and
>>> functional correctness testing (GUP_BASIC_TEST, PIN_BASIC_TEST,
>>> DUMP_USER_PAGES_TEST). Mixing these in a single binary means functional
>>> tests cannot be run or reported individually and run_vmtests.sh must
>>> invoke the binary multiple times with different flag combinations to
>>> cover all configurations.
>>>
>>> This patch series separates the two concerns: tools/mm/gup_bench for
>>> benchmarking and tools/testing/selftests/mm/gup_test for functional
>>> testing. To avoid duplicating HugeTLB and related file helpers, the
>>> series first prepares the existing file helpers for sharing, then moves
>>> the common helper code to tools/lib/mm/ so it can be shared by both
>>> selftests and tools/mm.
>>
>> Thanks.  I'll duck this for now, see what reviewers have to say.
>>
>> Sashiko still has a couple of nags.  Minor stuff, arguably ignorable.
>> 	https://sashiko.dev/#/patchset/20260527142432.230127-1-sarthak.sharma@arm.com
> 
> Thanks! I went through Sashiko's review.
> 
> Both the points are valid but look very minor to me: one is a temporary
> x86 build issue fixed by the next patch and the other is stricter

For the sake of bisection, we try to make patches such that each patch
when applied one by one, does not break the build. Sashiko says that
applying this patch breaks mm-selftests build for x86, so this needs
to be fixed : )

Although if there is no other major review comment, instead of respinning
you could simply reply to this patch with a fix patch and Andrew can
incorporate that : )

> argument validation for -F in gup_bench.

> 
> I don't feel they require a v5 on their own. Let's wait for reviewer
> feedback. If a respin is needed then I'll fold these cleanups in as well.
> 


