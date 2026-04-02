Return-Path: <linux-doc+bounces-82208-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLmMGXLXzWlxiQYAu9opvQ
	(envelope-from <linux-doc+bounces-82208-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Apr 2026 04:41:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1039382C80
	for <lists+linux-doc@lfdr.de>; Thu, 02 Apr 2026 04:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F24E30293FC
	for <lists+linux-doc@lfdr.de>; Thu,  2 Apr 2026 02:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E239E3328FD;
	Thu,  2 Apr 2026 02:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="KvW2Xnyc"
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91A91E32D6;
	Thu,  2 Apr 2026 02:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775097648; cv=none; b=nsCVzuZ1iNG4k2MsGe9Aox6sxmy9kiRSn0xGQsJw4hOqciLvSU3X0R63dWdgClIjzvp175riQrGtt+i6T1Ms+7MyEjXUngbde+61QzZdsbF7hnSCvg+v5blczJYGnlBWeo0IA1oZjDR9dilZqwIXezM9IqtPNefB8L6EBZzJ47Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775097648; c=relaxed/simple;
	bh=xm3bYxcxOUlXn0Q63meF9KmhwO02RwnjKtrHxG3LHqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G+jxaDWRjjuOMqLWU9/PEqjmnYP60/VZTcbsNWw0pnJI1ouFK6Xjh1lRf9ar6914WU5t66S9QyuBcv+kDc077Q1M9xa6LV+osRxFFUAv2bQ7Adxny81nUzrerMZebmGy+OmZbGAPGpxetN4rZ78yPQm1nSqOfZC72pVopXmFRi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=KvW2Xnyc; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ROWEGxqksQxFZs46Z6UIzyFf3Gnn2DH3A2REbgNnCmE=;
	b=KvW2XnycR1GXkgXBNFAHBb0gyzZiFhJQ1L52/ao+6KhBQewLy9Mo/i4RrsyZ1J8Axtygqbm2e
	IrfQxZm1MbH4Z4AURBg1of8D3Ft8qgiVHpBhGIKf6aPQPlk4i2Sp3Be/EsWqkYd3HpYcVMErRvp
	s5emz2sM9i+TvRTc/EUacX8=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fmQsv6QHCzRhQZ;
	Thu,  2 Apr 2026 10:34:27 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 2317E40561;
	Thu,  2 Apr 2026 10:40:38 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 2 Apr 2026 10:40:37 +0800
Message-ID: <730aaffa-9dfd-40c3-a372-c774d203b6e1@huawei.com>
Date: Thu, 2 Apr 2026 10:40:37 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Support the FEAT_HDBSS introduced in Armv9.5
To: Leonardo Bras <leo.bras@arm.com>
CC: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<corbet@lwn.net>, <pbonzini@redhat.com>, <will@kernel.org>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <liuyonglong@huawei.com>,
	<Jonathan.Cameron@huawei.com>, <yezhenyu2@huawei.com>, <linuxarm@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <skhan@linuxfoundation.org>,
	<suzuki.poulose@arm.com>
References: <20260225040421.2683931-1-zhengtian10@huawei.com>
 <acvWnjG0AZBHL21q@devkitleo>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <acvWnjG0AZBHL21q@devkitleo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-82208-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengtian10@huawei.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:dkim,huawei.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C1039382C80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/31/2026 10:13 PM, Leonardo Bras wrote:
> On Wed, Feb 25, 2026 at 12:04:16PM +0800, Tian Zheng wrote:
>> This series of patches add support to the Hardware Dirty state tracking
>> Structure(HDBSS) feature, which is introduced by the ARM architecture
>> in the DDI0601(ID121123) version.
>>
>> The HDBSS feature is an extension to the architecture that enhances
>> tracking translation table descriptors' dirty state, identified as
>> FEAT_HDBSS. This feature utilizes hardware assistance to achieve dirty
>> page tracking, aiming to significantly reduce the overhead of scanning
>> for dirty pages.
>>
>> The purpose of this feature is to make the execution overhead of live
>> migration lower to both the guest and the host, compared to existing
>> approaches (write-protect or search stage 2 tables).
>>
>> After these patches, users(such as qemu) can use the
>> KVM_CAP_ARM_HW_DIRTY_STATE_TRACK ioctl to enable or disable the HDBSS
>> feature before and after the live migration.
>>
>> v2:
>> https://lore.kernel.org/linux-arm-kernel/20251121092342.3393318-1-zhengtian10@huawei.com/
>>
>> v2->v3 changes:
>> - Remove the ARM64_HDBSS configuration option and ensure this feature
>> is only enabled in VHE mode.
>> - Move HDBSS-related variables to the arch-independent portion of the
>> kvm structure.
>> - Remove error messages during HDBSS enable/disable operations
>> - Change HDBSS buffer flushing from handle_exit to vcpu_put,
>> check_vcpu_requests, and kvm_handle_guest_abort.
>> - Add fault handling for HDBSS including buffer full, external abort,
>> and general protection fault (GPF).
>> - Add support for a 4KB HDBSS buffer size, mapped to the value 0b0000.
>> - Add a second argument to the ioctl to turn HDBSS on or off.
>>
>> Tian Zheng (1):
>>    KVM: arm64: Document HDBSS ioctl
>>
>> eillon (4):
>>    arm64/sysreg: Add HDBSS related register information
>>    KVM: arm64: Add support to set the DBM attr during memory abort
>>    KVM: arm64: Add support for FEAT_HDBSS
>>    KVM: arm64: Enable HDBSS support and handle HDBSSF events
>>
>>   Documentation/virt/kvm/api.rst       |  16 +++++
>>   arch/arm64/include/asm/cpufeature.h  |   5 ++
>>   arch/arm64/include/asm/esr.h         |   7 ++
>>   arch/arm64/include/asm/kvm_host.h    |  17 +++++
>>   arch/arm64/include/asm/kvm_mmu.h     |   1 +
>>   arch/arm64/include/asm/kvm_pgtable.h |   4 ++
>>   arch/arm64/include/asm/sysreg.h      |  11 +++
>>   arch/arm64/kernel/cpufeature.c       |  12 ++++
>>   arch/arm64/kvm/arm.c                 | 102 +++++++++++++++++++++++++++
>>   arch/arm64/kvm/hyp/pgtable.c         |   6 ++
>>   arch/arm64/kvm/hyp/vhe/switch.c      |  19 +++++
>>   arch/arm64/kvm/mmu.c                 |  70 ++++++++++++++++++
>>   arch/arm64/kvm/reset.c               |   3 +
>>   arch/arm64/tools/cpucaps             |   1 +
>>   arch/arm64/tools/sysreg              |  29 ++++++++
>>   include/uapi/linux/kvm.h             |   1 +
>>   tools/include/uapi/linux/kvm.h       |   1 +
>>   17 files changed, 305 insertions(+)
>>
>> --
>> 2.33.0
>>
>
> Hi Tian,
>
> I was thinking: maybe instead of putting the HDBSS (and HACDBS) stuff
> across a bunch of KVM files, we should try to focus them all on a single
> arch/arm64/kvm/dirty_bit.c file (plus a header such as
> arch/arm64/include/asm/kvm_dirty_bit.h).
>
> What is your opinion on that?
>
> Thanks!
> Leo


Sorry for the late reply. Yes, I had the same thought before. In the 
next version, I will

move all the HDBSS-related content into the same file, such as 
arch/arm64/kvm/dirty_bit.c

and arch/arm64/include/asm/kvm_dirty_bit.h.


Tian


>
>

