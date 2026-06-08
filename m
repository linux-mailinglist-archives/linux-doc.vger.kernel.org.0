Return-Path: <linux-doc+bounces-91341-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uWDnFP97JmrkXAIAu9opvQ
	(envelope-from <linux-doc+bounces-91341-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 10:23:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BA8653FAC
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 10:23:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=edYZDT01;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91341-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91341-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C1F030120E7
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 08:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C65E3AA510;
	Mon,  8 Jun 2026 08:23:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6BB3A3E8B;
	Mon,  8 Jun 2026 08:23:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907002; cv=none; b=EBXfx1K7phVRsDQOcoNYqoGn7LQntfkKKdtPdbgUGsVi/lNhICHr2+QCL9VyK2nRGmhJjO0wFPwyDHoO2BRO8rfG2nMrRec0FuKCgGTuMUeAFhN+UEJMCH+4dG1CqIscYWeroBXhn3HszcLFdWORwUpWH/fqzeJ4erTHx2kYQq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907002; c=relaxed/simple;
	bh=zBJ0+6iki8mXgDpkiRZdp2up2Qck5jTHuoY18SoxxP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fAqBG4PcBpcQlWbp5bjUCDSpKGX8YoprtnbAw/i52RvApJ1wkLWTb9cD+Og+B/fjROmx4d9jSSBvulLPofHGq6eSzvOSfhPnC/KnzD1leh/06QIUJusrOuuJKrhSdP/8qc2HKshaeA2kG87ARRTQp4MlN+1TED8BeYmaetRUZ78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=edYZDT01; arc=none smtp.client-ip=113.46.200.219
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0w7UuJbrk8/79aFOsVk7Yx0ya08/zmKmr0eY8n6NxvI=;
	b=edYZDT01btd+1flK3bhqZkCTyQ1fdstH4uPirfjz64VnuvQ6C0+kgEBnVmGkQl91G2HuUuQd3
	YnoMXpdUg0VxM1R0RhaeorcUkYBKjeZAmgdSezV4PTEuybgqEahh1J3J0tMUrT3g/AcXrpX26wD
	QFQmQtODscQdT0EOeHgm+c0=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gYlGK66HYz1prMB;
	Mon,  8 Jun 2026 16:15:21 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 5B4DD4048F;
	Mon,  8 Jun 2026 16:23:17 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 8 Jun 2026 16:23:13 +0800
Message-ID: <4f3ae5f8-abf1-42ef-b613-7d69349f0cc8@huawei.com>
Date: Mon, 8 Jun 2026 16:23:12 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 07/10] LoongArch: kexec_file: Use
 crash_prepare_headers() helper to simplify code
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <rppt@kernel.org>,
	<pasha.tatashin@soleen.com>, <pratyush@kernel.org>, <ruirui.yang@linux.dev>,
	<rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<kees@kernel.org>, <elver@google.com>, <kuba@kernel.org>,
	<lirongqing@baidu.com>, <ebiggers@kernel.org>, <paulmck@kernel.org>,
	<leitao@debian.org>, <coxu@redhat.com>, <Liam.Howlett@oracle.com>,
	<ryan.roberts@arm.com>, <osandov@fb.com>, <jbohac@suse.cz>,
	<cfsworks@gmail.com>, <tangyouling@kylinos.cn>, <sourabhjain@linux.ibm.com>,
	<ritesh.list@gmail.com>, <adityag@linux.ibm.com>, <liaoyuanhong@vivo.com>,
	<seanjc@google.com>, <fuqiang.wang@easystack.cn>, <ardb@kernel.org>,
	<chenjiahao16@huawei.com>, <guoren@kernel.org>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>
