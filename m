Return-Path: <linux-doc+bounces-84865-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBt2KdMp8GkzPQEAu9opvQ
	(envelope-from <linux-doc+bounces-84865-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 05:30:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 775F747D135
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 05:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3247530173A9
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 03:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2651B1FBEA8;
	Tue, 28 Apr 2026 03:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Ax7zlBnD"
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8381E12CD8B;
	Tue, 28 Apr 2026 03:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777347024; cv=none; b=ISw7zuTIdXUUbWPIsA0Ml3N3NatsCgi/0xo5W6UwFN10/8cmHUTB23XzVh/cZHBbEPPyVz8PDC4bHZc6kxfIp3gQopMhUAHiAxuszOtlQxlivgFPBYb6cX1WAjvJMVxvHFJmAwSYZNxHfYtoWAxRWdmp6p9X3gIWDBJZE1EvViA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777347024; c=relaxed/simple;
	bh=DcJ+UKIOigb3Vcrq6OMlHY7VBWT9vE4zAdc3++oY6+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=K45G/DkW+KBS2tvtZHslHKUCW1d52lsZ+uekKxugzD/57Z0bhJnLqrAqvxSqsh5t4b/zKZurac5fuH8Igis6bRzNcr3e7vaQl76MuR/pCe8r1mL5LWjk5KXH0fMzcQ2SrCHcBjzBLHbKkqeXW5+np6HiSb2vG1nVdCdYuUHLRzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Ax7zlBnD; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=53v80o50pdZvZamiU87690P2YfIvRYFux+/+SYSB+8A=;
	b=Ax7zlBnDvsHBrG11SUZ1Pks+cdQ09GMnJHUeJDFPnJ+emSKulfDm5/phFAybcSONUZOz7Zmdk
	JuXPr9JubkLETkbEhoVW7TASFkDw2eI7slX9Rgg90k2o6zU9Md1T0fRV5pJf4I+L2IYefJy2p2S
	PTql3k7K5Kbuffhny79gszs=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4g4Qks12FrzKm6G;
	Tue, 28 Apr 2026 11:23:49 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 25E5F40562;
	Tue, 28 Apr 2026 11:30:17 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 28 Apr 2026 11:30:14 +0800
Message-ID: <dfa24c4b-a423-4c80-9a8f-28c577c9ec11@huawei.com>
Date: Tue, 28 Apr 2026 11:30:13 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 00/15] arm64/riscv: Add support for crashkernel CMA
 reservation
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <vgoyal@redhat.com>,
	<dyoung@redhat.com>, <rdunlap@infradead.org>, <peterz@infradead.org>,
	<pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<paulmck@kernel.org>, <lirongqing@baidu.com>, <rppt@kernel.org>,
	<leitao@debian.org>, <ardb@kernel.org>, <jbohac@suse.cz>,
	<cfsworks@gmail.com>, <tangyouling@kylinos.cn>, <sourabhjain@linux.ibm.com>,
	<ritesh.list@gmail.com>, <hbathini@linux.ibm.com>, <eajames@linux.ibm.com>,
	<guoren@kernel.org>, <songshuaishuai@tinylab.org>, <kevin.brodsky@arm.com>,
	<vishal.moola@gmail.com>, <junhui.liu@pigmoral.tech>, <coxu@redhat.com>,
	<fuqiang.wang@easystack.cn>, <liaoyuanhong@vivo.com>,
	<takahiro.akashi@linaro.org>, <james.morse@arm.com>, <lizhengyu3@huawei.com>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
References: <20260402072701.628293-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260402072701.628293-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Queue-Id: 775F747D135
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84865-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,linux.alibaba.com,google.com,baidu.com,debian.org,suse.cz,kylinos.cn,tinylab.org,pigmoral.tech,easystack.cn,vivo.com,linaro.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[64];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]



