Return-Path: <linux-doc+bounces-95131-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iQUsGlerS2oDYQEAu9opvQ
	(envelope-from <linux-doc+bounces-95131-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 15:19:19 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 342AC711287
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 15:19:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=NU2eZAxZ;
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95131-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95131-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3842F3002D00
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 12:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635E33FE67A;
	Mon,  6 Jul 2026 12:57:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338C43DDB1A;
	Mon,  6 Jul 2026 12:57:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342666; cv=none; b=fazya5BUqkpf7te4jKEKUF2sqhAT5G/u0mta3fzWHBmhOwFw/DF2F5V0J4XByOJuGHYXDOMXGN0qJXyL0Kh2O9MkSS9HnzvvaMEa3ZX6IaEGV4q0zwiKiBZNIUw2GDNKclPfZ035m7N2i5pI8JKnBWlEQ8zpBNfpbr6t9OVeaCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342666; c=relaxed/simple;
	bh=tC2spD3U/GH5bblbsDUr2dwxWjOG4BtVw6VfclWtIu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=goPM1ZrXzpt6rnuxefC2zItqQvSb6J2s3iNOxtL1SWPEOtdgiD5i62mTl7WVsrOdqf6UH5cg5pvwYuR+WI063NfPuvmwm2YDDlTlQgZoBCnPIn/8Y0zpymu/+EHYZHcSlkZZnZ1opuWdRDbsNqkXwp0EyoE9f+UeGFaqb1hP3+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=NU2eZAxZ; arc=none smtp.client-ip=113.46.200.218
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=HWGOFzpCq+iP0+0NjVv6uf8SWmRqy5AkRECjfy5Liok=;
	b=NU2eZAxZ55qGUQI+YpTRECwMn3mUleshFzTu8GaqJ7oGc0o+5nKlL18Zw5tGVc8jpnUvftU5f
	r+MqWqXHAjirTDpbZDYX66nsoRnSXiapg16NuApCiK/oXELFEHIEi8xDUoY4MYPdEvSKPX8WZF/
	Igdc02D3OV+yI9LYaruaEA4=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gv41B2TcqzpSvH;
	Mon,  6 Jul 2026 20:49:02 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 4509B4058C;
	Mon,  6 Jul 2026 20:57:39 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 6 Jul 2026 20:57:34 +0800
Message-ID: <4a2f2262-c945-4bc1-92dd-fc55e4118ba0@huawei.com>
Date: Mon, 6 Jul 2026 20:57:32 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] arm64: Move DAIF macros to ptrace.h and use them
 centrally
To: Breno Leitao <leitao@debian.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <maz@kernel.org>, <ardb@kernel.org>,
	<ilias.apalodimas@linaro.org>, <oupton@kernel.org>, <joey.gouly@arm.com>,
	<seiden@linux.ibm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<oleg@redhat.com>, <mark.rutland@arm.com>, <lpieralisi@kernel.org>,
	<tglx@kernel.org>, <ada.coupriediaz@arm.com>, <anshuman.khandual@arm.com>,
	<ebiggers@kernel.org>, <broonie@kernel.org>, <mrigendra.chaubey@gmail.com>,
	<baohua@kernel.org>, <lucaswei@google.com>, <james.morse@arm.com>,
	<zengheng4@huawei.com>, <thuth@redhat.com>, <yang@os.amperecomputing.com>,
	<leo.bras@arm.com>, <Sascha.Bischoff@arm.com>, <james.clark@linaro.org>,
	<peterz@infradead.org>, <ben.horgan@arm.com>,
	<punit.agrawal@oss.qualcomm.com>, <gshan@redhat.com>,
	<osama.abdelkader@gmail.com>, <fengchengwen@huawei.com>,
	<ryan.roberts@arm.com>, <yangyicong@hisilicon.com>, <kevin.brodsky@arm.com>,
	<kees@kernel.org>, <jeson.gao@unisoc.com>, <zhaoyang.huang@unisoc.com>,
	<ryotkkr98@gmail.com>, <wsw9603@163.com>, <pasha.tatashin@soleen.com>,
	<jeremy.linton@arm.com>, <schuster.simon@siemens-energy.com>,
	<osandov@fb.com>, <arnd@arndb.de>, <zhangpengjie2@huawei.com>,
	<smostafa@google.com>, <vladimir.murzin@arm.com>, <tabba@google.com>,
	<vdonnefort@google.com>, <kaleshsingh@google.com>, <jic23@kernel.org>,
	<timothy.hayes@arm.com>, <alexandru.elisei@arm.com>, <zenghui.yu@linux.dev>,
	<david@kernel.org>, <akpm@linux-foundation.org>, <ljs@kernel.org>,
	<memxor@gmail.com>, <qperret@google.com>, <chaitanyas.prakash@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-efi@vger.kernel.org>,
	<kvmarm@lists.linux.dev>
