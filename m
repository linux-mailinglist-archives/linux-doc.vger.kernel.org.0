Return-Path: <linux-doc+bounces-15263-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF978B45FD
	for <lists+linux-doc@lfdr.de>; Sat, 27 Apr 2024 13:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC6B61C21656
	for <lists+linux-doc@lfdr.de>; Sat, 27 Apr 2024 11:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68844EB42;
	Sat, 27 Apr 2024 11:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DiMkLcQ0"
X-Original-To: linux-doc@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178A24DA12;
	Sat, 27 Apr 2024 11:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714216888; cv=none; b=spsztoiJ3DE9IBhxzWam5HbiWhxI9ZkjxPPN4459v9L+mUUoObVZQlZAAfgj3v2F1/mWS3kV1+EMzjrNf8ixf/Sl+jnY1bn3FiWltrA+5tQkNPbaKMHGplGjLKdMxhbPtXezHBJOw31b5E/IqY6UFvOn2FKfPmeSTaN2i3ogZb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714216888; c=relaxed/simple;
	bh=C5CZWRn/dblAaawMHg2qNlfLg+yBr5J2uQbwj2YUfTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XNOnNumFYjlZPgV7CPW+WSKoWaCSawb1oKrzHVOL6i6u972AgDNIFQmfQ6NZTAYQ3rYccNTHhLb0WxWGtlV8YZir/Xss7OYfqae7MrBCGc79L4e1tt+onaMkeSDHGMZ/RM49IWaTv2P7J9QjI9oTbj9zmihXeu5dE/x4oeSQHwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DiMkLcQ0; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=E2BLnhCI82wBGMd07MyYrgTnQQv3Sa9TdJWanAWnpdE=; b=DiMkLcQ0m0oActJMV0r/Um0L8D
	eqN4bzbg77nSayhDWCQuq6HS0YI26i94JMsHg+24nkLKpKnw6yOITt4Zv1t7ORaTvs+wAEh+1Oqin
	PL/e2BSA9PPfIVd2kkAwBbK5GZ5yaxuO4aCF+9EPghDr2Ewc6pV/TPQJn+L+34KZ2lrfuuBlALvti
	HFgaDSDzznXB+NjcuTv3mNXCY9+YdTni4sX/vmTm18n/rjb24OiNSVCtQqe3LV6jFP2U4BMjBRkU2
	hZiv3NqdzHrNI0IsFoRhm1ixxEHDdbDacO3AYKOUIMettQXRc4mz3d8Co+XAVZ6NmicrFNrxanp16
	tN4itiuw==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0g5h-0000000FeZd-3meW;
	Sat, 27 Apr 2024 11:19:54 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0g5f-000000002b3-3HnV;
	Sat, 27 Apr 2024 12:19:35 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Paul Durrant <paul@xen.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	jalliste@amazon.co.uk,
	sveith@amazon.de,
	zide.chen@intel.com,
	Dongli Zhang <dongli.zhang@oracle.com>
Subject: [PATCH v2 01/15] KVM: x86/xen: Do not corrupt KVM clock in kvm_xen_shared_info_init()
Date: Sat, 27 Apr 2024 12:04:58 +0100
Message-ID: <20240427111929.9600-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240427111929.9600-1-dwmw2@infradead.org>
References: <20240427111929.9600-1-dwmw2@infradead.org>
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
drift, instead of yanking the clock back to defintion A. But in the
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

Fixes: 629b5348841a1 ("KVM: x86/xen: update wallclock region")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 arch/x86/kvm/xen.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/kvm/xen.c b/arch/x86/kvm/xen.c
index f65b35a05d91..5a83a8154b79 100644
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
-- 
2.44.0


