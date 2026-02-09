Return-Path: <linux-doc+bounces-75647-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPzeJy2xiWndAgUAu9opvQ
	(envelope-from <linux-doc+bounces-75647-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 09 Feb 2026 11:04:29 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D4310DF3F
	for <lists+linux-doc@lfdr.de>; Mon, 09 Feb 2026 11:04:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A04D302AC2D
	for <lists+linux-doc@lfdr.de>; Mon,  9 Feb 2026 09:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0692366560;
	Mon,  9 Feb 2026 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="hhs9dNsd";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="hhs9dNsd"
X-Original-To: linux-doc@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68F1366541;
	Mon,  9 Feb 2026 09:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770631129; cv=none; b=MY5B6Yyt5E63RTu56c9COlFbiyTU31wVidMXIjeClSed7+HSfPwIscmVoPCSOW7MGeEEHpFKCN3zs6R9Na+6I22tsxMGPmkJh4QPFDoMAf0ybV8ZEJEvYzWk8EmwyWGX/kY9wumNrslMuAisq9F3xBXGUMoYlyArx+vGW+JF060=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770631129; c=relaxed/simple;
	bh=/HC/BDgTxAA05XgjcRY8O6PN0xJnJsh9iwfK7lnJUE0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CK9VhlhtKH2vrFx0GqlaxNpc6sePWFMVE1FNeg8oLiHQGsDSwqExSTiYUbkFOszsDvhgASJeFUhCpEh6vq4VaNfRPaBZbdJfpjXVcuyXFi5Q8brMKk/2UFhBzh8nfCpaZyi1c5QTuRlx5oPt3g/DWYOXsLpu90ZxbCJ+NmpZkjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=hhs9dNsd; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=hhs9dNsd; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rZbn2DX+TpOyjPxTrik+wvw3h17J9tL/MLsovlvAZxo=;
	b=hhs9dNsdwe4qkbK7HPFjHzXVe+tEdgWvlYgxvjQ+66g+iSMAe6/pwiihzhDiak6cf8lDusHvs
	OcMhzeSKNnSvqdRfFEnMQI0HtAxRMeSjpqLj8wOnfenTD8HasNqQUnmpYZapopvoOtj8aqI1qqk
	Qk1z6f7tD12iwcZTC7CUEcw=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4f8g9Y5cLPz1BFQ8;
	Mon,  9 Feb 2026 17:57:53 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rZbn2DX+TpOyjPxTrik+wvw3h17J9tL/MLsovlvAZxo=;
	b=hhs9dNsdwe4qkbK7HPFjHzXVe+tEdgWvlYgxvjQ+66g+iSMAe6/pwiihzhDiak6cf8lDusHvs
	OcMhzeSKNnSvqdRfFEnMQI0HtAxRMeSjpqLj8wOnfenTD8HasNqQUnmpYZapopvoOtj8aqI1qqk
	Qk1z6f7tD12iwcZTC7CUEcw=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f8g5D4tLGz1T4K4;
	Mon,  9 Feb 2026 17:54:08 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 1E25840538;
	Mon,  9 Feb 2026 17:58:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Feb
 2026 17:58:35 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<bhe@redhat.com>, <vgoyal@redhat.com>, <dyoung@redhat.com>,
	<rdunlap@infradead.org>, <pmladek@suse.com>, <feng.tang@linux.alibaba.com>,
	<pawan.kumar.gupta@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<arnd@arndb.de>, <lirongqing@baidu.com>, <fvdl@google.com>,
	<leitao@debian.org>, <rppt@kernel.org>, <ardb@kernel.org>, <jbohac@suse.cz>,
	<sourabhjain@linux.ibm.com>, <osandov@fb.com>, <ryan.roberts@arm.com>,
	<cfsworks@gmail.com>, <tangyouling@kylinos.cn>, <ritesh.list@gmail.com>,
	<thuth@redhat.com>, <hbathini@linux.ibm.com>, <eajames@linux.ibm.com>,
	<bjorn@rivosinc.com>, <songshuaishuai@tinylab.org>, <kevin.brodsky@arm.com>,
	<samuel.holland@sifive.com>, <vishal.moola@gmail.com>,
	<junhui.liu@pigmoral.tech>, <dwmw@amazon.co.uk>, <pbonzini@redhat.com>,
	<thomas.lendacky@amd.com>, <kai.huang@intel.com>, <ubizjak@gmail.com>,
	<coxu@redhat.com>, <liaoyuanhong@vivo.com>, <fuqiang.wang@easystack.cn>,
	<brgerst@gmail.com>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4 0/3] arm64/riscv: Add support for crashkernel CMA reservation
Date: Mon, 9 Feb 2026 17:59:28 +0800
Message-ID: <20260209095931.2813152-1-ruanjinjie@huawei.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75647-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[huawei.com:+];
	FREEMAIL_TO(0.00)[lwn.net,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,suse.com,linux.alibaba.com,google.com,arndb.de,baidu.com,debian.org,suse.cz,fb.com,kylinos.cn,rivosinc.com,tinylab.org,sifive.com,pigmoral.tech,amazon.co.uk,amd.com,intel.com,vivo.com,easystack.cn,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,huawei.com:mid,huawei.com:dkim];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_GT_50(0.00)[68];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 48D4310DF3F
X-Rspamd-Action: no action

Exclude crash kernel memory in crash core to avoid duplication. Also move
the size calculation (and the realloc if needed) into crash core.

And add support for crashkernel CMA reservation for arm64 and riscv.

Changes in v4:
- Move the size calculation (and the realloc if needed) into the
  generic crash.

Changs in v3:
- Exclude crash kernel memory in crash core as Mike suggested.
- Add acked-by.


Jinjie Ruan (3):
  crash: Exclude crash kernel memory in crash core
  arm64: kexec: Add support for crashkernel CMA reservation
  riscv: kexec: Add support for crashkernel CMA reservation

 .../admin-guide/kernel-parameters.txt         |  16 +--
 arch/arm64/kernel/machine_kexec_file.c        |  47 +-------
 arch/arm64/mm/init.c                          |   5 +-
 arch/loongarch/kernel/machine_kexec_file.c    |  45 +------
 arch/powerpc/include/asm/kexec.h              |  13 ++
 arch/powerpc/kexec/crash.c                    |  52 ++++----
 arch/powerpc/kexec/file_load_64.c             |  17 +--
 arch/powerpc/kexec/ranges.c                   |  18 +--
 arch/riscv/include/asm/kexec.h                |  10 ++
 arch/riscv/kernel/machine_kexec_file.c        |  39 +++---
 arch/riscv/mm/init.c                          |   5 +-
 arch/x86/include/asm/kexec.h                  |  10 ++
 arch/x86/kernel/crash.c                       | 104 ++--------------
 include/linux/crash_core.h                    | 114 +++++++++++++++++-
 kernel/crash_core.c                           |  71 +++++++++--
 15 files changed, 290 insertions(+), 276 deletions(-)

-- 
2.34.1


