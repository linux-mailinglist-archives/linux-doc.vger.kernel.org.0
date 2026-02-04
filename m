Return-Path: <linux-doc+bounces-75205-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFpeFS0Ug2nihQMAu9opvQ
	(envelope-from <linux-doc+bounces-75205-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 04 Feb 2026 10:41:01 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3D2E3F94
	for <lists+linux-doc@lfdr.de>; Wed, 04 Feb 2026 10:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97C0A3019194
	for <lists+linux-doc@lfdr.de>; Wed,  4 Feb 2026 09:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F7A3AE706;
	Wed,  4 Feb 2026 09:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="1xqbDBGH"
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9293A7F52;
	Wed,  4 Feb 2026 09:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770197803; cv=none; b=Db3GSUA55xuqCCNuXBGMQZMOuwx8BhgdvRCnQR08DIke5YEhOPlyJ+ud2+I50MuwVOgtx5PXXkm2mtAbLR8e7oYV/nrWioWqj3AKPRuBk7Mvo0YyxU4VPKUAUW/Zq1pdVdUg0BmEGQXO8J2ULHBkFnKJO+BI3zjDdHbBbdANVkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770197803; c=relaxed/simple;
	bh=rRo60HDtjCVJ8HKnnv6lw0iVaRVlp9GC4FDYXKCndTo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qzuIHYrq1EfxF3aTcOb7AgUTv75YDHSeFhrWeXLOt0O8gAGFT8oc+OA8YWrhbPC8QvLgIhyV4p5lEsrjMIGFDcu4hKDJql3w9JCk+G+lQgBBd42mHyOMhsIMWf08MjYvzaYD0b+soqIxl4W0cCJWASZJUwzqV/rWSeTr7EhunEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=1xqbDBGH; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=mFBJiqIwT9NZGyk5qGLbY1mlcpA6eQGqiHTQkqvDMKc=;
	b=1xqbDBGHV2dYoy3vGnjXu2TA/WZN09CbjC82e2+V5v8DPKKxKAbS/fgjLipQORmfwaL0pUvBs
	FJBu5fvw0+v0LExpIvXW2pSMR2LIhb6URUTKmgEUAj0nd3KCKgtMg/zlMOEspDjG9HYmU/vfTMe
	grDxiK3ovrSLsg2wWnF2HVU=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4f5Zr04p4mz1prLg;
	Wed,  4 Feb 2026 17:32:00 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 54A75404AD;
	Wed,  4 Feb 2026 17:36:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Feb
 2026 17:36:34 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<bhe@redhat.com>, <vgoyal@redhat.com>, <dyoung@redhat.com>,
	<pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
	<kees@kernel.org>, <elver@google.com>, <arnd@arndb.de>,
	<lirongqing@baidu.com>, <fvdl@google.com>, <leitao@debian.org>,
	<rppt@kernel.org>, <cfsworks@gmail.com>, <osandov@fb.com>,
	<sourabhjain@linux.ibm.com>, <ardb@kernel.org>, <ryan.roberts@arm.com>,
	<tangyouling@kylinos.cn>, <ritesh.list@gmail.com>, <bjorn@rivosinc.com>,
	<songshuaishuai@tinylab.org>, <samuel.holland@sifive.com>,
	<kevin.brodsky@arm.com>, <junhui.liu@pigmoral.tech>,
	<vishal.moola@gmail.com>, <coxu@redhat.com>, <jbohac@suse.cz>,
	<liaoyuanhong@vivo.com>, <brgerst@gmail.com>, <fuqiang.wang@easystack.cn>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3 0/3] arm64/riscv: Add support for crashkernel CMA reservation
Date: Wed, 4 Feb 2026 17:37:25 +0800
Message-ID: <20260204093728.1447527-1-ruanjinjie@huawei.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[lwn.net,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,linux.alibaba.com,google.com,arndb.de,baidu.com,debian.org,fb.com,kylinos.cn,rivosinc.com,tinylab.org,sifive.com,pigmoral.tech,suse.cz,vivo.com,easystack.cn,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	TAGGED_FROM(0.00)[bounces-75205-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[58];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:mid,huawei.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AA3D2E3F94
X-Rspamd-Action: no action

Add support for crashkernel CMA reservation for arm64 and riscv.

By the way, exclude crash kernel memory in crash core to
avoid duplication.

Changs in v3:
- Exclude crash kernel memory in crash core as Mike suggested.
- Add acked-by.

Jinjie Ruan (3):
  crash: Exclude crash kernel memory in crash core
  arm64: kexec: Add support for crashkernel CMA reservation
  riscv: kexec: Add support for crashkernel CMA reservation

 .../admin-guide/kernel-parameters.txt         | 16 ++++----
 arch/arm64/kernel/machine_kexec_file.c        | 16 +++-----
 arch/arm64/mm/init.c                          |  5 ++-
 arch/loongarch/kernel/machine_kexec_file.c    | 12 ------
 arch/powerpc/kexec/ranges.c                   | 16 ++------
 arch/riscv/kernel/machine_kexec_file.c        | 15 ++++---
 arch/riscv/mm/init.c                          |  5 ++-
 arch/x86/kernel/crash.c                       | 39 +------------------
 kernel/crash_core.c                           | 28 +++++++++++++
 9 files changed, 61 insertions(+), 91 deletions(-)

-- 
2.34.1


