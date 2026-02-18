Return-Path: <linux-doc+bounces-76212-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFKjGnvnlWnKWAIAu9opvQ
	(envelope-from <linux-doc+bounces-76212-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Feb 2026 17:23:23 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF68B157B09
	for <lists+linux-doc@lfdr.de>; Wed, 18 Feb 2026 17:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B7B9301AD3F
	for <lists+linux-doc@lfdr.de>; Wed, 18 Feb 2026 16:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE7E33F372;
	Wed, 18 Feb 2026 16:22:19 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E347232ED37;
	Wed, 18 Feb 2026 16:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771431739; cv=none; b=QyfHGcV+w1cnXMMrAPclc/milh5abkdAflVoZZctlPYwe3lYIFuPSmWpQI7qdXMWAg/HaVX3te3KAU1ZWUCWindNoa3fsbL1qJSsQWVV5GL1LyzOtPyJZFx2PD62N29mRPWWbQAgiOFsUUa6tJ8yDYo0nz6RRdrBR5jK+vG3/80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771431739; c=relaxed/simple;
	bh=5PXyOtynNVbMKoP+2/0MXz7v41D2R0c+pSyvmcJSdno=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HJy/XuXtSDxbtPBLJkiJM+kof8c+RLzmqIzCcWlrbgKE9naczzZzi1FydxXAe/aAJGZ3T9lSc8t/TAW1vgwJdceq+IZeWmUowLZLhHRWEzUXn1Gu8doVvVORDFUU+oMq61k4YkGPOtGE5mlpuEfFIaJHjZbIy7OhF52KgromUjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CEB6339;
	Wed, 18 Feb 2026 08:22:09 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F5A23F62B;
	Wed, 18 Feb 2026 08:22:10 -0800 (PST)
Message-ID: <1acf06d1-08af-4b05-82e7-655c8ef7cf0e@arm.com>
Date: Wed, 18 Feb 2026 16:22:08 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 26/41] arm_mpam: resctrl: Add support for 'MB' resource
From: Ben Horgan <ben.horgan@arm.com>
To: Zeng Heng <zengheng4@huawei.com>, james.morse@arm.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, gshan@redhat.com, kobak@nvidia.com,
 lcherian@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peternewman@google.com,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 linux-doc@vger.kernel.org, Kefeng Wang <wangkefeng.wang@huawei.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
 <20260203214342.584712-27-ben.horgan@arm.com>
 <20260205165018.0000089c@huawei.com>
 <f6f865bc-319c-8944-9989-4fd83a59d4b8@huawei.com>
 <61684bd8-8156-4fe1-8033-eaa12c6d3437@arm.com>
Content-Language: en-US
In-Reply-To: <61684bd8-8156-4fe1-8033-eaa12c6d3437@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-76212-lists,linux-doc=lfdr.de];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:mid,arm.com:email]
X-Rspamd-Queue-Id: BF68B157B09
X-Rspamd-Action: no action

Hi Fenghua, Zeng,

On 2/16/26 13:54, Ben Horgan wrote:
> Hi Zeng,
> 
> On 2/13/26 07:38, Zeng Heng wrote:
>> Hi Ben,
>>
>> On 2026/2/6 0:50, Jonathan Cameron wrote:
>>> On Tue, 3 Feb 2026 21:43:27 +0000
>>> Ben Horgan <ben.horgan@arm.com> wrote:
>>>
>>>> From: James Morse <james.morse@arm.com>
>>>>
>>>> resctrl supports 'MB', as a percentage throttling of traffic from the
>>>> L3. This is the control that mba_sc uses, so ideally the class chosen
>>>> should be as close as possible to the counters used for mbm_total. If
>>>> there is a single L3 and the topology of the memory matches then the
>>>> traffic at the memory controller will be equivalent to that at egress of
>>>> the L3. If these conditions are met allow the memory class to back MB.
>>>>
>>>> MB's percentage control should be backed either with the fixed point
>>>> fraction MBW_MAX or bandwidth portion bitmaps. The bandwidth portion
>>>> bitmaps is not used as its tricky to pick which bits to use to avoid
>>>> contention, and may be possible to expose this as something other than a
>>>> percentage in the future.
>>>
>>> I'm very curious to know whether this heuristic is actually useful on
>>> many
>>> systems or whether many / most of them fail this 'shape' heuristic.
>>>
>>
>> The current MPAM driver has restrictions that limit MB control support.
>> For example, on some systems, the MPAM memory class MSCs are not located
>> at the L3 cache but rather at the memory controller (e.g., Mata). In
>> such cases, MB control and mbm_total bandwidth monitoring cannot be
>> enabled.
>>> I'm unsure whether the community would welcome and be willing to review
>> a patch series supporting such systems. Of course, the changes would
>> involve minor refactoring in the resctrl common layer.
> 
> Having MSC at the memory controllers is quite common and it would be
> good for the mpam driver and resctrl to support this. My current
> priority is the initial MPAM support and look at this and other extra
> features later but I'd be happy to help progress support in this area
> through review and discussion. There is some discussion about adding new
> schema at [1] and we should make sure  this is consistent with monitors
> too. James has some out of tree patches from before that disccussion at [2].
> 
> [1] https://lore.kernel.org/lkml/aPtfMFfLV1l%2FRB0L@e133380.arm.com/
> [2] git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
>  mpam/snapshot+extras/v6.18-rc1

Fenghua gave a talk at LPC on supporting cpu-less numa nodes in resctrl
so is likely to have some patches/ideas around measuring bandwidth at
memory controllers.

> 
>>
>> Any feedback would be greatly appreciated.
>>
>>
>> Best Regards,
>> Zeng Heng
> 
> Thanks,
> 
> Ben
> 
> 

Thanks,

Ben


