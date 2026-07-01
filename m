Return-Path: <linux-doc+bounces-94455-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZT/1LYZuRWp2AAsAu9opvQ
	(envelope-from <linux-doc+bounces-94455-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 21:46:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC4B6F10AB
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 21:46:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b="f/JGcFWh";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94455-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94455-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDFB431EA66F
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 19:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912B04189B3;
	Wed,  1 Jul 2026 19:32:58 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D471341227A
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 19:32:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934378; cv=none; b=r3EmSu/UhpIixOT5cOGybv1xT15migkwodVXEuT+jKippeZj8nfORUDtWtAsGBRx/roD9AKQ7LqiPQBcjpJwg8+MQR9e4puinWqpvtsSPWGFNed+MGn66S3C1UoOQ0DLcUi81LnJTAzCLIwFVN70a/qvcgX0/QrvFtGxadPDaww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934378; c=relaxed/simple;
	bh=ehvol4aPGGdBph7tPEcdqNiMmKvh5DD8WD/ckSXpqow=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TdXbXpKxmPQlhZm38xCZEZ5xuR6YhkRM4Aa/okbEq5sw5nVJlHqfOugg3mndOmgyqXRTyrVZxPUxgKCNIezD3JGBpZDtK16xk09KWMpVYyfT46x5X8wPioYzjv+pFRn+vio0rK9Jf7vQko+NqfO9icDrAP3MBfZncK40i5eWQVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f/JGcFWh; arc=none smtp.client-ip=209.85.214.202
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2ca1f16e391so11746115ad.2
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 12:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934375; x=1783539175; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=XQAPpCEE/BDkXN3dIWP18HQMEopEl3zLKZ2PUcc2V5o=;
        b=f/JGcFWh9X32X3N6GvM28619cTdSE/iPF4/e53t4cFm7B4if4byqEPzdf823jJz5ir
         6hIuhr2LTZWHXRmnOWOlOMIzXVRBpQwWxqWIYG3Solt0Ed+kjYkeWG9R6nyN4pW3g2HV
         VTbMs/xTPWkUuJeDUZ2nEiwjkoaPrszGNgkumoELpGUUoFnz8Lf6+GC5/3cPwwTBTPut
         35VRi/V8IPu9wrkD1r+zsMG1gxaO29PTL6jjLH/v4es6yI7MXnMXl3MvPrEvfhjlWcgV
         Xqpycw2Ql1+L86OHACPpPZQ0BxdlxVlYtrme1kd9gSMtObRVQ7Nq7zkqAklqfWvCOPh7
         JNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934375; x=1783539175;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQAPpCEE/BDkXN3dIWP18HQMEopEl3zLKZ2PUcc2V5o=;
        b=Lli2Ae87i+bOX+tf6EJtz1Z6HX1LxhFhSw+EH86tdlJAp64ZdQjT4TCeoeXNWjMPM/
         WzYmDY+jh8wTEyFf2NBPOJ3l29FZbqhoWa6kC1FfNe1JE2u3GMgw1KSRudP/QYw7yv2n
         Qs531ezV9kOf/6DqjLmPaEtzQ60Z63+CyVRAzUDt4/kwPr2YaXLGiE1f7nh63TdafwZc
         /1Ae+BMl1o9EeWPsvNQ2Atk9Iki6/+TT1cGg5ftW9zLE0kOXSJXrlRAZhIQ9neSxrq+t
         Sj0U3VyPw/x8d2T5k/Ja0mG0uvX+nj78V1XNgexqcj41cjtZx1llxW+6CIrze68ewyE/
         xDgQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNs9xOusxUMnOep+q+zdQHFmFnk6APbY0aN1PU3fmdpZa1M07JI3Z0ea6TqcvSr8IgPas6gkN/uyc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+SxOlVt4Ih2G74+FwX9y3b2z3ab3zJkALJiFjiYRsvvtTEhi4
	d6m3S8SUoS1Fxq4bp4ZWRLAhoZD/r+4UYurx8PlUu6+AzBk58W1mQe39wC12koDuAzGqBtreD4B
	sclj7NQ==
X-Received: from plpl11.prod.google.com ([2002:a17:903:3dcb:b0:2b0:46bd:4fe5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce02:b0:2ca:62e:cc4f
 with SMTP id d9443c01a7336-2ca7e7645d1mr34535395ad.23.1782934374801; Wed, 01
 Jul 2026 12:32:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:44 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-24-seanjc@google.com>
Subject: [PATCH v5 23/51] x86/tsc: Add standalone helper for getting CPU
 frequency from CPUID
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:rick.p.edgecombe@intel.com,m:seanjc@google.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:skhan@linuxfoundation.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw@amazon.co.uk,m:dwmw2@infradead.org,m:mhklinux@outlook.com
 ,m:tglx@linutronix.de,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amazon.co.uk:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94455-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,zytor.com,redhat.com,broadcom.com,oracle.com,kernel.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amd.com,amazon.co.uk,infradead.org,outlook.com,linutronix.de];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BC4B6F10AB

Extract the guts of cpu_khz_from_cpuid() to a standalone helper that
doesn't restrict the usage to Intel CPUs.  This will allow sharing the
core logic with KVM-as-a-guest, as KVM generally doesn't restrict CPUID
based on vendor.

No functional change intended.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/tsc.h |  1 +
 arch/x86/kernel/tsc.c      | 31 +++++++++++++++----------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
index c09ec485abcd..cb682f097ea7 100644
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -88,6 +88,7 @@ struct cpuid_tsc_info {
 	unsigned int crystal_khz;
 };
 extern int cpuid_get_tsc_info(struct cpuid_tsc_info *info);
+extern unsigned int __cpu_khz_from_cpuid(void);
 
 extern void tsc_early_init(void);
 extern void tsc_init(void);
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 6ed6f8f012eb..56e73e96920a 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -668,6 +668,18 @@ int cpuid_get_tsc_info(struct cpuid_tsc_info *info)
 	return 0;
 }
 
+unsigned int __cpu_khz_from_cpuid(void)
+{
+	unsigned int eax_base_mhz, ebx, ecx, edx;
+
+	if (boot_cpu_data.cpuid_level < CPUID_LEAF_FREQ)
+		return 0;
+
+	cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
+
+	return eax_base_mhz * 1000;
+}
+
 /**
  * native_calibrate_tsc - determine TSC frequency
  * Determine TSC frequency via CPUID, else return 0.
@@ -703,12 +715,8 @@ static unsigned long native_calibrate_tsc(void)
 	 * clock, but we can easily calculate it to a high degree of accuracy
 	 * by considering the crystal ratio and the CPU speed.
 	 */
-	if (!info.crystal_khz && boot_cpu_data.cpuid_level >= CPUID_LEAF_FREQ) {
-		unsigned int eax_base_mhz, ebx, ecx, edx;
-
-		cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
-		info.crystal_khz = eax_base_mhz * 1000 * info.denominator / info.numerator;
-	}
+	if (!info.crystal_khz)
+		info.crystal_khz = __cpu_khz_from_cpuid() * info.denominator / info.numerator;
 
 	if (!info.crystal_khz)
 		return 0;
@@ -733,19 +741,10 @@ static unsigned long native_calibrate_tsc(void)
 
 static unsigned long cpu_khz_from_cpuid(void)
 {
-	unsigned int eax_base_mhz, ebx_max_mhz, ecx_bus_mhz, edx;
-
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
 		return 0;
 
-	if (boot_cpu_data.cpuid_level < CPUID_LEAF_FREQ)
-		return 0;
-
-	eax_base_mhz = ebx_max_mhz = ecx_bus_mhz = edx = 0;
-
-	cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx_max_mhz, &ecx_bus_mhz, &edx);
-
-	return eax_base_mhz * 1000;
+	return __cpu_khz_from_cpuid();
 }
 
 /*
-- 
2.55.0.rc0.799.gd6f94ed593-goog


