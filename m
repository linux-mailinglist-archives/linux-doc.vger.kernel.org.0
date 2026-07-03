Return-Path: <linux-doc+bounces-94774-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cLILFi+JR2qXaQAAu9opvQ
	(envelope-from <linux-doc+bounces-94774-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 12:04:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7490700F2E
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 12:04:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=ZAiGm3hJ;
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94774-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94774-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 30B40302A9DA
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 10:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A343BCD34;
	Fri,  3 Jul 2026 10:02:39 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DE326A1AC;
	Fri,  3 Jul 2026 10:02:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072959; cv=none; b=UP0ZcEuX9dksREZzsBZrG3H//FtiWTDXQxpEyWO5g7AmN3Bl63grscCZS1YLd5QA7kMyo2ZE8AWeuG2B5UZ7lWBKeNQVRZf9P2jpjwRzH5WeSqSUS0pMkKfvtD8aUfpmRGs/67Ye9wwfvlAqIvwHLIDcewHQFp20w3wM3oLOJ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072959; c=relaxed/simple;
	bh=qbhs/EDp0zTe4JlBeDIOQEUwoeSJI9z5sggurtEfhdc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PLtrEAicnD7889FKNEsUxPZaJ/IhrsQzqkPg53RCKnDTSKXLDtKxEcUHnZ02qzkFvRDKCf2Om/K1YRyy47oGgC5m7glNTrblOqMdV5W0GayKBmOjofl7vKndmC5XDNMlqCOhrXMOjQiOo/j+Jl8YkGFLWl715CZxkvRecz3e1kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ZAiGm3hJ; arc=none smtp.client-ip=113.46.200.227
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=UVb3+TSY4Wp1O/dSsSJ6V4ITHk2L3Q3jWLDM6kUPSNQ=;
	b=ZAiGm3hJEoo13iy2TJIJntThCAmftqKTK97BmH1pHQUanZR2x44vowB70M4Y5y0tQ7J+V6uuM
	LZLlb5gIKP4b2D28RVM+WZOVJgxeLOkGlBnzYy1181PA4pddMseqe/i3PvoEiRZEzRp7/m75j9A
	s0LP2iw9/kurpLmfRUgovLU=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gs8GQ1ry0znTW7;
	Fri,  3 Jul 2026 17:53:50 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 16E7B40572;
	Fri,  3 Jul 2026 18:02:29 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 3 Jul
 2026 18:02:25 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <maz@kernel.org>, <ardb@kernel.org>,
	<ilias.apalodimas@linaro.org>, <oupton@kernel.org>, <joey.gouly@arm.com>,
	<seiden@linux.ibm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<oleg@redhat.com>, <mark.rutland@arm.com>, <lpieralisi@kernel.org>,
	<tglx@kernel.org>, <ada.coupriediaz@arm.com>, <anshuman.khandual@arm.com>,
	<ruanjinjie@huawei.com>, <ebiggers@kernel.org>, <broonie@kernel.org>,
	<mrigendra.chaubey@gmail.com>, <baohua@kernel.org>, <lucaswei@google.com>,
	<james.morse@arm.com>, <zengheng4@huawei.com>, <thuth@redhat.com>,
	<yang@os.amperecomputing.com>, <leo.bras@arm.com>, <Sascha.Bischoff@arm.com>,
	<james.clark@linaro.org>, <peterz@infradead.org>, <leitao@debian.org>,
	<ben.horgan@arm.com>, <punit.agrawal@oss.qualcomm.com>, <gshan@redhat.com>,
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
Subject: [PATCH 04/17] arm64: entry: Add entry-specific helpers
Date: Fri, 3 Jul 2026 18:01:22 +0800
Message-ID: <20260703100135.2512312-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703100135.2512312-1-ruanjinjie@huawei.com>
References: <20260703100135.2512312-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94774-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:maz@kernel.org,m:ardb@kernel.org,m:ilias.apalodimas@linaro.org,m:oupton@kernel.org,m:joey.gouly@arm.com,m:seiden@linux.ibm.com,m:suzuki.poulose@arm.com,m:yuzenghui@huawei.com,m:oleg@redhat.com,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:ada.coupriediaz@arm.com,m:anshuman.khandual@arm.com,m:ruanjinjie@huawei.com,m:ebiggers@kernel.org,m:broonie@kernel.org,m:mrigendra.chaubey@gmail.com,m:baohua@kernel.org,m:lucaswei@google.com,m:james.morse@arm.com,m:zengheng4@huawei.com,m:thuth@redhat.com,m:yang@os.amperecomputing.com,m:leo.bras@arm.com,m:Sascha.Bischoff@arm.com,m:james.clark@linaro.org,m:peterz@infradead.org,m:leitao@debian.org,m:ben.horgan@arm.com,m:punit.agrawal@oss.qualcomm.com,m:gshan@redhat.com,m:osama.abdelkader@gmail.com,m:fengchengwen@huawei.com,m:ryan.roberts@arm.com,m:yangyicong@hisilicon.com,m:kevin.brodsky@arm.com,m:kees@kernel.org,m:je
 son.gao@unisoc.com,m:zhaoyang.huang@unisoc.com,m:ryotkkr98@gmail.com,m:wsw9603@163.com,m:pasha.tatashin@soleen.com,m:jeremy.linton@arm.com,m:schuster.simon@siemens-energy.com,m:osandov@fb.com,m:arnd@arndb.de,m:zhangpengjie2@huawei.com,m:smostafa@google.com,m:vladimir.murzin@arm.com,m:tabba@google.com,m:vdonnefort@google.com,m:kaleshsingh@google.com,m:jic23@kernel.org,m:timothy.hayes@arm.com,m:alexandru.elisei@arm.com,m:zenghui.yu@linux.dev,m:david@kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:memxor@gmail.com,m:qperret@google.com,m:chaitanyas.prakash@arm.com,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-efi@vger.kernel.org,m:kvmarm@lists.linux.dev,m:mrigendrachaubey@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,lwn.net,linuxfoundation.org,linaro.org,linux.ibm.com,huawei.com,redhat.com,gmail.com,google.com,os.amperecomputing.com,infradead.org,debian.org,oss.qualcomm.com,hisilicon.com,unisoc.com,163.com,soleen.com,siemens-energy.com,fb.com,arndb.de,linux.dev,linux-foundation.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_GT_50(0.00)[72];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,huawei.com:from_mime,huawei.com:email,huawei.com:mid,huawei.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7490700F2E

The existing hacks to bodge pseudo-NMI into the DAIF management code
are convoluted and difficult to maintain. To pave the way for real
hardware NMI support (FEAT_NMI) without compounding the existing
complexity, we need to abstract the low-level exception masking
and unmasking operations into entry-specific helpers.

Introduce a set of high-level abstract exception mask helpers to
encapsulate the "unmask-at-entry" and "mask-at-exit" behaviors across
different exception paths (IRQ, SError, EL1 Sync, and EL0 Sync):

- irq_entry_unmask_debug_serror(): Used at IRQ entry to save the original
  mask state and switch to a safe NOIRQ context.

- error_entry_unmask_debug(): Used at SError entry to mask all exceptions
  except Debug.

- el1_sync_entry_unmask_inherit(): Used at EL1 synchronous exception entry
  to inherit the interrupted kernel context's masks.

- el0_sync_entry_unmask_all() / el0_sync_exit_unmask_all(): Used
  at EL0 synchronous exception entry/exit boundaries to cleanly allow
  all exceptions under a standard process context.

- exception_exit_restore_mask(): A unified exit-side helper to safely
  restore the hardware exception mask states (DAIF and PMR) before
  returning to the interrupted context.

By replacing the raw register bit manipulations with these abstract
helpers in entry-common.c, we achieve better code encapsulation, cleaner
lifecycle symmetry, and a clear path forward for ALLINT integration.

No functional change intended.

Link: https://lore.kernel.org/linux-arm-kernel/Y5c9SLeJacLYHmP7@FVFF77S0Q05N/
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/exception_masks.h |  58 +++++++++++++
 arch/arm64/kernel/entry-common.c         | 103 ++++++++++++++---------
 2 files changed, 122 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/include/asm/exception_masks.h b/arch/arm64/include/asm/exception_masks.h
index 0a21fb97c3ca..2c87f7c90f62 100644
--- a/arch/arm64/include/asm/exception_masks.h
+++ b/arch/arm64/include/asm/exception_masks.h
@@ -138,4 +138,62 @@ static inline void local_exception_inherit(struct pt_regs *regs)
 
 	write_sysreg(regs->pstate & DAIF_MASK, daif);
 }
