Return-Path: <linux-doc+bounces-42307-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E14A7D2A7
	for <lists+linux-doc@lfdr.de>; Mon,  7 Apr 2025 05:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ADEF188D876
	for <lists+linux-doc@lfdr.de>; Mon,  7 Apr 2025 03:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25385212B39;
	Mon,  7 Apr 2025 03:50:52 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169B718DB0C;
	Mon,  7 Apr 2025 03:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743997852; cv=none; b=kDOaE+8YvSUeVAU4GK7N7ZDufodjHFtFZBw4NZf4yQDhSkyau+Qm06QIAVVD0zx5G9R7LqRnWhZFLBKBWlRjl/Gj4SkFEZkRT+mTWBaGY1CDI9z6bV197SrcLzv1A/X8BeXHP8QDLHBkIovujkdUMp7Pv6OQDNTwL9as4FelGMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743997852; c=relaxed/simple;
	bh=zHT7be0Dz4631czeIb9rNYZtOo5wX0cfX0fmMjWkffY=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Alnc0pjLkFEDYJ0lswLxS57p45hVaBv4IfbaBAyUsWZr2XleE5kgi9Olo4kDyjgTNQ0W3aG3SNC5kiPzvcEgKZCFXTGyL6Am3m0fr1WxH9Qh4OKy/J3boCfC/BWwltv7H574mDv4kg4Aeb4wHgfCZMhaSVj8UV7TT9XvIDJjjXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZWFWq1h70zCsQL;
	Mon,  7 Apr 2025 11:47:03 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 58CA4180103;
	Mon,  7 Apr 2025 11:50:47 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 7 Apr 2025 11:50:46 +0800
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <corbet@lwn.net>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<yangyicong@hisilicon.com>, <joey.gouly@arm.com>, <yuzenghui@huawei.com>,
	<shuah@kernel.org>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <tangchengchang@huawei.com>
Subject: Re: [PATCH v2 1/6] arm64: Provide basic EL2 setup for FEAT_{LS64,
 LS64_V} usage at EL0/1
To: Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20250331094320.35226-1-yangyicong@huawei.com>
 <20250331094320.35226-2-yangyicong@huawei.com>
 <957ccba4-2ae1-4358-b62d-3b5c44d7f1ca@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <a520bb9c-839d-fd96-7ecf-365371e65e44@huawei.com>
Date: Mon, 7 Apr 2025 11:50:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <957ccba4-2ae1-4358-b62d-3b5c44d7f1ca@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd200014.china.huawei.com (7.221.188.8)

On 2025/4/3 17:04, Suzuki K Poulose wrote:
> On 31/03/2025 10:43, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Instructions introduced by FEAT_{LS64, LS64_V} is controlled by
>> HCRX_EL2.{EnALS, EnASR}. Configure all of these to allow usage
>> at EL0/1.
>>
>> This doesn't mean these instructions are always available in
>> EL0/1 if provided. The hypervisor still have the control at
>> runtime.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>   arch/arm64/include/asm/el2_setup.h | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
>> index ebceaae3c749..0259941602c4 100644
>> --- a/arch/arm64/include/asm/el2_setup.h
>> +++ b/arch/arm64/include/asm/el2_setup.h
>> @@ -57,9 +57,19 @@
>>           /* Enable GCS if supported */
>>       mrs_s    x1, SYS_ID_AA64PFR1_EL1
>>       ubfx    x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
>> -    cbz    x1, .Lset_hcrx_\@
>> +    cbz    x1, .Lskip_gcs_hcrx_\@
>>       orr    x0, x0, #HCRX_EL2_GCSEn
>>   +.Lskip_gcs_hcrx_\@:
> 
> minor nit: For consistency, could we rename this "set_ls64", similar to "set_hcrx" ?
> 

IIUC, set_xxx really touches the registers and skip_xxx should just check and prepare
the feature bits. so here using .Lskip_gcs_hrcx_\@ should be more proper and consistent
with other places in el2_setup.h, like __init_el2_debug/__init_el2_fgt which also use
.Lskip_xxx for skipping an unsupported feature?

Thanks.

>> +    /* Enable LS64, LS64_V if supported */
>> +    mrs_s    x1, SYS_ID_AA64ISAR1_EL1
>> +    ubfx    x1, x1, #ID_AA64ISAR1_EL1_LS64_SHIFT, #4
>> +    cbz    x1, .Lset_hcrx_\@
>> +    orr    x0, x0, #HCRX_EL2_EnALS
>> +    cmp    x1, #ID_AA64ISAR1_EL1_LS64_LS64_V
>> +    b.lt    .Lset_hcrx_\@
>> +    orr    x0, x0, #HCRX_EL2_EnASR
>> +
>>   .Lset_hcrx_\@:
>>       msr_s    SYS_HCRX_EL2, x0
>>   .Lskip_hcrx_\@:
> 
> Suzuki
> 
> .