References: <20260703100135.2512312-1-ruanjinjie@huawei.com>
 <20260703100135.2512312-2-ruanjinjie@huawei.com> <akfl8VwB-RkHIFgm@gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <akfl8VwB-RkHIFgm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.66 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:leitao@debian.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:maz@kernel.org,m:ardb@kernel.org,m:ilias.apalodimas@linaro.org,m:oupton@kernel.org,m:joey.gouly@arm.com,m:seiden@linux.ibm.com,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:oleg@redhat.com,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:ada.coupriediaz@arm.com,m:anshuman.khandual@arm.com,m:ebiggers@kernel.org,m:broonie@kernel.org,m:mrigendra.chaubey@gmail.com,m:baohua@kernel.org,m:lucaswei@google.com,m:james.morse@arm.com,m:zengheng4@huawei.com,m:thuth@redhat.com,m:yang@os.amperecomputing.com,m:leo.bras@arm.com,m:Sascha.Bischoff@arm.com,m:james.clark@linaro.org,m:peterz@infradead.org,m:ben.horgan@arm.com,m:punit.agrawal@oss.qualcomm.com,m:gshan@redhat.com,m:osama.abdelkader@gmail.com,m:fengchengwen@huawei.com,m:ryan.roberts@arm.com,m:yangyicong@hisilicon.com,m:kevin.brodsky@arm.com,m:kees@kernel.org,m:jeson.gao@unisoc.com,m:zha
 oyang.huang@unisoc.com,m:ryotkkr98@gmail.com,m:wsw9603@163.com,m:pasha.tatashin@soleen.com,m:jeremy.linton@arm.com,m:schuster.simon@siemens-energy.com,m:osandov@fb.com,m:arnd@arndb.de,m:zhangpengjie2@huawei.com,m:smostafa@google.com,m:vladimir.murzin@arm.com,m:tabba@google.com,m:vdonnefort@google.com,m:kaleshsingh@google.com,m:jic23@kernel.org,m:timothy.hayes@arm.com,m:alexandru.elisei@arm.com,m:zenghui.yu@linux.dev,m:david@kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:memxor@gmail.com,m:qperret@google.com,m:chaitanyas.prakash@arm.com,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-efi@vger.kernel.org,m:kvmarm@lists.linux.dev,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,lwn.net,linuxfoundation.org,linaro.org,linux.ibm.com,huawei.com,redhat.com,gmail.com,google.com,os.amperecomputing.com,infradead.org,oss.qualcomm.com,hisilicon.com,unisoc.com,163.com,soleen.com,siemens-energy.com,fb.com,arndb.de,linux.dev,linux-foundation.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-95131-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[71];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:from_mime,huawei.com:dkim,huawei.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 342AC711287



On 7/4/2026 12:44 AM, Breno Leitao wrote:
> On Fri, Jul 03, 2026 at 06:01:19PM +0800, Jinjie Ruan wrote:
>> So move the definitions of DAIF_PROCCTX, DAIF_PROCCTX_NOIRQ, DAIF_ERRCTX,
>> and DAIF_MASK from <asm/daifflags.h> to <asm/ptrace.h>. 
> 
> This seems a bit counter intuitive, to have DAIF definitions at
> arm/ptrace.h instead of asm/daifflags.h, no?

If we keep them in <asm/daifflags.h>, we would hit a circular dependency
issue when <asm/daifflags.h> and <asm/ptrace.h> try to include each
other to resolve types.

> 
>> diff --git a/arch/arm64/kvm/hyp/nvhe/host.S b/arch/arm64/kvm/hyp/nvhe/host.S
>> index 9393fe3ea6a1..cbe2a616c726 100644
>> --- a/arch/arm64/kvm/hyp/nvhe/host.S
>> +++ b/arch/arm64/kvm/hyp/nvhe/host.S
>> @@ -11,6 +11,7 @@
>>  #include <asm/kvm_asm.h>
>>  #include <asm/kvm_mmu.h>
>>  #include <asm/kvm_ptrauth.h>
>> +#include <asm/ptrace.h>
> 
> ..
> 
>> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
>> index 89cb553be1e5..26ea02e7f5fd 100644
>> --- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
>> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
>> @@ -15,6 +15,7 @@
>>  #include <asm/kvm_asm.h>
>>  #include <asm/kvm_mmu.h>
>>  #include <asm/pgtable-hwdef.h>
>> +#include <asm/ptrace.h>
> 
> And then you need to do this in many low level files, which sounds less
> intuitive to have to have ptrace.h include instead of asm/daifflags.h
> (which is clear why we need it).
> 
> --breno