+
+/*
+ * Allow Debug exceptions and SError, mask IRQ/FIQ
+ */
+static __always_inline struct exception_mask irq_entry_unmask_debug_serror(struct pt_regs *regs)
+{
+	struct exception_mask orig;
+
+	local_exception_save_mask(&orig);
+	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
+
+	return orig;
+}
+
+static __always_inline struct exception_mask error_entry_unmask_debug(struct pt_regs *regs)
+{
+	struct exception_mask orig;
+
+	local_exception_save_mask(&orig);
+	local_exception_restore(arm64_make_errctx_mask());
+
+	return orig;
+}
+
+static __always_inline struct exception_mask el1_sync_entry_unmask_inherit(struct pt_regs *regs)
+{
+	struct exception_mask orig;
+
+	local_exception_save_mask(&orig);
+	local_exception_inherit(regs);
+
+	return orig;
+}
+
+/*
+ * Unmask all exceptions to establish a standard process context.
+ * Suitable for EL0 sync entry and secondary CPU boot streaming.
+ */
+static __always_inline void el0_sync_entry_unmask_all(struct pt_regs *regs)
+{
+	local_exception_restore(arm64_make_procctx_mask());
+}
+
+/*
+ * Retained for symmetric naming, used before returning to EL0
+ */
+static __always_inline void el0_sync_exit_unmask_all(struct pt_regs *regs)
+{
+	local_exception_restore(arm64_make_procctx_mask());
+}
+
+/*
+ * Mask all exceptions, ready to return to interrupted context
+ */
+static __always_inline void exception_exit_restore_mask(struct exception_mask mask)
+{
+	write_sysreg(mask.daif, daif);
+}
 #endif /* __ASM_EXCEPTION_MASKS_H */
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 6fdf74ff4835..dc223085e773 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -315,80 +315,97 @@ UNHANDLED(el1t, 64, error)
 static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
 {
 	unsigned long far = read_sysreg(far_el1);
+	struct exception_mask mask;
 	irqentry_state_t state;
 
 	state = arm64_enter_from_kernel_mode(regs);
-	local_exception_inherit(regs);
+	mask = el1_sync_entry_unmask_inherit(regs);
 	do_mem_abort(far, esr, regs);
 	arm64_exit_to_kernel_mode(regs, state);
+	exception_exit_restore_mask(mask);
 }
 
 static void noinstr el1_pc(struct pt_regs *regs, unsigned long esr)
 {
 	unsigned long far = read_sysreg(far_el1);
+	struct exception_mask mask;
 	irqentry_state_t state;
 
 	state = arm64_enter_from_kernel_mode(regs);
-	local_exception_inherit(regs);
+	mask = el1_sync_entry_unmask_inherit(regs);
 	do_sp_pc_abort(far, esr, regs);
 	arm64_exit_to_kernel_mode(regs, state);
+	exception_exit_restore_mask(mask);
 }
 
 static void noinstr el1_undef(struct pt_regs *regs, unsigned long esr)
 {
+	struct exception_mask mask;
 	irqentry_state_t state;
 
 	state = arm64_enter_from_kernel_mode(regs);
-	local_exception_inherit(regs);
+	mask = el1_sync_entry_unmask_inherit(regs);
 	do_el1_undef(regs, esr);
 	arm64_exit_to_kernel_mode(regs, state);
+	exception_exit_restore_mask(mask);
 }
 
 static void noinstr el1_bti(struct pt_regs *regs, unsigned long esr)
 {
+	struct exception_mask mask;
 	irqentry_state_t state;
 
 	state = arm64_enter_from_kernel_mode(regs);
-	local_exception_inherit(regs);
+	mask = el1_sync_entry_unmask_inherit(regs);
 	do_el1_bti(regs, esr);
 	arm64_exit_to_kernel_mode(regs, state);
+	exception_exit_restore_mask(mask);
 }
 
 static void noinstr el1_gcs(struct pt_regs *regs, unsigned long esr)
 {
+	struct exception_mask mask;
 	irqentry_state_t state;
 
 	state = arm64_enter_from_kernel_mode(regs);
-	local_exception_inherit(regs);
+	mask = el1_sync_entry_unmask_inherit(regs);
 	do_el1_gcs(regs, esr);
 	arm64_exit_to_kernel_mode(regs, state);
+	exception_exit_restore_mask(mask);
 }
 
 static void noinstr el1_mops(struct pt_regs *regs, unsigned long esr)
 {
+	struct exception_mask mask;
 	irqentry_state_t state;
 
 	state = arm64_enter_from_kernel_mode(regs);
-	local_exception_inherit(regs);
+	mask = el1_sync_entry_unmask_inherit(regs);
 	do_el1_mops(regs, esr);
 	arm64_exit_to_kernel_mode(regs, state);
+	exception_exit_restore_mask(mask);
 }
 
 static void noinstr el1_breakpt(struct pt_regs *regs, unsigned long esr)
 {
+	struct exception_mask mask;
 	irqentry_state_t state;
 
+	local_exception_save_mask(&mask);
 	state = arm64_enter_el1_dbg(regs);
 	debug_exception_enter(regs);
 	do_breakpoint(esr, regs);
 	debug_exception_exit(regs);
 	arm64_exit_el1_dbg(regs, state);
+	exception_exit_restore_mask(mask);
 }
 
 static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)
 {
+	struct exception_mask mask;
 	irqentry_state_t state;
 
+	local_exception_save_mask(&mask);
 	state = arm64_enter_el1_dbg(regs);
 	if (!cortex_a76_erratum_1463225_debug_handler(regs)) {
 		debug_exception_enter(regs);
@@ -403,40 +420,49 @@ static void noinstr el1_softstp(struct pt_regs *regs, unsigned long esr)
 		debug_exception_exit(regs);
 	}
 	arm64_exit_el1_dbg(regs, state);
+	exception_exit_restore_mask(mask);
 }
 
 static void noinstr el1_watchpt(struct pt_regs *regs, unsigned long esr)
 {
 	/* Watchpoints are the only debug exception to write FAR_EL1 */
 	unsigned long far = read_sysreg(far_el1);
+	struct exception_mask mask;
 	irqentry_state_t state;
 
+	local_exception_save_mask(&mask);
 	state = arm64_enter_el1_dbg(regs);
 	debug_exception_enter(regs);
 	do_watchpoint(far, esr, regs);
 	debug_exception_exit(regs);
 	arm64_exit_el1_dbg(regs, state);
+	exception_exit_restore_mask(mask);
 }
 
 static void noinstr el1_brk64(struct pt_regs *regs, unsigned long esr)
 {
+	struct exception_mask mask;
 	irqentry_state_t state;
 
+	local_exception_save_mask(&mask);
 	state = arm64_enter_el1_dbg(regs);
 	debug_exception_enter(regs);
 	do_el1_brk64(esr, regs);
 	debug_exception_exit(regs);
 	arm64_exit_el1_dbg(regs, state);
+	exception_exit_restore_mask(mask);
 }
 
 static void noinstr el1_fpac(struct pt_regs *regs, unsigned long esr)
 {
+	struct exception_mask mask;
 	irqentry_state_t state;
 
 	state = arm64_enter_from_kernel_mode(regs);
-	local_exception_inherit(regs);
+	mask = el1_sync_entry_unmask_inherit(regs);
 	do_el1_fpac(regs, esr);
 	arm64_exit_to_kernel_mode(regs, state);
+	exception_exit_restore_mask(mask);
 }
 
 asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
