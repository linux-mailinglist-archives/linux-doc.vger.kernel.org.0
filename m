Return-Path: <linux-doc+bounces-47992-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E06ACC38C
	for <lists+linux-doc@lfdr.de>; Tue,  3 Jun 2025 11:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B32F3A6CEA
	for <lists+linux-doc@lfdr.de>; Tue,  3 Jun 2025 09:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DDF2836A3;
	Tue,  3 Jun 2025 09:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NjiOKPQD"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB3C28312B
	for <linux-doc@vger.kernel.org>; Tue,  3 Jun 2025 09:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748944229; cv=none; b=MvM061p7rCvZkcyLICAWGe15cqicGX73tZRkjHcEcDIlD3Mngv57rlhTzYRCzF6Aq4kjafYzzRGs+n4XzOQSKMzL4k0YnTtEupV/Ilze4HFGnGvDa14xjv8nswzjQahYmkFQ4QIBDsAG0+rKdQg/SpYclyIOB334RvhVys01pkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748944229; c=relaxed/simple;
	bh=cYofdeohFRtCrlrs30kGtQgAlnzJghGw3tFBSu52gXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qFRuZrnFspC2zFSvLve6pa6rsADq+u006+PUtnBPwDhTf4AHfZTX5HLirliKlmihairSWzAFZtcu4C8nJF8fAxemoVmXKrb/5G9qJjRCyu+3dbnfRHtJrMsXvFRUFQc2cPae5mn9pMsOlcfv6e9bYZ5jd82sDP2zx9NSDvX1lAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NjiOKPQD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so2916537f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Jun 2025 02:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748944226; x=1749549026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YTiUXP9qqpwePncWUOCrudvn6ikDCRoeniFYV5C54HQ=;
        b=NjiOKPQDlT6MnFwQx9uTIPQmWBMWRPdZlu/lgZdmBoHwNCx6v1eS4FM2gZ+nSwtL/O
         FVep63rquqH5qPd+2WS5bOI2vYu5K3S0wn8Eb7ccdo/CEgeFwXouR3QX5JlKpyaXMIyF
         AEXmnYhuyvWzRNWLbUn5grpmPFLlbosiKeIExZwCP+uzAT9AL6O4h0FaNEIO8srQcn5t
         VUYQ25kkFz7DWqPY8GmTt1VDlxHQkCl5r+eW0Txe+W+sohDRwFYuL3OrMrRrXadCyO0e
         WIo4yWDWzmzRl0+jlGX5hWeCv/swOjzBxhgT+2xsQCihz8G/kqABs1IcBeeuPzCPnhQu
         Bplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748944226; x=1749549026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YTiUXP9qqpwePncWUOCrudvn6ikDCRoeniFYV5C54HQ=;
        b=P1cisMMOdQNlCg3XteIMj+9gl9BwGVqFo4NOVoN8cPiAHEv/wOb+Yf1531v36ctgvM
         b4AeQmJTBQF8NPOQeG7cHnHXZA5TsCybWqRjPrc5/u4qUCTZe8DvLqKKRLXbHN0sjI+e
         Fs8c+kb/ic+1mOeGz71JIJuqaj3t6jgf65ELwQlb6ARbHmyQxdV24tDvlzGNaMEuPhCc
         JF19+jQX7OcSXTYOr/hQZ1DD92yOlqdQdLBCNcZ8ZJfNZ3S00wsJwo8qKH45YY91oSye
         ktAjPSjDms+rJ/xQjH/0a04xBc6EaabrhoI1LzeJKWzJ30rFysaKbQNJuOHlzksLNdVt
         boMw==
X-Forwarded-Encrypted: i=1; AJvYcCXAsF4bJM0YQeb8Kkvid5zl2fEVyJSffiQjPfhpgbzaqQ+lprAbj+gR8XRcQWtyONExvvFj5Tv7f/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwErE6MzOVDgX8W70RYkfUgf5rxN132Yl0JY/K1yi9SfCPwg+Ce
	MZJzNk0bf5ExOUVj7gyrWbtiFYrAhIt4nvjikCzk8/YRkBkMdBhBlWDN3tm/27l8sYM=
X-Gm-Gg: ASbGncstkyU3XZ3KJizv/eU1xtXYzEp44X/cxR+5rL+cxazvf8tWuWFczn1LAK41Jyp
	VFLC9zKAuYU1t0AgOLqn8KbUObx2G29DJ5DFlJDCL3Z9rqpJnU5+B0Grqpd6o0BGmIDToALBu2p
	/gx/rLqPzdvC4y6sRkqKw7oxlB/TbMu/Z4r9O2i7jvjkuaq/qVxoAC1SwTNT3nqYy6R7uSr2jM8
	8uVV1Kq6B8JBlRerFK8MOkC6MmtW2yoq6Nci/lhU1LkQsPKUC12WnaitCjQg8emxVLZ4+ZNKlTX
	7/cyBYs4T+Is3v+9cj53p9PHj6Y52hB6LLqF1z6HCWqcrSWiFJGt0CnQ
