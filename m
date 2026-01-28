Return-Path: <linux-doc+bounces-74185-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Mf8FhXWeWkX0AEAu9opvQ
	(envelope-from <linux-doc+bounces-74185-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 28 Jan 2026 10:25:41 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9639EC64
	for <lists+linux-doc@lfdr.de>; Wed, 28 Jan 2026 10:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D338A300F18C
	for <lists+linux-doc@lfdr.de>; Wed, 28 Jan 2026 09:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF442C15B8;
	Wed, 28 Jan 2026 09:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpTbuYAL"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788F027A45C;
	Wed, 28 Jan 2026 09:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769592316; cv=none; b=agvVfglKSSDEFMKwuRLrRz0MKk7vGsma0Qw4dqkGe3uLYCdwjEw5z7DRzDU9aFecBbw/0No0riTtnfWFabInQWIB1uUhgwZFz41hgft8WqqOBju1jHog4sbPrN+EFMxHwrFTMbrLc+IqwGiigbB5v5GriSjkNPTIw9gvUgDeEV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769592316; c=relaxed/simple;
	bh=NOYUzAYOaQDLTtBB91+2pLZKvr04FAxNg/6BUtcW8aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bct3lUcJ7v6wahUKD6bH9JVcMEnO69dulElWASpE4CW1gRgvBQaxrRC7ravtoYVI+H+/6bQgU1ajjB389GA4jYSgLbifrDxe7nZSDT5RWz9Mvvr1LB8FT8TPUZXfpCaMmdU+Yo0Ok82DwXweNI2f2jG47YL2WiT1jfBtmic8bAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpTbuYAL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D00C4CEF1;
	Wed, 28 Jan 2026 09:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769592316;
	bh=NOYUzAYOaQDLTtBB91+2pLZKvr04FAxNg/6BUtcW8aU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EpTbuYAL5IAPWPvdsK/lVylxFhuznKwArTPCxaxNlbm6TeghX4LEUY2EY8Tr40fgZ
	 s3y/+08DEkG7+VltextLP64GqASv9orzxSqgu79+Z89MUwcr/Gy+5l24Jq0ESZIYjd
	 Yyw7X64kgIoHd1wO/v92yKqV4W94UQoAmNRg+TTgbhI1fRcbL4d3qIY4nOV/5M4Z+K
	 MBOq3DFvjVyFiXUv7mJiiFwHqfEXT2gG3FZd6IjFzw7UplYzVFUFI23dPOMyd+iDsZ
	 iKMJdsYztI8EgAZktEpm7J0pedv99v9o3HMQ03me2UT1XLcGXXGJt2rixME8r5PCRA
	 H7sxJy+jTPjPA==
Date: Wed, 28 Jan 2026 11:25:04 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: ardb@kernel.org, leitao@debian.org, corbet@lwn.net,
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	bp@alien8.de, mingo@kernel.org, pawan.kumar.gupta@linux.intel.com,
	feng.tang@linux.alibaba.com, kees@kernel.org, elver@google.com,
	arnd@arndb.de, fvdl@google.com, lirongqing@baidu.com,
	bhelgaas@google.com, bhe@redhat.com, dave.hansen@linux.intel.com,
	cfsworks@gmail.com, osandov@fb.com, sourabhjain@linux.ibm.com,
	jbohac@suse.cz, ryan.roberts@arm.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: kexec: Add support for crashkernel CMA
 reservation
Message-ID: <aXnV8HBOzTTWBbsI@kernel.org>
References: <20260126081334.699147-1-ruanjinjie@huawei.com>
 <aXnJd_Xghj9JLsnK@kernel.org>
 <3407c779-9e7e-8f90-353f-c2b58992aae2@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3407c779-9e7e-8f90-353f-c2b58992aae2@huawei.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,debian.org,lwn.net,arm.com,linux-foundation.org,alien8.de,linux.intel.com,linux.alibaba.com,google.com,arndb.de,baidu.com,redhat.com,gmail.com,fb.com,linux.ibm.com,suse.cz,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-74185-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CB9639EC64
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 05:10:15PM +0800, Jinjie Ruan wrote:
> 
> 
> On 2026/1/28 16:31, Mike Rapoport wrote:
> > On Mon, Jan 26, 2026 at 04:13:34PM +0800, Jinjie Ruan wrote:
> >> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
> >> crashkernel= command line option") and commit ab475510e042 ("kdump:
> >> implement reserve_crashkernel_cma") added CMA support for kdump
> >> crashkernel reservation.
> >>
> >> Crash kernel memory reservation wastes production resources if too
> >> large, risks kdump failure if too small, and faces allocation difficulties
> >> on fragmented systems due to contiguous block constraints. The new
> >> CMA-based crashkernel reservation scheme splits the "large fixed
> >> reservation" into a "small fixed region + large CMA dynamic region": the
> >> CMA memory is available to userspace during normal operation to avoid
> >> waste, and is reclaimed for kdump upon crash—saving memory while
> >> improving reliability.
> >>
> >> So extend crashkernel CMA reservation support to arm64. The following
> >> changes are made to enable CMA reservation:
> >>
> >> - Parse and obtain the CMA reservation size along with other crashkernel
> >>   parameters.
> >> - Call reserve_crashkernel_cma() to allocate the CMA region for kdump.
> >> - Include the CMA-reserved ranges for kdump kernel to use.
> >> - Exclude the CMA-reserved ranges from the crash kernel memory to
> >>   prevent them from being exported through /proc/vmcore.
> >>
> >> Update kernel-parameters.txt to document CMA support for crashkernel on
> >> arm64 architecture.
> > 
> > I'm looking at this and at almost identical patch for riscv 
> > https://lore.kernel.org/all/20260126080738.696723-1-ruanjinjie@huawei.com
> > and it feels wrong that we have duplicate the code that excludes cma
> > ranges.
> > CMA ranges are known to the crash_core and I don't see why we cannot
> > exclude them there.
> 
> Youa are right, x86 and powerpc has similar implementations that
> excludes crashkernel cma ranges.
> 
> x86 [1]
> 
> +	for (i = 0; i < crashk_cma_cnt; ++i) {
> +		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
> +					      crashk_cma_ranges[i].end);
> +		if (ret)
> +			return ret;
> +	}

So if this loop was in crash_prepare_elf64_headers() it would work for
arm64, riscv and x86, right?

> +
> +	return 0;
> 
> But powerpc [2] is a little different which uses a wrapper for
> crash_exclude_mem_range() and more check and realloc_mem_ranges().
> 
> +	for (i = 0; i < crashk_cma_cnt; ++i) {
> +		ret = crash_exclude_mem_range_guarded(mem_ranges,
> crashk_cma_ranges[i].start,
> +					      crashk_cma_ranges[i].end);
> +		if (ret)
> +			goto out;
> +	}

As for powerpc crash_exclude_mem_range_guarded() could only check if
mem_ranges is large enough and reallocate and then actual exclusion in
crash_prepare_elf64_headers() should also work.

> [1]: https://lore.kernel.org/all/ZWEAWMJtesa3O9M5@dwarf.suse.cz/
> [2]:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b4a96ab50f368afc2360ff539a20254ca2c9a889

-- 
Sincerely yours,
Mike.

