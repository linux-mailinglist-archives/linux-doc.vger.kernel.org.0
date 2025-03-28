Return-Path: <linux-doc+bounces-41871-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B71A74EEC
	for <lists+linux-doc@lfdr.de>; Fri, 28 Mar 2025 18:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B129C3B3BF7
	for <lists+linux-doc@lfdr.de>; Fri, 28 Mar 2025 17:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A967C1DE4FF;
	Fri, 28 Mar 2025 17:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="OsXZulUC"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3ED1DB14C;
	Fri, 28 Mar 2025 17:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743181995; cv=none; b=tTPwmIRpqTgmOYlJARRkgE0Zgxd9X6Tn6/BviMaaGq9QKQNAoNfChuLOczgfkECy6/7HKtd9gQelWITdCTL+J5zi8AabuAmEBIgssgjAp/3y3feY4YoQr/fN1IsaKEX5apoUH7A9jwr9+ABWCt0WmogoTQs706bwP2eZwagJ1aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743181995; c=relaxed/simple;
	bh=FIBzISSzKfdW3r3362+456RwM5AXBBo/gC1oDwRj9Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9k9tGMnYwbyLEMl8YtKCUzg3g0r1grzqNmwgrRBpNMrl7hef41zeBSZ5Mf+orgKG4A+8rYg9nMMmYRtC+qKypt+dCotEeawIOdbx6dAgGwOyLMc+Z+X94nP3dUAHie8OH872dcr/Ox+MKhT6+2PhmsQPFPbcOQmoNYm+oZ17Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=OsXZulUC; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from terminus.zytor.com (terminus.zytor.com [IPv6:2607:7c80:54:3:0:0:0:136])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52SHC6vn2029344
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 28 Mar 2025 10:12:29 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52SHC6vn2029344
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743181950;
	bh=j34JBiq84OCuNVJV9CsdbDmeJZyHRP30/xH5q5zm3aI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OsXZulUConGSw7PlhNWmLeCQTPoC0TpZ4lYJ6uizCuk01ei35XCw3AElgJB3MsDz+
	 JYiSQbxsFtg378M22FZcqQCBX295ED/4vjboCnkk2h8AnCSpg0bHtALWfs0zX6H+/c
	 Qw1tNgqNui5bcanb/hKik14mFTEZ3MjhH2QC9FHQdxE7uTaNE2BDyps82fsFnrfrYO
	 vAR7CA7oWLgiEGuWbB5cu1GiGZ10LLfvjmd/viSyIM5rOTlBBkOenly+ef2bDYz2L0
	 IaDRS+dlNU2jAnVU9MLkU+v6CBpDLbboijOE0j+GJYFLLfhek/v+Cd7Bi12hY32lZ7
	 74228NjKANmKA==
From: "Xin Li (Intel)" <xin@zytor.com>
To: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        andrew.cooper3@citrix.com, luto@kernel.org, peterz@infradead.org,
        chao.gao@intel.com, xin3.li@intel.com
Subject: [PATCH v4 17/19] KVM: nVMX: Add FRED VMCS fields to nested VMX context management
Date: Fri, 28 Mar 2025 10:12:03 -0700
Message-ID: <20250328171205.2029296-18-xin@zytor.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250328171205.2029296-1-xin@zytor.com>
References: <20250328171205.2029296-1-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xin Li <xin3.li@intel.com>

Signed-off-by: Xin Li <xin3.li@intel.com>
Signed-off-by: Xin Li (Intel) <xin@zytor.com>
Tested-by: Shan Kang <shan.kang@intel.com>
---

Changes in v4:
* Advertise VMX nested exception as if the CPU supports it (Chao Gao).
* Split FRED state management controls (Chao Gao).

Changes in v3:
* Add and use nested_cpu_has_fred(vmcs12) because vmcs02 should be set
  from vmcs12 if and only if the field is enabled in L1's VMX config
  (Sean Christopherson).
