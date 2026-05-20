Return-Path: <linux-doc+bounces-88584-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YM36JzN+DWosyAUAu9opvQ
	(envelope-from <linux-doc+bounces-88584-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 11:26:11 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5E058AB9D
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 11:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22F6231B26C6
	for <lists+linux-doc@lfdr.de>; Wed, 20 May 2026 08:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66903AF643;
	Wed, 20 May 2026 08:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="ahldOXzR"
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8E52D1F40;
	Wed, 20 May 2026 08:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779267113; cv=none; b=rjOTq2L2SYb9SBiTIyZhh/zHWPNPkHb7UCY2EbZwoWcL+9KnYwc/lFTK9t2BaCrAaIFaeCUmAdh6CTg2vBUXi4OPQE8JgKBOQO8Yrbun4jc0E4z1ToKJNQ1VV0bfgsoKsDCxXS63ioXvvAwU7B34u8n7eq2Yf8fDF/Tjj76frD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779267113; c=relaxed/simple;
	bh=9JAocrfSRE8OAcaCFSUKgWUvl095GAK8sITS8uCFLjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=E7duziOdiDfscyg9lEQvP34MqmSVEWvSFoFzz1JEWTCLr+CjBtZWnkSDBhd7jJPnJOxyZ1+aVygaRDPp8ipYbOg2xrYsu+n4beogOXrtsvpQmptRxykiUMGBQOI4WfW6EkPEkNwYbIXLDuadjZcwFflom22FqecZZLkZNzNFdcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ahldOXzR; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5ILLE5X/zh5Zp5m7SYWsEaC8ZBBvgKc8eCKNCOEyqYg=;
	b=ahldOXzRVBCatzSoLh4qIWjZNKkjLW+qbMChK+u+JTSiPCXdTZPYb9zQteodxgzTQLeiOjLFL
	1TOQJNZphPCA3XiHB3+YzYEx6XTyKjoXuFgzD869C++zx7TZXKvZ+XrYS/dQlY+k8Os8NGRpKvC
	x+HpkHsLmUgowgc8bj+OXyA=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gL4pP2yrDzcbR6;
	Wed, 20 May 2026 16:44:13 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 6149B4056E;
	Wed, 20 May 2026 16:51:47 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 20 May 2026 16:51:46 +0800
Message-ID: <cd330f4f-2604-48ce-bfcf-c9a79f48e66b@huawei.com>
Date: Wed, 20 May 2026 16:51:46 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Support the FEAT_HDBSS introduced in Armv9.5
To: Will Deacon <will@kernel.org>, <maz@kernel.org>, <oupton@kernel.org>,
	<catalin.marinas@arm.com>, <corbet@lwn.net>, <pbonzini@redhat.com>, Tian
 Zheng <zhengtian10@huawei.com>
CC: <kernel-team@android.com>, <yuzenghui@huawei.com>,
	<wangzhou1@hisilicon.com>, <liuyonglong@huawei.com>, <yezhenyu2@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <skhan@linuxfoundation.org>,
	<suzuki.poulose@arm.com>, <leo.bras@arm.com>, Jonathan Cameron
	<jic23@kernel.org>
References: <20260225040421.2683931-1-zhengtian10@huawei.com>
 <177918656142.736362.17906576792384645789.b4-ty@kernel.org>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <177918656142.736362.17906576792384645789.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
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
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-88584-lists,linux-doc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,huawei.com:mid,huawei.com:dkim]
X-Rspamd-Queue-Id: DD5E058AB9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/2026 11:23 PM, Will Deacon wrote:
> On Wed, 25 Feb 2026 12:04:16 +0800, Tian Zheng wrote:
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
>> [...]
> 
> Applied sysreg definitions to arm64 (for-next/sysregs), thanks!
> 
> [1/5] arm64/sysreg: Add HDBSS related register information
>        https://git.kernel.org/arm64/c/72f7be0c2e30
> 
> Cheers,

Thanks!
Tian


