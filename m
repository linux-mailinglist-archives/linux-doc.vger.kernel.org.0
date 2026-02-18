Return-Path: <linux-doc+bounces-76217-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPwMN57wlWlTWwIAu9opvQ
	(envelope-from <linux-doc+bounces-76217-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Feb 2026 18:02:22 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF94158031
	for <lists+linux-doc@lfdr.de>; Wed, 18 Feb 2026 18:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F2083012CFC
	for <lists+linux-doc@lfdr.de>; Wed, 18 Feb 2026 17:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BDDD32F766;
	Wed, 18 Feb 2026 17:02:18 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D1727FB05;
	Wed, 18 Feb 2026 17:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771434137; cv=none; b=RzhXR7gpgNnO06yQl9x/RSXxDPrTg4dUCGwqG4mAZ2fhvgv87hW4IFZ03QS3xW7CuLRxIFsLeG6QWDcx+h/fmv5k5kYp6apfrgx1lZUnRL9QcaAqiiPhu4Vy2NG8IBRQ7YL5emGdJGvCB5tonDDsTX/Txsi4zVAB3+NCXZ7d3fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771434137; c=relaxed/simple;
	bh=FbspF4cZNt8xwQgfm66zQ000CMjwK09OZUhidFbe9Wc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WdL/GzdRBUIgDWnHlVchqrwTq1HKXGcR/qGJdrHiNvL4PqScgZoL3SzwKB6uBFbAmtUKPIJIpyNMiWThpiyNwltaHhjZK5CpYkpLB7Mq4y/GRddVgyB+1ndtekLNkMCGOf9SVp5L/aZ3s//t5aZ7dYFriBnpOf1XzjFhyPP9PKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97A0E339;
	Wed, 18 Feb 2026 09:02:09 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF5843F62B;
	Wed, 18 Feb 2026 09:02:10 -0800 (PST)
Message-ID: <9d0cc06b-f8cb-43bb-94da-98d106cb5798@arm.com>
Date: Wed, 18 Feb 2026 17:02:09 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 41/41] arm64: mpam: Add initial MPAM documentation
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org
References: <20260203214342.584712-1-ben.horgan@arm.com>
 <20260203214342.584712-42-ben.horgan@arm.com>
 <20260205170557.00000d4d@huawei.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20260205170557.00000d4d@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-76217-lists,linux-doc=lfdr.de];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:mid,arm.com:email]
X-Rspamd-Queue-Id: 2FF94158031
X-Rspamd-Action: no action

Hi Jonathan,

On 2/5/26 17:05, Jonathan Cameron wrote:
> On Tue, 3 Feb 2026 21:43:42 +0000
> Ben Horgan <ben.horgan@arm.com> wrote:
> 
>> MPAM (Memory Partitioning and Monitoring) is now exposed to user-space via
>> resctrl. Add some documentation so the user knows what features to expect.
>>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>> Changes by Ben:
>> Some tidying, update for current heuristics
>> ---
>>  Documentation/arch/arm64/index.rst |  1 +
>>  Documentation/arch/arm64/mpam.rst  | 93 ++++++++++++++++++++++++++++++
>>  2 files changed, 94 insertions(+)
>>  create mode 100644 Documentation/arch/arm64/mpam.rst
>>
>> diff --git a/Documentation/arch/arm64/index.rst b/Documentation/arch/arm64/index.rst
>> index 6a012c98bdcd..189fa760dade 100644
>> --- a/Documentation/arch/arm64/index.rst
>> +++ b/Documentation/arch/arm64/index.rst
>> @@ -23,6 +23,7 @@ ARM64 Architecture
>>      memory
>>      memory-tagging-extension
>>      mops
>> +    mpam
>>      perf
>>      pointer-authentication
>>      ptdump
>> diff --git a/Documentation/arch/arm64/mpam.rst b/Documentation/arch/arm64/mpam.rst
>> new file mode 100644
>> index 000000000000..0769bccff25e
>> --- /dev/null
>> +++ b/Documentation/arch/arm64/mpam.rst
>> @@ -0,0 +1,93 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +====
>> +MPAM
>> +====
>> +
>> +What is MPAM
>> +============
> 
> 
>> +  MPAM (Memory Partitioning and Monitoring) is a feature in the CPUs and memory
> 
> I've not seen this style of indenting much in rst.  I checked a few
> files in this directory and it's not used in the ones I randomly picked.
> + it's not what the kernel-documentation.rst file suggests is standard
> formatting.

I seem to have needlessly invented a new style. I've not removed lots of
white space. It should match the rest now.

> 
> Other than that the content looks fine to me.
> 
> Jonathan

Thanks,

Ben


