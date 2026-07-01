Return-Path: <linux-doc+bounces-94479-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x2dpCmJuRWpbAAsAu9opvQ
	(envelope-from <linux-doc+bounces-94479-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 21:45:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF3A6F1098
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 21:45:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=ZXZeEAMO;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94479-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94479-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 637253049596
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 19:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53DC342E8C0;
	Wed,  1 Jul 2026 19:33:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DFB42C4A5
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 19:33:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934407; cv=none; b=XE99jDyZs6u7Qfk57sBIrFVHwoDHfBw+glSVjmNnk6bb3mqQYr7+52MhEVrajzElVwobeXmwYmbbrI0rPb5Fhq2KfGwzA2eHTt8ManaU/IqqhrM+oxldfIytnLY5T9dxMDBs3IK0GrhHmiOZdU04FUiOc0qPTTqFlPRqedoxIs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934407; c=relaxed/simple;
	bh=IG2Hmi12vLvJIelcQEMDYixsIVkPyLQSG2OhagBXg7k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e+j7qvE73CtARlXY4cOyfyAreVdfoOko2u5vX9iBMuopsSOcGdcLCkPLnQWH4EQMZO6/NLcMBlm8AKyGhyMvaXuZQxxBJVIWJEAE5PtIwqo5PSsxOG+P53EmlZ9hsybn7JCy/CloEr+rw/sNRSvJPq/bBliRq9g4dfZ7UJqL81Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZXZeEAMO; arc=none smtp.client-ip=209.85.215.202
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c89956023dbso901022a12.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 12:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934403; x=1783539203; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4/M1D57lssm/A6RYRKDqaCs4EQpgkZGCf/uDo3WK1sI=;
        b=ZXZeEAMOXd+gHrL4Ktx3/Fo5Th6QRTtB4gXMfNdwTL+exRiPrqetCTfpZ98PhD9JV4
         dM6KpfDSVh66P9265MUA1hTcgZ/qAmeUfmMXP3DuYgVYinTP0GKZop71+kmWbrdZemon
         hmt1oAEFd0goKUZF0XRjed/s2OFIxXj+duao0MGNFycUZpKnGRLLh0iEyMZkvAx15sMX
         ABvn0zFo5bN/L62mEHaRgff3vbIq0rZXTT8vqZu0SpEz0RJmWb9hmiAFMaWbBcghOHZA
         ebYcEAAVmEQ5cyBcm4eExiVeNAmyGQbD3q1ELWx3kSypvROtI5P5I6bggGB1joO5NW9I
         fIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934403; x=1783539203;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/M1D57lssm/A6RYRKDqaCs4EQpgkZGCf/uDo3WK1sI=;
        b=okcckUYYLHvA/LxjvqZ6aBVEDoW06AhEsDYZkEY1cRyrHgCc8GXzgTKR3t8jdhseSr
         kxsMDxxVRyXelado2sVEf7WYezbMID+MkmgbIRe9WXZ2PZbtBTk8F+JvZcbY1bl7QcoH
         iPugfsMJt+a9TvCobZhY6pWR6mhaxEsaV4i8NhKfR5LK8QuTjk3SIqkU3wVeOKOYpPNz
         /VWUaMJCE7Srm/wUgjPYNBkhZfTLHyrQTcSt/ysrSE1dUtsioXeAjV4u9z8BhMmLcIhX
         2Y2GPF5JYwBEK86rqZ8gzb1NnCKzwQQi80+Rnk552+26ud+ncCfCphKqYzKbmEMoUOhk
         86Bw==
X-Forwarded-Encrypted: i=1; AFNElJ8YTiEPn8nxujTKPewGzy5bx+hbMITpc71UMG4moju+cUuApynjE6mO7K5hXyayltwUgCMnlzUuvAM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzlVycXbSondErMlra6DKDIuHeHcjPbYVHgIwwrxgbk8vtvHx3
	If1f0zlrKEP+/eEWEc0YLIUVxJhtaShqzqFZTLnKMFaZpbmkoRAZlBtVGDJlncIr7YjT8j3HpYi
	tHAsWwQ==
X-Received: from pgal188.prod.google.com ([2002:a63:3ec5:0:b0:c98:a4cf:469b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:62cc:b0:3aa:c964:3c27
 with SMTP id adf61e73a8af0-3bfed49ea64mr3435408637.46.1782934402561; Wed, 01
 Jul 2026 12:33:22 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:32:07 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-47-seanjc@google.com>
Subject: [PATCH v5 46/51] x86/paravirt: Plumb a return code into __paravirt_set_sched_clock()
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
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:rick.p.edgecombe@intel.com,m:seanjc@google.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:skhan@linuxfoundation.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw@amazon.co.uk,m:dwmw2@infradead.org,m:mhklinux@outlook.com
 ,m:tglx@linutronix.de,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amazon.co.uk:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[seanjc@google.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94479-lists,linux-doc=lfdr.de];
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
X-Rspamd-Queue-Id: 8FF3A6F1098

Add a return code to __paravirt_set_sched_clock() so that the kernel can
reject attempts to use a PV sched_clock without breaking the caller.  E.g.
when running as a CoCo VM with a secure TSC, using a PV clock is generally
undesirable.

Note, kvmclock is the only PV clock that does anything "extra" beyond
simply registering itself as sched_clock, i.e. is the only caller that
needs to check the new return value.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h | 6 +++---
 arch/x86/kernel/kvmclock.c   | 9 ++++++---
 arch/x86/kernel/tsc.c        | 5 +++--
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index 96ae7feac47c..ca5c95d48c03 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -14,14 +14,14 @@ extern int no_timer_check;
 extern bool using_native_sched_clock(void);
 
 #ifdef CONFIG_PARAVIRT
-void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				       void (*save)(void), void (*restore)(void));
+int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				      void (*save)(void), void (*restore)(void));
 
 static __always_inline void paravirt_set_sched_clock(u64 (*func)(void),
 						     void (*save)(void),
 						     void (*restore)(void))
 {
-	__paravirt_set_sched_clock(func, true, save, restore);
+	(void)__paravirt_set_sched_clock(func, true, save, restore);
 }
 #endif
 
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 2cc3dd2ba355..22e8855fcd4d 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -332,10 +332,13 @@ static int kvmclock_setup_percpu(unsigned int cpu)
 
 static __init void kvm_sched_clock_init(bool stable)
 {
+	/* Ensure the offset is configured before making kvmclock visible! */
 	kvm_sched_clock_offset = kvm_clock_read();
-	__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
-				   kvm_save_sched_clock_state,
-				   kvm_restore_sched_clock_state);
+
+	if (__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
+				       kvm_save_sched_clock_state,
+				       kvm_restore_sched_clock_state))
+		return;
 
 	/*
 	 * The BSP's clock is managed via dedicated sched_clock save/restore
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 0f92b29adecc..012321fed5e5 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -280,8 +280,8 @@ bool using_native_sched_clock(void)
 	return static_call_query(pv_sched_clock) == native_sched_clock;
 }
 
-void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				       void (*save)(void), void (*restore)(void))
+int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				      void (*save)(void), void (*restore)(void))
 {
 	if (!stable)
 		clear_sched_clock_stable();
@@ -289,6 +289,7 @@ void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 	static_call_update(pv_sched_clock, func);
 	x86_platform.save_sched_clock_state = save;
 	x86_platform.restore_sched_clock_state = restore;
+	return 0;
 }
 #else
 u64 sched_clock_noinstr(void) __attribute__((alias("native_sched_clock")));
-- 
2.55.0.rc0.799.gd6f94ed593-goog