X-Google-Smtp-Source: AGHT+IHsW44MmqwfDKjzghl/i3BzuGEINgERerQaDbyP3gu7SUf4muuyytvtJbMK7SPgP194SuthmQ==
X-Received: by 2002:a05:6000:2892:b0:3a3:6478:e08 with SMTP id ffacd0b85a97d-3a514502388mr1696065f8f.23.1748944225608;
        Tue, 03 Jun 2025 02:50:25 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c9d4sm17906246f8f.38.2025.06.03.02.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 02:50:25 -0700 (PDT)
Message-ID: <2fb1965b-bef9-4a8e-a1c7-c8a77d957b23@linaro.org>
Date: Tue, 3 Jun 2025 10:50:23 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] KVM: arm64: Add trap configs for PMSDSFR_EL1
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
 <20250529-james-perf-feat_spe_eft-v2-6-a01a9baad06a@linaro.org>
 <867c1ze4pg.wl-maz@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <867c1ze4pg.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/05/2025 5:56 pm, Marc Zyngier wrote:
> On Thu, 29 May 2025 12:30:27 +0100,
> James Clark <james.clark@linaro.org> wrote:
>>
>> SPE data source filtering (SPE_FEAT_FDS) adds a new register
>> PMSDSFR_EL1, add the trap configs for it.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   arch/arm64/kvm/emulate-nested.c | 1 +
>>   arch/arm64/kvm/sys_regs.c       | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
>> index 0fcfcc0478f9..05d3e6b93ae9 100644
>> --- a/arch/arm64/kvm/emulate-nested.c
>> +++ b/arch/arm64/kvm/emulate-nested.c
>> @@ -1169,6 +1169,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
>>   	SR_TRAP(SYS_PMSIRR_EL1,		CGT_MDCR_TPMS),
>>   	SR_TRAP(SYS_PMSLATFR_EL1,	CGT_MDCR_TPMS),
>>   	SR_TRAP(SYS_PMSNEVFR_EL1,	CGT_MDCR_TPMS),
>> +	SR_TRAP(SYS_PMSDSFR_EL1,	CGT_MDCR_TPMS),
>>   	SR_TRAP(SYS_TRFCR_EL1,		CGT_MDCR_TTRF),
>>   	SR_TRAP(SYS_TRBBASER_EL1,	CGT_MDCR_E2TB),
>>   	SR_TRAP(SYS_TRBLIMITR_EL1,	CGT_MDCR_E2TB),
>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>> index 5dde9285afc8..9f544ac7b5a6 100644
>> --- a/arch/arm64/kvm/sys_regs.c
>> +++ b/arch/arm64/kvm/sys_regs.c
>> @@ -2956,6 +2956,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>>   	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
>>   	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
>>   	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
>> +	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
> 
> PMSDSFR_EL1 has an offset in the VNCR page (0x858), and must be
> described as such. This is equally true for a bunch of other
> SPE-related registers, so you might as well fix those while you're at
> it.
> 
> Thanks,
> 
> 	M.
> 

I got a bit stuck with what that would look like with registers that are 
only undef in case there was something that I missed, but do I just 
document the offsets?

+++ b/arch/arm64/include/asm/vncr_mapping.h
@@ -87,6 +87,8 @@
  #define VNCR_PMSICR_EL1         0x838
  #define VNCR_PMSIRR_EL1         0x840
  #define VNCR_PMSLATFR_EL1       0x848
+#define VNCR_PMSNEVFR_EL1       0x850
+#define VNCR_PMSDSFR_EL1        0x858

+++ b/arch/arm64/include/asm/kvm_host.h
@@ -596,6 +596,16 @@ enum vcpu_sysreg {
         VNCR(ICH_HCR_EL2),
         VNCR(ICH_VMCR_EL2),

+       /* SPE Registers */
+       VNCR(PMBLIMITR_EL1),
+       VNCR(PMBPTR_EL1),
+       VNCR(PMBSR_EL1),
+       VNCR(PMSCR_EL1),
+       VNCR(PMSEVFR_EL1),
+       VNCR(PMSICR_EL1),
+       VNCR(PMSIRR_EL1),
+       VNCR(PMSLATFR_EL1),


And then sys_reg_descs[] remain as "{ SYS_DESC(SYS_PMBLIMITR_EL1), 
undef_access }," rather than EL2_REG_VNCR() because we don't actually 
want to change to bad_vncr_trap()?

There are some other parts about fine grained traps and res0 bits for 
NV, but they all already look to be setup correctly. Except 
HDFGRTR2_EL2.nPMSDSFR_EL1, but it's inverted, none of the FGT2 traps are 
configured currently and PMSDSFR_EL1 is already trapped by MDCR_EL2 anyway.

Thanks
James