@@ -486,8 +512,6 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
 	default:
 		__panic_unhandled(regs, "64-bit el1h sync", esr);
 	}
-
-	write_sysreg(DAIF_MASK, daif);
 }
 
 static __always_inline void __el1_pnmi(struct pt_regs *regs,
@@ -516,14 +540,14 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 static void noinstr el1_interrupt(struct pt_regs *regs,
 				  void (*handler)(struct pt_regs *))
 {
-	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
+	struct exception_mask mask = irq_entry_unmask_debug_serror(regs);
 
 	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && regs_irqs_disabled(regs))
 		__el1_pnmi(regs, handler);
 	else
 		__el1_irq(regs, handler);
 
-	write_sysreg(DAIF_MASK, daif);
+	exception_exit_restore_mask(mask);
 }
 
 asmlinkage void noinstr el1h_64_irq_handler(struct pt_regs *regs)
@@ -539,13 +563,14 @@ asmlinkage void noinstr el1h_64_fiq_handler(struct pt_regs *regs)
 asmlinkage void noinstr el1h_64_error_handler(struct pt_regs *regs)
 {
 	unsigned long esr = read_sysreg(esr_el1);
+	struct exception_mask mask;
 	irqentry_state_t state;
 
-	local_exception_restore(arm64_make_errctx_mask());
+	mask = error_entry_unmask_debug(regs);
 	state = irqentry_nmi_enter(regs);
 	do_serror(regs, esr);
 	irqentry_nmi_exit(regs, state);
-	write_sysreg(DAIF_MASK, daif);
+	exception_exit_restore_mask(mask);
 }
 
 static void noinstr el0_da(struct pt_regs *regs, unsigned long esr)
