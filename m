Return-Path: <linux-doc+bounces-90426-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIelF081HmrChwkAu9opvQ
	(envelope-from <linux-doc+bounces-90426-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 03:43:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2CD626E63
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 03:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 71307300C012
	for <lists+linux-doc@lfdr.de>; Tue,  2 Jun 2026 01:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B237337BBD;
	Tue,  2 Jun 2026 01:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="rHaZ8PNG"
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E5F1E515;
	Tue,  2 Jun 2026 01:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780364618; cv=none; b=L5IRlXXDCR/ULhDie5oJR+orIJEbxYJfyTTu3IQ4NEJgtUe8efF0fSRG3jjLaMOtCtAfwitYkE6+89y8bZHfqeRhW6tnJMYHhsemh4X1dRLF3dE2pWpE+u7sgptmgKSK/xbQrGRySHbj/JM7G7eLaF7UpeoXhxhw50zHamGHY1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780364618; c=relaxed/simple;
	bh=Is74unXW3WLzqATS41lpUgNaFD3it4MLsOw3+TT8G4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CljaYJdloAy4eCJgbZIigWiLZyq47Y4v1tQ6pCPtU2LWXCVbj9inIVBgKQGkMlK+LIqdGJD+2zdPP555P6KDqqZe7KwPl6fyDSUl6/HkNrxbTYv8cMSwKM+yclAQuJzgQMbygsm0a3fS0PqdD1fue8V+H8kIFDDhreW5a5AmDMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=rHaZ8PNG; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lSyN8uzwXhmY7DMOaiH5+32B3ctfvf5QTlFldSqrORg=;
	b=rHaZ8PNGA+gISgwgik10XoynkWfz7ayOHWp5pYg2DR9+kM7LRE6sFvvbCwY7WZuExcMNMQCQS
	XuZ/RD3H3jG0SNieTYmEXXudVXbblnFxAcsCDvSXYCJwK6nxFw20KYn+MN8CS9fgZgl4GqZ8Sc9
	+cBgIb8sYmtBRoiL2hN8lbA=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gTthC4T77zpStZ;
	Tue,  2 Jun 2026 09:35:55 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id A94E940561;
	Tue,  2 Jun 2026 09:43:31 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 2 Jun 2026 09:43:27 +0800
Message-ID: <1a459706-80db-43d8-b163-76fc09da338d@huawei.com>
Date: Tue, 2 Jun 2026 09:43:26 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/23] arm64/riscv: Add support for crashkernel CMA
 reservation
To: Baoquan He <baoquan.he@linux.dev>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <rppt@kernel.org>,
	<pasha.tatashin@soleen.com>, <pratyush@kernel.org>, <ruirui.yang@linux.dev>,
	<rdunlap@infradead.org>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<kuba@kernel.org>, <lirongqing@baidu.com>, <ebiggers@kernel.org>,
	<paulmck@kernel.org>, <sourabhjain@linux.ibm.com>, <thuth@redhat.com>,
	<ardb@kernel.org>, <masahiroy@kernel.org>, <gshan@redhat.com>,
	<james.morse@arm.com>, <maz@kernel.org>, <leitao@debian.org>,
	<yeoreum.yun@arm.com>, <coxu@redhat.com>, <suzuki.poulose@arm.com>,
	<cfsworks@gmail.com>, <osandov@fb.com>, <jbohac@suse.cz>,
	<ryan.roberts@arm.com>, <tangyouling@kylinos.cn>, <ritesh.list@gmail.com>,
	<adityag@linux.ibm.com>, <hbathini@linux.ibm.com>, <bjorn@rivosinc.com>,
	<songshuaishuai@tinylab.org>, <vishal.moola@gmail.com>,
	<junhui.liu@pigmoral.tech>, <djordje.todorovic@htecgroup.com>,
	<austin.kim@lge.com>, <namcao@linutronix.de>, <djbw@kernel.org>,
	<chao.gao@intel.com>, <seanjc@google.com>, <fuqiang.wang@easystack.cn>,
	<liaoyuanhong@vivo.com>, <makb@juniper.net>, <graf@amazon.com>,
	<piliu@redhat.com>, <rafael.j.wysocki@intel.com>,
	<mario.limonciello@amd.com>, <jbouron@amazon.com>, <chenjiahao16@huawei.com>,
	<guoren@kernel.org>, <bauerman@linux.ibm.com>, <bgwin@google.com>,
	<takahiro.akashi@linaro.org>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
