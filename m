Return-Path: <linux-doc+bounces-6814-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B69282D9A8
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jan 2024 14:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 221C1282661
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jan 2024 13:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FCAD17BBD;
	Mon, 15 Jan 2024 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="GWcJbxtN"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5108D17747;
	Mon, 15 Jan 2024 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xen.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=jX87KX1NB8T3RPg0SJihEI1RqhbveMjQA0pberq0Ako=; b=GWcJbxtNgS173uNLRgZxCYoZ2S
	HSsdkbQlJSzcspRnTrOTr4C4FsKC4J+7ttFUsfW6fI4oZcn4FjZojpVJqiTqHXlGQ7l4sz0MNP6r3
	ks3OP0SFBCQwiZJGnWpqQ9Jz3ET35vtQMt7U7wKSQH7/F10MRgQinopG1wtRyRK5JbMA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1rPMiZ-00035o-42; Mon, 15 Jan 2024 13:09:31 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=REM-PW02S00X.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1rPMXd-0002kM-Fn; Mon, 15 Jan 2024 12:58:13 +0000
From: Paul Durrant <paul@xen.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v12 17/20] KVM: xen: don't block on pfncache locks in kvm_xen_set_evtchn_fast()
Date: Mon, 15 Jan 2024 12:57:04 +0000
Message-Id: <20240115125707.1183-18-paul@xen.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240115125707.1183-1-paul@xen.org>
References: <20240115125707.1183-1-paul@xen.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

As described in [1] compiling with CONFIG_PROVE_RAW_LOCK_NESTING shows that
kvm_xen_set_evtchn_fast() is blocking on pfncache locks in IRQ context.
There is only actually blocking with PREEMPT_RT because the locks will
turned into mutexes. There is no 'raw' version of rwlock_t that can be used
to avoid that, so use read_trylock() and treat failure to lock the same as
an invalid cache.

[1] https://lore.kernel.org/lkml/99771ef3a4966a01fefd3adbb2ba9c3a75f97cf2.camel@infradead.org/T/#mbd06e5a04534ce9c0ee94bd8f1e8d942b2d45bd6

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
---
Cc: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: x86@kernel.org

v11:
 - Amended the commit comment.

v10:
 - New in this version.
---
 arch/x86/kvm/xen.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index 5ce02699f44c..9168a6ec88fd 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -1673,10 +1673,13 @@ static int set_shinfo_evtchn_pending(struct kvm_vcpu *vcpu, u32 port)
 	unsigned long flags;
 	int rc = -EWOULDBLOCK;
 
-	read_lock_irqsave(&gpc->lock, flags);
-	if (!kvm_gpc_check(gpc, PAGE_SIZE))
+	local_irq_save(flags);
+	if (!read_trylock(&gpc->lock))
 		goto out;
 
+	if (!kvm_gpc_check(gpc, PAGE_SIZE))
+		goto out_unlock;
+
 	if (IS_ENABLED(CONFIG_64BIT) && kvm->arch.xen.long_mode) {
 		struct shared_info *shinfo = gpc->khva;
 
@@ -1698,8 +1701,10 @@ static int set_shinfo_evtchn_pending(struct kvm_vcpu *vcpu, u32 port)
 		rc = 1; /* It is newly raised */
 	}
 
+ out_unlock:
+	read_unlock(&gpc->lock);
  out:
-	read_unlock_irqrestore(&gpc->lock, flags);
+	local_irq_restore(flags);
 	return rc;
 }
 
@@ -1709,21 +1714,23 @@ static bool set_vcpu_info_evtchn_pending(struct kvm_vcpu *vcpu, u32 port)
 	struct gfn_to_pfn_cache *gpc = &vcpu->arch.xen.vcpu_info_cache;
 	unsigned long flags;
 	bool kick_vcpu = false;
+	bool locked;
 
-	read_lock_irqsave(&gpc->lock, flags);
+	local_irq_save(flags);
+	locked = read_trylock(&gpc->lock);
 
 	/*
 	 * Try to deliver the event directly to the vcpu_info. If successful and
 	 * the guest is using upcall_vector delivery, send the MSI.
-	 * If the pfncache is invalid, set the shadow. In this case, or if the
-	 * guest is using another form of event delivery, the vCPU must be
-	 * kicked to complete the delivery.
+	 * If the pfncache lock is contended or the cache is invalid, set the
+	 * shadow. In this case, or if the guest is using another form of event
+	 * delivery, the vCPU must be kicked to complete the delivery.
 	 */
 	if (IS_ENABLED(CONFIG_64BIT) && kvm->arch.xen.long_mode) {
 		struct vcpu_info *vcpu_info = gpc->khva;
 		int port_word_bit = port / 64;
 
-		if (!kvm_gpc_check(gpc, sizeof(*vcpu_info))) {
+		if ((!locked || !kvm_gpc_check(gpc, sizeof(*vcpu_info)))) {
 			if (!test_and_set_bit(port_word_bit, &vcpu->arch.xen.evtchn_pending_sel))
 				kick_vcpu = true;
 			goto out;
@@ -1737,7 +1744,7 @@ static bool set_vcpu_info_evtchn_pending(struct kvm_vcpu *vcpu, u32 port)
 		struct compat_vcpu_info *vcpu_info = gpc->khva;
 		int port_word_bit = port / 32;
 
-		if (!kvm_gpc_check(gpc, sizeof(*vcpu_info))) {
+		if ((!locked || !kvm_gpc_check(gpc, sizeof(*vcpu_info)))) {
 			if (!test_and_set_bit(port_word_bit, &vcpu->arch.xen.evtchn_pending_sel))
 				kick_vcpu = true;
 			goto out;
@@ -1756,7 +1763,10 @@ static bool set_vcpu_info_evtchn_pending(struct kvm_vcpu *vcpu, u32 port)
 	}
 
  out:
-	read_unlock_irqrestore(&gpc->lock, flags);
+	if (locked)
+		read_unlock(&gpc->lock);
+
+	local_irq_restore(flags);
 	return kick_vcpu;
 }
 
-- 
2.39.2


