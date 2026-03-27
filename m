Return-Path: <linux-doc+bounces-81604-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPaOEq8Wx2mWSgUAu9opvQ
	(envelope-from <linux-doc+bounces-81604-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 28 Mar 2026 00:45:51 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C10A934C81E
	for <lists+linux-doc@lfdr.de>; Sat, 28 Mar 2026 00:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8A493100D13
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2026 23:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4563A8735;
	Fri, 27 Mar 2026 23:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tmojgP9e"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA903A6B72
	for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 23:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654844; cv=none; b=ACOkY44H8SSjydnMf7vI2ew6SzwYojYxPUEJPOIXtc7/uDyTtccnyRp7fDpIe0V3N+epQvHf4gGkYh7RuD2qs9CwXmm3RRG1Z6MApEb5UN1gPqzJVmOX6s3r997TEn9OAB1YIprFz0dswzOQ8jm23V3xAUVjaJd6AHBdRHJcFe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654844; c=relaxed/simple;
	bh=ZvxNNPnPmX7wYJVvYk5hMj+puG16Eo/l6nqfvIOJDnw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O/nSJsbBYT5RcozqeS7STVHC+e5iSAAXRCMHvUL80u+MYq8dTVasCfOlMyXGB+WSS60f7sSBZ1u7lFDVOcK67jZpGhrZ66R4L2EbKU1kyrxOsIPnUDYDU/WALqnhY0L5yOOQEyCLC73CYujpwX11R7MAQMMDU/gHfj/zGPQRqt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tmojgP9e; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-35ba4bf54beso788323a91.1
        for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 16:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774654842; x=1775259642; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=orVw3BFMtlEwOndHFsmUNVe5beJCJOsEnJ6vfIk60cg=;
        b=tmojgP9emI4mtKMvbsMYALuTLkpyDtr+5liMbtyFjUHERstqna5BwJQyH7RlEo/rg2
         sY8OwbruhsXDA8aKgDicW/maKTxaFD+/CvoDkL/JNnXDWjDyt/Ij6Az7c9XHJ3/f7gv6
         NhNRtlKtcs0WOhC8SkfI7FFw6FHmWzPK6zDXE1JKco+wlLBjRwwo3iOCH8Mztte/P3Xr
         aIraqNHgz/m+oV0IC1AJj679/clAN+wP2gAaxIU9dEGH4vTvvr06LS8cOgiON6D1bovU
         bz/T2T47SWqkKFNCSF7nEHFcRbNkl7NtVrPzLrKVqxZved/uQYbm21IYR5tfPeYZlt+W
         QnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654842; x=1775259642;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orVw3BFMtlEwOndHFsmUNVe5beJCJOsEnJ6vfIk60cg=;
        b=OiEV5M8gpiH7ZljlVyfFMhphbb6kKegejcM1zocxFyDvnh0+W5J6QI+ZqnQx1s8smC
         +ccE47n70KDeBByZUpsQ0NnMV8WWIrxw1GFZ1ZC+YjabE6GjNczSUA2yUr5g+Nwf5tNG
         EzPfuaPmSujOQC2cwkXHufQyLgYI6TgQ3qWmzvCBETXzmdvJpWtTGkqt1i4mYXfugUYq
         W+PoZBxyfe3X8zLivwb0st+mQNjXN8r4JHoYlDv/eOIS/5ATNPfvxBqhYfImJSRYSuNo
         QmUFnld0McU1Rrmi0xIO3EwxqFJUFDPbDl4FIOlnyZAKBVxzdJNrnkSN4XaORqottYbR
         32Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWNFfW440XlwJU4mQDIurSo+4CzyPHdgD+4ohzfMdMtddS5aRXKIfjX3+sZqhAOl9eryVDpb6Z8NU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTyFULVABMFYhmbsCUz4aOYOy2lu+FWtH+3G5je7kcnLfIl/Ue
	wZBo+daiKp/X/aRydHLGgy8HqkV81FhpAkrwUL2t5+0roGXMDKdSxhMQhMWLyEMtkuNf6j5yumi
	/O0SjE9XxnVkYcg==
X-Received: from pjur6.prod.google.com ([2002:a17:90a:d406:b0:35c:251c:2305])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d44d:b0:35b:e4f8:7cc5 with SMTP id 98e67ed59e1d1-35c300b9405mr3788148a91.25.1774654841889;
 Fri, 27 Mar 2026 16:40:41 -0700 (PDT)
Date: Fri, 27 Mar 2026 16:40:15 -0700
In-Reply-To: <20260327234023.2659476-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260327234023.2659476-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260327234023.2659476-9-jmattson@google.com>
Subject: [PATCH v7 8/9] KVM: x86: nSVM: Save/restore gPAT with KVM_{GET,SET}_NESTED_STATE
From: Jim Mattson <jmattson@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-81604-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jmattson@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C10A934C81E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a 'gpat' field to kvm_svm_nested_state_hdr to carry L2's guest PAT
value across save and restore.

When KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT is disabled and the vCPU is in
guest mode with nested NPT enabled, save vmcb02's g_pat into the header on
KVM_GET_NESTED_STATE, and restore it on KVM_SET_NESTED_STATE.

Host-initiated accesses to IA32_PAT (via KVM_GET/SET_MSRS) always target
L1's hPAT, so they cannot be used to save or restore gPAT. The separate
header field ensures that KVM_GET/SET_MSRS and KVM_GET/SET_NESTED_STATE are
independent and can be ordered arbitrarily during save and restore.

Note that struct kvm_svm_nested_state_hdr is included in a union padded to
120 bytes, so there is room to add the gpat field without changing any
offsets.

Fixes: cc440cdad5b7 ("KVM: nSVM: implement KVM_GET_NESTED_STATE and KVM_SET_NESTED_STATE")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 Documentation/virt/kvm/api.rst  |  1 +
 arch/x86/include/uapi/asm/kvm.h |  1 +
 arch/x86/kvm/svm/nested.c       | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 0a2d873ca5a3..d6bbb7bad173 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -4965,6 +4965,7 @@ Errors:
 
   struct kvm_svm_nested_state_hdr {
 	__u64 vmcb_pa;
+	__u64 gpat;
   };
 
   struct kvm_vmx_nested_state_data {
diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 3ada2fa9ca86..1585ec804066 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -533,6 +533,7 @@ struct kvm_svm_nested_state_data {
 
 struct kvm_svm_nested_state_hdr {
 	__u64 vmcb_pa;
+	__u64 gpat;
 };
 
 /* for KVM_CAP_NESTED_STATE */
diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index add57f2a2d9f..54399e642745 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1865,6 +1865,9 @@ static int svm_get_nested_state(struct kvm_vcpu *vcpu,
 	/* First fill in the header and copy it out.  */
 	if (is_guest_mode(vcpu)) {
 		kvm_state.hdr.svm.vmcb_pa = svm->nested.vmcb12_gpa;
+		kvm_state.hdr.svm.gpat = 0;
+		if (l2_has_separate_pat(svm))
+			kvm_state.hdr.svm.gpat = svm->vmcb->save.g_pat;
 		kvm_state.size += KVM_STATE_NESTED_SVM_VMCB_SIZE;
 		kvm_state.flags |= KVM_STATE_NESTED_GUEST_MODE;
 
@@ -1918,6 +1921,7 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 	struct vmcb_save_area_cached save_cached;
 	struct vmcb_ctrl_area_cached ctl_cached;
 	unsigned long cr0;
+	bool use_separate_l2_pat;
 	int ret;
 
 	BUILD_BUG_ON(sizeof(struct vmcb_control_area) + sizeof(struct vmcb_save_area) >
@@ -1993,6 +1997,18 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 	    !nested_vmcb_check_save(vcpu, &save_cached, false))
 		goto out_free;
 
+	/*
+	 * Validate gPAT when the shared PAT quirk is disabled (i.e. L2
+	 * has its own gPAT). This is done separately from the
+	 * vmcb_save_area_cached validation above, because gPAT is L2
+	 * state, but the vmcb_save_area_cached is populated with L1 state.
+	 */
+	use_separate_l2_pat =
+		(ctl_cached.misc_ctl & SVM_MISC_ENABLE_NP) &&
+		!kvm_check_has_quirk(vcpu->kvm,
+				     KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT);
+	if (use_separate_l2_pat && !kvm_pat_valid(kvm_state->hdr.svm.gpat))
+		goto out_free;
 
 	/*
 	 * All checks done, we can enter guest mode. Userspace provides
@@ -2017,6 +2033,10 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 	nested_copy_vmcb_control_to_cache(svm, ctl);
 
 	svm_switch_vmcb(svm, &svm->nested.vmcb02);
+
+	if (use_separate_l2_pat)
+		vmcb_set_gpat(svm->vmcb, kvm_state->hdr.svm.gpat);
+
 	nested_vmcb02_prepare_control(svm);
 
 	/*
-- 
2.53.0.1018.g2bb0e51243-goog