References: <20260601094805.2928614-1-ruanjinjie@huawei.com>
 <ah2Lx7KHI60tzd0v@MiWiFi-R3L-srv>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <ah2Lx7KHI60tzd0v@MiWiFi-R3L-srv>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,soleen.com,linux.dev,infradead.org,linux.alibaba.com,google.com,baidu.com,debian.org,fb.com,suse.cz,kylinos.cn,rivosinc.com,tinylab.org,pigmoral.tech,htecgroup.com,lge.com,linutronix.de,intel.com,easystack.cn,vivo.com,juniper.net,amazon.com,amd.com,huawei.com,linaro.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	URIBL_MULTI_FAIL(0.00)[huawei.com:server fail,sto.lore.kernel.org:server fail];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90426-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[88];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:mid,huawei.com:dkim]
X-Rspamd-Queue-Id: 2C2CD626E63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 6/1/2026 9:40 PM, Baoquan He wrote:
> Hi Jinjie,
> 
> On 06/01/26 at 05:47pm, Jinjie Ruan wrote:
> ...snip... 
>> Changes in v15:
>> - Unify the subject prefix formats as Huacai suggested.
>> - Fix powerpc pre-existing NULL pointer dereference [Sashiko [1]]
>> - Fix powerpc pre-existing __merge_memory_ranges() memory range
>>   truncation [Sashiko [1]].
>> - Fix pre-existing arm64 CMA page leaks [Sashiko[2]].
>> - Fix pre-existing crash_load_dm_crypt_keys() Use-After-Free and
>>   Double Free issue [Sashiko[3]].
>> - Fix vfree(headers) and uninitialized variables issue
>>   and simplify the fix [Sashiko[2]].
>> - As walk_system_ram_res() and for_each_mem_range() use different
>>   lock, unify and simplify the fix of TOCTOU buffer overflow via memory
>>   region padding [Sashiko[4]].
>> - Fix the arm64 crash dump issues in Sashiko[5].
>> - Link to v14: https://lore.kernel.org/all/20260525084932.934910-1-ruanjinjie@huawei.com/
> 
> Do these Fixes have anything with the main target of this patch series
> you mentioned in cover-letter:"arm64/riscv: Add support for crashkernel CMA"?
> The patches become more and more in each new version, I am wondering if
> it relies on these Fixes patches to implement your adding support for
> crashkernel CMA on arm64/risc-v.
> 
> If not relying on them, could you split them into different patchset
> on different purpose? 

Hi Baoquan,

Thank you for your valuable guidance.

You are absolutely right. Most of these fix patches are indeed not
strictly related to the core implementation of the crashkernel CMA
support. They are pre-existing bugs in the surrounding kexec/crash code
that were flagged during our review.

Previously, Andrew suggested taking a look at the code review comments
from the Sashiko AI system, which is why these fixes kept expanding. I
completely agree with your advice that there is no need to keep them
together. I will split them into two completely different patchsets
based on their purpose:

1. A cleaner version of this series, strictly focused on adding the core
crashkernel CMA support for arm64/riscv.

2. One standalone bugfix patchset dedicated entirely to fixing these
pre-existing issues.

By the way, I would also appreciate some advice on how to handle further
AI reviews. It seems that the more code we touch or refactor to fix
these pre-existing issues, the more tangential bugs the AI flags in the
newly exposed areas, making the series extremely difficult to converge.

Should I continue to address all AI-reported bugs associated with the
surrounding code in this series, or should we draw a strict line
and only focus on the core CMA logic moving forward?

I will prepare the split patchsets shortly. Thanks again for
straightening this out!

Best regards,
Jinjie Ruan


> 
> Thanks
> Baoquan
> 
>>
>> [1]: https://lore.kernel.org/all/20260525092207.96B9D1F000E9@smtp.kernel.org/
>> [2]: https://lore.kernel.org/all/20260525091149.1A1E01F00A3D@smtp.kernel.org/
>> [3]: https://lore.kernel.org/all/20260525105227.3C2421F000E9@smtp.kernel.org/
>> [4]: https://lore.kernel.org/all/20260525095447.944E11F000E9@smtp.kernel.org/
>> [5]: https://lore.kernel.org/all/20260525101746.9959D1F000E9@smtp.kernel.org/
>>
>> Changes in v14:
>> - Fix image->elf_headers memory leak during retry loop for arm64 as Sashiko
>>   AI code review pointed out.
>> - Solve the hotplug notifier arch_crash_handle_hotplug_event() AA
>>   self-deadlock problem as Sashiko AI code review pointed out.
>> - Fix the TOCTOU issue in prepare_elf_headers() by get_online_mems().
>> - -ENOMEM -> -EAGAIN as Breno suggested.
>> - Add support for arm64 crash hotplug.
>> - Link to v13: https://lore.kernel.org/all/20260511030454.1730881-1-ruanjinjie@huawei.com/
>>

[...]
>>  24 files changed, 430 insertions(+), 338 deletions(-)
>>  create mode 100644 arch/arm64/kernel/crash.c
>>
>> -- 
>> 2.34.1
>>