@@ -553,7 +578,7 @@ static void noinstr el0_da(struct pt_regs *regs, unsigned long esr)
 	unsigned long far = read_sysreg(far_el1);
 
 	arm64_enter_from_user_mode(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	do_mem_abort(far, esr, regs);
 	arm64_exit_to_user_mode(regs);
 }
@@ -571,7 +596,7 @@ static void noinstr el0_ia(struct pt_regs *regs, unsigned long esr)
 		arm64_apply_bp_hardening();
 
 	arm64_enter_from_user_mode(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	do_mem_abort(far, esr, regs);
 	arm64_exit_to_user_mode(regs);
 }
@@ -579,7 +604,7 @@ static void noinstr el0_ia(struct pt_regs *regs, unsigned long esr)
 static void noinstr el0_fpsimd_acc(struct pt_regs *regs, unsigned long esr)
 {
 	arm64_enter_from_user_mode(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	do_fpsimd_acc(esr, regs);
 	arm64_exit_to_user_mode(regs);
 }
@@ -587,7 +612,7 @@ static void noinstr el0_fpsimd_acc(struct pt_regs *regs, unsigned long esr)
 static void noinstr el0_sve_acc(struct pt_regs *regs, unsigned long esr)
 {
 	arm64_enter_from_user_mode(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	do_sve_acc(esr, regs);
 	arm64_exit_to_user_mode(regs);
 }
@@ -595,7 +620,7 @@ static void noinstr el0_sve_acc(struct pt_regs *regs, unsigned long esr)
 static void noinstr el0_sme_acc(struct pt_regs *regs, unsigned long esr)
 {
 	arm64_enter_from_user_mode(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	do_sme_acc(esr, regs);
 	arm64_exit_to_user_mode(regs);
 }
@@ -603,7 +628,7 @@ static void noinstr el0_sme_acc(struct pt_regs *regs, unsigned long esr)
 static void noinstr el0_fpsimd_exc(struct pt_regs *regs, unsigned long esr)
 {
 	arm64_enter_from_user_mode(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	do_fpsimd_exc(esr, regs);
 	arm64_exit_to_user_mode(regs);
 }
@@ -611,7 +636,7 @@ static void noinstr el0_fpsimd_exc(struct pt_regs *regs, unsigned long esr)
 static void noinstr el0_sys(struct pt_regs *regs, unsigned long esr)
 {
 	arm64_enter_from_user_mode(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	do_el0_sys(esr, regs);
 	arm64_exit_to_user_mode(regs);
 }
@@ -624,7 +649,7 @@ static void noinstr el0_pc(struct pt_regs *regs, unsigned long esr)
 		arm64_apply_bp_hardening();
 
 	arm64_enter_from_user_mode(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	do_sp_pc_abort(far, esr, regs);
 	arm64_exit_to_user_mode(regs);
 }
@@ -632,7 +657,7 @@ static void noinstr el0_pc(struct pt_regs *regs, unsigned long esr)
 static void noinstr el0_sp(struct pt_regs *regs, unsigned long esr)
 {
 	arm64_enter_from_user_mode(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	do_sp_pc_abort(regs->sp, esr, regs);
 	arm64_exit_to_user_mode(regs);
 }
@@ -640,7 +665,7 @@ static void noinstr el0_sp(struct pt_regs *regs, unsigned long esr)
 static void noinstr el0_undef(struct pt_regs *regs, unsigned long esr)
 {
 	arm64_enter_from_user_mode(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	do_el0_undef(regs, esr);
 	arm64_exit_to_user_mode(regs);
 }
@@ -648,7 +673,7 @@ static void noinstr el0_undef(struct pt_regs *regs, unsigned long esr)
 static void noinstr el0_bti(struct pt_regs *regs)
 {
 	arm64_enter_from_user_mode(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	do_el0_bti(regs);
 	arm64_exit_to_user_mode(regs);
 }
@@ -656,7 +681,7 @@ static void noinstr el0_bti(struct pt_regs *regs)
 static void noinstr el0_mops(struct pt_regs *regs, unsigned long esr)
 {
 	arm64_enter_from_user_mode(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	do_el0_mops(regs, esr);
 	arm64_exit_to_user_mode(regs);
 }
@@ -664,7 +689,7 @@ static void noinstr el0_mops(struct pt_regs *regs, unsigned long esr)
 static void noinstr el0_gcs(struct pt_regs *regs, unsigned long esr)
 {
 	arm64_enter_from_user_mode(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	do_el0_gcs(regs, esr);
 	arm64_exit_to_user_mode(regs);
 }
@@ -672,7 +697,7 @@ static void noinstr el0_gcs(struct pt_regs *regs, unsigned long esr)
 static void noinstr el0_inv(struct pt_regs *regs, unsigned long esr)
 {
 	arm64_enter_from_user_mode(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	bad_el0_sync(regs, 0, esr);
 	arm64_exit_to_user_mode(regs);
 }
@@ -686,7 +711,7 @@ static void noinstr el0_breakpt(struct pt_regs *regs, unsigned long esr)
 	debug_exception_enter(regs);
 	do_breakpoint(esr, regs);
 	debug_exception_exit(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_exit_unmask_all(regs);
 	arm64_exit_to_user_mode(regs);
 }
 
@@ -705,7 +730,7 @@ static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
 	 * the single-step is complete.
 	 */
 	step_done = try_step_suspended_breakpoints(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	if (!step_done)
 		do_el0_softstep(esr, regs);
 	arm64_exit_to_user_mode(regs);
@@ -720,14 +745,14 @@ static void noinstr el0_watchpt(struct pt_regs *regs, unsigned long esr)
 	debug_exception_enter(regs);
 	do_watchpoint(far, esr, regs);
 	debug_exception_exit(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_exit_unmask_all(regs);
 	arm64_exit_to_user_mode(regs);
 }
 
 static void noinstr el0_brk64(struct pt_regs *regs, unsigned long esr)
 {
 	arm64_enter_from_user_mode(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	do_el0_brk64(esr, regs);
 	arm64_exit_to_user_mode(regs);
 }
@@ -737,7 +762,7 @@ static void noinstr el0_svc(struct pt_regs *regs)
 	arm64_syscall_enter_from_user_mode(regs);
 	cortex_a76_erratum_1463225_svc_handler();
 	fpsimd_syscall_enter();
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	do_el0_svc(regs);
 	arm64_syscall_exit_to_user_mode(regs);
 	fpsimd_syscall_exit();
@@ -746,7 +771,7 @@ static void noinstr el0_svc(struct pt_regs *regs)
 static void noinstr el0_fpac(struct pt_regs *regs, unsigned long esr)
 {
 	arm64_enter_from_user_mode(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	do_el0_fpac(regs, esr);
 	arm64_exit_to_user_mode(regs);
 }
@@ -824,7 +849,7 @@ static void noinstr el0_interrupt(struct pt_regs *regs,
 {
 	arm64_enter_from_user_mode(regs);
 
-	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
+	irq_entry_unmask_debug_serror(regs);
 
 	if (regs->pc & BIT(55))
 		arm64_apply_bp_hardening();
@@ -862,11 +887,11 @@ static void noinstr __el0_error_handler_common(struct pt_regs *regs)
 	irqentry_state_t state;
 
 	arm64_enter_from_user_mode(regs);
-	local_exception_restore(arm64_make_errctx_mask());
+	error_entry_unmask_debug(regs);
 	state = irqentry_nmi_enter(regs);
 	do_serror(regs, esr);
 	irqentry_nmi_exit(regs, state);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_exit_unmask_all(regs);
 	arm64_exit_to_user_mode(regs);
 }
 
@@ -879,7 +904,7 @@ asmlinkage void noinstr el0t_64_error_handler(struct pt_regs *regs)
 static void noinstr el0_cp15(struct pt_regs *regs, unsigned long esr)
 {
 	arm64_enter_from_user_mode(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	do_el0_cp15(esr, regs);
 	arm64_exit_to_user_mode(regs);
 }
@@ -888,7 +913,7 @@ static void noinstr el0_svc_compat(struct pt_regs *regs)
 {
 	arm64_syscall_enter_from_user_mode(regs);
 	cortex_a76_erratum_1463225_svc_handler();
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	do_el0_svc_compat(regs);
 	arm64_syscall_exit_to_user_mode(regs);
 }
@@ -896,7 +921,7 @@ static void noinstr el0_svc_compat(struct pt_regs *regs)
 static void noinstr el0_bkpt32(struct pt_regs *regs, unsigned long esr)
 {
 	arm64_enter_from_user_mode(regs);
-	local_exception_restore(arm64_make_procctx_mask());
+	el0_sync_entry_unmask_all(regs);
 	do_bkpt32(esr, regs);
 	arm64_exit_to_user_mode(regs);
 }
-- 
2.34.1


