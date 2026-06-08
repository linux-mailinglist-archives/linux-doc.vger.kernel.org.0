Return-Path: <linux-doc+bounces-91320-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sR8CEtJxJmptWgIAu9opvQ
	(envelope-from <linux-doc+bounces-91320-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 09:40:02 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B52DE6539FB
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 09:40:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b="K/bf340R";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91320-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91320-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C569F303D2FF
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 07:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7643932D8;
	Mon,  8 Jun 2026 07:36:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959F4313E17;
	Mon,  8 Jun 2026 07:36:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904185; cv=none; b=alps2uByRjwXmWVDvAjg8eL+Gtcng45izmhor8nzpGONiGCBRgItdp0Enle1hWuKJh0Q8T1XTEcuQiv68T3nghYC0uSji36FgNo5FmbRozEB4tW32Lu/2OawjZ8TaK9i+0rnsNxe7aqVdLfGMw0Qd7gfQL255mXQgj8BTjCcLqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904185; c=relaxed/simple;
	bh=fkMRN8Ivg/s2KJzgRCu7IkWeahsrhtkd9+C/DlR1AhI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RByY9T/04kW2ENZrJ7kgZwMbaZW+I/3yogK8Hz2xei8yLFc5DjePk67uNdltQsGybaje36xkEK89sQTUIevm30nbE7Mze/MmjrUjZgEQ8Hs93dSbqBWMiXL2tSKR6f+KnpNvyECozd25OAv1DRwFcrtqLOf1MT2pQ15OB6fy3gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=K/bf340R; arc=none smtp.client-ip=113.46.200.219
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=JQ0401oUV/1VolfOdUzchAEXjFGIOJpHTf71w/0/c2s=;
	b=K/bf340RepdaAwqyvuC/ivSJbK5nA1/Kq2pryuhSJV0+RUx87NdxQ+fWV1GT3V23F7mOYBU2b
	WCvr38J+zXUe8SuITkiQ4ubN30GOIoMzx7RJGDq4CmEgDODibWEDkAQhblICyT8XmypuVH9gOod
	vbG/nCNFU5/bBWd3K/0XOtU=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gYkD355lDz1prLy;
	Mon,  8 Jun 2026 15:28:19 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 319D4202E6;
	Mon,  8 Jun 2026 15:36:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 8 Jun
 2026 15:36:11 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
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
	<ruanjinjie@huawei.com>, <leitao@debian.org>, <coxu@redhat.com>,
	<Liam.Howlett@oracle.com>, <ryan.roberts@arm.com>, <osandov@fb.com>,
	<jbohac@suse.cz>, <cfsworks@gmail.com>, <tangyouling@kylinos.cn>,
	<sourabhjain@linux.ibm.com>, <ritesh.list@gmail.com>,
	<adityag@linux.ibm.com>, <liaoyuanhong@vivo.com>, <seanjc@google.com>,
	<fuqiang.wang@easystack.cn>, <ardb@kernel.org>, <chenjiahao16@huawei.com>,
	<guoren@kernel.org>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
Subject: [PATCH v16 00/10] arm64/riscv: Add support for crashkernel CMA reservation
Date: Mon, 8 Jun 2026 15:34:49 +0800
Message-ID: <20260608073459.3119290-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91320-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:robh@kernel.org,m:saravanak@kernel.org,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:rppt@kernel.org,m:pasha.tatashin@soleen.com,m:pratyush@kernel.org,m:ruirui.yang@linux.dev,m:rdunlap@infradead.org,m:peterz@infradead.org,m:feng.tang@linux.alibaba.com,m:dapeng1.mi@linux.intel.com,m:kees@kernel.org,m:elver@google.com,m:kuba@kernel.org,m:lirongqing@baidu.com,m:ebiggers@kernel.org,m:paulmck@kernel.org,m:ruanjinjie@huawei.com,m:leitao@debian.org,m:coxu@redhat.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:osandov@fb.com,m:jbohac@suse.cz,m:cfsworks@gmail.com,m:tangyou
 ling@kylinos.cn,m:sourabhjain@linux.ibm.com,m:ritesh.list@gmail.com,m:adityag@linux.ibm.com,m:liaoyuanhong@vivo.com,m:seanjc@google.com,m:fuqiang.wang@easystack.cn,m:ardb@kernel.org,m:chenjiahao16@huawei.com,m:guoren@kernel.org,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:devicetree@vger.kernel.org,m:kexec@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,soleen.com,linux.dev,infradead.org,linux.alibaba.com,google.com,baidu.com,huawei.com,debian.org,oracle.com,fb.com,suse.cz,kylinos.cn,vivo.com,easystack.cn,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[64];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B52DE6539FB

The crash memory allocation, and the exclude of crashk_res, crashk_low_res
and crashk_cma memory are almost identical across different architectures,
This patch set handle them in crash core in a general way, which eliminate
a lot of duplication code.

And add support for crashkernel CMA reservation for arm64 and riscv.

This patch set is rebased on v7.1-rc1.

Basic second kernel boot test were performed on QEMU platforms for x86,
ARM64 and RISC-V architectures with the following parameters:

        "cma=256M crashkernel=4G crashkernel=64M,cma"

For first kernel, there will be such log:

        # dmesg | grep crash
        [    0.000000] crashkernel low memory reserved: 0xe8000000 - 0xf0000000 (128 MB)
        [    0.000000] crashkernel reserved: 0x000000023e600000 - 0x000000033e600000 (4096 MB)
        [    0.000000] crashkernel CMA reserved: 64 MB in 1 ranges

        # dmesg | grep cma
        [    0.000000] cma: Reserved 256 MiB at 0x00000000f0000000
        [    0.000000] cma: Reserved 64 MiB at 0x0000000100000000

For second kernel, there will be such log:

        [    0.000000] OF: fdt: Looking for usable-memory-range property...
        [    0.000000] OF: fdt: cap_mem_regions[0]: base=0x000000023e600000, size=0x0000000100000000
        [    0.000000] OF: fdt: cap_mem_regions[1]: base=0x00000000e8000000, size=0x0000000008000000
        [    0.000000] OF: fdt: cap_mem_regions[2]: base=0x0000000100000000, size=0x0000000004000000

Changes in v16:
- Split out the unrelated bugfixes as Baoquan suggested, which will
  be a separate patch set later.
- Link to v15: https://lore.kernel.org/all/20260601094805.2928614-1-ruanjinjie@huawei.com/

Changes in v15:
- Unify the subject prefix formats as Huacai suggested.
- Fix powerpc pre-existing NULL pointer dereference [Sashiko [1]]
- Fix powerpc pre-existing __merge_memory_ranges() memory range
  truncation [Sashiko [1]].
- Fix pre-existing arm64 CMA page leaks [Sashiko[2]].
- Fix pre-existing crash_load_dm_crypt_keys() Use-After-Free and
  Double Free issue [Sashiko[3]].
- Fix vfree(headers) and uninitialized variables issue
  and simplify the fix [Sashiko[2]].
- As walk_system_ram_res() and for_each_mem_range() use different
  lock, unify and simplify the fix of TOCTOU buffer overflow via memory
  region padding [Sashiko[4]].
- Fix the arm64 crash dump issues in Sashiko[5].
- Link to v14: https://lore.kernel.org/all/20260525084932.934910-1-ruanjinjie@huawei.com/

[1]: https://lore.kernel.org/all/20260525092207.96B9D1F000E9@smtp.kernel.org/
[2]: https://lore.kernel.org/all/20260525091149.1A1E01F00A3D@smtp.kernel.org/
[3]: https://lore.kernel.org/all/20260525105227.3C2421F000E9@smtp.kernel.org/
[4]: https://lore.kernel.org/all/20260525095447.944E11F000E9@smtp.kernel.org/
[5]: https://lore.kernel.org/all/20260525101746.9959D1F000E9@smtp.kernel.org/

Changes in v14:
- Fix image->elf_headers memory leak during retry loop for arm64 as Sashiko
  AI code review pointed out.
- Solve the hotplug notifier arch_crash_handle_hotplug_event() AA
  self-deadlock problem as Sashiko AI code review pointed out.
- Fix the TOCTOU issue in prepare_elf_headers() by get_online_mems().
- -ENOMEM -> -EAGAIN as Breno suggested.
- Add support for arm64 crash hotplug.
- Link to v13: https://lore.kernel.org/all/20260511030454.1730881-1-ruanjinjie@huawei.com/

Changes in v13:
- Rebased on v7.1-rc1.
- Update the commit message.
- Add Reviewed-by.
- Link to v12: https://lore.kernel.org/all/20260402072701.628293-1-ruanjinjie@huawei.com/

Changes in v12:
- Remove the unused "nr_mem_ranges" for x86.
- Add "Fix crashk_low_res not exclude bug" test log.
- Provide a separate patch for each architecture for using
  crash_prepare_headers(), which will make the review more convenient.
- Add Reviewed-by and Tested-by.
- Link to v11: https://lore.kernel.org/all/20260328074013.3589544-1-ruanjinjie@huawei.com/

Changes in v11:
- Avoid silently drop crash memory if the crash kernel is built without
  CONFIG_CMA.
- Remove unnecessary "cmem->nr_ranges = 0" for arch_crash_populate_cmem()
  as we use kvzalloc().
- Provide a separate patch for each architecture to fix the existing
  buffer overflow issue.
- Add Acked-bys for arm64.

Changes in v10:
- Fix crashk_low_res not excluded bug in the existing
  RISC-V code.
- Fix an existing memory leak issue in the existing PowerPC code.
- Fix the ordering issue of adding CMA ranges to
  "linux,usable-memory-range".
- Fix an existing concurrency issue. A Concurrent memory hotplug may occur
  between reading memblock and attempting to fill cmem during kexec_load()
  for almost all existing architectures.
- Link to v9: https://lore.kernel.org/all/20260323072745.2481719-1-ruanjinjie@huawei.com/

Changes in v9:
- Collect Reviewed-by and Acked-by, and prepare for Sashiko AI review.
- Link to v8: https://lore.kernel.org/all/20260302035315.3892241-1-ruanjinjie@huawei.com/

Changes in v8:
- Fix the build issues reported by kernel test robot and Sourabh.
- Link to v7: https://lore.kernel.org/all/20260226130437.1867658-1-ruanjinjie@huawei.com/

Changes in v7:
- Correct the inclusion of CMA-reserved ranges for kdump kernel in of/kexec
  for arm64 and riscv.
- Add Acked-by.
- Link to v6: https://lore.kernel.org/all/20260224085342.387996-1-ruanjinjie@huawei.com/

Changes in v6:
- Update the crash core exclude code as Mike suggested.
- Rebased on v7.0-rc1.
- Add acked-by.
- Link to v5: https://lore.kernel.org/all/20260212101001.343158-1-ruanjinjie@huawei.com/

Jinjie Ruan (9):
  riscv: kexec_file: Fix crashk_low_res not exclude bug
  crash: Add crash_prepare_headers() to exclude crash kernel memory
  arm64: kexec_file: Use crash_prepare_headers() helper to simplify code
  x86: kexec_file: Use crash_prepare_headers() helper to simplify code
  riscv: kexec_file: Use crash_prepare_headers() helper to simplify code
  LoongArch: kexec_file: Use crash_prepare_headers() helper to simplify
    code
  powerpc/kexec_file: Use crash_exclude_core_ranges() helper
  arm64: kexec_file: Add support for crashkernel CMA reservation
  riscv: kexec_file: Add support for crashkernel CMA reservation

Sourabh Jain (1):
  powerpc/crash: sort crash memory ranges before preparing elfcorehdr

 .../admin-guide/kernel-parameters.txt         |  16 +--
 arch/arm64/kernel/machine_kexec_file.c        |  40 +++----
 arch/arm64/mm/init.c                          |   5 +-
 arch/loongarch/kernel/machine_kexec_file.c    |  40 +++----
 arch/powerpc/include/asm/kexec_ranges.h       |   1 -
 arch/powerpc/kexec/crash.c                    |   5 +-
 arch/powerpc/kexec/ranges.c                   | 101 +-----------------
 arch/riscv/kernel/machine_kexec_file.c        |  39 +++----
 arch/riscv/mm/init.c                          |   5 +-
 arch/x86/kernel/crash.c                       |  89 ++-------------
 drivers/of/fdt.c                              |   9 +-
 drivers/of/kexec.c                            |   9 ++
 include/linux/crash_core.h                    |   9 ++
 include/linux/crash_reserve.h                 |   4 +-
 kernel/crash_core.c                           |  89 ++++++++++++++-
 15 files changed, 180 insertions(+), 281 deletions(-)

-- 
2.34.1


