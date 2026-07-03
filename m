Return-Path: <linux-doc+bounces-94927-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aYq4ACMrSGoEnQAAu9opvQ
	(envelope-from <linux-doc+bounces-94927-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 23:35:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E85DF705E51
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 23:35:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=desiato.20200630 header.b=aNaMFKhd;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94927-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-94927-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C52193024DE5
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 21:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A27353A82;
	Fri,  3 Jul 2026 21:23:49 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4167321F5E;
	Fri,  3 Jul 2026 21:23:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783113829; cv=none; b=GbVRKHPqVBhX5WTCQ4HqRICxf0dOajJL+hAhHzEi/4FUSAIRKHPHbfGDu4VP43hRcS+tsrF0sg+LkH3sG9KTrDHqfq17skMlx/Lf8eNgA3PoKa7q3YYuhuVNWrh1AREVpofXzrsnzFAyw2VJesOPhhDkJVlw3MP6Pu76v2HxQGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783113829; c=relaxed/simple;
	bh=MjipA883RaJ3mH0lxU9tNQaqbJgDN+eVHIe32Tignis=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ckwYEomIU0pOSsfg2Nl0ltvRmCwqGtg7qKqfSrK884VSD1aPDZKEmex4Bgtjw2NmWVLu9ZIffBFQdWOmUYW50xgTZSi5zfDRHcTdS2lsO8Uz3aKF5GBW65SKYdrWfbGdHla7u0dy/go36b+RZ3Cxs/qcVJRDbKeFmRyDjh/HlZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=aNaMFKhd; arc=none smtp.client-ip=90.155.92.199
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=GJgji+5kC3YzYVHStlFYRgwhsr0ZfLQx7Fpf6sFlDAA=; b=aNaMFKhduCWNdatfzzJJHFUyeo
	Rv0SPwZDALsXDKwMgu8TapnCKqex3QPVj6TX+zcg6JTU+v1auSQB/Dm++Fne6Kd6/Xsd1WpTAh66p
	+Jw+sbONjIBR0Ucx+tpPYaoTJ+irYWQyCueZjPBZL8ujVdf7l3w9ZfCHuqaOz3JKseBAeiAyDV+7D
	ZHZ8RHyxNJF0eyEn2u16sn8ppCB0vLGNANDCMEtR4E8moNuG3lTnO3T0FdJSxQh+iIg5dUgiofp4Q
	WdYXyTAa47+JwSUPFmx+SeUirPzgv2aPbC8gxMNw396yX7a6sSd6/7iF/f4W8/EB9/3wPty5xPA5/
	oJ+JIJWg==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wflKd-000000059O1-3OLf;
	Fri, 03 Jul 2026 21:23:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wflKW-00000001ROd-1uel;
	Fri, 03 Jul 2026 22:21:48 +0100
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
Subject: [PATCH v6 13/36] KVM: x86: Fix KVM clock precision in get_kvmclock() with TSC scaling
Date: Fri,  3 Jul 2026 22:17:52 +0100
Message-ID: <20260703212145.343527-14-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703212145.343527-1-dwmw2@infradead.org>
References: <20260703212145.343527-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94927-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:dwmw2@infradead.org,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:dongli.zhang@oracle.com,m:joe.jin@oracle.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,amazon.co.uk:email,infradead.org:from_mime,infradead.org:dkim,infradead.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E85DF705E51

From: David Woodhouse <dwmw@amazon.co.uk>

When in master clock mode, the KVM clock is defined in terms of the
guest TSC. But get_kvmclock() was computing it from the host TSC
without applying TSC scaling, leading to a systemic drift from the
values the guest computes from its own TSC.

Store the VM's TSC scaling ratio in kvm_arch and precompute the
guest-TSC-based mul/shift in pvclock_update_vm_gtod_copy(). Use these
in get_kvmclock() to scale the host TSC delta to guest TSC before
converting to nanoseconds.

This avoids "definition C" of the KVM clock described in the
earlier commit "KVM: x86/xen: Do not corrupt KVM clock in
kvm_xen_shared_info_init()".

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/include/asm/kvm_host.h |  4 +++
 arch/x86/kvm/x86.c              | 52 +++++++++++++++++++++++++++++----
 2 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index b2446c04a076..87435ddecde1 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1490,6 +1490,7 @@ struct kvm_arch {
 	u64 last_tsc_write;
 	u32 last_tsc_khz;
 	u64 last_tsc_offset;
+	u64 last_tsc_scaling_ratio;
 	u64 cur_tsc_nsec;
 	u64 cur_tsc_write;
 	u64 cur_tsc_offset;
@@ -1505,6 +1506,9 @@ struct kvm_arch {
 	u64 master_kernel_ns;
 	u64 master_cycle_now;
 	struct ratelimit_state kvmclock_update_rs;
+	u64 master_tsc_scaling_ratio;
+	s8  master_tsc_shift;
+	u32 master_tsc_mul;
 
 #ifdef CONFIG_KVM_HYPERV
 	struct kvm_hv hyperv;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 37b1f8192842..65aa0fb0b5e1 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2781,6 +2781,7 @@ static void __kvm_synchronize_tsc(struct kvm_vcpu *vcpu, u64 offset, u64 tsc,
 	kvm->arch.last_tsc_write = tsc;
 	kvm->arch.last_tsc_khz = vcpu->arch.virtual_tsc_khz;
 	kvm->arch.last_tsc_offset = offset;
+	kvm->arch.last_tsc_scaling_ratio = vcpu->arch.l1_tsc_scaling_ratio;
 
 	vcpu->arch.last_guest_tsc = tsc;
 
@@ -3109,6 +3110,8 @@ static bool kvm_get_walltime_and_clockread(struct timespec64 *ts,
  *
  */
 
+static unsigned long get_cpu_tsc_khz(void);
+
 static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
 {
 #ifdef CONFIG_X86_64
@@ -3132,9 +3135,30 @@ static void pvclock_update_vm_gtod_copy(struct kvm *kvm)
 				&& !ka->backwards_tsc_observed
 				&& !ka->boot_vcpu_runs_old_kvmclock;
 
-	if (ka->use_master_clock)
+	if (ka->use_master_clock) {
+		u64 tsc_hz;
+
 		atomic_set(&kvm_guest_has_master_clock, 1);
 
+		/*
+		 * Copy the scaling ratio and precompute the mul/shift for
+		 * converting guest TSC to nanoseconds. These are used by
+		 * get_kvmclock() to compute kvmclock from the host TSC
+		 * without needing a vCPU reference.
+		 */
+		ka->master_tsc_scaling_ratio = ka->last_tsc_scaling_ratio;
+		tsc_hz = (u64)get_cpu_tsc_khz() * 1000;
+		if (tsc_hz && kvm_caps.has_tsc_control)
+			tsc_hz = kvm_scale_tsc(tsc_hz,
+					       ka->master_tsc_scaling_ratio);
+		if (tsc_hz)
+			kvm_get_time_scale(NSEC_PER_SEC, tsc_hz,
+					   &ka->master_tsc_shift,
+					   &ka->master_tsc_mul);
+		else
+			ka->use_master_clock = false;
+	}
+
 	vclock_mode = pvclock_gtod_data.clock.vclock_mode;
 	trace_kvm_update_master_clock(ka->use_master_clock, vclock_mode,
 					vcpus_matched);
@@ -3220,10 +3244,28 @@ static void get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
 
 				hv_clock.tsc_timestamp = ka->master_cycle_now;
 				hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
-				kvm_get_time_scale(NSEC_PER_SEC, get_cpu_tsc_khz() * 1000LL,
-						   &hv_clock.tsc_shift,
-						   &hv_clock.tsc_to_system_mul);
-				data->clock = __pvclock_read_cycles(&hv_clock, data->host_tsc);
+
+				/*
+				 * Use the precomputed guest-TSC-based mul/shift
+				 * so that the kvmclock value matches what the
+				 * guest computes from its own TSC.
+				 */
+				hv_clock.tsc_shift = ka->master_tsc_shift;
+				hv_clock.tsc_to_system_mul = ka->master_tsc_mul;
+
+				if (kvm_caps.has_tsc_control) {
+					u64 tsc_delta = data->host_tsc - ka->master_cycle_now;
+
+					tsc_delta = kvm_scale_tsc(tsc_delta,
+								  ka->master_tsc_scaling_ratio);
+					data->clock = hv_clock.system_time +
+						pvclock_scale_delta(tsc_delta,
+								    hv_clock.tsc_to_system_mul,
+								    hv_clock.tsc_shift);
+				} else {
+					data->clock = __pvclock_read_cycles(&hv_clock,
+									    data->host_tsc);
+				}
 				continue;
 			}
 
-- 
2.54.0