References: <20260608073459.3119290-1-ruanjinjie@huawei.com>
 <20260608073459.3119290-8-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260608073459.3119290-8-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-91341-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,soleen.com,linux.dev,infradead.org,linux.alibaba.com,google.com,baidu.com,debian.org,oracle.com,fb.com,suse.cz,kylinos.cn,vivo.com,easystack.cn,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:robh@kernel.org,m:saravanak@kernel.org,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:rppt@kernel.org,m:pasha.tatashin@soleen.com,m:pratyush@kernel.org,m:ruirui.yang@linux.dev,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:kees@kernel.org,m:elver@google.com,m:kuba@kernel.org,m:lirongqing@baidu.com,m:ebiggers@kernel.org,m:paulmck@kernel.org,m:leitao@debian.org,m:coxu@redhat.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:osandov@fb.com,m:jbohac@suse.cz,m:cfsworks@gmail.com,m:tangyouling@kylinos.cn,m:sourab
 hjain@linux.ibm.com,m:ritesh.list@gmail.com,m:adityag@linux.ibm.com,m:liaoyuanhong@vivo.com,m:seanjc@google.com,m:fuqiang.wang@easystack.cn,m:ardb@kernel.org,m:chenjiahao16@huawei.com,m:guoren@kernel.org,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:devicetree@vger.kernel.org,m:kexec@lists.infradead.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[63];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,xen0n.name:email,huawei.com:mid,huawei.com:dkim,huawei.com:from_mime,huawei.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7BA8653FAC



On 6/8/2026 3:34 PM, Jinjie Ruan wrote:
> Use the newly introduced crash_prepare_headers() function to replace
> the existing prepare_elf_headers(), allocate cmem and exclude crash kernel
> memory in the crash core, which reduce code duplication.
> 
> Only the following two architecture functions need to be implemented:
> - arch_get_system_nr_ranges(). Use for_each_mem_range to traverse
>   and pre-count the max number of memory ranges.
> 
> - arch_crash_populate_cmem(). Use for_each_mem_range to traverse
>   and collect the memory ranges and fills them into cmem.
> 
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: Youling Tang <tangyouling@kylinos.cn>
> Cc: Baoquan He <bhe@redhat.com>
> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Acked-by: Baoquan He <bhe@redhat.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/loongarch/kernel/machine_kexec_file.c | 40 +++++++---------------
>  1 file changed, 12 insertions(+), 28 deletions(-)


The below AI reported TOCTOU bug is an existing artifact and completely
unrelated to the rework here. Therefore, we will skip fixing it in this
series to avoid unnecessary noise.

Link:
https://lore.kernel.org/all/20260608075258.0F6D91F00893@smtp.kernel.org/

> 
> diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
> index 5584b798ba46..5412aa9f3568 100644
> --- a/arch/loongarch/kernel/machine_kexec_file.c
> +++ b/arch/loongarch/kernel/machine_kexec_file.c
> @@ -56,46 +56,30 @@ static void cmdline_add_initrd(struct kimage *image, unsigned long *cmdline_tmpl
>  }
>  
>  #ifdef CONFIG_CRASH_DUMP
> -
> -static int prepare_elf_headers(void **addr, unsigned long *sz)
> +unsigned int arch_get_system_nr_ranges(void)
>  {
> -	int ret, nr_ranges;
> -	uint64_t i;
> +	int nr_ranges = 2; /* for exclusion of crashkernel region */
>  	phys_addr_t start, end;
> -	struct crash_mem *cmem;
> +	uint64_t i;
>  
> -	nr_ranges = 2; /* for exclusion of crashkernel region */
>  	for_each_mem_range(i, &start, &end)
>  		nr_ranges++;
>  
> -	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
> -	if (!cmem)
> -		return -ENOMEM;
> +	return nr_ranges;
> +}
> +
> +int arch_crash_populate_cmem(struct crash_mem *cmem)
> +{
> +	phys_addr_t start, end;
> +	uint64_t i;
>  
> -	cmem->max_nr_ranges = nr_ranges;
> -	cmem->nr_ranges = 0;
>  	for_each_mem_range(i, &start, &end) {
>  		cmem->ranges[cmem->nr_ranges].start = start;
>  		cmem->ranges[cmem->nr_ranges].end = end - 1;
>  		cmem->nr_ranges++;
>  	}
>  
> -	/* Exclude crashkernel region */
> -	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
> -	if (ret < 0)
> -		goto out;
> -
> -	if (crashk_low_res.end) {
> -		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
> -		if (ret < 0)
> -			goto out;
> -	}
> -
> -	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
> -
> -out:
> -	kfree(cmem);
> -	return ret;
> +	return 0;
>  }
>  
>  /*
> @@ -163,7 +147,7 @@ int load_other_segments(struct kimage *image,
>  		void *headers;
>  		unsigned long headers_sz;
>  
> -		ret = prepare_elf_headers(&headers, &headers_sz);
> +		ret = crash_prepare_headers(true, &headers, &headers_sz, NULL);
>  		if (ret < 0) {
>  			pr_err("Preparing elf core header failed\n");
>  			goto out_err;


