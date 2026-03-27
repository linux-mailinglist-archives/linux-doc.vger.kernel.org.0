Return-Path: <linux-doc+bounces-81515-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIOzB340xmnzHQUAu9opvQ
	(envelope-from <linux-doc+bounces-81515-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2026 08:40:46 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E7B3408A9
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2026 08:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 993FD301D695
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2026 07:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9432690C0;
	Fri, 27 Mar 2026 07:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="YlJSh+sD"
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC0C3C6A25;
	Fri, 27 Mar 2026 07:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774597239; cv=none; b=stt2CHHa1cAt5bsfN7njvQ2Z3dmY1onu2nLgKDXheRzYj3sdjsJAxP1e37RXZwAxcn4FGobHHdRFFIJS2cazdrWczrs5oDIOpTFqhs7qP0KdtOOJBxLn0AnV3yqfvw3aW6ou++DiTs30/Rxx6NBpWqnaNjBPHENkqQlK68Swp4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774597239; c=relaxed/simple;
	bh=/L6AmJg74azI6rrEuQ5w93kRN5/h8LtEgS9vkE6amJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r3Pi692WJj8TPD2deF5pT9lY4EH+YOozAkRrqo/FEbRN6Pi+hjZ+CMyvUEQjBscl4ve7tGwy0eun8xXCp3bS3TmED4dLIFHZQtGJY9KTNayA0HR5reobDNFd/maYC8lC7irHgVx5j6wPjmCiUhWqzz39YHQMC+l9zsg05A+olV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=YlJSh+sD; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=m/TnutpGNNQMeOJaVLkcKsGuB+WWTz76WYqB2NYpJI0=;
	b=YlJSh+sD9R73qfN4YoYK35Z5sLwd4T4rTya15zQ6nnbzaxs1AM8MqCvdiBt5Khson6g0EaUdS
	ukF/jBaQHn3UL2erIrEMyYxbMs5l59TdRtynYSuI1mZAASkQUc+dOOZK2Kov2SPPWOnDJ91pSTC
	+6YM29BkZYu04sndbmuTu8g=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fhsqY1NG8z12Ljr;
	Fri, 27 Mar 2026 15:35:05 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 695A140561;
	Fri, 27 Mar 2026 15:40:31 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 27 Mar 2026 15:40:30 +0800
Message-ID: <6cce203f-89d9-4e9d-8b28-9629eb53b180@huawei.com>
Date: Fri, 27 Mar 2026 15:40:30 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/kvm: Enable eager hugepage splitting if HDBSS is
 available
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
 <20260225040421.2683931-5-zhengtian10@huawei.com>
 <acQj5grOdZT8LUGp@devkitleo> <acQna2hLwdr1juTN@devkitleo>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <acQna2hLwdr1juTN@devkitleo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-81515-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengtian10@huawei.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,huawei.com:dkim,huawei.com:mid]
X-Rspamd-Queue-Id: 50E7B3408A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/26/2026 2:20 AM, Leonardo Bras wrote:
> FEAT_HDBSS speeds up guest memory dirty tracking by avoiding a page fault
> and saving the entry in a tracking structure.
>
> That may be a problem when we have guest memory backed by hugepages or
> transparent huge pages, as it's not possible to do on-demand hugepage
> splitting, relying only on eager hugepage splitting.
>
> So, at stage2 initialization, enable eager hugepage splitting with
> chunk = PAGE_SIZE if the system supports HDBSS.
>
> Signed-off-by: Leonardo Bras <leo.bras@arm.com>
> ---
>   arch/arm64/kvm/mmu.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 070a01e53fcb..bdfa72b7c073 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -993,22 +993,26 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
>   
>   	mmu->last_vcpu_ran = alloc_percpu(typeof(*mmu->last_vcpu_ran));
>   	if (!mmu->last_vcpu_ran) {
>   		err = -ENOMEM;
>   		goto out_destroy_pgtable;
>   	}
>   
>   	for_each_possible_cpu(cpu)
>   		*per_cpu_ptr(mmu->last_vcpu_ran, cpu) = -1;
>   
> -	 /* The eager page splitting is disabled by default */
> -	mmu->split_page_chunk_size = KVM_ARM_EAGER_SPLIT_CHUNK_SIZE_DEFAULT;
> +	 /* The eager page splitting is disabled by default if system has no HDBSS */
> +	if (system_supports_hacdbs())
> +		mmu->split_page_chunk_size = PAGE_SIZE;
> +	else
> +		mmu->split_page_chunk_size = KVM_ARM_EAGER_SPLIT_CHUNK_SIZE_DEFAULT;
> +
>   	mmu->split_page_cache.gfp_zero = __GFP_ZERO;
>   
>   	mmu->pgd_phys = __pa(pgt->pgd);
>   
>   	if (kvm_is_nested_s2_mmu(kvm, mmu))
>   		kvm_init_nested_s2_mmu(mmu);
>   
>   	return 0;
>   
>   out_destroy_pgtable:


Thanks again for sending this patch. I'll integrate it into the next 
version and run some tests.



