Return-Path: <linux-doc+bounces-14596-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEE88AA2E6
	for <lists+linux-doc@lfdr.de>; Thu, 18 Apr 2024 21:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19D7C1F22447
	for <lists+linux-doc@lfdr.de>; Thu, 18 Apr 2024 19:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87373184127;
	Thu, 18 Apr 2024 19:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b1FAbxQZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B837F16C69F;
	Thu, 18 Apr 2024 19:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713468937; cv=none; b=DfidPZ+UY6BzZ/09HFnVykJPHBswJnQprcezcu0Vacj9k1Ip7Zj0NwjDIIEnudhJBJm1s6ufG/HlhV3tMlGndfx8RCC8DUuwd5C3nSssTkYgfINy0a8DkqqPr5QZV1OayeQ2vwennGV903Vn2ob80J0jY2EgSMoiNy3nrPoYUnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713468937; c=relaxed/simple;
	bh=6dxCSBjpC0ET5LsQJzru+GfyMgMuM2APfY4ZMPFMbH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yym2+DyedaR7NiHRDixP7QSu82YDRu0S9jPALAFK6OnJDFbOBuFwpDuNyMwFQB1J0HtD0knDv8V6VjcWfjjiaHyF+hoCeKViNxSzYI3mrfa4k8MwwI2dlh+elktDzlVD3pfdw8E2eYS6Vb3xmN/kTysESQFtTu6ip3SYUCylGF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=b1FAbxQZ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=WRBAEf86cY4SYrbsy1090w/B3mo5yHqKxVEXwEK80aI=; b=b1FAbxQZEMnQcXDpnHPbA1z3nz
	qcGSf6x18suJGNTrwrds18Sz/HGU5GU/XKFPlRyt/6ipU2A1jm6D3E2/EJjLu5PTD+lMXKeJgjPXj
	XRdZt/aSo5JfFqSntgkTb307+Zi+TZLIrg4Aj7TvU+iILhbUOpMmxK9CraCetJfOpPPyWOT3SoBuk
	nJRXI8bTBXNCvp/puGS1n/h8BoaVbU4LDvVsLPiRylUgkQNrKy+5vtjJ0lqbOhlkGXtaLHAQ0Y2pP
	Uw3JUMjDTYHzbfQQMf9E5gNfKNp602CWQ+YuLZo4N8f2WwW4LS72uplAj51XRg3d5uTv6LmPWv5X0
	rpyqkSCg==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxXXf-000000060xe-1Fz1;
	Thu, 18 Apr 2024 19:35:31 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxXXe-00000000Ase-3ubc;
	Thu, 18 Apr 2024 20:35:30 +0100
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
	sveith@amazon.de
Subject: [PATCH 06/10] KVM: x86: Add KVM_VCPU_TSC_SCALE and fix the documentation on TSC migration
Date: Thu, 18 Apr 2024 20:34:45 +0100
Message-ID: <20240418193528.41780-7-dwmw2@infradead.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240418193528.41780-1-dwmw2@infradead.org>
References: <20240418193528.41780-1-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

The documentation on TSC migration using KVM_VCPU_TSC_OFFSET is woefully
inadequate. It ignores TSC scaling, and ignores the fact that the host
TSC may differ from one host to the next (and in fact because of the way
the kernel calibrates it, it generally differs from one boot to the next
even on the same hardware).

Add KVM_VCPU_TSC_SCALE to extract the actual scale ratio and frac_bits,
and attempt to document the *awful* process that we're requiring userspace
to follow to merely preserve the TSC across migration.