* Fix coding style issues (Sean Christopherson).

Changes in v2:
* Remove hyperv TLFS related changes (Jeremi Piotrowski).
* Use kvm_cpu_cap_has() instead of cpu_feature_enabled() (Chao Gao).
---
 Documentation/virt/kvm/x86/nested-vmx.rst | 18 +++++
 arch/x86/kvm/vmx/capabilities.h           |  5 ++
 arch/x86/kvm/vmx/nested.c                 | 83 ++++++++++++++++++++++-
 arch/x86/kvm/vmx/nested.h                 | 22 ++++++
 arch/x86/kvm/vmx/vmcs12.c                 | 18 +++++
 arch/x86/kvm/vmx/vmcs12.h                 | 36 ++++++++++
 arch/x86/kvm/vmx/vmcs_shadow_fields.h     |  4 ++
 7 files changed, 184 insertions(+), 2 deletions(-)

diff --git a/Documentation/virt/kvm/x86/nested-vmx.rst b/Documentation/virt/kvm/x86/nested-vmx.rst
index e64ef231f310..87fa9f3877ab 100644
--- a/Documentation/virt/kvm/x86/nested-vmx.rst
+++ b/Documentation/virt/kvm/x86/nested-vmx.rst
@@ -218,6 +218,24 @@ struct shadow_vmcs is ever changed.
 		u16 host_gs_selector;
 		u16 host_tr_selector;
 		u64 secondary_vm_exit_controls;
+		u64 guest_ia32_fred_config;
+		u64 guest_ia32_fred_rsp1;
+		u64 guest_ia32_fred_rsp2;
+		u64 guest_ia32_fred_rsp3;
+		u64 guest_ia32_fred_stklvls;
+		u64 guest_ia32_fred_ssp1;
+		u64 guest_ia32_fred_ssp2;
+		u64 guest_ia32_fred_ssp3;
+		u64 host_ia32_fred_config;
+		u64 host_ia32_fred_rsp1;
+		u64 host_ia32_fred_rsp2;
+		u64 host_ia32_fred_rsp3;
+		u64 host_ia32_fred_stklvls;
+		u64 host_ia32_fred_ssp1;
+		u64 host_ia32_fred_ssp2;
+		u64 host_ia32_fred_ssp3;
+		u64 injected_event_data;
+		u64 original_event_data;
 	};
 
 
diff --git a/arch/x86/kvm/vmx/capabilities.h b/arch/x86/kvm/vmx/capabilities.h
index d29be4e4124e..b1abbdb48449 100644
--- a/arch/x86/kvm/vmx/capabilities.h
+++ b/arch/x86/kvm/vmx/capabilities.h
@@ -79,6 +79,11 @@ static inline bool cpu_has_vmx_basic_inout(void)
 	return	vmcs_config.basic & VMX_BASIC_INOUT;
 }
 
+static inline bool cpu_has_vmx_nested_exception(void)
+{
+	return	vmcs_config.basic & VMX_BASIC_NESTED_EXCEPTION;
+}
+
 static inline bool cpu_has_virtual_nmis(void)
 {
 	return vmcs_config.pin_based_exec_ctrl & PIN_BASED_VIRTUAL_NMIS &&
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 8b0c5e5f1e98..6ff7ae3b7a33 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -704,6 +704,12 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 
 	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
 					 MSR_KERNEL_GS_BASE, MSR_TYPE_RW);
+
+	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
+					 MSR_IA32_FRED_RSP0, MSR_TYPE_RW);
+
+	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
+					 MSR_IA32_FRED_SSP0, MSR_TYPE_RW);
 #endif
 	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
 					 MSR_IA32_SPEC_CTRL, MSR_TYPE_RW);
