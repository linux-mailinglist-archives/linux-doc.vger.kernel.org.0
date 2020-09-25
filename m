Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01B6E278AF6
	for <lists+linux-doc@lfdr.de>; Fri, 25 Sep 2020 16:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729089AbgIYOgB (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 25 Sep 2020 10:36:01 -0400
Received: from smtp-fw-9101.amazon.com ([207.171.184.25]:5240 "EHLO
        smtp-fw-9101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728431AbgIYOgB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Sep 2020 10:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1601044559; x=1632580559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nxRW9+qY/DCUPvAgQOzCHVz5hNIRlb9nGUwNrY9XaEM=;
  b=hjIBFK/im539cg0KyFkhjZPoDoNxt1nCH8xptJUEXxVJmd0VxqTe4+qt
   yqEdnBrCbv+bSKY3pE0XQZxBw3phVv37oIT/lfqN2UvwUeekr7LHTrpTE
   jSbA6CT5YUO/DVEwFsFPY3yu8CSDnPLi7AM6lLL44Q6i04T3JPW0PXFEA
   I=;
X-IronPort-AV: E=Sophos;i="5.77,302,1596499200"; 
   d="scan'208";a="71123734"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP; 25 Sep 2020 14:34:46 +0000
Received: from EX13MTAUWC002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
        by email-inbound-relay-1a-7d76a15f.us-east-1.amazon.com (Postfix) with ESMTPS id 73502A2790;
        Fri, 25 Sep 2020 14:34:41 +0000 (UTC)
Received: from EX13D20UWC001.ant.amazon.com (10.43.162.244) by
 EX13MTAUWC002.ant.amazon.com (10.43.162.240) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 25 Sep 2020 14:34:41 +0000
Received: from u79c5a0a55de558.ant.amazon.com (10.43.162.221) by
 EX13D20UWC001.ant.amazon.com (10.43.162.244) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 25 Sep 2020 14:34:37 +0000
From:   Alexander Graf <graf@amazon.com>
To:     kvm list <kvm@vger.kernel.org>
CC:     Aaron Lewis <aaronlewis@google.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        "Joerg Roedel" <joro@8bytes.org>,
        KarimAllah Raslan <karahmed@amazon.de>,
        "Dan Carpenter" <dan.carpenter@oracle.com>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 2/8] KVM: x86: Deflect unknown MSR accesses to user space
Date:   Fri, 25 Sep 2020 16:34:16 +0200
Message-ID: <20200925143422.21718-3-graf@amazon.com>
X-Mailer: git-send-email 2.28.0.394.ge197136389
In-Reply-To: <20200925143422.21718-1-graf@amazon.com>
References: <20200925143422.21718-1-graf@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.162.221]
X-ClientProxiedBy: EX13D08UWC002.ant.amazon.com (10.43.162.168) To
 EX13D20UWC001.ant.amazon.com (10.43.162.244)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

MSRs are weird. Some of them are normal control registers, such as EFER.
Some however are registers that really are model specific, not very
interesting to virtualization workloads, and not performance critical.
Others again are really just windows into package configuration.

Out of these MSRs, only the first category is necessary to implement in
kernel space. Rarely accessed MSRs, MSRs that should be fine tunes against
certain CPU models and MSRs that contain information on the package level
are much better suited for user space to process. However, over time we have
accumulated a lot of MSRs that are not the first category, but still handled
by in-kernel KVM code.

This patch adds a generic interface to handle WRMSR and RDMSR from user
space. With this, any future MSR that is part of the latter categories can
be handled in user space.

Furthermore, it allows us to replace the existing "ignore_msrs" logic with
something that applies per-VM rather than on the full system. That way you
can run productive VMs in parallel to experimental ones where you don't care
about proper MSR handling.

Signed-off-by: Alexander Graf <graf@amazon.com>
Reviewed-by: Jim Mattson <jmattson@google.com>

---

v1 -> v2:

  - s/ETRAP_TO_USER_SPACE/ENOENT/g
  - deflect all #GP injection events to user space, not just unknown MSRs.
    That was we can also deflect allowlist errors later
  - fix emulator case

v2 -> v3:

  - return r if r == X86EMUL_IO_NEEDED
  - s/KVM_EXIT_RDMSR/KVM_EXIT_X86_RDMSR/g
  - s/KVM_EXIT_WRMSR/KVM_EXIT_X86_WRMSR/g
  - Use complete_userspace_io logic instead of reply field
  - Simplify trapping code

