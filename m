Return-Path: <linux-doc+bounces-94938-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yRU3DykrSGoKnQAAu9opvQ
	(envelope-from <linux-doc+bounces-94938-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 23:35:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1E2705E5C
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 23:35:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=desiato.20200630 header.b=MrJT44uE;
	dmarc=pass (policy=none) header.from=infradead.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94938-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-94938-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CD8D3134510
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 21:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476FB37C93E;
	Fri,  3 Jul 2026 21:24:12 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E79354AEB;
	Fri,  3 Jul 2026 21:24:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783113852; cv=none; b=ak7U+oyeAalcxAfaDrqvyom6cmNPsDYHf3WSJG23FLNYVSX8QKQgcpZhHxXkYcE784/YQJYRcWKSBL1J8AApjU/a7cRPkehBEOFtpI3NSj36R/T4TKf6AFm1QVT/Hwpn2SbJkNiLP7PfeCluGaRfBXNv81CNAewSWrO8ebNq2mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783113852; c=relaxed/simple;
	bh=eeSkOaoohS8ABjkan2gcRgVt8w8ZGAV/hNmlhpY4VAw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SJ08uF8S1CYzr9ThUvKoSqDjMYr0KKMRBTuo7huyeYn+AeJYsAXYHFP0OaEeunmyAuwrW7Q9vyTv2jx9vDPr+2deyI9Y85lkWtRQfUCbRgTsU2lbzCDehCMBBolAMDX49TH4g2I2yGG3/gPd3b6bymkifqietWVhu5tR5Y6P5hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MrJT44uE; arc=none smtp.client-ip=90.155.92.199
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description;
	bh=SebBoBga7+8xvSm9Qg2DITvEgd/PpKvvHuYtx20We+A=; b=MrJT44uEu/ZgsbRjkneqpYQb+I
	C9bwJVuCznY58yJD8EdJi8FQdNVEgxGcL50Ro9AZYdMNScp+g1s1h2IFLUn2lIqqc9EYs8NUR3RGy
	6qxE3E1hl0ywiGSZI+jKomQ4xMQr+7uKuHnk/5q0xaHqpxokRZIG6n6fJrVvB2w20H2Y8vq7G+Kz/
	ypBryhHJBUZNe7TIsGAxVDdtKuU2mjrLVIBo3VZJ4w8SDZ7LzobdRT/yT+cdPuckXVbOn/8HEOmTl
	5FiE48zNpNUBhA5POfG4WA4DzdJ+VDeI0VUe2SBZrA7WCF/2WPhGmEyI6XoaCQ7zDs39P9Nk5648O
	5UZK0HgA==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wflKd-000000059Nu-3OYm;
	Fri, 03 Jul 2026 21:23:38 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wflKV-00000001RNp-3OFP;
	Fri, 03 Jul 2026 22:21:47 +0100
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
Subject: [PATCH v6 01/36] KVM: x86/xen: Do not corrupt KVM clock in kvm_xen_shared_info_init()
Date: Fri,  3 Jul 2026 22:17:40 +0100
Message-ID: <20260703212145.343527-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703212145.343527-1-dwmw2@infradead.org>
References: <20260703212145.343527-1-dwmw2@infradead.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94938-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:seanjc@google.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:dwmw2@infradead.org,m:paul@xen.org,m:jic23@kernel.org,m:Sascha.Bischoff@arm.com,m:maz@kernel.org,m:joey.gouly@arm.com,m:jalliste@amazon.com,m:dongli.zhang@oracle.com,m:joe.jin@oracle.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dwmw2@infradead.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwmw2@infradead.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:email,vger.kernel.org:from_smtp,infradead.org:from_mime,infradead.org:dkim,infradead.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amazon.co.uk:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA1E2705E5C

From: David Woodhouse <dwmw@amazon.co.uk>

The KVM clock is an interesting thing. It is defined as "nanoseconds
since the guest was created", but in practice it runs at two *different*
rates — or three different rates, if you count implementation bugs.

Definition A is that it runs synchronously with the CLOCK_MONOTONIC_RAW
of the host, with a delta of kvm->arch.kvmclock_offset.

But that version doesn't actually get used in the common case, where the
host has a reliable TSC and the guest TSCs are all running at the same
rate and in sync with each other, and kvm->arch.use_master_clock is set.

In that common case, definition B is used: There is a reference point in
time at kvm->arch.master_kernel_ns (again a CLOCK_MONOTONIC_RAW time),
and a corresponding host TSC value kvm->arch.master_cycle_now. This
fixed point in time is converted to guest units (the time offset by
kvmclock_offset and the TSC Value scaled and offset to be a guest TSC
value) and advertised to the guest in the pvclock structure. While in
this 'use_master_clock' mode, the fixed point in time never needs to be
changed, and the clock runs precisely in time with the guest TSC, at the
rate advertised in the pvclock structure.

The third definition C is implemented in kvm_get_wall_clock_epoch() and
__get_kvmclock(), using the master_cycle_now and master_kernel_ns fields
but converting the *host* TSC cycles directly to a value in nanoseconds
instead of scaling via the guest TSC.

One might naïvely think that all three definitions are identical, since
CLOCK_MONOTONIC_RAW is not skewed by NTP frequency corrections; all
three are just the result of counting the host TSC at a known frequency,
or the scaled guest TSC at a known precise fraction of the host's
frequency. The problem is with arithmetic precision, and the way that
frequency scaling is done in a division-free way by multiplying by a
scale factor, then shifting right. In practice, all three ways of
calculating the KVM clock will suffer a systemic drift from each other.

Eventually, definition C should just be eliminated. Commit 451a707813ae
("KVM: x86/xen: improve accuracy of Xen timers") worked around it for
the specific case of Xen timers, which are defined in terms of the KVM
clock and suffered from a continually increasing error in timer expiry
times. That commit notes that get_kvmclock_ns() is non-trivial to fix
and says "I'll come back to that", which remains true.

Definitions A and B do need to coexist, the former to handle the case
where the host or guest TSC is suboptimally configured. But KVM should
be more careful about switching between them, and the discontinuity in
guest time which could result.

In particular, KVM_REQ_MASTERCLOCK_UPDATE will take a new snapshot of
time as the reference in master_kernel_ns and master_cycle_now, yanking
the guest's clock back to match definition A at that moment.

When invoked from in 'use_master_clock' mode, kvm_update_masterclock()
should probably *adjust* kvm->arch.kvmclock_offset to account for the
drift, instead of yanking the clock back to definition A. But in the
meantime there are a bunch of places where it just doesn't need to be
invoked at all.

To start with: there is no need to do such an update when a Xen guest
populates the shared_info page. This seems to have been a hangover from
the very first implementation of shared_info which automatically
populated the vcpu_info structures at their default locations, but even
then it should just have raised KVM_REQ_CLOCK_UPDATE on each vCPU
instead of using KVM_REQ_MASTERCLOCK_UPDATE. And now that userspace is
expected to explicitly set the vcpu_info even in its default locations,
there's not even any need for that either.

Fixes: 629b5348841a ("KVM: x86/xen: update wallclock region")
Reviewed-by: Paul Durrant <paul@xen.org>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/xen.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index 91fd3673c09a..82e34edbfdbd 100644
--- a/arch/x86/kvm/xen.c
+++ b/arch/x86/kvm/xen.c
@@ -98,8 +98,6 @@ static int kvm_xen_shared_info_init(struct kvm *kvm)
 	wc->version = wc_version + 1;
 	read_unlock_irq(&gpc->lock);
 
-	kvm_make_all_cpus_request(kvm, KVM_REQ_MASTERCLOCK_UPDATE);
-
 out:
 	srcu_read_unlock(&kvm->srcu, idx);
 	return ret;

base-commit: 2d6d57f889f3a5e7d19009c560ea2002cdde9fb8
-- 
2.54.0


