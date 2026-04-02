Return-Path: <linux-doc+bounces-82224-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODRJLGEbzml7lAYAu9opvQ
	(envelope-from <linux-doc+bounces-82224-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Apr 2026 09:31:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B237385380
	for <lists+linux-doc@lfdr.de>; Thu, 02 Apr 2026 09:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38F80310FF05
	for <lists+linux-doc@lfdr.de>; Thu,  2 Apr 2026 07:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F02389DE3;
	Thu,  2 Apr 2026 07:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="m6UHo5BT";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="m6UHo5BT"
X-Original-To: linux-doc@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043E2389118;
	Thu,  2 Apr 2026 07:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775114761; cv=none; b=ic+R5m8Nu751AMvp2iejpb4UD5GKg8patKeKtD0wc/Uj7UrQCIuM+0GBoNBpYoYMlByn0Hx5u1V/il3T+gvoKE4oNUdJ0p3ykwMopcIgBdPVdbAZ0Yc/TOhpzI3/8V4A5GcZyPFXtO/D+UK57oAYHsTRpPIk8kC/YvBB1m0W0wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775114761; c=relaxed/simple;
	bh=dqJe7vwS6wOJ2ZAJakoUWOu5UtN5jVKxYCv/BNdsNUs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=il0x2UnlTIhdPgMr4ljVRqogQshyfepvkchz+cDs+ZtcQew/Lsh3msJl5ZJiXgvFOUerW7JtED51x8zplFzEibXdIa4qIqNQQlJkq40gy7R9zm+yf85ZJLSzU7Fc0DEO09sdDRDBc1p7fM40KR8OALBa/EmkyOD85OmqSzfVfGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=m6UHo5BT; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=m6UHo5BT; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NTXaH/u2INsyIif/iORAXkaRRNdVFjs/BI5242cqFK0=;
	b=m6UHo5BTrBmJCqhNfkREKY9koHpctmsQLW/KoJMDsGsK70DUBGQfH/kY0q5LTEyCfKgZhqcQl
	jCC4hEY1NYZChtgLRM5XhFqh4BA7Iq9CKc/uNNCrw/0Zk4f7s+QoSJidtHUnzB8swS3X8IseM2X
	JFczaaj7qIkblhvkhlOtpsU=
Received: from canpmsgout03.his.huawei.com (unknown [172.19.92.159])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4fmYKv6Wrtz1BG2G;
	Thu,  2 Apr 2026 15:25:39 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NTXaH/u2INsyIif/iORAXkaRRNdVFjs/BI5242cqFK0=;
	b=m6UHo5BTrBmJCqhNfkREKY9koHpctmsQLW/KoJMDsGsK70DUBGQfH/kY0q5LTEyCfKgZhqcQl
	jCC4hEY1NYZChtgLRM5XhFqh4BA7Iq9CKc/uNNCrw/0Zk4f7s+QoSJidtHUnzB8swS3X8IseM2X
	JFczaaj7qIkblhvkhlOtpsU=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fmYCV1m0dzpStp;
	Thu,  2 Apr 2026 15:20:06 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id CC5EF40538;
	Thu,  2 Apr 2026 15:25:55 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 2 Apr
 2026 15:25:52 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
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
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 04/15] arm64: kexec_file: Fix potential buffer overflow in prepare_elf_headers()
Date: Thu, 2 Apr 2026 15:26:50 +0800
Message-ID: <20260402072701.628293-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402072701.628293-1-ruanjinjie@huawei.com>
References: <20260402072701.628293-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,linux.alibaba.com,google.com,baidu.com,debian.org,suse.cz,kylinos.cn,tinylab.org,pigmoral.tech,easystack.cn,vivo.com,linaro.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-82224-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,linaro.org:email,huawei.com:dkim,huawei.com:email,huawei.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_GT_50(0.00)[65];
	DKIM_TRACE(0.00)[huawei.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2B237385380
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is a race condition between the kexec_load() system call
(crash kernel loading path) and memory hotplug operations that can lead
to buffer overflow and potential kernel crash.

During prepare_elf_headers(), the following steps occur:
1. The first for_each_mem_range()  queries current System RAM memory ranges
2. Allocates buffer based on queried count
3. The 2st for_each_mem_range() populates ranges from memblock

If memory hotplug occurs between step 1 and step 3, the number of ranges
can increase, causing out-of-bounds write when populating cmem->ranges[].

This happens because kexec_load() uses kexec_trylock (atomic_t) while
memory hotplug uses device_hotplug_lock (mutex), so they don't serialize
with each other.

Just add bounds checking to prevent out-of-bounds access.

Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/machine_kexec_file.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index fba260ad87a9..df52ac4474c9 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -59,6 +59,11 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	cmem->max_nr_ranges = nr_ranges;
 	cmem->nr_ranges = 0;
 	for_each_mem_range(i, &start, &end) {
+		if (cmem->nr_ranges >= cmem->max_nr_ranges) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
 		cmem->ranges[cmem->nr_ranges].start = start;
 		cmem->ranges[cmem->nr_ranges].end = end - 1;
 		cmem->nr_ranges++;
-- 
2.34.1


