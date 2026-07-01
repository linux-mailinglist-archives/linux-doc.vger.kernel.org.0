Return-Path: <linux-doc+bounces-94338-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0ayFEAoERWpc5AoAu9opvQ
	(envelope-from <linux-doc+bounces-94338-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 14:11:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 994E76ED15E
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 14:11:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=zte.com.cn (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94338-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94338-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9A3230435A0
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 12:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B3E43637D;
	Wed,  1 Jul 2026 12:11:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD16403AF2;
	Wed,  1 Jul 2026 12:11:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782907886; cv=none; b=oktjIwrXtLc17y6Pl9z1Hd/qW4gkRYWGtzB57gBwnq8np5jZYk0V72InUGbAQjbn1Iiki40/sUnCWZCQ/aDzc2/CUM3KRiVtrE0hVSKHBsDNlsIJhLDejhe51DSITSq2qRArOhEQd3gE1q6CLxe4DgBrAeUuEeR2KZaywqiyzD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782907886; c=relaxed/simple;
	bh=x8Om0EKvLql6Zu+HVTcHCRu9d9Jk5BnVdQjtZdu4zlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oYL1NWYnvAtTuQ5XVcykscGmRFbEB/c0TjKhd7NFp5mSX+1LugTL5boaSqTB9XjwjP9kAjLj4fn9Soke3fH4WUW4+EW/S8g+SWj8UPlOq+eAEzUXMXXvkqCUr3vrcUm4yH/Y8AbShtayQD4VPeVoedxTTyGH76P2wvuR+R6ixE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gqzPx5sMnz8XrrJ;
	Wed, 01 Jul 2026 20:11:17 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl1.zte.com.cn with SMTP id 661CB6SP047127;
	Wed, 1 Jul 2026 20:11:06 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Wed, 1 Jul 2026 20:11:09 +0800
X-Zmail-TransId: 3e816a4503dd008-1d60a
X-Zmail-LocalSMTP: 1
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-Zmail-RealSender: wang.yechao255@zte.com.cn
From: Wang Yechao <wang.yechao255@zte.com.cn>
To: Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@linux.dev>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Wang Yechao <wang.yechao255@zte.com.cn>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: [PATCH v4 5/5] RISC-V: KVM: Add the eager_page_split module parameter
Date: Wed,  1 Jul 2026 20:09:48 +0800
Message-ID: <20260701120954.129873-6-wang.yechao255@zte.com.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260701120954.129873-1-wang.yechao255@zte.com.cn>
References: <20260701120954.129873-1-wang.yechao255@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-MAIL:mse-fl1.zte.com.cn 661CB6SP047127
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Wed, 01 Jul 2026 20:11:17 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A4503E5.000/4gqzPx5sMnz8XrrJ
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.36 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[zte.com.cn : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anup@brainfault.org,m:kvm@vger.kernel.org,m:kvm-riscv@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:atish.patra@linux.dev,m:alex@ghiti.fr,m:wang.yechao255@zte.com.cn,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wang.yechao255@zte.com.cn,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-94338-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wang.yechao255@zte.com.cn,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,zte.com.cn:email,zte.com.cn:mid,zte.com.cn:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 994E76ED15E

Add an eager_page_split module parameter for RISC-V KVM, following
the same approach as on x86. This parameter controls whether eager
page splitting is enabled. The default value is on.

When eager page splitting is enabled, KVM proactively splits large
pages (huge pages) into smaller pages when needed for dirty logging
or other operations. Disabling it can be beneficial for VM workloads
that rarely perform writes, or that only write to a small region of
memory, as it allows huge pages to remain intact for read accesses.

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 Documentation/admin-guide/kernel-parameters.txt |  7 +++++--
 arch/riscv/kvm/mmu.c                            | 13 ++++++++++---
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a68003c3599cc..b4c68a896fa79 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3047,7 +3047,7 @@ Kernel parameters
 			Default is 0 (don't ignore, but inject #GP)
 
 	kvm.eager_page_split=
-			[KVM,X86] Controls whether or not KVM will try to
+			[KVM,X86,RISCV] Controls whether or not KVM will try to
 			proactively split all huge pages during dirty logging.
 			Eager page splitting reduces interruptions to vCPU
 			execution by eliminating the write-protection faults
@@ -3067,7 +3067,10 @@ Kernel parameters
 			the KVM_CLEAR_DIRTY ioctl, and only for the pages being
 			cleared.
 
-			Eager page splitting is only supported when kvm.tdp_mmu=Y.
+			On x86, eager page splitting is only supported when
+			kvm.tdp_mmu=Y.
+
+			On RISCV, eager page splitting is supported by default.
 
 			Default is Y (on).
 
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 29a7ac023d4db..a534f596c8ca0 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -16,6 +16,9 @@
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
 
+static bool __read_mostly eager_page_split = true;
+module_param(eager_page_split, bool, 0644);
+
 static void mmu_wp_memory_region(struct kvm *kvm, int slot)
 {
 	struct kvm_memslots *slots = kvm_memslots(kvm);
@@ -167,8 +170,10 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 
 	kvm_riscv_gstage_wp_range(&gstage, start, end);
 
-	if (kvm_dirty_log_manual_protect_and_init_set(kvm))
-		mmu_split_huge_pages(&gstage, start, end);
+	if (kvm_dirty_log_manual_protect_and_init_set(kvm)) {
+		if (READ_ONCE(eager_page_split))
+			mmu_split_huge_pages(&gstage, start, end);
+	}
 }
 
 void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
@@ -238,7 +243,9 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 		if (kvm_dirty_log_manual_protect_and_init_set(kvm))
 			return;
 		mmu_wp_memory_region(kvm, new->id);
-		mmu_split_memory_region(kvm, new->id);
+
+		if (READ_ONCE(eager_page_split))
+			mmu_split_memory_region(kvm, new->id);
 	}
 }
 
-- 
2.43.5