@@ -1256,9 +1262,11 @@ static int vmx_restore_vmx_basic(struct vcpu_vmx *vmx, u64 data)
 {
 	const u64 feature_bits = VMX_BASIC_DUAL_MONITOR_TREATMENT |
 				 VMX_BASIC_INOUT |
-				 VMX_BASIC_TRUE_CTLS;
+				 VMX_BASIC_TRUE_CTLS |
+				 VMX_BASIC_NESTED_EXCEPTION;
 
-	const u64 reserved_bits = GENMASK_ULL(63, 56) |
+	const u64 reserved_bits = GENMASK_ULL(63, 59) |
+				  GENMASK_ULL(57, 56) |
 				  GENMASK_ULL(47, 45) |
 				  BIT_ULL(31);
 
@@ -2506,6 +2514,8 @@ static void prepare_vmcs02_early(struct vcpu_vmx *vmx, struct loaded_vmcs *vmcs0
 			     vmcs12->vm_entry_instruction_len);
 		vmcs_write32(GUEST_INTERRUPTIBILITY_INFO,
 			     vmcs12->guest_interruptibility_info);
+		if (cpu_has_vmx_fred())
+			vmcs_write64(INJECTED_EVENT_DATA, vmcs12->injected_event_data);
 		vmx->loaded_vmcs->nmi_known_unmasked =
 			!(vmcs12->guest_interruptibility_info & GUEST_INTR_STATE_NMI);
 	} else {
@@ -2558,6 +2568,17 @@ static void prepare_vmcs02_rare(struct vcpu_vmx *vmx, struct vmcs12 *vmcs12)
 		vmcs_writel(GUEST_IDTR_BASE, vmcs12->guest_idtr_base);
 
 		vmx_segment_cache_clear(vmx);
+
+		if (nested_cpu_load_guest_fred_states(vmcs12)) {
+			vmcs_write64(GUEST_IA32_FRED_CONFIG, vmcs12->guest_ia32_fred_config);
+			vmcs_write64(GUEST_IA32_FRED_RSP1, vmcs12->guest_ia32_fred_rsp1);
+			vmcs_write64(GUEST_IA32_FRED_RSP2, vmcs12->guest_ia32_fred_rsp2);
+			vmcs_write64(GUEST_IA32_FRED_RSP3, vmcs12->guest_ia32_fred_rsp3);
+			vmcs_write64(GUEST_IA32_FRED_STKLVLS, vmcs12->guest_ia32_fred_stklvls);
+			vmcs_write64(GUEST_IA32_FRED_SSP1, vmcs12->guest_ia32_fred_ssp1);
+			vmcs_write64(GUEST_IA32_FRED_SSP2, vmcs12->guest_ia32_fred_ssp2);
+			vmcs_write64(GUEST_IA32_FRED_SSP3, vmcs12->guest_ia32_fred_ssp3);
+		}
 	}
 
 	if (!hv_evmcs || !(hv_evmcs->hv_clean_fields &
@@ -3842,6 +3863,8 @@ static void vmcs12_save_pending_event(struct kvm_vcpu *vcpu,
 	u32 idt_vectoring;
 	unsigned int nr;
 
+	vmcs12->original_event_data = 0;
+
 	/*
 	 * Per the SDM, VM-Exits due to double and triple faults are never
 	 * considered to occur during event delivery, even if the double/triple
@@ -3880,6 +3903,13 @@ static void vmcs12_save_pending_event(struct kvm_vcpu *vcpu,
 				vcpu->arch.exception.error_code;
 		}
 
+		if ((vmcs12->vm_entry_controls & VM_ENTRY_IA32E_MODE) &&
+		    (vmcs12->guest_cr4 & X86_CR4_FRED) &&
+		    (vcpu->arch.exception.nested))
+			idt_vectoring |= VECTORING_INFO_NESTED_EXCEPTION_MASK;
+
+		vmcs12->original_event_data = vcpu->arch.exception.event_data;
+
 		vmcs12->idt_vectoring_info_field = idt_vectoring;
 	} else if (vcpu->arch.nmi_injected) {
 		vmcs12->idt_vectoring_info_field =
@@ -4460,6 +4490,14 @@ static bool is_vmcs12_ext_field(unsigned long field)
 	case GUEST_TR_BASE:
 	case GUEST_GDTR_BASE:
 	case GUEST_IDTR_BASE:
+	case GUEST_IA32_FRED_CONFIG:
+	case GUEST_IA32_FRED_RSP1:
+	case GUEST_IA32_FRED_RSP2:
+	case GUEST_IA32_FRED_RSP3:
+	case GUEST_IA32_FRED_STKLVLS:
+	case GUEST_IA32_FRED_SSP1:
+	case GUEST_IA32_FRED_SSP2:
+	case GUEST_IA32_FRED_SSP3:
 	case GUEST_PENDING_DBG_EXCEPTIONS:
 	case GUEST_BNDCFGS:
 		return true;
@@ -4509,6 +4547,18 @@ static void sync_vmcs02_to_vmcs12_rare(struct kvm_vcpu *vcpu,
 	vmcs12->guest_tr_base = vmcs_readl(GUEST_TR_BASE);
 	vmcs12->guest_gdtr_base = vmcs_readl(GUEST_GDTR_BASE);
 	vmcs12->guest_idtr_base = vmcs_readl(GUEST_IDTR_BASE);
+
+	if (nested_cpu_save_guest_fred_states(vmcs12)) {
+		vmcs12->guest_ia32_fred_config = vmcs_read64(GUEST_IA32_FRED_CONFIG);
+		vmcs12->guest_ia32_fred_rsp1 = vmcs_read64(GUEST_IA32_FRED_RSP1);
+		vmcs12->guest_ia32_fred_rsp2 = vmcs_read64(GUEST_IA32_FRED_RSP2);
+		vmcs12->guest_ia32_fred_rsp3 = vmcs_read64(GUEST_IA32_FRED_RSP3);
+		vmcs12->guest_ia32_fred_stklvls = vmcs_read64(GUEST_IA32_FRED_STKLVLS);
+		vmcs12->guest_ia32_fred_ssp1 = vmcs_read64(GUEST_IA32_FRED_SSP1);
+		vmcs12->guest_ia32_fred_ssp2 = vmcs_read64(GUEST_IA32_FRED_SSP2);
+		vmcs12->guest_ia32_fred_ssp3 = vmcs_read64(GUEST_IA32_FRED_SSP3);
+	}
+
 	vmcs12->guest_pending_dbg_exceptions =
 		vmcs_readl(GUEST_PENDING_DBG_EXCEPTIONS);
 
@@ -4656,6 +4706,21 @@ static void prepare_vmcs12(struct kvm_vcpu *vcpu, struct vmcs12 *vmcs12,
 
 		vmcs12->vm_exit_intr_info = exit_intr_info;
 		vmcs12->vm_exit_instruction_len = exit_insn_len;
+
+		/*
+		 * When there is a valid original event, the exiting event is a nested
+		 * event during delivery of the earlier original event.
+		 *
+		 * FRED event delivery reflects this relationship by setting the value
+		 * of the nested exception bit of VM-exit interruption information
+		 * (aka exiting-event identification) to that of the valid bit of the
+		 * IDT-vectoring information (aka original-event identification).
+		 */
+		if ((vmcs12->idt_vectoring_info_field & VECTORING_INFO_VALID_MASK) &&
+		    (vmcs12->vm_entry_controls & VM_ENTRY_IA32E_MODE) &&
+		    (vmcs12->guest_cr4 & X86_CR4_FRED))
+			vmcs12->vm_exit_intr_info |= INTR_INFO_NESTED_EXCEPTION_MASK;
+
 		vmcs12->vmx_instruction_info = vmcs_read32(VMX_INSTRUCTION_INFO);
 
 		/*
@@ -4733,6 +4798,17 @@ static void load_vmcs12_host_state(struct kvm_vcpu *vcpu,
 	vmcs_write32(GUEST_IDTR_LIMIT, 0xFFFF);
 	vmcs_write32(GUEST_GDTR_LIMIT, 0xFFFF);
 
+	if (nested_cpu_load_host_fred_states(vmcs12)) {
+		vmcs_write64(GUEST_IA32_FRED_CONFIG, vmcs12->host_ia32_fred_config);
+		vmcs_write64(GUEST_IA32_FRED_RSP1, vmcs12->host_ia32_fred_rsp1);
+		vmcs_write64(GUEST_IA32_FRED_RSP2, vmcs12->host_ia32_fred_rsp2);
+		vmcs_write64(GUEST_IA32_FRED_RSP3, vmcs12->host_ia32_fred_rsp3);
+		vmcs_write64(GUEST_IA32_FRED_STKLVLS, vmcs12->host_ia32_fred_stklvls);
+		vmcs_write64(GUEST_IA32_FRED_SSP1, vmcs12->host_ia32_fred_ssp1);
+		vmcs_write64(GUEST_IA32_FRED_SSP2, vmcs12->host_ia32_fred_ssp2);
+		vmcs_write64(GUEST_IA32_FRED_SSP3, vmcs12->host_ia32_fred_ssp3);
+	}
+
 	/* If not VM_EXIT_CLEAR_BNDCFGS, the L2 value propagates to L1.  */
 	if (vmcs12->vm_exit_controls & VM_EXIT_CLEAR_BNDCFGS)
 		vmcs_write64(GUEST_BNDCFGS, 0);
@@ -7206,6 +7282,9 @@ static void nested_vmx_setup_basic(struct nested_vmx_msrs *msrs)
 	msrs->basic |= VMX_BASIC_TRUE_CTLS;
 	if (cpu_has_vmx_basic_inout())
 		msrs->basic |= VMX_BASIC_INOUT;
+
+	if (cpu_has_vmx_nested_exception())
+		msrs->basic |= VMX_BASIC_NESTED_EXCEPTION;
 }
 
 static void nested_vmx_setup_cr_fixed(struct nested_vmx_msrs *msrs)
diff --git a/arch/x86/kvm/vmx/nested.h b/arch/x86/kvm/vmx/nested.h
index 6eedcfc91070..c6b69699e28e 100644
--- a/arch/x86/kvm/vmx/nested.h
+++ b/arch/x86/kvm/vmx/nested.h
@@ -249,6 +249,11 @@ static inline bool nested_cpu_has_save_preemption_timer(struct vmcs12 *vmcs12)
 	    VM_EXIT_SAVE_VMX_PREEMPTION_TIMER;
 }
 
+static inline bool nested_cpu_has_secondary_vm_exit_controls(struct vmcs12 *vmcs12)
+{
+	return vmcs12->vm_exit_controls & VM_EXIT_ACTIVATE_SECONDARY_CONTROLS;
+}
+
 static inline bool nested_exit_on_nmi(struct kvm_vcpu *vcpu)
 {
 	return nested_cpu_has_nmi_exiting(get_vmcs12(vcpu));
@@ -269,6 +274,23 @@ static inline bool nested_cpu_has_encls_exit(struct vmcs12 *vmcs12)
 	return nested_cpu_has2(vmcs12, SECONDARY_EXEC_ENCLS_EXITING);
 }
 
+static inline bool nested_cpu_load_guest_fred_states(struct vmcs12 *vmcs12)
+{
+	return vmcs12->vm_entry_controls & VM_ENTRY_LOAD_IA32_FRED;
+}
+
+static inline bool nested_cpu_save_guest_fred_states(struct vmcs12 *vmcs12)
+{
+	return nested_cpu_has_secondary_vm_exit_controls(vmcs12) &&
+	       vmcs12->secondary_vm_exit_controls & SECONDARY_VM_EXIT_SAVE_IA32_FRED;
+}
+
+static inline bool nested_cpu_load_host_fred_states(struct vmcs12 *vmcs12)
+{
+	return nested_cpu_has_secondary_vm_exit_controls(vmcs12) &&
+	       vmcs12->secondary_vm_exit_controls & SECONDARY_VM_EXIT_LOAD_IA32_FRED;
+}
+
 /*
  * if fixed0[i] == 1: val[i] must be 1
  * if fixed1[i] == 0: val[i] must be 0
diff --git a/arch/x86/kvm/vmx/vmcs12.c b/arch/x86/kvm/vmx/vmcs12.c
index 9fac24fd5b4b..5fa63326deba 100644
--- a/arch/x86/kvm/vmx/vmcs12.c
+++ b/arch/x86/kvm/vmx/vmcs12.c
@@ -67,6 +67,24 @@ const unsigned short vmcs12_field_offsets[] = {
 	FIELD64(HOST_IA32_EFER, host_ia32_efer),
 	FIELD64(HOST_IA32_PERF_GLOBAL_CTRL, host_ia32_perf_global_ctrl),
 	FIELD64(SECONDARY_VM_EXIT_CONTROLS, secondary_vm_exit_controls),
+	FIELD64(INJECTED_EVENT_DATA, injected_event_data),
+	FIELD64(ORIGINAL_EVENT_DATA, original_event_data),
+	FIELD64(GUEST_IA32_FRED_CONFIG, guest_ia32_fred_config),
+	FIELD64(GUEST_IA32_FRED_RSP1, guest_ia32_fred_rsp1),
+	FIELD64(GUEST_IA32_FRED_RSP2, guest_ia32_fred_rsp2),
+	FIELD64(GUEST_IA32_FRED_RSP3, guest_ia32_fred_rsp3),
+	FIELD64(GUEST_IA32_FRED_STKLVLS, guest_ia32_fred_stklvls),
+	FIELD64(GUEST_IA32_FRED_SSP1, guest_ia32_fred_ssp1),
+	FIELD64(GUEST_IA32_FRED_SSP2, guest_ia32_fred_ssp2),
+	FIELD64(GUEST_IA32_FRED_SSP3, guest_ia32_fred_ssp3),
+	FIELD64(HOST_IA32_FRED_CONFIG, host_ia32_fred_config),
+	FIELD64(HOST_IA32_FRED_RSP1, host_ia32_fred_rsp1),
+	FIELD64(HOST_IA32_FRED_RSP2, host_ia32_fred_rsp2),
+	FIELD64(HOST_IA32_FRED_RSP3, host_ia32_fred_rsp3),
+	FIELD64(HOST_IA32_FRED_STKLVLS, host_ia32_fred_stklvls),
+	FIELD64(HOST_IA32_FRED_SSP1, host_ia32_fred_ssp1),
+	FIELD64(HOST_IA32_FRED_SSP2, host_ia32_fred_ssp2),
+	FIELD64(HOST_IA32_FRED_SSP3, host_ia32_fred_ssp3),
 	FIELD(PIN_BASED_VM_EXEC_CONTROL, pin_based_vm_exec_control),
 	FIELD(CPU_BASED_VM_EXEC_CONTROL, cpu_based_vm_exec_control),
 	FIELD(EXCEPTION_BITMAP, exception_bitmap),
diff --git a/arch/x86/kvm/vmx/vmcs12.h b/arch/x86/kvm/vmx/vmcs12.h
index 1fe3ed9108aa..f2a33d7007c9 100644
--- a/arch/x86/kvm/vmx/vmcs12.h
+++ b/arch/x86/kvm/vmx/vmcs12.h
@@ -186,6 +186,24 @@ struct __packed vmcs12 {
 	u16 host_tr_selector;
 	u16 guest_pml_index;
 	u64 secondary_vm_exit_controls;
+	u64 guest_ia32_fred_config;
+	u64 guest_ia32_fred_rsp1;
+	u64 guest_ia32_fred_rsp2;
+	u64 guest_ia32_fred_rsp3;
+	u64 guest_ia32_fred_stklvls;
+	u64 guest_ia32_fred_ssp1;
+	u64 guest_ia32_fred_ssp2;
+	u64 guest_ia32_fred_ssp3;
+	u64 host_ia32_fred_config;
+	u64 host_ia32_fred_rsp1;
+	u64 host_ia32_fred_rsp2;
+	u64 host_ia32_fred_rsp3;
+	u64 host_ia32_fred_stklvls;
+	u64 host_ia32_fred_ssp1;
+	u64 host_ia32_fred_ssp2;
+	u64 host_ia32_fred_ssp3;
+	u64 injected_event_data;
+	u64 original_event_data;
 };
 
 /*
@@ -362,6 +380,24 @@ static inline void vmx_check_vmcs12_offsets(void)
 	CHECK_OFFSET(host_tr_selector, 994);
 	CHECK_OFFSET(guest_pml_index, 996);
 	CHECK_OFFSET(secondary_vm_exit_controls, 998);
+	CHECK_OFFSET(guest_ia32_fred_config, 1006);
+	CHECK_OFFSET(guest_ia32_fred_rsp1, 1014);
+	CHECK_OFFSET(guest_ia32_fred_rsp2, 1022);
+	CHECK_OFFSET(guest_ia32_fred_rsp3, 1030);
+	CHECK_OFFSET(guest_ia32_fred_stklvls, 1038);
+	CHECK_OFFSET(guest_ia32_fred_ssp1, 1046);
+	CHECK_OFFSET(guest_ia32_fred_ssp2, 1054);
+	CHECK_OFFSET(guest_ia32_fred_ssp3, 1062);
+	CHECK_OFFSET(host_ia32_fred_config, 1070);
+	CHECK_OFFSET(host_ia32_fred_rsp1, 1078);
+	CHECK_OFFSET(host_ia32_fred_rsp2, 1086);
+	CHECK_OFFSET(host_ia32_fred_rsp3, 1094);
+	CHECK_OFFSET(host_ia32_fred_stklvls, 1102);
+	CHECK_OFFSET(host_ia32_fred_ssp1, 1110);
+	CHECK_OFFSET(host_ia32_fred_ssp2, 1118);
+	CHECK_OFFSET(host_ia32_fred_ssp3, 1126);
+	CHECK_OFFSET(injected_event_data, 1134);
+	CHECK_OFFSET(original_event_data, 1142);
 }
 
 extern const unsigned short vmcs12_field_offsets[];
diff --git a/arch/x86/kvm/vmx/vmcs_shadow_fields.h b/arch/x86/kvm/vmx/vmcs_shadow_fields.h
index cad128d1657b..da338327c2b3 100644
--- a/arch/x86/kvm/vmx/vmcs_shadow_fields.h
+++ b/arch/x86/kvm/vmx/vmcs_shadow_fields.h
@@ -74,6 +74,10 @@ SHADOW_FIELD_RW(HOST_GS_BASE, host_gs_base)
 /* 64-bit */
 SHADOW_FIELD_RO(GUEST_PHYSICAL_ADDRESS, guest_physical_address)
 SHADOW_FIELD_RO(GUEST_PHYSICAL_ADDRESS_HIGH, guest_physical_address)
+SHADOW_FIELD_RO(ORIGINAL_EVENT_DATA, original_event_data)
+SHADOW_FIELD_RO(ORIGINAL_EVENT_DATA_HIGH, original_event_data)
+SHADOW_FIELD_RW(INJECTED_EVENT_DATA, injected_event_data)
+SHADOW_FIELD_RW(INJECTED_EVENT_DATA_HIGH, injected_event_data)
 
 #undef SHADOW_FIELD_RO
 #undef SHADOW_FIELD_RW
-- 
2.48.1


