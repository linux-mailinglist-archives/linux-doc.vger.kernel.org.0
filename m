Return-Path: <linux-doc+bounces-91418-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /GU9MabvJmoNnwIAu9opvQ
	(envelope-from <linux-doc+bounces-91418-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 18:36:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE54658C5B
	for <lists+linux-doc@lfdr.de>; Mon, 08 Jun 2026 18:36:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=desiato.20200630 header.b=leHuzNM3;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91418-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91418-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF5F6317F7BD
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 15:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526EF3F6C50;
	Mon,  8 Jun 2026 14:55:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4035A3F4833;
	Mon,  8 Jun 2026 14:55:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930522; cv=none; b=HRHep2KssUuadTjzhWSQYyIHpzwAwddC9IRmza6CqKaoG7hBmd20BQGm48W6UEZ6arGmEjwz9PcFK0+mUrPpLzVLH0/fBuBqvcMCl0xniG8Oz4i94odTPoUVv9/4JumXL28t/1PZkZWCHhmF/9oCWhXhTxqCPcEuYTXRMKeTbvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930522; c=relaxed/simple;
	bh=NMZnldX9uLavTTMI5cFiMDFVdLYNB6aAnLxv5afx3dc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T2ududvM6XqCWI1EM2RL88xjxBsPtrsmQMJL4A4j5EkwE5sgcPj9ja7l05CK+1OOkrcKcLp56C8x/hO7WXm9akBk7YIZnruk7wykB1+6QPyj2qmvq4K+UUjzNpqa5Q7qZprkPhFpW0Xbwlmpybza7eBy4/DhLgCJBr2OLFI0tGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=leHuzNM3; arc=none smtp.client-ip=90.155.92.199
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description;
	bh=GbicoDuWZuSNUqLEMcVhKsjPlvyGA6ZGIMWsZrA2Bd4=; b=leHuzNM3KLTrNW7+UGnCAwbQJe
	vUfUSugsjMC/ACkfR1NJ+y3bNXWweyIjcD9uvt+b7RJpQpgEZCh8r0YFLprPoHeEz7zTbVZ40VQf1
	RHGWGvBWUHjAky+jIEeN+oIpxdIwA+rhYJFsTqIgSLpRwP/QOYLul/8M4ZMbb0hoRRFf/JZgbNsHX
	IWIEswsP5ZrCjtOdL/HQr3BqSZWQ5/uovEEuxmiW7W6MWIXC9g6IckD0ZB8vI9ExeEjmMsm6aWVg1
	FkyqCuvpziD3jAkT+kLC0I29mxEwe78pfGfSZNNXltg0QZDpzE3eTwC4P5suBTsmwFzLtXPwQMelI
	fZwnwQgw==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbNV-00000001AgT-3Wjr;
	Mon, 08 Jun 2026 14:55:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbNT-00000000NGq-0OCB;
	Mon, 08 Jun 2026 15:54:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Jack Allister <jalliste@amazon.com>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	joe.jin@oracle.com,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 33/34] KVM: x86: Replace pvclock_gtod_data vclock_mode with boolean
Date: Mon,  8 Jun 2026 15:48:14 +0100
Message-ID: <20260608145455.89187-34-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608145455.89187-1-dwmw2@infradead.org>
References: <20260608145455.89187-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91418-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:dwmw2@infradead.org,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:dongli.zhang@oracle.com,m:joe.jin@oracle.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DE54658C5B

From: David Woodhouse <dwmw@amazon.co.uk>

The remaining users of pvclock_gtod_data only need to know whether
the host clocksource is TSC-based. Replace all vclock_mode checks
with a simple kvm_host_has_tsc_clocksource boolean, updated by the
pvclock_gtod_notify callback.

This is inherently racy (as it always was — kvm_track_tsc_matching
never held the gtod seqcount), relying on eventual consistency: the
notifier fires on every timekeeping update and will correct any
transient inconsistency within one tick.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Assisted-by: Kiro:claude-opus-4.6-1m
---
 arch/x86/kvm/x86.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index c18947c5b63f..93a428c37847 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2649,6 +2649,8 @@ static u64 compute_guest_tsc(struct kvm_vcpu *vcpu, s64 kernel_ns)
 }
 
 #ifdef CONFIG_X86_64
+static bool kvm_host_has_tsc_clocksource;
+
 static inline bool gtod_is_based_on_tsc(int mode)
 {
 	return mode == VDSO_CLOCKMODE_TSC || mode == VDSO_CLOCKMODE_HVCLOCK;
@@ -2678,7 +2680,6 @@ static bool kvm_use_master_clock(struct kvm *kvm)
 static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu, bool new_generation)
 {
 	struct kvm_arch *ka = &vcpu->kvm->arch;
-	struct pvclock_gtod_data *gtod = &pvclock_gtod_data;
 
 	/*
 	 * Track whether all vCPUs have matching TSC offsets (for
@@ -2712,7 +2713,7 @@ static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu, bool new_generation)
 	 * accounts for its offset.
 	 */
 	bool use_master_clock = kvm_use_master_clock(vcpu->kvm) &&
-				gtod_is_based_on_tsc(gtod->clock.vclock_mode);
+				kvm_host_has_tsc_clocksource;
 
 	/*
 	 * Request a masterclock update if the masterclock needs to be toggled
@@ -2726,7 +2727,7 @@ static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu, bool new_generation)
 
 	trace_kvm_track_tsc(vcpu->vcpu_id, ka->nr_vcpus_matched_tsc,
 			    atomic_read(&vcpu->kvm->online_vcpus),
-		            ka->use_master_clock, gtod->clock.vclock_mode);
+		            ka->use_master_clock, kvm_host_has_tsc_clocksource);
 }
 #else
 static inline void kvm_track_tsc_matching(struct kvm_vcpu *vcpu,
@@ -2850,7 +2851,7 @@ static inline bool kvm_check_tsc_unstable(void)
 	 * TSC is marked unstable when we're running on Hyper-V,
 	 * 'TSC page' clocksource is good.
 	 */
-	if (pvclock_gtod_data.clock.vclock_mode == VDSO_CLOCKMODE_HVCLOCK)
+	if (kvm_host_has_tsc_clocksource)
 		return false;
 #endif
 	return check_tsc_unstable();
@@ -3315,7 +3316,7 @@ static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
 			ka->use_master_clock = false;
 	}
 
-	vclock_mode = pvclock_gtod_data.clock.vclock_mode;
+	vclock_mode = kvm_host_has_tsc_clocksource;
 	trace_kvm_update_master_clock(ka->use_master_clock, vclock_mode,
 					ka->all_vcpus_matched_freq);
 #endif
@@ -10407,12 +10408,15 @@ static int pvclock_gtod_notify(struct notifier_block *nb, unsigned long unused,
 	update_pvclock_gtod(tk);
 
 #ifdef CONFIG_X86_64
+	kvm_host_has_tsc_clocksource =
+		gtod_is_based_on_tsc(tk->tkr_mono.clock->vdso_clock_mode);
+
 	/*
 	 * Disable master clock if host does not trust, or does not use,
 	 * TSC based clocksource. Delegate queue_work() to irq_work as
 	 * this is invoked with tk_core.seq write held.
 	 */
-	if (!gtod_is_based_on_tsc(pvclock_gtod_data.clock.vclock_mode) &&
+	if (!kvm_host_has_tsc_clocksource &&
 	    atomic_read(&kvm_guest_has_master_clock) != 0)
 		irq_work_queue(&pvclock_irq_work);
 #endif
-- 
2.54.0