v3 -> v4:

  - Mention exit reasons in re-inter mandatory section of API documentation
  - Clear padding bytes
  - Generalize get/set deflect functions
  - Remove redundant pending_user_msr field

v5 -> v6:

  - Introduce exit reason mask to allow for future expansion and filtering
  - s/emul_to_vcpu(ctxt)/vcpu/

v6 -> v7:

  - Fire #GP without skipping the MSR instruction
  - Fix padding

v7 -> v8:

  - Add KVM_MSR_EXIT_REASON_UNKNOWN
---
 Documentation/virt/kvm/api.rst  |  74 +++++++++++++++++++-
 arch/x86/include/asm/kvm_host.h |   3 +
 arch/x86/kvm/emulate.c          |  18 ++++-
 arch/x86/kvm/x86.c              | 120 ++++++++++++++++++++++++++++++--
 include/trace/events/kvm.h      |   2 +-
 include/uapi/linux/kvm.h        |  13 ++++
 6 files changed, 221 insertions(+), 9 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index d2b733dc7892..5e6c6a429562 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -4869,8 +4869,8 @@ to the byte array.
 
 .. note::
 
-      For KVM_EXIT_IO, KVM_EXIT_MMIO, KVM_EXIT_OSI, KVM_EXIT_PAPR and
-      KVM_EXIT_EPR the corresponding
+      For KVM_EXIT_IO, KVM_EXIT_MMIO, KVM_EXIT_OSI, KVM_EXIT_PAPR,
+      KVM_EXIT_EPR, KVM_EXIT_X86_RDMSR and KVM_EXIT_X86_WRMSR the corresponding
 
 operations are complete (and guest state is consistent) only after userspace
 has re-entered the kernel with KVM_RUN.  The kernel side will first finish
@@ -5163,6 +5163,43 @@ Note that KVM does not skip the faulting instruction as it does for
 KVM_EXIT_MMIO, but userspace has to emulate any change to the processing state
 if it decides to decode and emulate the instruction.
 
+::
+
+		/* KVM_EXIT_X86_RDMSR / KVM_EXIT_X86_WRMSR */
+		struct {
+			__u8 error; /* user -> kernel */
+			__u8 pad[7];
+			__u32 reason; /* kernel -> user */
+			__u32 index; /* kernel -> user */
+			__u64 data; /* kernel <-> user */
+		} msr;
+
+Used on x86 systems. When the VM capability KVM_CAP_X86_USER_SPACE_MSR is
+enabled, MSR accesses to registers that would invoke a #GP by KVM kernel code
+will instead trigger a KVM_EXIT_X86_RDMSR exit for reads and KVM_EXIT_X86_WRMSR
+exit for writes.
+
+The "reason" field specifies why the MSR trap occurred. User space will only
+receive MSR exit traps when a particular reason was requested during through
+ENABLE_CAP. Currently valid exit reasons are:
+
+	KVM_MSR_EXIT_REASON_UNKNOWN - access to MSR that is unknown to KVM
+	KVM_MSR_EXIT_REASON_INVAL - access to invalid MSRs or reserved bits
+
+For KVM_EXIT_X86_RDMSR, the "index" field tells user space which MSR the guest
+wants to read. To respond to this request with a successful read, user space
+writes the respective data into the "data" field and must continue guest
+execution to ensure the read data is transferred into guest register state.
+
+If the RDMSR request was unsuccessful, user space indicates that with a "1" in
+the "error" field. This will inject a #GP into the guest when the VCPU is
+executed again.
+
+For KVM_EXIT_X86_WRMSR, the "index" field tells user space which MSR the guest
+wants to write. Once finished processing the event, user space must continue
+vCPU execution. If the MSR write was unsuccessful, user space also sets the
+"error" field to "1".
+
 ::
 
 		/* Fix the size of the union. */
@@ -5852,6 +5889,28 @@ controlled by the kvm module parameter halt_poll_ns. This capability allows
 the maximum halt time to specified on a per-VM basis, effectively overriding
 the module parameter for the target VM.
 