On 4/2/2026 3:26 PM, Jinjie Ruan wrote:
> The crash memory allocation, and the exclude of crashk_res, crashk_low_res
> and crashk_cma memory are almost identical across different architectures,
> This patch set handle them in crash core in a general way, which eliminate
> a lot of duplication code.
> 
> And add support for crashkernel CMA reservation for arm64 and riscv.
> 
> Rebased on v7.0-rc1.
> 
> Basic second kernel boot test were performed on QEMU platforms for x86,
> ARM64, and RISC-V architectures with the following parameters:
> 
> 	"cma=256M crashkernel=256M crashkernel=64M,cma"
> 
> Changes in v12:
> - Remove the unused "nr_mem_ranges" for x86.
> - Add "Fix crashk_low_res not exclude bug" test log.
> - Provide a separate patch for each architecture for using
>   crash_prepare_headers(), which will make the review more convenient.
> - Add Reviewed-by and Tested-by.
> - Link to v11: https://lore.kernel.org/all/20260328074013.3589544-1-ruanjinjie@huawei.com/
> 
> Changes in v11:
> - Avoid silently drop crash memory if the crash kernel is built without
>   CONFIG_CMA.
> - Remove unnecessary "cmem->nr_ranges = 0" for arch_crash_populate_cmem()
>   as we use kvzalloc().
> - Provide a separate patch for each architecture to fix the existing
>   buffer overflow issue.
> - Add Acked-bys for arm64.
> 
> Changes in v10:
> - Fix crashk_low_res not excluded bug in the existing
>   RISC-V code.
> - Fix an existing memory leak issue in the existing PowerPC code.
> - Fix the ordering issue of adding CMA ranges to
>   "linux,usable-memory-range".
> - Fix an existing concurrency issue. A Concurrent memory hotplug may occur
>   between reading memblock and attempting to fill cmem during kexec_load()
>   for almost all existing architectures.
> - Link to v9: https://lore.kernel.org/all/20260323072745.2481719-1-ruanjinjie@huawei.com/
> 
> Changes in v9:
> - Collect Reviewed-by and Acked-by, and prepare for Sashiko AI review.
> - Link to v8: https://lore.kernel.org/all/20260302035315.3892241-1-ruanjinjie@huawei.com/
> 
> Changes in v8:
> - Fix the build issues reported by kernel test robot and Sourabh.
> - Link to v7: https://lore.kernel.org/all/20260226130437.1867658-1-ruanjinjie@huawei.com/
> 
> Changes in v7:
> - Correct the inclusion of CMA-reserved ranges for kdump kernel in of/kexec
>   for arm64 and riscv.
> - Add Acked-by.
> - Link to v6: https://lore.kernel.org/all/20260224085342.387996-1-ruanjinjie@huawei.com/
> 
> Changes in v6:
> - Update the crash core exclude code as Mike suggested.
> - Rebased on v7.0-rc1.
> - Add acked-by.
> - Link to v5: https://lore.kernel.org/all/20260212101001.343158-1-ruanjinjie@huawei.com/
> 
> Jinjie Ruan (14):
>   riscv: kexec_file: Fix crashk_low_res not exclude bug
>   powerpc/crash: Fix possible memory leak in update_crash_elfcorehdr()
>   x86/kexec: Fix potential buffer overflow in prepare_elf_headers()
>   arm64: kexec_file: Fix potential buffer overflow in
>     prepare_elf_headers()
>   riscv: kexec_file: Fix potential buffer overflow in
>     prepare_elf_headers()
>   LoongArch: kexec: Fix potential buffer overflow in
>     prepare_elf_headers()
>   crash: Add crash_prepare_headers() to exclude crash kernel memory
>   arm64: kexec_file: Use crash_prepare_headers() helper to simplify code
>   x86/kexec: Use crash_prepare_headers() helper to simplify code
>   riscv: kexec_file: Use crash_prepare_headers() helper to simplify code
>   LoongArch: kexec: Use crash_prepare_headers() helper to simplify code
>   crash: Use crash_exclude_core_ranges() on powerpc
>   arm64: kexec: Add support for crashkernel CMA reservation
>   riscv: kexec: Add support for crashkernel CMA reservation

Hi, every one,

It seems the patches for crash core rework, powerpc, riscv, and arm64
are mostly ready to be merged. Could any maintainer help pick these up,
or should I rebase the entire series against v7.1-rc1?

> 
> Sourabh Jain (1):
>   powerpc/crash: sort crash memory ranges before preparing elfcorehdr
> 
>  .../admin-guide/kernel-parameters.txt         |  16 +--
>  arch/arm64/kernel/machine_kexec_file.c        |  43 +++-----
>  arch/arm64/mm/init.c                          |   5 +-
>  arch/loongarch/kernel/machine_kexec_file.c    |  43 +++-----
>  arch/powerpc/include/asm/kexec_ranges.h       |   1 -
>  arch/powerpc/kexec/crash.c                    |   7 +-
>  arch/powerpc/kexec/ranges.c                   | 101 +-----------------
>  arch/riscv/kernel/machine_kexec_file.c        |  42 +++-----
>  arch/riscv/mm/init.c                          |   5 +-
>  arch/x86/kernel/crash.c                       |  92 +++-------------
>  drivers/of/fdt.c                              |   9 +-
>  drivers/of/kexec.c                            |   9 ++
>  include/linux/crash_core.h                    |   9 ++
>  include/linux/crash_reserve.h                 |   4 +-
>  kernel/crash_core.c                           |  89 ++++++++++++++-
>  15 files changed, 193 insertions(+), 282 deletions(-)
> 


