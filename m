Return-Path: <linux-doc+bounces-94476-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZYzCAfRtRWr//woAu9opvQ
	(envelope-from <linux-doc+bounces-94476-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 21:43:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 694C96F102B
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 21:43:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=SuVFKY6P;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94476-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94476-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42BAF305505E
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 19:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D22429DAF;
	Wed,  1 Jul 2026 19:33:23 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEE042A79B
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 19:33:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934402; cv=none; b=Lm5bFCk0xb67suaK3jHopDc5fyK+iSvhRUEALtaM4KnMsEYF/anlGYhdcfcIL4QBtryaT9aiRHklTJ4jF54/FgIM8Wnzr1hPryQ6GAX5c5Gar/iphjz8J4NOa4rRlZ34NvNfyfbxCVXUyd5pJ5VVgKS+rlF5JeCdG9NAcHjhkIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934402; c=relaxed/simple;
	bh=5RmHG8jQeFaxWLyXRFh1e6DyJpHBisQQEigG7SgzsNI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BS38Mkkl91aW8axrjwN5pTDybeehxMpsZQp8JGb+4zwpGmsZzrYrgP0agIDOPSe6Xw3vh5lFgyYo+g8tMP/IUDGiBYDUW+55UCLH3rzs87otlSjtt6aqXjZHEd7WzsNgc2NlVNUfLlhw9tK/u3sd55+oBHZwRAxg3Pq836Qw1fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SuVFKY6P; arc=none smtp.client-ip=209.85.216.73
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-37fb9d7b524so973206a91.3
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 12:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934400; x=1783539200; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VKCobU9qtcP/hN9BlhIiU1X9DFbnjtpoNJAd58RipCc=;
        b=SuVFKY6Pn8WHrrhDJo65fRVbP0QSq14/ulHcDZTceBBjSXQTUxS8cbOe8TRHeTQOXw
         n0BLMdtEUGhWNU/eUEEJCd+av1RT4Q1srto5DQmnWFa/xNMQ6xcCZ7t/Qg15KdEKo5ev
         Cb0Sonw9PqLyxUHyO8V6K1AKnmobUrvImEuf8Wy50/OlGHTeLpgB+l8Db1Kbj0FRZzPF
         IzVWTDiHYsgpZkUjRjc8i3ffd8sTdADTPIXkd8LYebsQfCZdXR4b3vJTRvB0Y/FLeIyD
         0yFhZ/W51zyjkBzK4IK6OFG3GQ2KwrHlGOjzIGJHV/sX72s1MDyAusZMO4NEDptYOqSq
         FzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934400; x=1783539200;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VKCobU9qtcP/hN9BlhIiU1X9DFbnjtpoNJAd58RipCc=;
        b=OZW+pzr8aO/UzvKVp6tUHFoPa9hBRFIAnlCpI2nz/g0px07V3yCXFjgM+wtrTur4S/
         1stg8OP6cmUPolChNK33rPrYX4CxhGCmwYGa/cK8cVNtLn+zUTbg4sY8omE76EKpcJUS
         I58JgeyFg4maqxedQaky2lTHDTIJtt2Mz0AINa5GDsITpyr7e7HVX3QGLTnMJaKbw8a9
         BHW1WB8i7sKKyvvfFyNl0rbM4n4vZSom4zLT5u46nWJ8sdwvzBcai7LkgReoLYtXUsjk
         +KEQDCf3d9M7vM1JmNxWui7kwnV0RnAuyv4Wfr0p9CBGHYhKAit6v4Co4nNm1cp1uPMY
         q+ZA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9Vw3Fl43JHyd78ZSFXycDKGBcDI+pfxs+gGoaW41mkQiJlcWhEZY8Hjzxs/6yJbZ1IA4gPijBvOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG1jBMa5EGr4J3TVhcfivb9P3w79LY7v7PoiLK9NHlQ2S5M2aB
	EOCd3IoelfySnRLb7IfF4zpLwnpk2lPagnt4aNpKxAtUMmbS4PSV8sbvMRQcl2Vh094RZEyTs6D
	SZcpRyg==
X-Received: from pjqu11.prod.google.com ([2002:a17:90a:ae8b:b0:37d:8595:7a08])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:180e:b0:37f:ff9d:ad69
 with SMTP id 98e67ed59e1d1-380ba80c706mr2175388a91.7.1782934399271; Wed, 01
 Jul 2026 12:33:19 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:32:04 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-44-seanjc@google.com>
Subject: [PATCH v5 43/51] x86/kvmclock: Hook clocksource.suspend/resume when
 kvmclock isn't sched_clock
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:rick.p.edgecombe@intel.com,m:seanjc@google.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:skhan@linuxfoundation.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw@amazon.co.uk,m:dwmw2@infradead.org,m:mhklinux@outlook.com
 ,m:tglx@linutronix.de,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amazon.co.uk:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94476-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 694C96F102B

Save/restore kvmclock across suspend/resume via clocksource hooks when
kvmclock isn't being used for sched_clock.  This will allow using kvmclock
as a clocksource (or for wallclock!) without also using it for sched_clock.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 61d4d943fe74..41aff709b90a 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -152,7 +152,17 @@ static void kvm_setup_secondary_clock(void)
 
 static void kvm_restore_sched_clock_state(void)
 {
-	kvm_register_clock("primary cpu clock, resume");
+	kvm_register_clock("primary cpu, sched_clock resume");
+}
+
+static void kvmclock_suspend(struct clocksource *cs)
+{
+	kvmclock_disable();
+}
+
+static void kvmclock_resume(struct clocksource *cs)
+{
+	kvm_register_clock("primary cpu, clocksource resume");
 }
 
 void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
@@ -223,6 +233,8 @@ static struct clocksource kvm_clock = {
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	.id		= CSID_X86_KVM_CLK,
 	.enable		= kvm_cs_enable,
+	.suspend	= kvmclock_suspend,
+	.resume		= kvmclock_resume,
 };
 
 static void __init kvmclock_init_mem(void)
@@ -318,6 +330,15 @@ static __init void kvm_sched_clock_init(bool stable)
 				   kvm_save_sched_clock_state,
 				   kvm_restore_sched_clock_state);
 
+	/*
+	 * The BSP's clock is managed via dedicated sched_clock save/restore
+	 * hooks when kvmclock is used as sched_clock, as sched_clock needs to
+	 * be kept alive until the very end of suspend entry, and restored as
+	 * quickly as possible after resume.
+	 */
+	kvm_clock.suspend = NULL;
+	kvm_clock.resume = NULL;
+
 	pr_info("kvm-clock: using sched offset of %llu cycles",
 		kvm_sched_clock_offset);
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