+7.21 KVM_CAP_X86_USER_SPACE_MSR
+-------------------------------
+
+:Architectures: x86
+:Target: VM
+:Parameters: args[0] contains the mask of KVM_MSR_EXIT_REASON_* events to report
+:Returns: 0 on success; -1 on error
+
+This capability enables trapping of #GP invoking RDMSR and WRMSR instructions
+into user space.
+
+When a guest requests to read or write an MSR, KVM may not implement all MSRs
+that are relevant to a respective system. It also does not differentiate by
+CPU type.
+
+To allow more fine grained control over MSR handling, user space may enable
+this capability. With it enabled, MSR accesses that match the mask specified in
+args[0] and trigger a #GP event inside the guest by KVM will instead trigger
+KVM_EXIT_X86_RDMSR and KVM_EXIT_X86_WRMSR exit notifications which user space
+can then handle to implement model specific MSR handling and/or user notifications
+to inform a user that an MSR was not handled.
+
 8. Other capabilities.
 ======================
 
@@ -6173,3 +6232,14 @@ specific interfaces must be consistent, i.e. if one says the feature
 is supported, than the other should as well and vice versa.  For arm64
 see Documentation/virt/kvm/devices/vcpu.rst "KVM_ARM_VCPU_PVTIME_CTRL".
 For x86 see Documentation/virt/kvm/msr.rst "MSR_KVM_STEAL_TIME".
+
+8.25 KVM_CAP_X86_USER_SPACE_MSR
+----------------------------
+
+:Architectures: x86
+
+This capability indicates that KVM supports deflection of MSR reads and
+writes to user space. It can be enabled on a VM level. If enabled, MSR
+accesses that would usually trigger a #GP by KVM into the guest will
+instead get bounced to user space through the KVM_EXIT_X86_RDMSR and
+KVM_EXIT_X86_WRMSR exit notifications.
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 5303dbc5c9bc..12c3f048f18b 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -961,6 +961,9 @@ struct kvm_arch {
 	bool guest_can_read_msr_platform_info;
 	bool exception_payload_enabled;
 
+	/* Deflect RDMSR and WRMSR to user space when they trigger a #GP */
+	u32 user_space_msr_mask;
+
 	struct kvm_pmu_event_filter *pmu_event_filter;
 	struct task_struct *nx_lpage_recovery_thread;
 };
diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index 1d450d7710d6..1f97037d9190 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -3701,11 +3701,18 @@ static int em_dr_write(struct x86_emulate_ctxt *ctxt)
 
 static int em_wrmsr(struct x86_emulate_ctxt *ctxt)
 {
+	u64 msr_index = reg_read(ctxt, VCPU_REGS_RCX);
 	u64 msr_data;
+	int r;
 
 	msr_data = (u32)reg_read(ctxt, VCPU_REGS_RAX)
 		| ((u64)reg_read(ctxt, VCPU_REGS_RDX) << 32);
-	if (ctxt->ops->set_msr(ctxt, reg_read(ctxt, VCPU_REGS_RCX), msr_data))
+	r = ctxt->ops->set_msr(ctxt, msr_index, msr_data);
+
+	if (r == X86EMUL_IO_NEEDED)
+		return r;
+
+	if (r)
 		return emulate_gp(ctxt, 0);
 
 	return X86EMUL_CONTINUE;
@@ -3713,9 +3720,16 @@ static int em_wrmsr(struct x86_emulate_ctxt *ctxt)
 
 static int em_rdmsr(struct x86_emulate_ctxt *ctxt)
 {
+	u64 msr_index = reg_read(ctxt, VCPU_REGS_RCX);
 	u64 msr_data;
+	int r;
+
+	r = ctxt->ops->get_msr(ctxt, msr_index, &msr_data);
+
+	if (r == X86EMUL_IO_NEEDED)
+		return r;
 
-	if (ctxt->ops->get_msr(ctxt, reg_read(ctxt, VCPU_REGS_RCX), &msr_data))
+	if (r)
 		return emulate_gp(ctxt, 0);
 
 	*reg_write(ctxt, VCPU_REGS_RAX) = (u32)msr_data;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 58d513c5e264..5f0fbd49c65c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1589,12 +1589,89 @@ int kvm_set_msr(struct kvm_vcpu *vcpu, u32 index, u64 data)
 }
 EXPORT_SYMBOL_GPL(kvm_set_msr);
 
+static int complete_emulated_msr(struct kvm_vcpu *vcpu, bool is_read)
+{
+	if (vcpu->run->msr.error) {
+		kvm_inject_gp(vcpu, 0);
+		return 1;
+	} else if (is_read) {
+		kvm_rax_write(vcpu, (u32)vcpu->run->msr.data);
+		kvm_rdx_write(vcpu, vcpu->run->msr.data >> 32);
+	}
+
+	return kvm_skip_emulated_instruction(vcpu);
+}
+
+static int complete_emulated_rdmsr(struct kvm_vcpu *vcpu)
+{
+	return complete_emulated_msr(vcpu, true);
+}
+
+static int complete_emulated_wrmsr(struct kvm_vcpu *vcpu)
+{
+	return complete_emulated_msr(vcpu, false);
+}
+
+static u64 kvm_msr_reason(int r)
+{
+	switch (r) {
+	case -ENOENT:
+		return KVM_MSR_EXIT_REASON_UNKNOWN;
+	default:
+		return KVM_MSR_EXIT_REASON_INVAL;
+	}
+}
+
+static int kvm_msr_user_space(struct kvm_vcpu *vcpu, u32 index,
+			      u32 exit_reason, u64 data,
+			      int (*completion)(struct kvm_vcpu *vcpu),
+			      int r)
+{
+	u64 msr_reason = kvm_msr_reason(r);
+
+	/* Check if the user wanted to know about this MSR fault */
+	if (!(vcpu->kvm->arch.user_space_msr_mask & msr_reason))
+		return 0;
+
+	vcpu->run->exit_reason = exit_reason;
+	vcpu->run->msr.error = 0;
+	memset(vcpu->run->msr.pad, 0, sizeof(vcpu->run->msr.pad));
+	vcpu->run->msr.reason = msr_reason;
+	vcpu->run->msr.index = index;
+	vcpu->run->msr.data = data;
+	vcpu->arch.complete_userspace_io = completion;
+
+	return 1;
+}
+
+static int kvm_get_msr_user_space(struct kvm_vcpu *vcpu, u32 index, int r)
+{
+	return kvm_msr_user_space(vcpu, index, KVM_EXIT_X86_RDMSR, 0,
+				   complete_emulated_rdmsr, r);
+}
+
+static int kvm_set_msr_user_space(struct kvm_vcpu *vcpu, u32 index, u64 data, int r)
+{
+	return kvm_msr_user_space(vcpu, index, KVM_EXIT_X86_WRMSR, data,
+				   complete_emulated_wrmsr, r);
+}
+
 int kvm_emulate_rdmsr(struct kvm_vcpu *vcpu)
 {
 	u32 ecx = kvm_rcx_read(vcpu);
 	u64 data;
+	int r;
+
+	r = kvm_get_msr(vcpu, ecx, &data);
 
-	if (kvm_get_msr(vcpu, ecx, &data)) {
+	/* MSR read failed? See if we should ask user space */
+	if (r && kvm_get_msr_user_space(vcpu, ecx, r)) {
+		/* Bounce to user space */
+		return 0;
+	}
+
+	/* MSR read failed? Inject a #GP */
+	if (r) {
 		trace_kvm_msr_read_ex(ecx);
 		kvm_inject_gp(vcpu, 0);
 		return 1;
@@ -1612,8 +1689,18 @@ int kvm_emulate_wrmsr(struct kvm_vcpu *vcpu)
 {
 	u32 ecx = kvm_rcx_read(vcpu);
 	u64 data = kvm_read_edx_eax(vcpu);
+	int r;
 
-	if (kvm_set_msr(vcpu, ecx, data)) {
+	r = kvm_set_msr(vcpu, ecx, data);
+
+	/* MSR write failed? See if we should ask user space */
+	if (r && kvm_set_msr_user_space(vcpu, ecx, data, r)) {
+		/* Bounce to user space */
+		return 0;
+	}
+
+	/* MSR write failed? Inject a #GP */
+	if (r) {
 		trace_kvm_msr_write_ex(ecx, data);
 		kvm_inject_gp(vcpu, 0);
 		return 1;
@@ -3511,6 +3598,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_EXCEPTION_PAYLOAD:
 	case KVM_CAP_SET_GUEST_DEBUG:
 	case KVM_CAP_LAST_CPU:
+	case KVM_CAP_X86_USER_SPACE_MSR:
 		r = 1;
 		break;
 	case KVM_CAP_SYNC_REGS:
@@ -5031,6 +5119,10 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 		kvm->arch.exception_payload_enabled = cap->args[0];
 		r = 0;
 		break;
+	case KVM_CAP_X86_USER_SPACE_MSR:
+		kvm->arch.user_space_msr_mask = cap->args[0];
+		r = 0;
+		break;
 	default:
 		r = -EINVAL;
 		break;
@@ -6360,13 +6452,33 @@ static void emulator_set_segment(struct x86_emulate_ctxt *ctxt, u16 selector,
 static int emulator_get_msr(struct x86_emulate_ctxt *ctxt,
 			    u32 msr_index, u64 *pdata)
 {
-	return kvm_get_msr(emul_to_vcpu(ctxt), msr_index, pdata);
+	struct kvm_vcpu *vcpu = emul_to_vcpu(ctxt);
+	int r;
+
+	r = kvm_get_msr(vcpu, msr_index, pdata);
+
+	if (r && kvm_get_msr_user_space(vcpu, msr_index, r)) {
+		/* Bounce to user space */
+		return X86EMUL_IO_NEEDED;
+	}
+
+	return r;
 }
 
 static int emulator_set_msr(struct x86_emulate_ctxt *ctxt,
 			    u32 msr_index, u64 data)
 {
-	return kvm_set_msr(emul_to_vcpu(ctxt), msr_index, data);
+	struct kvm_vcpu *vcpu = emul_to_vcpu(ctxt);
+	int r;
+
+	r = kvm_set_msr(vcpu, msr_index, data);
+
+	if (r && kvm_set_msr_user_space(vcpu, msr_index, data, r)) {
+		/* Bounce to user space */
+		return X86EMUL_IO_NEEDED;
+	}
+
+	return r;
 }
 
 static u64 emulator_get_smbase(struct x86_emulate_ctxt *ctxt)
diff --git a/include/trace/events/kvm.h b/include/trace/events/kvm.h
index 9417a34aad08..26cfb0fa8e7e 100644
--- a/include/trace/events/kvm.h
+++ b/include/trace/events/kvm.h
@@ -17,7 +17,7 @@
 	ERSN(NMI), ERSN(INTERNAL_ERROR), ERSN(OSI), ERSN(PAPR_HCALL),	\
 	ERSN(S390_UCONTROL), ERSN(WATCHDOG), ERSN(S390_TSCH), ERSN(EPR),\
 	ERSN(SYSTEM_EVENT), ERSN(S390_STSI), ERSN(IOAPIC_EOI),          \
-	ERSN(HYPERV), ERSN(ARM_NISV)
+	ERSN(HYPERV), ERSN(ARM_NISV), ERSN(X86_RDMSR), ERSN(X86_WRMSR)
 
 TRACE_EVENT(kvm_userspace_exit,
 	    TP_PROTO(__u32 reason, int errno),
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 7d8eced6f459..31292a3cdfc2 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -248,6 +248,8 @@ struct kvm_hyperv_exit {
 #define KVM_EXIT_IOAPIC_EOI       26
 #define KVM_EXIT_HYPERV           27
 #define KVM_EXIT_ARM_NISV         28
+#define KVM_EXIT_X86_RDMSR        29
+#define KVM_EXIT_X86_WRMSR        30
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -413,6 +415,16 @@ struct kvm_run {
 			__u64 esr_iss;
 			__u64 fault_ipa;
 		} arm_nisv;
+		/* KVM_EXIT_X86_RDMSR / KVM_EXIT_X86_WRMSR */
+		struct {
+			__u8 error; /* user -> kernel */
+			__u8 pad[7];
+#define KVM_MSR_EXIT_REASON_INVAL	(1 << 0)
+#define KVM_MSR_EXIT_REASON_UNKNOWN	(1 << 1)
+			__u32 reason; /* kernel -> user */
+			__u32 index; /* kernel -> user */
+			__u64 data; /* kernel <-> user */
+		} msr;
 		/* Fix the size of the union. */
 		char padding[256];
 	};
@@ -1037,6 +1049,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_SMALLER_MAXPHYADDR 185
 #define KVM_CAP_S390_DIAG318 186
 #define KVM_CAP_STEAL_TIME 187
+#define KVM_CAP_X86_USER_SPACE_MSR 188
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.28.0.394.ge197136389




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879



