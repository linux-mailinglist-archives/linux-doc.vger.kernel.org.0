Return-Path: <linux-doc+bounces-94468-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t2auLi1wRWrqAAsAu9opvQ
	(envelope-from <linux-doc+bounces-94468-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 21:53:17 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0166F11F7
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 21:53:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=TNLNEavc;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94468-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-94468-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD0C030508FC
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 19:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C754252C1;
	Wed,  1 Jul 2026 19:33:13 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB365423F76
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 19:33:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934393; cv=none; b=FsaNR8Liv6Tm+gIP7sGqNXVwh33mXuWjx+lswMAB92xCRcPSJrZxDPFUmRChQozAzAfFUkCqWBHV0S2aysKwuhfKR4vA3GfoZHj6iSAH+4RnABAlhPAx+VNuz8184pOoOd8+eE8/WCSK4fjmTr1GhvrPo8pPU6QFS+2k9ocRiv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934393; c=relaxed/simple;
	bh=CMkMn9gDHGDnd3gtJyIeM0lkE5As7w47pJpKewsK9/4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qc4DGe2h+atTVvaG0qboHdHArCFIOpOuRtcqWFsZvLsEKw7C/jSyZTvfa35956VYAwcToz+rHavngFcuew9sk8NiNh1DCSe0AnX+Q3hyVnIhQd65zRtyRbcUXy39gLXMPnpvfkW+DKCNos1Av5jSg+CogTQo5Ofy0+cOSMeIm4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TNLNEavc; arc=none smtp.client-ip=209.85.210.201
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-845a29d8c1eso1181797b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 12:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934390; x=1783539190; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=bEdSCU5mjiDv3GADlP0fC3hWLpC5/Jr71iPsXhxCK9Y=;
        b=TNLNEavciSrrUvZpoTM3W3Xb0RDLWyv/8ewNn8byAPOaEHHw2WaU70Q0z9xyY5PmaW
         27umSlY43bDyC8x8lW3ygoS/ZCzl0L83R3lC2fpAyfL0xn2ahN+8a+p/Pq9aSd124IK8
         SNZv0DxqUsIyQ3Roai1h8TL18DaxghXeMXXkjDDzis+N3Xj3yCpcptfRdAGcl9le0gPx
         pXC3iO2/JNZs7L4UAU4/5dx0qP+Ipo8nQn7pPEwpGH4MBgwBc4OHzz0Zmg/MQPuK8zrL
         HwacizZEMo2YOq49VtLywnYMThkj71U+QXSGYlCNNuO31CaXiMVw0PICwR/lThbEgRQ/
         fpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934390; x=1783539190;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEdSCU5mjiDv3GADlP0fC3hWLpC5/Jr71iPsXhxCK9Y=;
        b=MmToP8exaxr9v9jBeYnxV72vQDsH1HAZkRdFh7gARxHKy4gXD1ueROt/owqUeB7fUm
         54nnLFI1xxLw7ab8BqbZgn860BGZ/c4CT/8QBe41n1slQh35duI9PGXI/rgE+U9lEKEm
         m2GAImZOzauBIIyvWYh1GvkEtB0Dm4M0hvQCaNWi9UMtG8rvtZ78B6FzRuKQBFzMjscR
         jHRkem1PDI1Lt4vIr48ADFJgRnQ+miBSxIKeMV3yIylCUPdzHaYPDJCqCuYXzN9iuEXP
         WeFn6E2tg7gM0XEnGR+nbw07NXXVQlKzqBdu5PZrO0ofj2hskp/85fSJ/1Pvy15nIUo1
         qYaQ==
X-Forwarded-Encrypted: i=1; AFNElJ//meV6JcB8gCHrw3lHxR5kf6o+Esak3GvNFYdfOY0yX+cSrLxDAHgYFoNJF8CeE19tfutr4uxAx/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNvGWV09DxBLkXkwlLuf5dEI9uayxx7jUzYlQ341AjWX9L1Llh
	nOla5BrGNw5qXDXFySfmG+kARxXl/irfeWtmZKvF7jyW1xHCnI8d6eupITzKqQx2u5hwqJ2zAmM
	4H88jsQ==
X-Received: from pgh6.prod.google.com ([2002:a05:6a02:4e06:b0:c8b:19f4:6228])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4320:b0:3bf:6c08:fb88
 with SMTP id adf61e73a8af0-3bfed4b9441mr3531733637.56.1782934389876; Wed, 01
 Jul 2026 12:33:09 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:56 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-36-seanjc@google.com>
Subject: [PATCH v5 35/51] x86/tsc: WARN if TSC sched_clock save/restore used
 with PV sched_clock
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,amazon.co.uk:email];
	TAGGED_FROM(0.00)[bounces-94468-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:rick.p.edgecombe@intel.com,m:seanjc@google.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:skhan@linuxfoundation.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw@amazon.co.uk,m:dwmw2@infradead.org,m:mhklinux@outlook.com
 ,m:tglx@linutronix.de,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,zytor.com,redhat.com,broadcom.com,oracle.com,kernel.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amd.com,amazon.co.uk,infradead.org,outlook.com,linutronix.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD0166F11F7

Now that all PV clocksources override the sched_clock save/restore hooks
when overriding sched_clock, WARN if the "default" TSC hooks are invoked
when using a PV sched_clock, e.g. to guard against regressions.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index a762cb5cec0f..7473dcab4775 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -947,9 +947,17 @@ EXPORT_SYMBOL_FOR_MODULES(recalibrate_cpu_khz, "p4-clockmod,powernow-k7");
 
 static unsigned long long cyc2ns_suspend;
 
+static __always_inline bool tsc_is_save_restore_needed(void)
+{
+	if (WARN_ON_ONCE(!using_native_sched_clock()))
+		return false;
+
+	return static_branch_likely(&__use_tsc) || sched_clock_stable();
+}
+
 void tsc_save_sched_clock_state(void)
 {
-	if (!static_branch_likely(&__use_tsc) && !sched_clock_stable())
+	if (!tsc_is_save_restore_needed())
 		return;
 
 	cyc2ns_suspend = sched_clock();
@@ -969,7 +977,7 @@ void tsc_restore_sched_clock_state(void)
 	unsigned long flags;
 	int cpu;
 
-	if (!static_branch_likely(&__use_tsc) && !sched_clock_stable())
+	if (!tsc_is_save_restore_needed())
 		return;
 
 	local_irq_save(flags);
-- 
2.55.0.rc0.799.gd6f94ed593-goog


