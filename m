Return-Path: <linux-doc+bounces-79939-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IpzDWZ9ummTWwIAu9opvQ
	(envelope-from <linux-doc+bounces-79939-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 11:24:38 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE3B2B9D5E
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 11:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A254B306CEE0
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 10:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DBB322B88;
	Wed, 18 Mar 2026 10:22:45 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE47B33EC;
	Wed, 18 Mar 2026 10:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773829364; cv=none; b=VRFUf97HoYHHbrd3nhuO699LTDmLV/6FZi/q+azsRuCOBaPsm2BMCk6AZFS4qYiLWyA2cTKvJYnfoE7q/5AKgVfPp7R0JgcBuyjItdSTIKqjUATA47COphpARyv01bp3NRAq9HKYI30UWaE9JDUdpH85W0Ki3WF5cioo/DzxWDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773829364; c=relaxed/simple;
	bh=AWNoVGlTeHh0vTJZXksAKLtoa+rNN0yOAW8HDTelPtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QcJ8gI/yYC+/zlNJVEQHLnU1mmnSQVWQTuGtUjzyCjfjkHKK/n7Lw8OT847dtPH7vu9h5DmbZcZdks8E/61Sr2hPDOXZ4ol3ysK6Cz9Cmn6SS+bkfYHJALGPEb8Uzp5sUJCDACx5R6IK7ckdhi2m15z4WuhbUGVCjHmIhbQ0uCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5FC81E2F;
	Wed, 18 Mar 2026 03:22:35 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BEF93F778;
	Wed, 18 Mar 2026 03:22:38 -0700 (PDT)
Message-ID: <967c7d65-6ffe-4eb9-817c-2eb1f9b510b1@arm.com>
Date: Wed, 18 Mar 2026 10:22:36 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v6 00/40] arm_mpam: Add KVM/arm64 and resctrl glue code
To: Jesse Chick <jessechick@os.amperecomputing.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260313144617.3420416-1-ben.horgan@arm.com>
 <a8d31059-f821-48ac-b6bb-7e8d38fac7b6@os.amperecomputing.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <a8d31059-f821-48ac-b6bb-7e8d38fac7b6@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.35 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-79939-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.929];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amperecomputing.com:email]
X-Rspamd-Queue-Id: 8BE3B2B9D5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jesse,

On 3/17/26 00:25, Jesse Chick wrote:
> Hi Ben,
> 
> 
>> Thanks for all the reviewing and testing so far. Just a bit more to get this
>> over the line.
> 
> 
> I tested this patch series, specifically L3 CPOR, on an Ampere
> implementation with common benchmarking tools (lmbench, multichase).
> 
> 
>> Generally the resctrl glue code works by picking what MPAM features it can expose
>> from the MPAM drive, then configuring the structs that back the resctrl helpers.
>> If your platform is sufficiently Xeon shaped, you should be able to get L2/L3 CPOR
>> bitmaps exposed via resctrl. CSU counters work if they are on/after the L3. MBWU
>> counters are considerably more hairy, and depend on hueristics around the topology,
>> and a bunch of stuff trying to emulate ABMC.
> 
> 
> The observed latency in increasingly large R/W operations scaled as
> expected across various numbers of competing processes and cache
> portions. The distinct jumps in latency as successive cache level
> capacities were exceeded indicates that (a) L3 CPOR is configurable from
> user space via the resctrl interface as described in this series and (b)
> that the feature itself is working correctly.
> 
> For the series:
> 
> Tested-by: Jesse Chick <jessechick@os.amperecomputing.com>

Thanks for the testing and description.

Ben

> 
> Thanks,
> Jesse
> 
> 


