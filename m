Return-Path: <linux-doc+bounces-88585-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +J7CFIR+DWosyAUAu9opvQ
	(envelope-from <linux-doc+bounces-88585-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 11:27:32 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A289758AC50
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 11:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3A463024957
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 08:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B382639C657;
	Wed, 20 May 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CeXrUcx2"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2E63AF641;
	Wed, 20 May 2026 08:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779267364; cv=none; b=c24wpFBpoXJ+aCjxIuIOOrdrkJoEssDI5cBWCKI+LPEf7aKxx43Tx+369fbL6/dGupjaYmXgkBLcVNY/PnD6lT0djMWLaRRUM277h298pyw4gW3iiOB5R2o4EzuXLFA2bG0eRV1gpUUCLc7mc4OAwunnEmgFuLQS5MwlmCWus+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779267364; c=relaxed/simple;
	bh=fVD0HQdprIAV+MLYO/FJgK0I16wrm0C3z2cWQQYFRd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+MXnoZcN7ryn9CnU7w1pm0YVSmyw3STIHvKhCFZatXiqu8XT6XspCm1RvWfV6jNrsZfYMDGp7wj3jsoEUt644JZzZ+VWxhUZeQ2LbBb1OO4FulBt/1fXhDT1rZknZyWbBP55IHrbTV01/Hj5d7eoKc1c7WmwaCHChKWTRNYJhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CeXrUcx2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DA51F00893;
	Wed, 20 May 2026 08:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779267362;
	bh=M67gQ2b5PjMLRqfJkCPbykmhRVGUYihUqRBcMGeSNZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CeXrUcx2NOPTLF6tZf/gMUiuOZwHUDe75lwssrGyfd66X4OcDNz08Pfv1UHZagElP
	 A8lqbt5XVP7uyJ1dN2EfUffGy7cG8k1jgBG7vDToskH1m04IT8Ji1SS7XStiZHgFcx
	 TyI6Lg61rY43fLSAnKYE8w7LFTvOmnw6h8PBCsqemDuEQhP4bdHbOuLKmNsWJ3qQ9C
	 2bQaMpbbyZelonnNlWluGQQRNpAcC+q3kFUEK2qeCfCRDFPrhWkeI0WX4ioNFFFU5Z
	 AhCfLo6rAwgzcGSLS2WFmE/ZEiO+QvRJNgW4lQCov5OWOHb8Cf8r8WODVDFT8StkP/
	 7YKie4t/+wQUw==
Date: Wed, 20 May 2026 11:55:53 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/2] tools/mm: add a standalone GUP microbenchmark
Message-ID: <ag13GbKcLMIoHOHj@kernel.org>
References: <20260519120506.184512-1-sarthak.sharma@arm.com>
 <20260519120506.184512-2-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519120506.184512-2-sarthak.sharma@arm.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-88585-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[run_vmtests.sh:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:email]
X-Rspamd-Queue-Id: A289758AC50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

(added broonie)

Hi,

On Tue, May 19, 2026 at 05:35:05PM +0530, Sarthak Sharma wrote:
> Add a command-line tool for benchmarking get_user_pages fast-path
> (GUP_FAST), pin_user_pages fast-path (PIN_FAST), and pin_user_pages
> longterm (PIN_LONGTERM) via the CONFIG_GUP_TEST debugfs interface.
> 
> When invoked without arguments, gup_bench runs the same matrix of
> configurations as run_gup_matrix() in run_vmtests.sh: all three GUP
> commands across read/write, private/shared mappings, and a range of
> page counts, with THP on/off for regular mappings and hugetlb for huge
> page mappings.
> 
> This tool is a mix of reused and new logic. The mapping/setup path comes
> from selftests/mm/gup_test.c, while the default benchmark matrix matches
> run_gup_matrix() in run_vmtests.sh. The standalone CLI and tools/mm
> integration are added here so tools/mm does not depend on kselftest.
> 
> Add gup_bench to BUILD_TARGETS and INSTALL_TARGETS in tools/mm/Makefile,
> and ignore the resulting binary in tools/mm/.gitignore. While here, also
> add the missing thp_swap_allocator_test entry to .gitignore.
> 
> Add tools/mm/gup_bench.c to the GUP entry in MAINTAINERS.
> 
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
> ---
>  MAINTAINERS          |   1 +
>  tools/mm/.gitignore  |   2 +
>  tools/mm/Makefile    |   6 +-
>  tools/mm/gup_bench.c | 491 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 497 insertions(+), 3 deletions(-)
>  create mode 100644 tools/mm/gup_bench.c

...
 
> +/*
> + * Local HugeTLB setup helpers for gup_bench.
> + *
> + * These helpers were copied from tools/testing/selftests/mm/ and adjusted to
> + * remove the ksft formatting. Keep this copy local so tools/mm does not
> + * depend on ksft output behavior.
> + */

It looks like self tests of at least 5 subsystems beside mm use hugetlb:

$ git grep -l "Hugepagesize:" tools/testing/selftests/ | grep -v "selftests/mm"
tools/testing/selftests/arm64/mte/check_hugetlb_options.c
tools/testing/selftests/cgroup/test_hugetlb_memcg.c
tools/testing/selftests/kvm/lib/test_util.c
tools/testing/selftests/memfd/common.c
tools/testing/selftests/net/tcp_mmap.c

It seems that we need to better share the common code in
tools/testing/selftest.

And adding another copy of the hugetlb detection and setup code does not
seem like a great idea.

> +
> +static unsigned int psize(void)
> +{
> +	static unsigned int __page_size;
> +
> +	if (!__page_size)
> +		__page_size = sysconf(_SC_PAGESIZE);
> +	return __page_size;
> +}
> +
> +static unsigned long default_huge_page_size(void)
> +{
> +	FILE *f = fopen("/proc/meminfo", "r");
> +	unsigned long hpage_size = 0;
> +	char buf[256];
> +
> +	if (!f)
> +		return 0;
> +	while (fgets(buf, sizeof(buf), f)) {
> +		if (sscanf(buf, "Hugepagesize:       %lu kB", &hpage_size) == 1)
> +			break;
> +	}
> +	fclose(f);
> +	hpage_size <<= 10;
> +	return hpage_size;
> +}

-- 
Sincerely yours,
Mike.

