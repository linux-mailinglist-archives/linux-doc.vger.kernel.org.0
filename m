Return-Path: <linux-doc+bounces-82721-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJiOMr1V1Wmu4wcAu9opvQ
	(envelope-from <linux-doc+bounces-82721-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 07 Apr 2026 21:06:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 453803B3332
	for <lists+linux-doc@lfdr.de>; Tue, 07 Apr 2026 21:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D52EE304299A
	for <lists+linux-doc@lfdr.de>; Tue,  7 Apr 2026 19:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C7A379EE0;
	Tue,  7 Apr 2026 19:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uobZ2mg5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FE33793B1
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 19:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775588639; cv=none; b=P42QiyEV81hfOuWnlm6nA1RthlcBlQxYI5uT9kBBy6VH+yWamQlJ19A+f2rly1BH+Ek6aR7A+Du6sdbDhja5xA0dISVhAzMT0aZh9PPTLA1eRgM1P+Fr3qgQQeOZQzv0GFrZSz5RLfJULqtErpOkHulgNSl+rzxP24N5qLHxIVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775588639; c=relaxed/simple;
	bh=iuWUKvwmq1iLzTnz/4asZIAlh+gQc+x117UdbVL7P2w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d3vkJ1hGTbXbhomqFV27Pj1431+kKjICajrg0DkqZ8yhhynfmpO1a30hwX7jReJA27p6mQTK/pksuRmHeApGIzOrPsVYKs8KUtn/g4aPHosHwFiLkM2neT85R4k2NqudiVRLZ2/GFOV3Q4YE1ikDztSarhhiR58f0ble/hR2cLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uobZ2mg5; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c76bb22a8ceso7142898a12.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2026 12:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775588637; x=1776193437; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5I/y9a0OvTzfaNFmaQXBFw1laTAVH3VYWAc0gKu5sno=;
        b=uobZ2mg5VaRj46Bhu4PEx9uE/ArlsCEGZau5vxbTEBhM79SOOUK8mH4EXEOJQfeL+R
         1NVCLIhFbSt2iJCx94Ioe5j1gubeKdxqndwhdqjbmwceFFslkpigUGmYCkRA80KvdGdw
         jWxTKJq7lpuzHL+u8E2rrtVyFkaFK3NYp/Z6zEHw5EnIHHMrZ5NC3mw6Lkv3Oklt8F1k
         /rzcjQuKm2p8ejWF5TuF+zVHHq35smnv64MHTK3rpVaJDe373anlWbwJIvSiyApQMXHZ
         uBTtKFRuYBy49R7+5W7KmPCam+BOiPyFF0CN4QKs4KtCCMCelXdk3HE7bqYrDbDvMMj7
         HhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775588637; x=1776193437;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5I/y9a0OvTzfaNFmaQXBFw1laTAVH3VYWAc0gKu5sno=;
        b=f5r5PPYmzyYXzUMu/HqObWDOfifhvOP1DLSCmKXPsSBZpkcxmL5jtKDkrr82d0wNU7
         wWWdvvCnhT/+7B1lxrmrpBB7oAC+lsyXLDESoGPnOsCM95hUcvhLE+1RA+H8U4v6jya7
         xdchTivszX3Eh+vSCnbOGuBK0i03JFzV1mzUnWlQWEmRWaGNekf8GZ5LbAqXgKzWzaz7
         4iIDIKcFC3nroQ/I37eb1X2H/dKYPayXpFfDeTYTWZeTrly+/7hiz4Kt5JDr6Bx0mIxL
         GD/fNMk3xgw9sve4/F2p/2/czRqZv0d6WRa4Q6AN4Pib+VmlOZ5X932TV6zm/0plu1ru
         HxiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcDLByohG4d4+FGsJqHtmQ8IDOTfAqWfe8yUTqDUoYi53xM/dVyqzWof07x3a1W345tL1EDyTm6p4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzurhj4jKCbq+zMa0KKHSH8yT5Hv1RTAIBPqIXjkg4Y+MoF+r17
	sYvkatM91muevBZt/5Z2zoc27hSyzYM2SV038xBZbxTrhlNB+s+lCQkRMsQDuHvLlVQvwudvLWa
	r7KTJcvB1KWOpmA==
X-Received: from pfbmb8.prod.google.com ([2002:a05:6a00:7608:b0:82c:9835:bf12])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:18a3:b0:81f:31c3:2e34 with SMTP id d2e1a72fcca58-82d0da90bc1mr18183960b3a.25.1775588636947;
 Tue, 07 Apr 2026 12:03:56 -0700 (PDT)
Date: Tue,  7 Apr 2026 12:03:29 -0700
In-Reply-To: <20260407190343.325299-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260407190343.325299-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260407190343.325299-7-jmattson@google.com>
Subject: [PATCH v8 6/8] KVM: x86: nSVM: Save gPAT to vmcb12.g_pat on VMEXIT
From: Jim Mattson <jmattson@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-82721-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
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
X-Rspamd-Queue-Id: 453803B3332
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

According to the APM volume 3 pseudo-code for "VMRUN," when nested paging
is enabled in the vmcb, the guest PAT register (gPAT) is saved to the vmcb
on emulated VMEXIT.

When KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT is disabled and the vCPU is in
guest mode with nested NPT enabled, save the vmcb02 g_pat field to the
vmcb12 g_pat field on emulated VMEXIT.

Fixes: 15038e147247 ("KVM: SVM: obey guest PAT")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/nested.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 8c9dd685b616..cf6356c775e6 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1250,6 +1250,9 @@ static int nested_svm_vmexit_update_vmcb12(struct kvm_vcpu *vcpu)
 	vmcb12->save.dr6    = svm->vcpu.arch.dr6;
 	vmcb12->save.cpl    = vmcb02->save.cpl;
 
+	if (l2_has_separate_pat(vcpu))
+		vmcb12->save.g_pat = vmcb02->save.g_pat;
+
 	if (guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK)) {
 		vmcb12->save.s_cet	= vmcb02->save.s_cet;
 		vmcb12->save.isst_addr	= vmcb02->save.isst_addr;
-- 
2.53.0.1213.gd9a14994de-goog


