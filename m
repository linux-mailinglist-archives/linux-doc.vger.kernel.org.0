Return-Path: <linux-doc+bounces-94917-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tk+nE7MoSGpnnAAAu9opvQ
	(envelope-from <linux-doc+bounces-94917-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 23:25:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA999705CD7
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 23:25:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b="hb/nvHEG";
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94917-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94917-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B7FD3075836
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 21:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F2D370AF0;
	Fri,  3 Jul 2026 21:22:09 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB6235AC1B;
	Fri,  3 Jul 2026 21:22:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783113729; cv=none; b=aVLHN/dtQU4CRkgqonZOk/HH/BPBlSZpVKQhuwhkz9WOjCV5ngIHFXp47OmP3OeZYRAdyq1CfGUCmkQQ8bRyuA82v+aiXEqkosxf2/Fu2jwqSkgBcKmc1W2PB0ACZU+AzJClzwswdt/lVTdiPj2rgE/zjNYARZ6VGW9emxCEbw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783113729; c=relaxed/simple;
	bh=B5Y46hxNbjB13I68NgS+jb5GJzWVPTlpGeuNK+Zt9kE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kIwXQVZsjGS7Fk9kEkBTpn3OTHgBd+9ajPIoT4BoigGSrlHmSFZBhbUwMNblUuz9puiDX6pU/oAm746WhogGZKzutseUQUF03pbfDe0vLX7sIeFd4SyV97GEWDZ629/vcRcGZnCnfOINKp6uC0gM2c841QajeKpErjo/cJE0di4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hb/nvHEG; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=Uf6PMMgja7l0D+gznz6ziYSzcjhgw4gAMyV+QMwIS4w=; b=hb/nvHEGmIkkWSIO9fLFyYkl6P
	lhXj0DAUVaYTNlSjh9Ss2Uc7JqT+E0mDSgQF6HZZfS6Uhrl3pFZMXnt57qYqdw8l/FXZns/+M5YY/
	kKM4u3aIR9pCz2XESpfpAi5/Bi1spkdEUwrRa0uWaWvhfktAKSlCmqIgUEiL+l3J8ZMFmlO8ZLLj5
	rdW5ORlo4NyoFiq4LVYWiKqBt5CXZNjaAWZ5DKCm0b5O9mq3eWA3bDwiSAPZNZ/Abx6a7eMs3duc3
	/POuQuY/i9iQJJ3zU2Q5BVdFKXYQi8EURSyU73jVB+7z0aOV1hkkdmaUMI8Kzbxa0vw9EnSuOEcRF
	Rl2ZUp/w==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wflKX-0000000AsYE-1AzU;
	Fri, 03 Jul 2026 21:21:49 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wflKX-00000001RPT-0m6V;
	Fri, 03 Jul 2026 22:21:49 +0100
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
Subject: [PATCH v6 25/36] KVM: x86: Avoid gratuitous global clock updates
Date: Fri,  3 Jul 2026 22:18:04 +0100
Message-ID: <20260703212145.343527-26-dwmw2@infradead.org>
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
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94917-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:dwmw2@infradead.org,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:dongli.zhang@oracle.com,m:joe.jin@oracle.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,infradead.org:from_mime,infradead.org:dkim,infradead.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amazon.co.uk:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA999705CD7

From: David Woodhouse <dwmw@amazon.co.uk>

Eliminate two sources of unnecessary KVM_REQ_GLOBAL_CLOCK_UPDATE:

1. kvm_write_system_time(): The global clock update was a workaround for
   ever-drifting clocks based on the host's CLOCK_MONOTONIC subject to
   NTP skew. Now that the KVM clock uses CLOCK_MONOTONIC_RAW, the clock
   does not drift with NTP corrections and there is no need to
   synchronize all vCPUs on boot or resume. Use KVM_REQ_CLOCK_UPDATE on
   the vCPU itself, and only when the clock is being enabled, not
   disabled.

2. kvm_arch_vcpu_load(): In master clock mode, migration between pCPUs
   does not require any clock update since the master clock reference is
   shared. Only request a local KVM_REQ_CLOCK_UPDATE for the vCPU's
   first-ever load (vcpu->cpu == -1) to generate initial pvclock params.
   In non-master-clock mode, keep the global update to synchronize all
   vCPUs.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/x86.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index f8883c3b8ed2..2a1e1a1ab6ee 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2457,13 +2457,13 @@ static void kvm_write_system_time(struct kvm_vcpu *vcpu, gpa_t system_time,
 	}
 
 	vcpu->arch.time = system_time;
-	kvm_make_request(KVM_REQ_GLOBAL_CLOCK_UPDATE, vcpu);
 
 	/* we verify if the enable bit is set... */
-	if (system_time & 1)
+	if (system_time & 1) {
 		kvm_gpc_activate(&vcpu->arch.pv_time, system_time & ~1ULL,
 				 sizeof(struct pvclock_vcpu_time_info));
-	else
+		kvm_make_request(KVM_REQ_CLOCK_UPDATE, vcpu);
+	} else
 		kvm_gpc_deactivate(&vcpu->arch.pv_time);
 
 	return;
@@ -5355,13 +5355,13 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		 * On a host with synchronized TSC, there is no need to update
 		 * kvmclock on vcpu->cpu migration
 		 */
-		if (!vcpu->kvm->arch.use_master_clock || vcpu->cpu == -1) {
+		if (!vcpu->kvm->arch.use_master_clock) {
 			if (__ratelimit(&vcpu->kvm->arch.kvmclock_update_rs))
 				kvm_make_request(KVM_REQ_GLOBAL_CLOCK_UPDATE, vcpu);
 			else
 				kvm_make_request(KVM_REQ_CLOCK_UPDATE, vcpu);
-		}
-
+		} else if (vcpu->cpu == -1)
+			kvm_make_request(KVM_REQ_CLOCK_UPDATE, vcpu);
 		if (vcpu->cpu != cpu)
 			kvm_make_request(KVM_REQ_MIGRATE_TIMER, vcpu);
 		vcpu->cpu = cpu;
-- 
2.54.0