I may have thrown up in my mouth a little when writing that documentation.
It's an awful API. If we do this, we should be ashamed of ourselves.
(I also haven't tested the documented process yet).

Let's use Simon's KVM_VCPU_TSC_VALUE instead.
https://lore.kernel.org/all/20230202165950.483430-1-sveith@amazon.de/

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 Documentation/virt/kvm/devices/vcpu.rst | 115 ++++++++++++++++++------
 arch/x86/include/uapi/asm/kvm.h         |   6 ++
 arch/x86/kvm/x86.c                      |  15 ++++
 3 files changed, 109 insertions(+), 27 deletions(-)

diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
index 31f14ec4a65b..2a054443118d 100644
--- a/Documentation/virt/kvm/devices/vcpu.rst
+++ b/Documentation/virt/kvm/devices/vcpu.rst
@@ -216,52 +216,113 @@ Returns:
 Specifies the guest's TSC offset relative to the host's TSC. The guest's
 TSC is then derived by the following equation:
 
-  guest_tsc = host_tsc + KVM_VCPU_TSC_OFFSET
+  guest_tsc = (( host_tsc * tsc_scale_ratio ) >> tsc_scale_bits ) + KVM_VCPU_TSC_OFFSET
+
+The values of tsc_scale_ratio and tsc_scale_bits can be obtained using
+the KVM_VCPU_TSC_SCALE attribute.
 
 This attribute is useful to adjust the guest's TSC on live migration,
 so that the TSC counts the time during which the VM was paused. The
-following describes a possible algorithm to use for this purpose.
+following describes a possible algorithm to use for this purpose,
 
 From the source VMM process:
 
-1. Invoke the KVM_GET_CLOCK ioctl to record the host TSC (tsc_src),
+1. Invoke the KVM_GET_CLOCK ioctl to record the host TSC (host_tsc_src),
    kvmclock nanoseconds (guest_src), and host CLOCK_REALTIME nanoseconds
-   (host_src).
+   (time_src) at a given moment (Tsrc).
+
+2. For each vCPU[i]:
+
+   a. Read the KVM_VCPU_TSC_OFFSET attribute to record the guest TSC offset
+      (ofs_src[i]).
 
-2. Read the KVM_VCPU_TSC_OFFSET attribute for every vCPU to record the
-   guest TSC offset (ofs_src[i]).
+   b. Read the KVM_VCPU_TSC_SCALE attribute to record the guest TSC scaling
+      ratio (ratio_src[i], frac_bits_src[i]).
 
-3. Invoke the KVM_GET_TSC_KHZ ioctl to record the frequency of the
-   guest's TSC (freq).
+   c. Use host_tsc_src and the scaling/offset factors to calculate this
+      vCPU's TSC at time Tsrc:
+      tsc_src[i] = (( host_tsc_src * ratio_src[i] ) >> frac_bits_src[i] ) + ofs_src[i]
+
+3. Invoke the KVM_GET_CLOCK_GUEST ioctl on the boot vCPU to return the KVM
+   clock as a function of the guest TSC (pvti_src).  (This ioctl not succeed
+   if the host and guest TSCs are not consistent and well-behaved.)
 
 From the destination VMM process:
 
-4. Invoke the KVM_SET_CLOCK ioctl, providing the source nanoseconds from
-   kvmclock (guest_src) and CLOCK_REALTIME (host_src) in their respective
+4. Before creating the vCPUs, invoke the KVM_SET_TSC_KHZ ioctl on the VM, to
+   set the scaled frequency of the guest's TSC (freq).
+
+5. Invoke the KVM_SET_CLOCK ioctl, providing the source nanoseconds from
+   kvmclock (guest_src) and CLOCK_REALTIME (time_src) in their respective
    fields.  Ensure that the KVM_CLOCK_REALTIME flag is set in the provided
    structure.
 
-   KVM will advance the VM's kvmclock to account for elapsed time since
-   recording the clock values.  Note that this will cause problems in
+   KVM will restore the VM's kvmclock, accounting for elapsed time since
+   the clock values were recorded.  Note that this will cause problems in
    the guest (e.g., timeouts) unless CLOCK_REALTIME is synchronized
    between the source and destination, and a reasonably short time passes
-   between the source pausing the VMs and the destination executing
-   steps 4-7.
+   between the source pausing the VMs and the destination resuming them.
+   Due to the KVM_[SG]ET_CLOCK API using CLOCK_REALTIME instead of
+   CLOCK_TAI, leap seconds during the migration may also introduce errors.
+
+6. Invoke the KVM_GET_CLOCK ioctl to record the host TSC (host_tsc_dst) and
+   host CLOCK_REALTIME nanoseconds (time_dst) at a given moment (Tdst).
+
+7. Calculate the number of nanoseconds elapsed between Tsrc and Tdst:
+   ΔT = time_dst - time_src
+
+8. As each vCPU[i] is created:
+
+   a. Read the KVM_VCPU_TSC_SCALE attribute to record the guest TSC scaling
+      ratio (ratio_dst[i], frac_bits_dst[i]).
+
+   b. Calculate the intended guest TSC value at time Tdst:
+      tsc_dst[i] = tsc_tsc[i] + (ΔT * freq[i])
+
+   c. Use host_tsc_dst and the scaling/offset factors to calculate this vCPU's
+      TSC at time Tsrc without taking offsetting into account:
+      raw_dst[i] = (( host_tsc_dst * ratio_dst[i] ) >> frac_bits_dst[i] )
+
+   d. Calculate ofs_src[i] = tsc_dst[i] + raw_dst[i] and set the resulting
+      offset using the KVM_VCPU_TSC_OFFSET attrribute.
 
-5. Invoke the KVM_GET_CLOCK ioctl to record the host TSC (tsc_dest) and
-   kvmclock nanoseconds (guest_dest).
+9. If pvti_src was provided, invoke the KVM_SET_CLOCK_GUEST ioctl on the boot
+   vCPU to restore the KVM clock as a precise function of the guest TSC. If
+   pvti_src was not provided by the source, or the ioctl fails on the
+   destination, the KVM clock is operating in its less precise mode where it
+   is defined in terms of the host CLOCK_MONOTONIC_RAW, so the value
+   previously set in step 5 is as accurate as it can be.
+
+4.2 ATTRIBUTE: KVM_VCPU_TSC_SCALE
+
+:Parameters: 64-bit fixed point TSC scale factor
+
+Returns:
+
+	 ======= ======================================
+	 -EFAULT Error reading the provided parameter
+		 address.
+	 -ENXIO  Attribute not supported
+	 -EINVAL Invalid request to write the attribute
+	 ======= ======================================
+
+This read-only attribute reports the guest's TSC scaling factor, in the form
+of a fixed-point number represented by the following structure:
+
+    struct kvm_vcpu_tsc_scale {
+	    __u64	tsc_ratio;
+	    __u64	tsc_frac_bits;
+    };
 
-6. Adjust the guest TSC offsets for every vCPU to account for (1) time
-   elapsed since recording state and (2) difference in TSCs between the
-   source and destination machine:
 
-   ofs_dst[i] = ofs_src[i] -
-     (guest_src - guest_dest) * freq +
-     (tsc_src - tsc_dest)
+The tsc_frac_bits field indicate the location of the fixed point, such that
+host TSC values are converted to guest TSC using the formula:
 
-   ("ofs[i] + tsc - guest * freq" is the guest TSC value corresponding to
-   a time of 0 in kvmclock.  The above formula ensures that it is the
-   same on the destination as it was on the source).
+    guest_tsc = ( ( host_tsc * tsc_ratio ) >> tsc_frac_bits) + offset
 
-7. Write the KVM_VCPU_TSC_OFFSET attribute for every vCPU with the
-   respective value derived in the previous step.
+Userspace can use this to precisely calculate the guest TSC from the host
+TSC at any given moment. This is needed for accurate migration of guests,
+as described in the documentation for the KVM_VCPU_TSC_OFFSET attribute.
+In conjunction with the KVM_GET_CLOCK_GUEST ioctl, it also provides a way
+for userspace to quickly calculate the KVM clock for a guest, to use as a
+time reference for hypercalls or emulation of other timer devices.
diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 72ad5ace118d..fe7c98907818 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -864,6 +864,12 @@ struct kvm_hyperv_eventfd {
 /* for KVM_{GET,SET,HAS}_DEVICE_ATTR */
 #define KVM_VCPU_TSC_CTRL 0 /* control group for the timestamp counter (TSC) */
 #define   KVM_VCPU_TSC_OFFSET 0 /* attribute for the TSC offset */
+#define   KVM_VCPU_TSC_SCALE  1 /* attribute for TSC scaling factor */
+
+struct kvm_vcpu_tsc_scale {
+	__u64 tsc_ratio;
+	__u64 tsc_frac_bits;
+};
 
 /* x86-specific KVM_EXIT_HYPERCALL flags. */
 #define KVM_EXIT_HYPERCALL_LONG_MODE	_BITULL(0)
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 42abce7b4fc9..00a7c1188dec 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -5715,6 +5715,7 @@ static int kvm_arch_tsc_has_attr(struct kvm_vcpu *vcpu,
 
 	switch (attr->attr) {
 	case KVM_VCPU_TSC_OFFSET:
+	case KVM_VCPU_TSC_SCALE:
 		r = 0;
 		break;
 	default:
@@ -5737,6 +5738,17 @@ static int kvm_arch_tsc_get_attr(struct kvm_vcpu *vcpu,
 			break;
 		r = 0;
 		break;
+	case KVM_VCPU_TSC_SCALE: {
+		struct kvm_vcpu_tsc_scale scale;
+
+		scale.tsc_ratio = vcpu->arch.l1_tsc_scaling_ratio;
+		scale.tsc_frac_bits = kvm_caps.tsc_scaling_ratio_frac_bits;
+		r = -EFAULT;
+		if (copy_to_user(uaddr, &scale, sizeof(scale)))
+			break;
+		r = 0;
+		break;
+	}
 	default:
 		r = -ENXIO;
 	}
@@ -5777,6 +5789,9 @@ static int kvm_arch_tsc_set_attr(struct kvm_vcpu *vcpu,
 		r = 0;
 		break;
 	}
+	case KVM_VCPU_TSC_SCALE:
+		r = -EINVAL; /* Read only */
+		break;
 	default:
 		r = -ENXIO;
 	}
-- 
2.44.0


